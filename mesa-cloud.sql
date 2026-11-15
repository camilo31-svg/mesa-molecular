-- Mesa Molecular: private workspaces, authenticated by Supabase Auth.
begin;
create table if not exists public.mesa_workspaces (
  owner_id uuid primary key references auth.users(id) on delete cascade,
  revision bigint not null check (revision > 0),
  payload jsonb not null check (jsonb_typeof(payload) = 'object'
    and octet_length(payload::text) <= 25000000
    and jsonb_typeof(payload->'docs') is not distinct from 'array'
    and case when jsonb_typeof(payload->'projects') = 'array'
      then jsonb_array_length(payload->'projects') > 0 else false end),
  updated_at timestamptz not null default now()
);
alter table public.mesa_workspaces enable row level security;
alter table public.mesa_workspaces force row level security;
revoke all on public.mesa_workspaces from public, anon, authenticated;
grant select, insert, update on public.mesa_workspaces to authenticated;
drop policy if exists mesa_owner_read on public.mesa_workspaces;
drop policy if exists mesa_owner_insert on public.mesa_workspaces;
drop policy if exists mesa_owner_update on public.mesa_workspaces;
create policy mesa_owner_read on public.mesa_workspaces for select to authenticated
  using ((select auth.uid()) = owner_id);
create policy mesa_owner_insert on public.mesa_workspaces for insert to authenticated
  with check ((select auth.uid()) = owner_id);
create policy mesa_owner_update on public.mesa_workspaces for update to authenticated
  using ((select auth.uid()) = owner_id) with check ((select auth.uid()) = owner_id);

create or replace function public.mesa_save_workspace(p_expected bigint, p_payload jsonb)
returns table(revision bigint, payload jsonb, updated_at timestamptz)
language plpgsql security invoker set search_path = '' as $$
declare account uuid := auth.uid();
begin
  if account is null then raise exception 'Authentication required' using errcode = '42501'; end if;
  if p_expected is null or p_expected < 0 then raise exception 'Invalid revision' using errcode = '22023'; end if;
  if p_payload is null or jsonb_typeof(p_payload) is distinct from 'object'
     or jsonb_typeof(p_payload->'projects') is distinct from 'array'
     or jsonb_typeof(p_payload->'docs') is distinct from 'array'
     or jsonb_array_length(p_payload->'projects') < 1
     or octet_length(p_payload::text) > 25000000 then
    raise exception 'Invalid or oversized workspace' using errcode = '22023';
  end if;
  if p_expected = 0 then
    return query insert into public.mesa_workspaces as w(owner_id,revision,payload)
      values (account,1,p_payload) on conflict(owner_id) do nothing
      returning w.revision,w.payload,w.updated_at;
  else
    return query update public.mesa_workspaces as w
      set revision = w.revision+1, payload = p_payload, updated_at = now()
      where w.owner_id = account and w.revision = p_expected
      returning w.revision,w.payload,w.updated_at;
  end if;
  if not found then raise exception 'Workspace revision changed' using errcode = '40001'; end if;
end;
$$;
revoke all on function public.mesa_save_workspace(bigint,jsonb) from public,anon;
grant execute on function public.mesa_save_workspace(bigint,jsonb) to authenticated;
commit;

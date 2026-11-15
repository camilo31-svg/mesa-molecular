# Mesa Molecular

Aplicación independiente de edición molecular, cuaderno de laboratorio y modelado de circuitos. Versión 6.6.

[Abrir aplicación](https://camilo31-svg.github.io/mesa-molecular/)

## Cuaderno y móvil

Inserta tablas con el selector de filas/columnas y edita sus celdas dentro de la entrada. Admite fórmulas, referencias absolutas, pegado de hojas de cálculo, estadísticas y CSV. El botón de dictado usa el servicio del navegador cuando está disponible.

En Configuración → Apariencia puedes elegir Automático, Móvil u Ordenador. En móvil vertical alternas secuencia y mapa, con una secuencia desplegable debajo del mapa; al girar se muestran ambas vistas. Admite pellizco para ampliar y pulsación prolongada para seleccionar/anotar.

## Cuenta y guardado privado

Pulsa **Iniciar sesión** en la esquina inferior izquierda, o **Más → Mi cuenta y sincronización** en móvil. Crea una cuenta con tu correo y contraseña, confirma el correo si se solicita e inicia sesión. En el primer acceso puedes guardar los archivos de este dispositivo en tu cuenta. Abre esa misma cuenta en ordenador y móvil para trabajar con los mismos documentos.

Si vienes del HTML local, exporta su copia JSON desde Backup and settings e impórtala en la web antes del primer guardado en nube. La contraseña no se incluye en los archivos ni en los respaldos. Mantener la sesión entre recargas es opcional. Guardar fuerza la sincronización; las ediciones incompatibles de un mismo documento se conservan como conflicto.

La web está en GitHub Pages; Supabase Auth y PostgreSQL proporcionan el acceso y almacenamiento privados. Las políticas por filas separan las cuentas. El proyecto usa el plan gratuito, sujeto a los límites de Supabase. El espacio por cuenta se limita a 24 MB en el cliente; para adjuntos grandes se ofrece la edición de servidor. El correo de pruebas de Supabase está restringido a direcciones permitidas; para usuarios adicionales hace falta configurar SMTP.

El SDK oficial de Supabase 2.119.0 se incorpora con su licencia MIT. La clave del proyecto publicada es de tipo publishable; no se incluye una clave de administrador ni una contraseña de base de datos.

## Opción avanzada: repositorio privado

La interfaz se publica en GitHub Pages. Los archivos del laboratorio se sincronizan mediante la API de GitHub con el repositorio privado camilo31-svg/mesa-molecular-datos.

1. Si vienes de la app HTML local, exporta su copia JSON desde Backup and settings e impórtala en esta web.
2. Crea un token de granularidad fina limitado al repositorio privado de datos, con permiso Contents: Read and write.
3. Abre Apariencia → Otras formas de sincronizar → Repositorio privado de GitHub. En la primera conexión, inicializa el repositorio con tus archivos. En el móvil, conecta al mismo repositorio.

El token se envía únicamente a api.github.com y permanece en memoria de la página. Se vuelve a introducir al recargar. La app conserva el borrador local, combina cambios de archivos distintos y detecta conflictos cuando dos dispositivos editan el mismo archivo. La lectura remota se comprueba cada 30 segundos y al volver a la página; Guardar fuerza la sincronización. Los respaldos anteriores se descargan desde Conectar dispositivos.

## Alcance

Incluye mapas direccionales, primers, ORFs opcionales por mapa, análisis bioquímico, partes/TUs/módulos con metadatos, gramáticas y simulación de circuitos. Los primers tienen nombres separados de sus figuras, bases alineadas, dirección y bordes de borrador; cerrar un diseño sin guardar elimina su selección y vista previa. Los cálculos son modelos teóricos con los límites descritos en la interfaz. La reproducción completa de las prestaciones de Benchling sigue pendiente.

Las tablas de parámetros adaptadas de Biopython incluyen su atribución y licencia en index.html. Códigos genéticos: NCBI gc.prt 4.6. No requiere dependencias externas para la interfaz.

# Mesa Molecular

Aplicación independiente de edición molecular, cuaderno de laboratorio y modelado de circuitos. Versión 6.7.

[Abrir aplicación](https://camilo31-svg.github.io/mesa-molecular/)

## Cuaderno y móvil

Inserta tablas con el selector de filas/columnas y edita sus celdas dentro de la entrada. Admite fórmulas, referencias absolutas, pegado de hojas de cálculo, estadísticas y CSV. El botón de dictado usa el servicio del navegador cuando está disponible.

En Configuración → Apariencia puedes elegir Automático, Móvil u Ordenador. En móvil vertical alternas secuencia y mapa, con una secuencia desplegable debajo del mapa; al girar se muestran ambas vistas. Admite pellizco para ampliar y giro con dos dedos en el mapa circular. Tocar una base la selecciona; mantener pulsado conserva la selección y abre su menú. Puedes extenderla arrastrando sus extremos o manteniendo pulsado y arrastrando. Un deslizamiento rápido desplaza la secuencia.

Al cambiar de orientación se limpian los gestos pendientes y se recalculan las filas. Reducir el zoom al mínimo restablece la vista. Run digest cierra el inspector en móvil. El gel se ajusta al espacio disponible al abrir/cerrar la secuencia; sus opciones y carriles tienen controles desplegables. Más se limita al área sobre la navegación inferior y permite desplazarse por todas sus opciones.

## Codones, copiado y CRISPR

Pulsar un aminoácido selecciona sus tres bases, también en la hebra inversa, traducciones unidas y cruces del origen. Copiar abre las seis variantes de ADN, ARN y traducción, en ambas orientaciones. La opción de copia parcial ajusta el marco del CDS y no conserva la identidad de una TU incompleta.

El diseño de gRNAs permite elegir PAM, lado, longitud, región, composición y modelo. Incluye Doench 2014 y Azimuth/Doench-Fusi 2016, exportación TSV, selección y guardado como oligo. Se verificaron 77 candidatos NGG de un ejemplo de Benchling (guía/PAM/hebra/corte/puntuación 2014), y los 1.000 ejemplos oficiales de Azimuth. Azimuth no puntúa secuencias circulares; los otros PAM sin un modelo compatible muestran actividad no disponible. El organismo/ensamblaje se registra como referencia declarada: no se incluyen índices de genoma completo. Los off-targets disponibles son locales, no equivalen al cálculo genómico de Benchling. No se han implementado CFD ni diseño pareado/base-editing.

Los pesos de Azimuth proceden de Microsoft Research, revisión 84eb013b8dde7132357a9b69206e99a4c65e2b89, con licencia BSD de tres cláusulas incluida en index.html. La reproducción de todos los modelos y servicios genómicos de Benchling sigue pendiente.

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

# Mesa Molecular

Aplicación independiente de edición molecular, cuaderno de laboratorio y modelado de circuitos. Versión 6.5.

[Abrir aplicación](https://camilo31-svg.github.io/mesa-molecular/)

## Cuaderno y móvil

Inserta tablas con el selector de filas/columnas y edita sus celdas dentro de la entrada. Admite fórmulas, referencias absolutas, pegado de hojas de cálculo, estadísticas y CSV. El botón de dictado usa el servicio del navegador cuando está disponible.

En Configuración → Apariencia puedes elegir Automático, Móvil u Ordenador. En móvil vertical alternas secuencia y mapa, con una secuencia desplegable debajo del mapa; al girar se muestran ambas vistas. Admite pellizco para ampliar y pulsación prolongada para seleccionar/anotar.

## Sincronización privada

La interfaz se publica en GitHub Pages. Los archivos del laboratorio se sincronizan mediante la API de GitHub con el repositorio privado camilo31-svg/mesa-molecular-datos.

1. Si vienes de la app HTML local, exporta su copia JSON desde Backup and settings e impórtala en esta web.
2. Crea un token de granularidad fina limitado al repositorio privado de datos, con permiso Contents: Read and write.
3. Abre Apariencia → Conectar dispositivos. En la primera conexión, inicializa el repositorio con tus archivos. En el móvil, conecta al mismo repositorio.

El token se envía únicamente a api.github.com y permanece en memoria de la página. Se vuelve a introducir al recargar. La app conserva el borrador local, combina cambios de archivos distintos y detecta conflictos cuando dos dispositivos editan el mismo archivo. La lectura remota se comprueba cada 30 segundos y al volver a la página; Guardar fuerza la sincronización. Los respaldos anteriores se descargan desde Conectar dispositivos.

## Alcance

Incluye mapas direccionales, primers, ORFs opcionales por mapa, análisis bioquímico, partes/TUs/módulos con metadatos, gramáticas y simulación de circuitos. Los cálculos son modelos teóricos con los límites descritos en la interfaz. La reproducción completa de las prestaciones de Benchling sigue pendiente.

Las tablas de parámetros adaptadas de Biopython incluyen su atribución y licencia en index.html. Códigos genéticos: NCBI gc.prt 4.6. No requiere dependencias externas para la interfaz.

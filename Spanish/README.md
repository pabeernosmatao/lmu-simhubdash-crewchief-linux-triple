### 🏎️ SimHubDash + CrewChief para Le Mans Ultimate en Linux

Guía completa de instalación y configuración de **Le Mans Ultimate (LMU)**, **SimHubDash** y **CrewChief** en sistemas Linux (enfocada en **CachyOS / Arch** con **KDE Plasma**). 

Este manual detalla cómo lograr una configuración nativa de **triple pantalla (7680×1440 @ 144 Hz) bajo Wayland sin utilizar Gamescope**. 

### 📋 Requisitos Previos e Información Importante

* **Entorno:** Wayland + KDE Plasma.
* **Hardware de pruebas:** 3 monitores a 144 Hz (resolución total 7680×1440). *Nota: Los valores de resolución y tasa de refresco pueden adaptarse a tu hardware específico.*
* **⚠️ Regla de Oro:** Para que todas las aplicaciones se comuniquen entre sí a través de la telemetría, **NO se debe utilizar Gamescope**.

### 🚀 Paso 1: Instalación de Componentes Básicos

### 1. Preparación de Le Mans Ultimate (LMU)

1. Instala **Le Mans Ultimate** desde Steam.
2. Ejecútalo utilizando la versión de **Proton** recomendada para la versión actual del juego.
3. **⚠️ Muy importante:** Utiliza **únicamente un monitor** para esta configuración inicial.
4. Configura por completo tu volante, pedales, asignación de botones y resto de periféricos.
5. Cierra el simulador al terminar.
6. Deja las *Opciones de lanzamiento* de Steam **completamente vacías** por ahora.

### 2. Descarga de Software

Descarga las versiones más recientes de los instaladores para Windows de: 

* [SimHubDash](/goto?url=CAESPgHrOzAVRSdBiQuWuJwHriGVHGvol3pmsR_sd_1MLRgz3-7iq7MgRv_lfMFCKou4-dsHNsYRkQyijK3VSab2)
* [CrewChief](/goto?url=CAESPAHrOzAVS0tCcZ3BgS4ElXC3Rc1DWNwuttEDb4-ZNLquK6uPMyrfmi5gPfVeLcEXgGJ08YyACHVAKrC-JA)

### 3. Instalación mediante Terminal

Abre una terminal en la carpeta donde descargaste los instaladores y ejecuta los comandos contenidos en el archivo Instala_Simhubdash_y_Crewchief.txt de este repositorio. 

📝 **Nota sobre las rutas:** Recuerda actualizar en los comandos la ruta de Proton y los nombres exactos de los instaladores que descargaste. 

**Durante la instalación, asegúrate de cumplir lo siguiente:** 

* ❌ **CrewChief:** Si el instalador solicita ejecutar la aplicación al finalizar, **desmarca la casilla**. No la inicies todavía.
* ❌ **SimHubDash:** Desmarca obligatoriamente las siguientes casillas de componentes: 

  * Install .NET Runtime
  * Install USB Display Drivers
  * Install Visual C++ Redistributables
  * Si solicita ejecutar al finalizar, **desmarca la casilla**.

### 🛠️ Paso 2: Configuración del Script de Inicio y Telemetría

### 1. Crear el Script de Lanzamiento

Crea un archivo de script llamado lanzar_apps.sh (o el nombre que prefieras) y copia en su interior el contenido del archivo Lanzar_Simhub_y_Crewchief.txt provisto en este repositorio. 

* Dale permisos de ejecución en tu sistema (chmod +x lanzar_apps.sh).
* Asegúrate de revisar y actualizar la ruta de Proton dentro del script si fuera necesario.

### 2. Primer Inicio de la Telemetría

1. Ejecuta tu script (./lanzar_apps.sh). Ambas aplicaciones deberían abrirse de forma correcta.
2. Configura los plugins de telemetría en cada interfaz.
3. **Si no detecta la telemetría:** Cierra ambas aplicaciones y sigue el **Paso Alternativo (6b)**: 

  * Con SimHub y CrewChief cerrados, inicia LMU desde Steam.
  * Una vez el simulador esté corriendo, ejecuta el script de inicio.
  * Vuelve a configurar los plugins de telemetría.
4. Una vez validado el funcionamiento de la telemetría, cierra todo en este orden estricto: **SimHub/CrewChief ➡️ Le Mans Ultimate**.

### 3. Configuración del Cortafuegos (Firewall)

Para que SimHubDash se comunique con tablets, smartphones o pantallas externas conectadas a la red local: 

* Abre el puerto **TCP 8888** en tu cortafuegos.
* En *KDE Plasma*, puedes gestionarlo de forma gráfica desde: Configuración del sistema ➡️ Cortafuegos.

💡 **Usuarios con un solo monitor:** Si juegas en pantalla simple, puedes saltar directamente a la sección de [Opciones de Lanzamiento de Steam](#-opciones-de-lanzamiento-de-steam). 

### 🖥️🖥️🖥️ Paso 3: Configuración de Triple Monitor (Wayland, sin Gamescope)

### 1. Reemplazo del Archivo de Configuración de LMU

1. Localiza el archivo original de configuración en la siguiente ruta: 

bash

~/.steam/steam/steamapps/common/Le Mans Ultimate/UserData/Config_DX11.ini

Usa el código con precaución.
2. Sustituye por completo su contenido con el texto del archivo Config_DX11.txt incluido en este repositorio.
3. *Si tu resolución combinada es distinta de 7680×1440, modifica únicamente las líneas correspondientes a la resolución dentro del archivo.*

### 2. Configuración In-Game

1. Inicia Le Mans Ultimate.
2. Ve a los ajustes gráficos y configura **únicamente**: 

  * La resolución de pantalla.
  * Activar la casilla de **Multiview**.
3. Reinicia el simulador.

### 3. Solución de Problemas de Ventana (Si solo se despliega en 2 monitores)

Si el juego no se extiende de forma automática por las tres pantallas, crearemos una regla de ventana nativa en KDE Plasma: 

1. Con LMU abierto, ve a: Configuración del sistema ➡️ Gestión de ventanas ➡️ Reglas de ventanas.
2. Crea una nueva regla y selecciona la ventana activa de LMU.
3. Configúrala replicando los parámetros visuales que se muestran en la imagen Regla_de_ventan.png de este repositorio. 

  * *Nota: La posición de la ventana por defecto suele ser 0,0. Si usas pantallas auxiliares superiores (como un 4º monitor), ajusta el eje Y de la regla según corresponda (ej. 0,1080).*
4. Aplica los cambios, cierra el simulador y vuelve a abrirlo.

### 4. Ajustes Finales y Frecuencia de Refresco

1. Entra a una pista y ajusta los valores del FOV y la alineación física/ángulos de tus pantallas desde los menús internos del juego. Cierra el simulador.
2. Vuelve a abrir el archivo Config_DX11.ini para verificar que la tasa de refresco coincida exactamente con la de tus monitores (ej. 144, 120, etc.). Guarda los cambios.

### 🕹️ Opciones de Lanzamiento de Steam

A continuación se muestra una línea de comandos optimizada como ejemplo para ejecutar el juego. Puedes modificarla según las necesidades específicas de tu hardware de video (AMD/Nvidia): 

bash

PROTON_USE_NTSYNC=1 PROTON_FSR4_UPGRADE=1 PROTON_ENABLE_HDR=1 PROTON_ENABLE_WAYLAND=1 RADV_PERFMODE=high DXVK_ASYNC=1 renice -n -10 -p $(pgrep -u $USER le_mans_ultimate) 2>/dev/null; %command%

Usa el código con precaución.

*Recuerda que lo indispensable de esta línea es mantener el entorno nativo de Wayland y evitar por completo invocar herramientas como Gamescope.* 

### 🔄 Flujo de Trabajo Recomendado (Orden de Ejecución)

Para evitar problemas de pérdida de paquetes de telemetría o cuelgues, utiliza siempre este orden de forma consistente: 

### Al iniciar:

1. 🟩 Inicia **Le Mans Ultimate** desde Steam.
2. 🟩 Ejecuta tu **script de inicio** (lanzar_apps.sh) para arrancar SimHubDash y CrewChief.

### Al cerrar:

1. 🟥 Cierra **SimHubDash** y **CrewChief** (el orden entre ellos no importa).
2. 🟥 Cierra **Le Mans Ultimate**.

### 📝 Notas de Compatibilidad y Hardware

* 🎙️ **CrewChief:** Funciona con total normalidad a excepción de los comandos de voz por micrófono y la función de personalización donde el programa te llama por tu nombre propio.
* 📊 **SimHubDash:** Soporte 100% operativo para pantallas añadidas, superposiciones (overlays), capturas de telemetría y dashboards externos.
* 🔊 **Next Level Racing HF8 (Cojín Háptico):** Funciona correctamente pero **debe configurarse como un dispositivo de salida de audio directo** dentro del apartado *ShakeIt Bass Shakers* de SimHub. No se ha logrado compatibilidad funcional a través de su conexión USB en este entorno.

### 🤝 Agradecimientos

Este manual y sus configuraciones asociadas han sido posibles gracias al excelente trabajo de investigación previo desarrollado por **srlemke**. La solución para extender las tres pantallas bajo Wayland sin depender de Gamescope adapta directamente sus scripts y su guía técnica original. 

* 🔗 [Guía Original: LMU Linux Triples (Gist de srlemke)](/goto?url=CAESYwHrOzAVTNCS4W6UDWvST_N_R8qeYNf5gU-5RsaC8xJaebuVXwFM5sSJZcMdBWC96Ev7Iu1wE8ENyQWvqyEUEAWCzEEI3b9TiBPICWFnYjmumZp9H8bOoL8MxYZ_5k-mf5dMkg)
* 🔗 [Colección completa de optimizaciones y scripts de srlemke](/goto?url=CAESQgHrOzAVDrBQAI51Wcr7xNWCZoftZoMv2j3GBQnWcjTZzirChPbCL_Ho-6x83aFM_MoaidN41wyzRYlOnK_w0ol3Sg)

🏁 **¡Nos vemos en la pista! Disfruta de tu simulador en Linux.**

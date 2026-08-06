# Guía LMU Linux Triple Monitor (ES)

Guía completa de instalación: SimHubDash + CrewChief para Le Mans Ultimate en Linux (CachyOS + KDE Plasma)
Esta guía explica cómo instalar y configurar Le Mans Ultimate, SimHubDash y CrewChief en Linux utilizando Wayland, con una configuración de tres monitores de 7680×1440 a 144 Hz, sin utilizar Gamescope.
Nota: La resolución y la frecuencia de actualización de los monitores pueden adaptarse a la configuración de tu equipo.

Instalación de Le Mans Ultimate, SimHubDash y CrewChief
1. Instalar Le Mans Ultimate
Instala Le Mans Ultimate desde Steam y ejecútalo utilizando la versión de Proton recomendada para la versión actual del juego.
Antes de continuar:
    • Utiliza únicamente un monitor para la configuración inicial (puedes tener más monitores conectados, pero no intentes configurar la triple pantalla todavía). 
    • Configura el volante, los pedales, la asignación de botones y el resto de los controles. 
    • Cierra el simulador cuando hayas terminado de configurarlo. 
    • Deja las Opciones de lanzamiento de Steam completamente vacías por ahora. 

2. Descargar las últimas versiones
Descarga las versiones más recientes de:
    • SimHubDash 
    • CrewChief 

3. Abrir una terminal
Accede a la carpeta donde descargaste los instaladores.

4. Instalar SimHubDash y CrewChief
Ejecuta los comandos incluidos en Install_Simhubdash_and_Crewchief.txt.
Importante: Actualiza la ruta y la versión de Proton, así como los nombres de los instaladores de SimHubDash y CrewChief, para que coincidan con las versiones que estés utilizando.
- Crewchief: Después de la instalación, no lo ejecute si el instalador lo solicita.
- Simhubdash desmarca - Install .NET Runtime
                                       - Install USB Display Drivers
                                       - Install Visual C++ Redistributables      
                                       - Después de la instalación, no lo ejecute si el instalador lo solicita.

6. Crear el script de inicio
Crea un script llamado xxxx.sh utilizando el contenido de Launch_Simhub_And_Crewchief.txt.
Guárdalo donde prefieras y dale permisos de ejecución.
Recuerda actualizar la ruta de Proton si es necesario.

7. Iniciar SimHubDash y CrewChief
Ejecuta xxxx.sh.
Las dos aplicaciones deberían iniciarse correctamente.
Configura los plugins de telemetría en cada una de ellas.
Si alguna de las aplicaciones no detecta o no permite configurar la telemetría, ciérralas ambas.

6b. Si la telemetría sigue sin funcionar
Con ambas aplicaciones cerradas:
    1. Inicia Le Mans Ultimate desde Steam. 
    2. Cuando el simulador esté en funcionamiento, ejecuta xxxx.sh. 
    3. Configura de nuevo los plugins de telemetría en SimHubDash y CrewChief. 
Una vez que la telemetría funcione correctamente, cierra todo siguiendo este orden:
    1. Cierra SimHubDash y CrewChief. 
    2. Cierra Le Mans Ultimate. 
Nota: La activación de la telemetría puede resultar algo inconsistente. En mi experiencia, normalmente funciona con el simulador cerrado (Paso 6), aunque en algunas ocasiones solo se activa cuando LMU ya está en ejecución (Paso 6b). Si no funciona al primer intento, vuelve a intentarlo; tarde o temprano terminará conectando correctamente.

7. Permitir SimHubDash en el cortafuegos
Para que SimHubDash pueda comunicarse con tablets y dispositivos móviles, abre el puerto TCP 8888 en el cortafuegos.
En KDE Plasma, la configuración del cortafuegos está disponible directamente desde Configuración del sistema.

8. Comprobar que todo funciona correctamente
Procura iniciar y cerrar siempre las aplicaciones siguiendo el mismo orden.
Inicio
    1. Inicia Le Mans Ultimate desde Steam. 
    2. Ejecuta el script de inicio. 
Cierre
    1. Cierra SimHubDash y CrewChief (el orden entre ambas aplicaciones es indiferente). 
    2. Cierra Le Mans Ultimate. 

9. Usuarios con un solo monitor
Si utilizas un único monitor, ya puedes pasar directamente a la sección Opciones de lanzamiento de Steam.

Notas
Según mi experiencia:
    • CrewChief funciona correctamente, excepto los comandos de voz y la opción para que el programa se dirija a ti por tu nombre. 
    • SimHubDash funciona correctamente para dashboards, overlays, telemetría y el resto de pantallas de información. 
    • El sistema háptico Next Level Racing HF8 también funciona, pero debe configurarse como un dispositivo de salida de audio dentro de ShakeIt Bass Shakers. No he conseguido hacerlo funcionar mediante USB.



Configuración para tres monitores (Wayland, sin Gamescope)
1. Descargar Config_DX11.txt

2. Editar el archivo de configuración
Ve a:
/home/TU_USUARIO/.steam/steam/steamapps/common/Le Mans Ultimate/UserData/
Abre Config_DX11.ini, sustituye todo su contenido por el de Config_DX11.txt y guarda el archivo.
Si tu configuración no es de 7680×1440, modifica únicamente los valores de resolución.
Por ahora, deja el resto de opciones sin cambios.

3. Configurar LMU
Inicia Le Mans Ultimate.
Configura únicamente:
    • Resolución de pantalla. 
    • Activar Multiview. 
Reinicia el simulador.

4. Comprobar la imagen
Si LMU se extiende correctamente por los tres monitores, continúa con el Paso 6.

4b. Si LMU solo ocupa dos monitores
Continúa con el Paso 5.

5. Crear una regla de ventana en KDE Plasma
Con LMU en funcionamiento:
    • Abre Configuración del sistema → Gestión de ventanas → Reglas de ventanas. 
    • Crea una nueva regla. 
    • Selecciona la ventana de LMU. 
    • Configúrala utilizando los parámetros mostrados en la imagen window_rule.png. 
Nota: La posición de la ventana puede variar respecto al ejemplo. En mi caso está configurada en 0,1080 porque tengo un cuarto monitor situado encima del conjunto de tres pantallas. Según tu configuración, el valor puede ser 0,0 u otro distinto.
Aplica los cambios.
Cierra LMU y vuelve a iniciarlo.
Ahora debería extenderse correctamente por los tres monitores.

6. Ajustar la vista dentro del juego
Entra en una sesión y ajusta:
    • La alineación de las tres pantallas. 
    • El FOV. 
    • Cualquier otro ajuste de visualización. 
Después, cierra LMU.

7. Comprobar la frecuencia de actualización
Ve a:
/home/TU_USUARIO/.steam/steam/steamapps/common/Le Mans Ultimate/UserData/
Abre Config_DX11.ini y verifica que la frecuencia de actualización sea correcta.
Si es necesario, ajústala para que coincida con la de tus monitores (144 Hz, 120 Hz, etc.) y guarda el archivo.

8. Comprobación final
Utiliza siempre la siguiente secuencia de inicio.
Inicio
    1. Inicia LMU desde Steam. 
    2. Ejecuta el script de inicio. 
Cierre
    1. Cierra SimHubDash y CrewChief (el orden es indiferente). 
    2. Cierra LMU. 

9. No utilices Gamescope
No utilices Gamescope con esta configuración.

Opciones de lanzamiento de Steam
Importante
Para que todas las aplicaciones puedan comunicarse correctamente, no debe utilizarse Gamescope.
A continuación se muestra el comando de lanzamiento de Steam que funciona correctamente en mi equipo.
Se incluye únicamente como ejemplo y puede que no sea la mejor opción para tu hardware:
PROTON_USE_NTSYNC=1 PROTON_FSR4_UPGRADE=1 PROTON_ENABLE_HDR=1 PROTON_ENABLE_WAYLAND=1 RADV_PERFMODE=high DXVK_ASYNC=1 renice -n -10 -p $(pgrep -u $USER le_mans_ultimate) 2>/dev/null; %command%
Puedes utilizarlo como punto de partida o pedir a una IA que te recomiende las opciones de lanzamiento más adecuadas para tu hardware.
Lo importante es que especifiques claramente que no quieres utilizar Gamescope.
Si necesitas más FPS, puedes instalar lsfg-vk, aunque eso ya es otro tema.

Agradecimientos
Este manual ha sido posible gracias al excelente trabajo de srlemke y sus guías sobre Le Mans Ultimate en Linux.
La configuración de triple monitor sin Gamescope se basa en su archivo de configuración y en su guía original LMU Linux Triples, adaptada para funcionar en Wayland y KDE Plasma.
Guía original:
https://gist.github.com/srlemke/a9a8273dc66230a3dc36d8bd425186fc
Su colección completa de guías y scripts relacionados con SimHub, CrewChief y optimización en Linux puede encontrarse aquí:
https://gist.github.com/srlemke

¡DISFRUTA DE TU SIMULADOR!

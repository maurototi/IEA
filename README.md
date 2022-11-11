   
--EN PROCESO 12/10/22
  # Grain Vision Web Service
El programa desarrollado en Node-red tiene como objetivo recolectar los datos generados por GrainVision en formato de texto y los ingresa a una DB sin que el disco se llene (gracias a que purgamos la DB), esos datos son enviados al servidor web a través del protocolo HTTP.

Este proyecto fue desarrollado por IEA (Ingeniería Electrónica Argentina).

  # Programas utilizados

* [Node.js](https://nodejs.org/dist/v16.13.2/): Versión node-v16.13.2-win-x64.zip

* [npm](https://nodered.org/): Versión 3.0.2

* [nssm](https://nssm.cc/download): Versión 2.24

 
  

 # Installation
RECOMENDACIÓN: Por defecto, instalar él .zip en una carpeta llamada C:\GRAINVSN\GVCLOUD.

Una vez instalado él .zip: 

 - Abrir el archivo install.bat**(ABRIR SIEMPRE COMO ADMINISTRADOR)**, y seleccionar la opcion 1 para descargar y descomprir NodeJS y NSSM utilizando Powershell (esto lo hace llamando al archivo initialize.ps1 donde tiene el código para bajar los archivos .zip de la red, descomprimirlos y borrarlos luego de ser utilizados), declarar Nodepath (dirección del node instalado anteriormente) para poder instalar node-red de manera global, en src instala las dependencias del proyecto (npm).
 - luego seleccione la opcion 2 o 3 dependiendo lo que usted quiera:
En caso elija 3 se iniciara node-red, minimice la pestaña cmd para y busque en su navegador  http://127.0.0.1:1880/#flow/5fc04a5852b963c8 (no debe cerrar la consola para que no se detenga el node-red.
En caso de que elija 2 (se hará uso de nssm) le preguntará el nombre y descripción de su servicio y se establecerá node-red como servicio de Windows. Esto hace que cuando nosotros prendamos nuestro ordenador ya estar acorriendo node-red y solo buscando el link en el navegador se nos abrirá el programa.

Si todo salió bien estarías viendo la estructura del programa hecho en Node-red con sus flows y nodos correspondientes.

  # Flows y Nodos ¿Cómo funciona?

Al ingresar a Node-red encontraremos varios flows que cumplen distintas funciones para llegar al objetivo, estos flujos están especificados acá:

  

 - **File Finder Data Archive**: En este flujo se buscan y leen las carpetas que contienen los archivos, se formatean y se envían como mensajes a la base de datos SQLite.




# Descripción detallada de carpetas

Al descargar él .zip nos encontramos con varios archivos que pasamos a detallar:

- **bin**  en esta carpeta tenemos todos los programas necesarios para el funcionamiento del proyecto, un run.cmd y un .ps1 que lo que hace es descargar y descomprimir los .zip, node y nssm en caso de que no se allá hecho.
- **database** que tiene la DB.
- **src** que tiene todo lo necesario para poder trabajar adentro del proyecto. 
- **.git** alberga todo el contenido del repositorio utilizado por Git.
- **.vscode** archivo de vscode que contiene palabras que siempre considera correctas a la hora de escribir.
- **.gitignore** es un archivo  de texto que le dice a Git que archivos o carpetas ignorar.
- **install.bat** este archivo .bat instala el proyecto, descomprime los programas adicionales que necesitamos, descarga el npm y establece un servicio de Windows para que funciones el Node-red cuando prendemos la pc en caso de que lo desee. Esto está mas especificado en el apartado #Installation.
- **CHANGELOG** lista ordenada de forma cronológica y que especifica los cambios que se han ido realizando para cada versión de la aplicación.
- **README**  que contiene toda la información y explicación del programa. 
- **start.cmd**  start node.

# Descripción de las variables en el código.
- GVCLOUDPATH es la dirección de la carpeta raíz.
- NODEJSPATH es la ubicación del node descomprimido y descargado.
- NSSMPATH es la ubicación del nssm descomprimido y descargado.
- SOURCE es la dirección de la carpeta src(donde están las dependencias de node).
- FILENAME_NODE es el nombre que se le asignara al archivo node una vez descomprimido.
- FILENAME_NSSM es el nombre que se le asignara al archivo nssm una vez descomprimido.
- URL_NODE Y URL_NSSM son las direcciones de las páginas web para obtener el .zip des estos programas.
- PATH esta variable es utilizada para descargar node e instalar las dependencias en la carpeta src.

Esto tambien lo dejamos documentado en el código para que sea fácil la lectura cuando estemos codeando.

<p align="center">
  <img src="C:\GRAINVSN\GVCLOUD\Diagrama_GVCLOUD.jpg" width="350" title="hover text">
  <img src="C:\GRAINVSN\GVCLOUD\Diagrama_GVCLOUD.jpg" width="350" alt="accessibility text">
</p>

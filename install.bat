@echo off
SET URL_NODE="https://nodejs.org/dist/v16.13.2/node-v16.13.2-win-x64.zip"
SET URL_NSSM="https://nssm.cc/release/nssm-2.24.zip"
SET FILENAME_NODE="nodejs.zip"
SET FILENAME_NSSM="nssm.zip"
SET GVCLOUDPATH=%~d0%~p0
SET NODEJSPATH=%GVCLOUDPATH%bin\node-v16.13.2-win-x64
SET NSSMPATH=%GVCLOUDPATH%bin\nssm-2.24
SET SOURCE=%GVCLOUDPATH%src
SET PATH=%PATH%;%NODEJSPATH%


::GVCLOUDPATH es la direccion de la carpeta raiz.
::NODEJSPATH es la ubicacion del node descomprimido y descargado.
::NSSMPATH es la ubicacion del nssm descomprimido y descargado.
::SOURCE es la direccion de la carpeta src(donde estan las dependecias de node).
::FILENAME_NODE es el nombre que se le asignara al archivo node una vez descomprimido.
::FILENAME_NSSM es el nombre que se le asignara al archivo nssm una vez descomprimido.
::URL_NODE Y URL_NSSM son las direcciones de las paginas web para obtener el .zip des estos programas.
::PATH esta variable es utilizada para descargar node e instalar las dependencias en la carpeta src.


:Menu
cls
echo Seleccione su opcion tecleando el numero respectivo.
echo.
echo 1. Descargar dependencias
echo 2. Instalar node como servicio de Windows
echo 3. Iniciar Node-red
echo 4. Desinstalar servicio Windows (en proceso)
echo 5. Salir
set /p var=
if %var%==1 goto :Primero
if %var%==2 goto :Segundo
if %var%==3 goto :Tercero
if %var%==4 goto :Cuarto
if %var%==5 goto exit
if %var% GTR 3 echo Error
goto :Menu

:Primero
cls 

IF NOT EXIST %NODEJSPATH% (
    :: Descargar y Descomprime NodeJS y NSSM utilizando Powershell
    :: powershell -COMMAND "%GVCLOUDPATH%bin\initialize.ps1 \"%FILENAME_NODE%\" \"%URL_NODE%\" \"%FILENAME_NSSM%\" \"%URL_NSSM%\""
    :: Declaro esta variable para poder instalar node-red de manera global (Es necesario)
    cscript //nologo _.vbs
    SET NODE_PATH=%NODEJSPATH%
    CALL unzip.bat
    CALL npm install -g node-red
    :: Voy a source e instalo las dependencias de todo el proyecto
    cd %SOURCE%
    CALL npm install
)

Echo Precione una tecla para volver al menu
Pause>Nul
goto :Menu
:Segundo
cls 

set "ServiceName=GrainVisionWebService"
set /p "ServiceName=Ingrese nombre del Servicio (Default: GrainVisionWebService): "
set "DescriptionName=Servicio de subida de datos de GrainVision Web"
set /p "DescriptionName=Ingrese una descripcion del Servicio (Default: Servicio de subida de datos de GrainVision Web):  "

SET NOMBRE_SERVICIO=%ServiceName%
cd %NSSMPATH%\win64

nssm install %ServiceName% "%NODEJSPATH%\node-red.cmd" 
nssm set %ServiceName% AppDirectory %NODEJSPATH% 
nssm set %ServiceName% AppParameters "-u %SOURCE%"
nssm set %ServiceName% DisplayName %ServiceName% 
nssm set %ServiceName% Description %DescriptionName%  
nssm set %ServiceName% Start SERVICE_AUTO_START
    
    
sc start %ServiceName%

Echo Precione una tecla para volver al menu
Pause>Nul
goto :Menu
:Tercero
cls 

%NODEJSPATH%\node-red -u src
cmd /k

Echo Precione una tecla para volver al menu
Pause>Nul
goto :Menu
:Cuarto
cls 
echo %NOMBRE_SERVICIO%

    CALL sc config stop %NOMBRE_SERVICIO% 
    CALL sc config delete %NOMBRE_SERVICIO%
cmd /k
Echo Precione una tecla para volver al menu
Pause>Nul
goto :Menu

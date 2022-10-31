nssm.exe install SERVICE_NAME AAgrainvisionweb

nssm.exe get AAgrainvisionweb

nssm.exe set AAgrainvisionweb PARAMETER_NAME PARAMETER_VALUE
nssm.exe set AAgrainvisionweb Description "My service description."
nssm.exe set AAgrainvisionweb Start SERVICE_AUTO_START
nssm.exe set AAgrainvisionweb AppExit Default Exit
nssm.exe set AAgrainvisionweb AppStdout "C:\log\service-output.log"

--------------------------------------------------------------------
set "ServiceName=GrainVisionWebService"
    set /p "ServiceName=Ingrese nombre del Servicio (Default: GrainVisionWebService): "
    set "DescriptionName=Servicio de subida de datos de GrainVision Web"
    set /p "DescriptionName=Ingrese una descripcion del Servicio (Default: Servicio de subida de datos de GrainVision Web):  "
    
    cd %NSSMPATH%\win64
    nssm.exe install %ServiceName% %NODEJSPATH%\node-red
    timeout /t 2
    nssm.exe set %ServiceName% AppDirectory %NODEJSPATH%
    nssm.exe set %ServiceName% AppParameters -u %SOURCE%
    nssm.exe set %ServiceName% DisplayName %ServiceName%
    nssm.exe set %ServiceName% Description %DescriptionName%
    nssm.exe set %ServiceName% Start SERVICE_AUTO_START
 
    sc start %ServiceName%
 
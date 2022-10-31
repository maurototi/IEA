$FILENAME_NODE=$args[0]
$URL_NODE=$args[1]
$FILENAME_NSSM=$args[2]
$URL_NSSM=$args[3]

#Descaraga archivos node y npm en la carpeta.

Invoke-WebRequest -Uri $URL_NODE -OutFile bin\$FILENAME_NODE
Invoke-WebRequest -Uri $URL_NSSM -OutFile bin\$FILENAME_NSSM

#Descomprime archivos node y npm en la carpeta.

Expand-Archive -Path  bin\$FILENAME_NODE -DestinationPath bin\
Expand-Archive -Path bin\$FILENAME_NSSM DestinationPath bin\

#Borra los .zip.

Remove-Item bin\$FILENAME_NODE
Remove-Item bin\$FILENAMEPP_NSSM
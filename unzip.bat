@echo off
setlocal
cd /d %~dp0
cscript //nologo %vbs%
Call :UnZipFile "%1" "%2"
exit /b

:UnZipFile <ExtractTo> <newzipfile>
:: set vbs="%temp%\_.vbs"
set vbs="_.vbs"
if exist %vbs% del /f /q %vbs%
>%vbs%  echo Set fso = CreateObject("Scripting.FileSystemObject")
>>%vbs% echo Set stdout = fso.GetStandardStream (1)
>>%vbs% echo Dim GVCLOUDPATH, GVBINPATH, NODEJSFILE, NODEJSURL

>>%vbs% echo GVCLOUDPATH = "C:\Users\pdrappo\Desktop\GVCLOUD"
>>%vbs% echo GVBINPATH = fso.BuildPath(GVCLOUDPATH, "bin")
>>%vbs% echo NODEJSFILE = fso.BuildPath(GVBINPATH, "nodejs.zip")
>>%vbs% echo NODEJSURL = "https://nodejs.org/dist/v16.13.2/node-v16.13.2-win-x64.zip"
>>%vbs% echo If NOT fso.FolderExists(%1) Then
>>%vbs% echo 	fso.CreateFolder(%1)
>>%vbs% echo End If
>>%vbs% echo set objShell = CreateObject("Shell.Application")
>>%vbs% echo set FilesInZip = objShell.NameSpace(%2).items
>>%vbs% echo objShell.NameSpacea<).CopyHere(FilesInZip)
>>%vbs% echo Set fso = Nothing
>>%vbs% echo Set objShell = Nothing
>>%vbs% echo set FilesInZip = objShell.NameSpace(NODEJSFILE).items
>>%vbs% echo Set oFile = FilesInZip.Item(0)
>>%vbs% echo ' Descomprimo
>>%vbs% echo objShell.NameSpace(GVBINPATH).CopyHere(FilesInZip)

>>%vbs% echo ' Renombro
>>%vbs% echo fso.MoveFolder oFile, fso.BuildPath(GVBINPATH, "nodejs")
>>%vbs% echo stdout.WriteLine oFile.Path
>>%vbs% echo Set fso = Nothing
>>%vbs% echo Set objShell = Nothing
:: cscript //nologo %vbs%
:: if exist %vbs% del /f /q %vbs%
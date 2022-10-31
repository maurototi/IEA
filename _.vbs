Set fso = CreateObject("Scripting.FileSystemObject")
Set stdout = fso.GetStandardStream (1)

Dim GVCLOUDPATH, GVBINPATH, NODEJSFILE, NODEJSURL

GVCLOUDPATH = "C:\GRAINVSN\GVCLOUD"
GVBINPATH = fso.BuildPath(GVCLOUDPATH, "bin")
NODEJSFILE = fso.BuildPath(GVBINPATH, "nodejs.zip")
NODEJSURL = "https://nodejs.org/dist/v16.13.2/node-v16.13.2-win-x64.zip"

stdout.WriteLine "Descargando NodeJS"

Dim xHttp: Set xHttp = createobject("Microsoft.XMLHTTP")
Dim bStrm: Set bStrm = createobject("Adodb.Stream")
xHttp.Open "GET", NODEJSURL, False
xHttp.Send

with bStrm
    .type = 1 '//binary
    .open
    .write xHttp.responseBody
    .savetofile NODEJSFILE, 2 '//overwrite
end with

stdout.WriteLine "Descomprimiendo NodeJS"

If NOT fso.FolderExists(GVBINPATH) Then
	fso.CreateFolder(GVBINPATH)
End If
set objShell = CreateObject("Shell.Application")
set FilesInZip = objShell.NameSpace(NODEJSFILE).items
Set oFile = FilesInZip.Item(0)
' Descomprimo
objShell.NameSpace(GVBINPATH).CopyHere(FilesInZip)

' Renombro
fso.MoveFolder oFile, fso.BuildPath(GVBINPATH, "nodejs")
stdout.WriteLine oFile.Path
Set fso = Nothing
Set objShell = Nothing
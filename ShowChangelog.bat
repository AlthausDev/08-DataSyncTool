@echo off

rem Obtener la ruta del directorio donde se encuentra el script
set "ScriptDirectorio=%~dp0"

rem Establecer la carpeta "log" en el mismo directorio que el script
set "LogDirectorio=%ScriptDirectorio%log"

set LogArchivo=CHANGELOG.md

rem Verificar si el directorio de registro existe, si no, mostrar un mensaje y salir.
if not exist "%LogDirectorio%" (
    echo El directorio de log no existe.
    pause
    exit /b 1
)

rem Verificar si el archivo CHANGELOG.md existe, si no, mostrar un mensaje y salir.
if not exist "%LogDirectorio%\%LogArchivo%" (
    echo El archivo CHANGELOG.md no existe.
    pause
    exit /b 1
)

rem Mostrar el contenido del archivo CHANGELOG.md
type "%LogDirectorio%\%LogArchivo%"
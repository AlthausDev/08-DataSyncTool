@echo off

set LogDirectorio=D:\Log
set LogArchivo=CHANGELOG.md
set TempArchivo=TEMPCHANGELOG.md

rem Verificar si el directorio de registro existe, si no, créalo.
if not exist "%LogDirectorio%" mkdir "%LogDirectorio%"

rem Obtener la fecha y la hora actual
set FechaHora=%DATE% %TIME%

rem Crear o agregar al archivo temporal con formato de CHANGELOG
(
    echo ## Cambios Recientes
    echo.
    echo ### %FechaHora%
    echo - %Accion% %Descripcion%
    echo.
    echo.
) > "%LogDirectorio%\%TempArchivo%"

rem Buscar y eliminar la línea "Cambios Recientes" del archivo CHANGELOG.md
type "%LogDirectorio%\%LogArchivo%" | find /v "## Cambios Recientes" >> "%LogDirectorio%\%TempArchivo%"

rem Sobrescribir CHANGELOG.md con el contenido del archivo temporal
move /y "%LogDirectorio%\%TempArchivo%" "%LogDirectorio%\%LogArchivo%"

echo Registro completado.



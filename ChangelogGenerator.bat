@echo off

rem Obtener la ruta del directorio donde se encuentra el script
set "ScriptDirectorio=%~dp0"

rem Establecer la carpeta "log" en el mismo directorio que el script
set "LogDirectorio=%ScriptDirectorio%log"

set LogArchivo=CHANGELOG.md
set TempArchivo=TEMPCHANGELOG.md

rem Verificar si el directorio de registro existe, si no, créalo.
if not exist "%LogDirectorio%" mkdir "%LogDirectorio%"

rem Obtener la fecha y la hora actual
set FechaHora=%DATE% %TIME%

rem Definir una matriz de acciones y descripciones
set "Acciones[1]=%Accion1%"
set "Acciones[2]=%Accion2%"
set "Acciones[3]=%Accion3%"
set "Acciones[4]=%Accion4%"
set "Acciones[5]=%Accion5%"

set "Descripciones[1]=: %Descripcion1%"
set "Descripciones[2]=: %Descripcion2%"
set "Descripciones[3]=: %Descripcion3%"
set "Descripciones[4]=: %Descripcion4%"
set "Descripciones[5]=: %Descripcion5%"

rem Crear o agregar al archivo temporal con formato de CHANGELOG
(
    echo ## Cambios Recientes
    echo.
    echo ### %FechaHora%
    echo.
    rem Bucle para acciones y descripciones
    for /L %%i in (1,1,5) do (
        rem Verificar si ambas variables están definidas
        if defined Acciones[%%i] (
            rem Agregar acción y descripción al archivo temporal
            call echo - **%%Acciones[%%i]%%**%%Descripciones[%%i]%%
        )
    )

    echo.
) > "%LogDirectorio%\%TempArchivo%"

rem Buscar y eliminar la línea "Cambios Recientes" del archivo CHANGELOG.md
type "%LogDirectorio%\%LogArchivo%" | find /v "## Cambios Recientes" >> "%LogDirectorio%\%TempArchivo%"

rem Sobrescribir CHANGELOG.md con el contenido del archivo temporal
move /y "%LogDirectorio%\%TempArchivo%" "%LogDirectorio%\%LogArchivo%"

echo.
echo Registro completado.


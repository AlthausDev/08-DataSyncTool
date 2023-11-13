@echo off

rem Solicitar el nombre del volumen al usuario
set /p NombreVolumen="Indica en que volumen quiere copiar los archivos de esta unidad: "

echo Nombre del volumen despues de la conversion: %NombreVolumen%
echo.

rem Buscar la letra de la unidad con el volumen especificado
for /f "tokens=1,* delims=:" %%a in ('wmic volume get driveletter^, label ^| findstr /i "%NombreVolumen%"') do (
    if /i not "%%I"=="$RECYCLE.BIN" if /i not "%%I"=="System Volume Information" (
        set "UnidadUSB=%%a:"
        echo Unidad USB encontrada: %UnidadUSB%
    )
)

rem Verificar si se encontró la unidad USB
if not defined UnidadUSB (
    echo No se encontró la unidad USB con el volumen %NombreVolumen%.
    goto :FinScript
)

rem Obtener la ruta del directorio donde se encuentra el script
set "ScriptDirectorio=%~dp0"
rem Obtener la letra de la unidad del directorio del script
for %%P in ("%ScriptDirectorio%") do set "Origen=%%~dP"

rem Establecer las rutas de origen y destino
set "Destino=%UnidadUSB%\"


if not exist "%Destino%" (
    echo La unidad USB no está conectada.
    goto :FinScript
)

REM Eliminar archivos en el destino
for /d %%I in ("%Destino%\*") do (
    if /i not "%%~nI"=="$RECYCLE.BIN" if /i not "%%~nI"=="System Volume Information" (
        RD /S /Q "%%I"
        echo Se han eliminado los archivos en %%I
    )
)

REM Copiar archivos desde el origen hasta el destino
copy "%Origen%" "%Destino%" /e /k /y
echo Se han copiado correctamente los archivos de %Origen% a %Destino%


rem Definir acciones y descripciones para el changelog
set "Accion1=Eliminar
set "Descripcion1=Se han eliminado todos los archivos en %Destino%"
set "Accion2=Copiar"
set "Descripcion2=Se han copiado los archivos desde %Origen% a %Destino%



rem Llamar al script changelog-generator.bat con las acciones y descripciones definidas
call ChangelogGenerator.bat
:FinScript
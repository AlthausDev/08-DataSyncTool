@echo off

:menu
cls
echo Menu Principal
echo
echo 1. Copiar desde donde está el script a la Unidad seleccionada
echo 2. Visualizar CHANGELOG.md
echo 3. Salir

set /p opcion=Seleccione una opción:
echo.

if "%opcion%"=="1" (
    echo Ha seleccionado la opción 1. Copiar desde donde está el script a la Unidad seleccionada
    set /p confirmar=¿Está seguro de que desea continuar? (S/N):
    if /i "%confirmar%"=="S" (
        call FileCopier.bat  REM Llamar al script de copia desde USB
    )
    goto menu
) else if "%opcion%"=="2 (
    echo Mostrando el contenido de CHANGELOG.md...
    call ShowChangelog.bat  REM Llamar al script de visualización del changelog
    goto menu
) else if "%opcion%"=="3" (
    echo Saliendo del programa.
    exit /b 0
) else (
    echo Opción no válida. Introduzca una opción válida.
    goto menu
)

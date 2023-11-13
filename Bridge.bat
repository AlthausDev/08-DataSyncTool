@echo off
echo Ejecutando Script 1

rem Define la acción
:: set Accion= **AccionX:**
:: set Descripcion= Eliminación y copia de archivos


rem Llama al Segundo Script (changelog-generator.bat)
call changelog-generator.bat

echo Fin del Script 1
@pause

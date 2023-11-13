@echo off

rem Establecer las rutas de origen y destino
set Origen=D:\*
set Destino=E:\*

if not exist %Destino% (
    echo La unidad USB no está conectada.
    goto :FinScript
)

RD /S /Q %Destino%
echo Se han eliminado los archivos

xcopy "%Origen%" "%Destino%" /e /k /y
echo Se han copiado correctamente los archivos

:FinScript
@pause
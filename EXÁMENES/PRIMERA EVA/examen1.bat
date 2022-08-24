@echo off 
::Principio del menu
:comienzo
echo 			MENÚ
echo ==============================================================
echo 1. Leer el fichero de alumnos  y mostrar por pantalla "Apellidos y Nombre"
echo 2. Crear el grupo "alumnos_M"
echo 3. Listar todos los grupos que existen
echo 4. Contar saltos a una dirección data
echo 5. Características del sistema
echo 6. Salir
echo ===============================================================

echo selecione una opcion
set /p %opcion=

if %opcion% == 1 GOTO :UNO
if %opcion% == 2 GOTO :DOS
if %opcion% == 3 GOTO :TRES
if %opcion% == 4 GOTO :CUATRO
if %opcion% == 5 GOTO :CINCO
if %opcion% == 6 GOTO :SEIS

::OPCION 1
::Leer el fichero Usuarios.txt y que salgan Apellidos y Nombre
::Sacar los apellidos y nombres del fichero con un bucle for
:UNO
::Pedimos la ruta del fichero Usuarios.txt 
set /p ruta= Introduce la ruta del fichero Usuarios:
echo.
echo Apellidos,	 Nombre
echo -------------------------------------------------------------------------------------
::con el bucle for recogemos solo las columnas que necesitamos del fichero
	(for /f "usebackq tokens=1,2,3,4 delims=:" %%A in (%ruta%) do (
	echo %%C , %%D
	))
pause
cls
goto :comienzo

::Creación de grupo
:DOS
echo Escribe el nombre del grupo que quieras crear 
set /p %grupo=
::Si no existe lo crea
::Hay que tener en cuenta que se necesita ser ADMIN para crear grupos y usuarios

::0 si no existe
::1 si existe ya el grupo mencionado anterior
if ERRORLEVEL 0 GOTO :noexisteg
if ERRORLEVEL 1 GOTO :existeg

:noexisteg
echo El grupo no existe, ahora se creará
net localgroup %grupo% /add
::para mostrar al usuario el grupo creado
net localgroup %grupo% 
pause
cls
goto :comienzo

::Si existe lo manda de nuevo para que se ponga otro nombre
:existeg
echo El grupo creado ya existe, ponga otro nombre diferente
pause
cls
goto :DOS

:TRES
net localgroup
goto :comienzo
:CUATRO
echo Introduce una dirección (ejemplo: www.google.es)
set /p %direccion=
echo Introduce un número de saltos
set /p %saltos=
echo.
tracert -d -h %saltos% %direccion%
pause
cls
goto :comienzo

::características del sistema
:CINCO
echo.
::parámetro /i para omitir mayúsculas y minúsculas
systeminfo 
timeout 2
pause cls
goto :comienzo

::opcion seis y comandos de control de errores
::SALIR
:SEIS
echo Saliendo...
timeout 2 > nul
exit

::si se escribe una opcion que no esta
:MAL
echo Esa opcion no existe
cls
pause
echo Volviendo al menu...
timeout 2 > nul
cls
goto :comienzo






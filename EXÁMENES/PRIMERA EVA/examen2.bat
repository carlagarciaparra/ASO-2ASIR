@echo off
setlocal enabledelayedexpansion
:inicio
set /p "lineas=Ingresa un numero: "
::si el usuario no nos dice cuantas lineas quiere entonces vuelve al inicio
if not defined lineas (goto:inicio)

::primer bucle para controlar las lineas que pide el usuario y que solo se muestren esas lineas
for /L %%a in (1, 1, %lineas%) do (
    set Res=
    ::bucle dentro del mismo for para que se impriman dentro
    for /L %%b in (1, 1, %%a) do set Res=!Res!%%a
    echo !Res!
)








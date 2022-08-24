#!/bin/bash
function opcion1(){
echo Introduce la ruta donde se encuentra el fichero
#cogemos y metemos en la variable ruta la info del usuario
read ruta
echo ==============================================
echo "Apellidos                      Nombre"
echo ----------------------------------------------
#utilizamos cut para que salgan solo apellidos y nombre y --output-delimiter para poner espacios entre
#los dos
cat $ruta | cut -d":" -f3,4 --output-delimiter="            "
echo ==============================================
}


function opcion2(){

#con el comando groupadd añadimos el usuario (en este caso usuario ASO)
#se tiene que ejecutar en sudo porque si no, nos da permisos denegados 
echo "Introduce un grupo"
read grupo
groupadd -f $grupo
cat /etc/group
}


function opcion3(){

#se necesita estar en el terminal como sudo para que funciones
#creo un fichero solo con los nombres para crear los usuarios
cat Usuarios.txt | cut -d":" -f2 > usuario
#creamos los usuarios con bucle while leyendo linea a linea para crearlos
while IFS= read -r line
do
	useradd $line -d /home
done < usuario
}


function opcion5(){
systeminfo
}

function opcion6(){
#pedimos al usuario que nos de donde copiar el fichero
echo "introduce un fichero para copiar"
read fiche1
echo "introduce un lugar donde copiarlo"
read fiche2
#con las dos variables registradas realizamos un copy
cp $fiche1 $fiche2
#le mostramos al usuario que han sido creados
ls -l
}

function opcion7(){
exit
}

while :
do
echo ============================================================================

echo 1. Leer el fichero de alumnos y mostrar por pantalla "Apellidos y Nombre"
echo 2. Crear el grupo "ASO"
echo 3. Crear usuarios con password
echo 4. Contar saltos a una dirección data
echo 5. Mostrar las características del sistema
echo 6. Copiar ficheros
echo 7. Salir
echo =============================================================================
read opcion
echo =====================================================

case $opcion in
1) opcion1;;
2) opcion2;;
3) opcion3;;
4) opcion4;;
5) opcion5;;
6) opcion6;;
7) opcion7;;

*) echo "La opción no es válida"

esac
done


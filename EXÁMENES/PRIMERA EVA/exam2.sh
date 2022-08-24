#!/bin/bash
function tabla(){
#pedimos al usuario que tabla es el comienzo del bucle
read -p "Ingresa un número: " respuesta
#bucle de tabla 
for h in $(seq $respuesta 10)
do
echo "        Tabla del $h         "
echo ===============================
for tabla in $(seq 1 10)
do
#creamos una variable que guarde el resultado de dicha operación
let resultado=$h*$tabla
echo "        $h * $tabla = $resultado "
done
echo
sleep 2
done
}

tabla


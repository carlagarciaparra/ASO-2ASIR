
#pedimos al usuario un número para que se calcule el factorial
$numero = Read-Host "introduce un numero para calcular su factorial"
$factorial=1

#controlamos que el numero no sea mayor de 238
if ($numero -gt "238"){
for ($inicio=1;$inicio -le $numero; $inicio++)
{
#multiplicacion entre todos los números que lo anteceden
    $factorial= $factorial * $inicio
   
}
     write-host "$numero = $factorial"
#en el caso de que sea mayor escribiremos un error
} else {
    Write-Host "El número introducido es demasiado grande"
}

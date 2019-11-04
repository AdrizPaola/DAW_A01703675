<?php

function connectDB() {        
    $servername = "mysql1008.mochahost.com";
    $username = "dawbdorg_1703675";
    $password = "1703675";
    $dbname = "dawbdorg_A01703675";

    $environment = "DEV";
    if ($environment == "DEV") {
         $connection = mysqli_connect($servername, $username, $password, $dbname);
    } else if($environment == "PROD") {
         $connection = mysqli_connect($servername, $username, "passwdadmin", $dbname);
    }
    if(!$connection){
        die("Conexión fallida: " . mysqli_connect_error());
    }

    mysqli_set_charset($connection,"utf8");
    return $connection;
}


function closeDB($bd) {
   mysqli_close($bd);
}

function historialZombies() {
   $db = connectDB();
   if($db == null){
       echo "Conexion base de datos no exitosa";
       return;
   }
    
    $resultado = array();
    $query = "SELECT ID, Nombre FROM Zombie";
    $registros = $db->query($query);
    while ($fila = mysqli_fetch_array($registros, MYSQLI_BOTH)) {
       array_push($resultado, array($fila["ID"],$fila["Nombre"]));
   }
    $regresar='<table><thead><tr><td>Nombre</td><td>Estados</td></tr></thead><tbody>';
    
    for($i = 0; $i < count($resultado); $i++){
        $id1=$resultado[$i][0];
        $query1 = "CALL HistorialZombies($id1)";
        $resultado2 = array();
        $registros2 = $db->query($query1);
    if($registros2){
           while ($fila = mysqli_fetch_array($registros2, MYSQLI_BOTH)) {
               array_push($resultado2, array($fila["Nombre"],$fila["FechaHora"]));
           }
            $regresar.="<tr><td>".$resultado[$i][1]."</td><td>";

            for($j=0; $j < count($resultado2); $j++){
                $regresar.= $resultado2[$j][0]."  ".$resultado2[$j][1]."<br/>";
            }
            $regresar.="</td></tr>";
        }
        else{
             $regresar.="<tr><td>".$resultado[$i][1]."</td><td>";
             $regresar.="</td></tr>";
        }
    }
    $regresar.="</tbody></table>";
  
   closeDB($db);
   echo $regresar;
}


function cantidadZombies()
{
   $db = connectDB();
   if($db == null){
       echo "Conexion base de datos no exitosa";
       return;
   }
   $query = 'CALL CantidadZombies()';
   $resultado = array();
  
   $registros = $db->query($query);

   while ($fila = mysqli_fetch_array($registros, MYSQLI_BOTH)) {
       array_push($resultado, array($fila["Numero Zombies"]));
   }
   
    for($j=0; $j < count($resultado); $j++){
            $aux.= $resultado[$j][0]."<br/>";
        }
      
   mysqli_free_result($registros);

   closeDB($db);
   return $aux;
}


function estado(){
     $db = connectDB();
    $resultado = array();
    $query ='CALL estados()';
    $registros = $db->query($query);
    while ($fila = mysqli_fetch_array($registros, MYSQLI_BOTH)) {
       array_push($resultado, array($fila["Nombre"],$fila["Cuantos"]));
   }
    $regresar='<table><thead><tr><td>Nombre</td><td>Estados</td></tr></thead><tbody>';
     for($i = 0; $i < count($resultado); $i++){
         $regresar.='<tr>
         <td>'.$resultado[$i][0].'</td>
         <td>'.$resultado[$i][1].'</td></tr>';
     }
    $regresar.='</tbody></table>';
    echo $regresar;
}




?>
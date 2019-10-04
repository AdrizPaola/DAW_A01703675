<?php
    require_once("util.php");
    encabezado();
    $name=$_POST['nombre'];

   //Funcion para eliminar un registro
    if (isset($_POST["nombre"])) {
        
        delete_by_name($name);
        echo '<script language="javascript">';
        echo 'alert("Se borró la fruta")';
        echo '</script>';
   
    }else{
        echo '<script language="javascript">';
        echo 'alert("Ingresa el nombre de la fruta correctamente")';
        echo '</script>';
    }

?>
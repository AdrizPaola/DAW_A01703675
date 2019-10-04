<?php
    require_once("util.php");

    encabezado();

    if(isset($_POST["nombre"])){
        echo "Entro";
         $name=htmlspecialchars($_POST['nombre']);
        $units=htmlspecialchars($_POST['unidades']);
        $quatity=htmlspecialchars($_POST['cantidad']);
        $price=htmlspecialchars($_POST['precio']);
        $country=htmlspecialchars($_POST['pais']);
        
        
        if(update_by_name($name, $units, $quatity, $price, $country)){
        echo "LO ACTUALIZO";
        }
        else{
            echo "NO LO ACTUALIZA";
        }
        
        echo '<script language="javascript">';
            echo 'alert("Se edito la fruta")';
        echo '</script>';
        header('Location: '.$_SERVER['HTTP_REFERER']);
        
    } else{
        echo '<script language="javascript">';
            echo 'alert("No se encontro registro")';
        echo '</script>';

    }
?>
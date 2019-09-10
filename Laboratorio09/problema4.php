<?php
	require_once("util.php");
	encabezado(); 

    $numero = $_POST["potencia"];
    $aux = '<tr><th> Número </th><th>Cuadrado</th><th>Cubo</th></tr></tr>';
    for ($i = 1; $i <= $numero; $i++) {
        $aux .= "<tr><td>" . $i . "</td><td>" . ($i*$i) . "</td><td>" . ($i*$i*$i) . "</td></tr>";
    }
    echo "<table border=3>" . $aux . "</table>";
    principal();
    footer();  
?>
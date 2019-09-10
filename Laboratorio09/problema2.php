<?php 
	require_once("util.php");
	encabezado(); 
  
  $arrString=$_POST["arreglo"];

  $arregloAux = explode(" ", $arrString);
  sort($arregloAux);
  $tamanioArreglo = count($arregloAux);
  $mediana = floor($tamanioArreglo / 2);
  echo '<section><div><h4>Mediana</h4>';
  echo "La  mediana del arreglo es: ". $arregloAux[$mediana] . "</div></section>";
  principal();
  footer();  
?>
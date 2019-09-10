<?php 
	require_once("util.php");
	encabezado(); 

  function promedio($arreglo){
      $suma = 0;
      $promedio = 0;
      $tamanioArreglo = count($arreglo);
      for($i=0; $i < $tamanioArreglo; $i++) { 
          $suma += $arreglo[$i];
      } 
      $promedio = $suma/$tamanioArreglo;
      return $promedio;
  }
  $arregloEntrada=$_POST["arreglo"];
  $arregloAux = explode(" ", $arregloEntrada);
  echo '<section><div><h4>Calcular Promedio</h4>';
  echo 'El promedio del arreglo es: '.promedio($arregloAux).'</div></section>';
  principal();
  footer();  
?>
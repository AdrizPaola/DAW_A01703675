<?php 
	require_once("util.php");
	encabezado(); 
  
  $arrString=$_POST["arreglo"];
  $arregloAux = explode(" ", $arrString);
  $n = $arregloAux[0];
  $m = $arregloAux[1];
  $a = $arregloAux[2];
  $cuantosn = 0;
  $cuantosm = 0;
  $total= 0;

  if(($a > $n) and ($a > $m)){
    echo "1";
  } else{
      if(($n % $a) > 0){
            $cuantosn = ($n/$a) + 1;
              
          } else {
              $cuantosn = $n/$a;       
          }
          
          if(($m % $a) > 0){
              $cuantosm = ($m/$a) + 1;
          } else {
              $cuantosm = $m/$a;
          }
  }
  
 
  $total = floor($cuantosn) + floor($cuantosm);
  sort($arregloAux);

  echo '<section><div><h4>Cantidad de Losas</h4>';
  echo "Se pueden utilizar un total de: ". $total . "</div></section>";
  principal();
  footer();  
?>
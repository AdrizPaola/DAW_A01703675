<?php
    require_once("util.php");
    encabezado();

    $entradaArreglo = $_POST["arreglo"];
    $arregloAux = explode(" ", $entradaArreglo);
    echo "<ul";
    $suma = 0;
    $tamanioArreglo = count($arregloAux);

    for($i = 0; $i < $tamanioArreglo; $i++){
        echo "<li>";
        $suma = $suma + $arregloAux[$i];
        echo "". $arregloAux[$i] . "</li>";
    }

    echo "</ul>";
    echo "El promedio es ". ($suma)/$tamanioArreglo;
    echo "<br>";

    sort($arregloAux);
    $mediana = floor($tamanioArreglo/2);
    echo "La mediana es: ". $arregloAux[$mediana];
    echo "<br>";
    echo "Ordenado de menor a mayor: ";
    for($i = 0; $i < $tamanioArreglo; $i++){
        echo "$arregloAux[$i]";
    }
    echo "<br>";
    echo "Ordenado de mayor a menor: ";
    rsort($arregloAux);
    for($i = 0; $i < $tamanioArreglo; $i++){
        echo "$arregloAux[$i]";
    }
    echo "<br>";

    principal();
    footer();
    
?>
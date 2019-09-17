<?php
  function calcularIMC($peso, $altura){
    $alturaMetros = $altura / 100;
    $imc = ($peso / ($alturaMetros * $alturaMetros));
    return $imc;
  }

  function clasificacion($imc){
    $clasificacion1;
    if($imc < 18.5){
      $clasificacion1 = "Bajo de peso";
    } else if($imc >= 18.5 and $imc <= 24.9){
      $clasificacion1 = "IMC normal";
    } else if($imc >= 25 and $imc <= 29.9){
      $clasificacion1 = "Sobrepeso";
    } else if($imc >= 30 and $imc <= 34.9){
      $clasificacion1 = "Obesidad tipo 1";
    } else if($imc >= 35 and $imc <= 39.9){
      $clasificacion1 = "Obesidad tipo 2";
    } else if($imc >= 40){
      $clasificacion1 = "Obesidad mórbida";
    }
    return $clasificacion1;
  }

  if(isset($_POST['calcular'])){
    //echo "Entro1";
    $_POST["nombre"] = htmlentities($_POST["nombre"]);
    $_POST["correo"] = htmlentities($_POST["correo"]);
    $_POST["peso"] = htmlentities($_POST["peso"]);
    $_POST["altura"] = htmlentities($_POST["altura"]);

    if (isset($_POST['nombre'])&&isset($_POST['correo'])&& isset($_POST['peso'])&& isset($_POST['altura'])&& $_POST["peso"] != "" && $_POST["altura"] != "" && $_POST["peso"] != 0 && $_POST["altura"] != 0) {
        //echo "Entro2";
        $imc = calcularIMC($_POST['peso'], $_POST['altura']);
        $clasificacion = clasificacion ($imc);
        //echo "Entro3";
        include('imc_Vista.php');
        //echo "Entro4";
        if (isset($_GET['imc'])) {
            echo "Entro5";
            $imc = $_GET['imc'];
            $clasificacion = clasificacion ($imc);
            include('imc_Vista.php');
        }

    }else{
        include("partials/head.html");
        include("partials/index.html");
        include("partials/footer.html");
    }
    
}else{
    include("partials/head.html");
    include("partials/index.html");
    include("partials/footer.html");
}       
    if (isset($_GET['imc'])) {
        $imc = $_GET['imc'];
        $clasificacion = clasificacion ($imc);
        include('imc_Vista.php');
    }
?>


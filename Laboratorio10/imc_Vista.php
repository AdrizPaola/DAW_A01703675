<?php
  require_once("util.php");
  encabezado();
?>

  <body>
  <p> Resultados: </p>
  <p>
   Hola! <?php echo htmlspecialchars(htmlentities($_POST["nombre"]), ENT_QUOTES, 'UTF-8') ?> Para un peso de: <?php echo htmlspecialchars (htmlentities($_POST["peso"]), ENT_QUOTES, 'UTF-8') ?> kilogramos y una talla de: <?php echo htmlspecialchars (htmlentities($_POST["altura"]), ENT_QUOTES, 'UTF-8') ?> metros. Su IMC es: <?php echo htmlspecialchars ($imc, ENT_QUOTES, 'UTF-8') ?>
  </p>

  <p>
  De acuerdo a lo obtenido usted esta dentro del rango de: <?php echo htmlspecialchars ($clasificacion, ENT_QUOTES, 'UTF-8') ?>
  </p>
    
   </body>
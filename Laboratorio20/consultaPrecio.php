<?php
  include("partials/head.html");
  require_once("util.php");
  $_POST["precio"] = htmlspecialchars($_POST["precio"]);
  if (isset($_POST["precio"])) {
      getCheapestFruits($_POST["precio"]);
  }else {
      getCheapestFruits();
  }
?>
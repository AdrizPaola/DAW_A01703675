<?php
    session_start();
    if(empty ($_SESSION["username"])){
        if(empty($_POST["username"])){
            header('Location: index.php');
        }
        else
        {
            $_SESSION["username"] = $_POST["username"];
            $_SESSION["password"] = $_POST["password"];
        }
    }


    if(htmlspecialchars($_POST["username"]) == "AdrizPaola" && htmlspecialchars($_POST["password"]) == "1008"){
        if(($_SESSION["username"] == "AdrizPaola")&&($_SESSION["password"] == "1008")) {
          include("partials/head.html");
          include("partials/subirFoto.html");
	        include("partials/footer.html");
    	}

    }else if(isset($_POST["usuario"]) || isset($_POST["password"]) ) {
        include("index.php");

    } else {
        include("index.php");
    }
?>
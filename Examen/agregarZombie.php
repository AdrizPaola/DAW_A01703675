<?php
	include("partials/_header.html");
    require_once("modelo.php");
    
    if(isset($_POST["nombreZombie"])){
      	agregarZombie($_POST["nombreZombie"]);
        header("location:index.php");
                   
    }
    else{
        include_once("partials/_agregarZombie.html");
    }
    include_once("partials/_footer.html");

?>
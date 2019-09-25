<?php
    function encabezado(){
        include("partials/head.html");
    }

    function indice(){
        include("partials/index.html");
    }

    function footer(){
        include("partials/footer.html");
    }

    function principal(){
        return "<a href='index.php'> Regresar </a>";
    }

    function inicioSesion(){
        include("partials/login.html");
    }

?>
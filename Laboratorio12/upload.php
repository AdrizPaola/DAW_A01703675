<?php
 session_start();
    if($_SESSION["username"] == "AdrizPaola"){
        $target_dir = "img/";
        $target_file = $target_dir . basename($_FILES["fileToUpload"]["name"]);
        $subida = 1;
        $imageFileType = strtolower(pathinfo($target_file,PATHINFO_EXTENSION));


        if(isset($_POST["submit"])) {
            $check = getimagesize($_FILES["fileToUpload"]["tmp_name"]);
            if($check !== false) {
                echo "El archivo es una imagen - " . $check["mime"] . ".";
                $subida = 1;
            } else {
                echo "El archivo no es una imagen";
                $subida = 0;
            }
        }
 
        if (file_exists($target_file)) {
            echo "La imagen ya existe";
            $subida = 0;
        }
   
        if ($_FILES["fileToUpload"]["size"] > 500000) {
            echo "La imagen es demasiado grande";
            $subida = 0;
        }

        if($imageFileType != "jpg" && $imageFileType != "png" && $imageFileType != "jpeg"
        && $imageFileType != "gif" ) {
            echo "Sorry, only JPG, JPEG, PNG & GIF files are allowed.";
            $subida = 0;
        }

        if ($subida == 0) {
            echo "La imagen no fue cargada.";

        } else {
            if (move_uploaded_file($_FILES["fileToUpload"]["tmp_name"], $target_file)) {
                echo "The file ". basename( $_FILES["fileToUpload"]["name"]). " has been uploaded.";
                $_SESSION["imagen"]= $target_file;
                header("location:login.php");
            } else {
                echo "Hubo un error al cargar la imagen";
            }
        }
    }else{
        header("location:index.php");
    }
?>
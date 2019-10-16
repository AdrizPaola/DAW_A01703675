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

    function registrarF(){
        include("partials/_formaRegistrarFruta.html");
    }

    function agregarFruta(){
        include("partials/_formaAgregarFruta.html");
    }

    function eliminarFruta(){
        include("partials/_formaEliminarFruta.html");
    }

    function editarFruta(){
        include("partials/_formaEditarFruta.html");   
    }

    function ajax(){
        include("ajaxView.html");
    }

    function datosNombre(){
         include("partials/datosNombre.html");
    }

    function datosPrecio(){
        include("partials/datosPrecio.html");
    }

    function principal(){
        return "<a href='index.php'> Regresar </a>";
    }

    function conectDb(){ 
    
        $conexion=mysqli_connect("localhost","root","","frutas");
        if($conexion==NULL){
            die("Error en la conexión");
        }
        $conexion->set_charset("utf8");
        return $conexion;
    }
   

    function closeDb ($conexion){
        mysqli_close($conexion);
    }

    function getFruits(){
        $conn=conectDb();
        $sql="SELECT name, units, quantity, price, country FROM frutas";
        $result = mysqli_query($conn, $sql);
        closeDb($conn);
        return $result;
    }


    function getFruitsByName($fruit_name){
        $conn=conectDb();
        $sql="SELECT name, units, quantity, price, country FROM frutas WHERE name Like '%".$fruit_name."%'";
        $result=mysqli_query($conn,$sql);

        if(mysqli_num_rows($result)>0){
            echo '<table class = "table"><thead><h2>Frutas con ese nombre</h2><tr><th>Nombre</th><th>Unidad</th><th>Cantidad</th><th>Precio</th><th>País</th></tr></thead><tbody>';
     
            while($row=mysqli_fetch_assoc($result)){
                echo '<tr>';
                echo '<td>'.$row["name"].'</td>';
                echo '<td>'.$row["units"].'</td>';
                echo '<td>'.$row["quantity"].'</td>';
                echo '<td>'.$row["price"].'</td>';
                echo '<td>'.$row["country"].'</td>';
                echo '</tr>';
            }
        }else{
        echo '<p>No existe una fruta con ese nombre</p>';
        }
        echo '</tbody></table>';
        mysqli_free_result($result); 
        closeDb($conn);
        return $result;
    }
 

    function getCheapestFruits($cheap_price){
        $conn=conectDb();
        $sql="SELECT name, units, quantity, price, country FROM frutas WHERE price <= '".$cheap_price."'";
        $result=mysqli_query($conn,$sql);

        if(mysqli_num_rows($result)>0){
            echo '<table class = "table"><thead><h2>Frutas menor o igual al precio dado</h2><tr><th>Nombre</th><th>Unidad(es)</th><th>Cantidad(es)</th><th>Precio</th><th>País</th></tr></thead><tbody>';
           
            while($row=mysqli_fetch_assoc($result)){
                echo '<tr>';
                echo '<td>'.$row["name"].'</td>';
                echo '<td>'.$row["units"].'</td>';
                echo '<td>'.$row["quantity"].'</td>';
                echo '<td>'.$row["price"].'</td>';
                echo '<td>'.$row["country"].'</td>';
                echo '</tr>';
            }
        }else{
        echo '<p>No existe una fruta con un precio igual o menor</p>';
        }
        echo '</tbody></table>';
        mysqli_free_result($result); 
        closeDb($conn);
        return $result;
    }

    function insertFruit($name, $units, $quantity, $price, $country){
        $bd = conectDb();
        
        $query='INSERT INTO Frutas(name, units, quantity, price, country) VALUES (?,?,?,?,?)';
        if(!($statement = $bd->prepare($query))){
            die("Preparation failed: (" . $bd->errno . ") " . $bd->error);
        }
        
        $name = $bd->real_escape_string($name); //Para hacer seguros los datos.
        $units = $bd->real_escape_string($units);
        $quantity = $bd->real_escape_string($quantity);
        $price = $bd->real_escape_string($price);
        $country = $bd->real_escape_string($country);
        
        if (!$statement->bind_param("sssss", $name, $units, $quantity, $price, $country)) {
            die("Parameter vinculation failed: (" . $statement->errno . ") " . $statement->error); 
        }
         
        if (!$statement->execute()) {
            die("Execution failed: (" . $statement->errno . ") " . $statement->error);
        } 
        
        closeDb($bd);
    }


    function delete_by_name($fruit_name){
        $conn=conectDb();
        $sql="DELETE FROM Frutas WHERE name='" . $fruit_name . "'";
        $result=mysqli_query($conn,$sql);
        closeDb($conn);
        return $result;
    }

    function update_by_name($name, $units, $quantity, $price, $country){
        $conn=conectDb();
        $sql="UPDATE Frutas SET units=?, quantity=?, price=?, country=? WHERE name LIKE '%".$name."%'";
        $result=mysqli_query($conn,$sql);
        
        $name = $conn->real_escape_string($name); //Para hacer seguros los datos.
        $units = $conn->real_escape_string($units);
        $quantity = $conn->real_escape_string($quantity);
        $price = $conn->real_escape_string($price);
        $country = $conn->real_escape_string($country);
        
        if(!($statement = $conn->prepare($sql))){
            die("Preparation failed: (" . $conn->errno . ") " . $conn->error);
        }
        
        if (!$statement->bind_param("ssss", $units, $quantity, $price, $country)) {
            die("Parameter vinculation failed: (" . $statement->errno . ") " . $statement->error); 
        }
         
        if (!$statement->execute()) {
            die("Execution failed: (" . $statement->errno . ") " . $statement->error);
        } 
        
        closeDb($conn);
        return $result;
    }

  

    

?>

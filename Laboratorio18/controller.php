<?php
require_once("util.php");
$pattern=strtolower($_GET['pattern']);
$words=array();
$result=getFruits();
if(mysqli_num_rows($result)>0){
    //Cargar
    while($row=mysqli_fetch_assoc($result)){
      array_push($words,$row["name"]);
    }
  }else{
    echo 'No existe fruta con ese nombre';
  }
$response="";
$size=0;
for($i=0; $i<count($words); $i++)
{
   $pos=stripos(strtolower($words[$i]),$pattern);
   if(!($pos===false))
   {
     $size++;
     $word=$words[$i];
     $response.="<option value=\"$word\">$word</option>";
   }
}
if($size>0)
  echo "<select id=\"list\" size=$size onclick=\"selectValue()\">$response</select>";
?>
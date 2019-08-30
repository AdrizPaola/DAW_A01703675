function cambiaTexto(){
    document.getElementById("texto").innerHTML = "Te quiero mucho";
    document.getElementById("texto").style.fontStyle = "italic"
}

function salidaTexto(){
    document.getElementById("texto").innerHTML = "Nunca lo olvides";
    document.getElementById("texto").style.fontStyle = "italic"
}




//Drag-And-Drop
function allowDrop(event) {
  event.preventDefault();
}

function drag(event) {
  event.dataTransfer.setData("text", event.target.id);
}

function drop(ev) {
  event.preventDefault();
  var data = event.dataTransfer.getData("text");
  event.target.appendChild(document.getElementById(data));
}




function agregarProducto(){
    
    let iphone = document.getElementById("cel1").value;
    let huawei = document.getElementById("cel2").value;
    let samsung = document.getElementById("cel3").value;
   
    let total_iphone = iphone * 24000;
    let total_huawei = huawei * 18000;
    let total_samsung = samsung * 17000;
    
    let iva;
    let aux = "";
    let pago = 0;
    
    
    if(iphone>0){
        aux +="Cantidad iPhone: " + iphone + " =  " + total_iphone + "<br/>";
        
    }if(huawei>0){
        aux +="Cantidad Huawei: " + huawei + " =  " + total_huawei + "<br/>";
        
    }if(samsung>0){
        aux +="Cantidad Samsung: " + samsung + " =  " + total_samsung + "<br/><br/>";
        
    }
    
    pago = total_huawei + total_iphone + total_samsung;
    iva = pago * 0.16;

   
    aux += "Total sin IVA = "+ pago + " pesos. <br/>" ;
    aux += "IVA= "+ iva + " pesos. <br/>" ;
    aux += "Total a pagar = "+ (pago+iva) + " pesos. <br/>" ;
    document.getElementById("pago").innerHTML = aux;
}



function consejo() {
  document.getElementById("respuesta").style.display = "block";
 }

 function quitarConsejo(){
	document.getElementById("respuesta").style.display = "none";
}


function funcAvisa(){
 window.alert("Hola!! bienvenido a este sitio, disfruta el contenido :D");
}

setTimeout(funcAvisa,1000);
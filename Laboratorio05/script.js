function evaluarContraseñas() {
    let contrasenia;
    let contraseniaConfirm;
    let tamanio = false;
    let numeros = false;
    let letras = false;
    let caracteres = false;
    let aceptada = 0;
    let aceptadaVal = false;
    
    document.getElementById("con1").value;
    
    contrasenia = document.getElementById("con1").value;
    contraseniaConfirm = document.getElementById("con2").value;

    
    if(contrasenia.length==0){
        tamanio=false;
  
    }if(contrasenia.length >= 8){
        tamanio=true;
        aceptada++;

    }if(contrasenia.match(/[0-9]/)){
        numeros=true;
        aceptada++;

    }if(contrasenia.match(/[a-z]/)){
        letras=true;
        aceptada++;

    }if(contrasenia.match(/[!#$%*&.]/)){
        caracteres = true;
        aceptada++;
    }
    if(aceptada == 4){
        aceptadaVal = true;
    }
    
    if(contrasenia == contraseniaConfirm && aceptadaVal == false){
        document.getElementById("feedback").innerHTML = "La contraseña no cumple los requisitos";
        
    }else if(contrasenia == contraseniaConfirm && aceptadaVal == true){
        document.getElementById("feedback").innerHTML = "Contraseña aceptada";
        
    }else{
        document.getElementById("feedback").innerHTML = "Las contraseñas no coinciden";
    }
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




function resultados(){
    let nombre1 = document.getElementById("nombre").value;
    let ingre = document.getElementById("ingresos").value;
    let ren = document.getElementById("renta").value;
    let iluminacion = document.getElementById("luz").value;
    let aguita = document.getElementById("agua").value;
    let alim = document.getElementById("comida").value;
    let internet = document.getElementById("inter").value;
    let total = 0;
    let paga = 0;
    let invalida=0;
    
 
    if(!nombre1.match(/[a-z]/)||nombre1==0){
        document.getElementById("msg1").innerHTML = "Ingresa un nombre válido";
        invalida++;
    }
    if(isNaN(ingre)||ingre==0){
        document.getElementById("msg2").innerHTML = "Ingresa número";
        invalida++;
    }
    if(isNaN(ren)||ren==0){
        document.getElementById("msg3").innerHTML = "Ingresa número";
        invalida++;
    }
    if(isNaN(iluminacion)||iluminacion==0){
        document.getElementById("msg4").innerHTML = "Ingresa número";
        invalida++;
    }
    if(isNaN(aguita)||aguita==0){
        document.getElementById("msg5").innerHTML = "Ingresa número";
        invalida++;
    }
    if(isNaN(alim)||alim==0){
        document.getElementById("msg6").innerHTML = "Ingresa número";
        invalida++;
    }
    if(isNaN(internet)||internet==0){
        document.getElementById("msg7").innerHTML = "Ingresa número";
        invalida++;
    }
    
    let aux="";

    if(invalida==0){
        
        total = parseInt(ren) + parseInt(iluminacion) + parseInt(aguita) + parseInt(alim) + parseInt(internet);
        
        total = parseInt(ingre - total);
        
        if(total > 0){
            aux+="Hola " + nombre1 + " ";
            aux+="el ingreso restante después de tus pagos es de: ";
            aux += total;
            document.getElementById("res").innerHTML = aux;  
        } else if(total < 0){
            aux+="Hola " + nombre1 + " ";
            aux+="es una pena, para solventar gastos te hacen falta ";
            aux += Math.abs(total);
            document.getElementById("res").innerHTML = aux; 
        } else{
            document.getElementById("res").innerHTML = "Apenas ajustaste cuentas, no te quedo dinero extra"
        }
        

    }else{
        alert("Llena los campos correctamente");
    }


}


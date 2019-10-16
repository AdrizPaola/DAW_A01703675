function resultados(){
    let nom = document.getElementById("nombre").value;
    let mail = document.getElementById("correo").value;
    let peso1 = document.getElementById("peso").value;
    let altura1 = document.getElementById("altura").value;
    let bandera = 0;

    if(!nom.match(/[a-z]/)||nom==0){
        document.getElementById("retro1").innerHTML = "Ingresa un nombre válido";
        bandera++;
    }if(!mail.match(/[@]/)||mail==0){
        document.getElementById("retro2").innerHTML = "Ingresa un correo válido";
        bandera++;
    }if(isNaN(peso1)||peso1==0){
        document.getElementById("retro3").innerHTML = "Ingresa número";
        bandera++;
    }if(isNaN(altura1)||altura1==0){
        document.getElementById("retro4").innerHTML = "Ingresa número";
        bandera++;
    }
    
    if(bandera==0){
    }else{
        alert("Necesitas llenar todos los campos correctamente");
    }
}

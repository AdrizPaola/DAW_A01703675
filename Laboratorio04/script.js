function tablaCuadradosCubos(){
    var numero = prompt("Ingrese la cantidad de respuestas deseadas: ");
    var val = parseInt(numero); //Para convertir la cadena numero en un entero
    var tabla = "";
    
    tabla = tabla + "<tr>"
                    +"<th> Número </th>"
                    +"<th> Cuadrado </th>"
                    +"<th> Cubo </th>" + "</tr>";

    for (var i = 0; i < val; i++) {
        tabla = tabla + "<tr>"
                        +"<td>" + i + "</td>"
                        +"<td>" + i*i + "</td>"
                        +"<td>" + i*i*i + "</td>"
                        +"</tr>";
    }
    
    tabla="<table border = 3>" + tabla + "</table>";
    document.write("" + tabla);
    document.write('<br><br><a href="Laboratorio04.html"> Regresar a la página principal</a>');
}


function suma(){
    var numero1 = Math.floor(Math.random() * 10);  //Para generar numeros aleatorios
    var numero2 = Math.floor(Math.random() * 10);
    var tiempo1 = performance.now(); //Para calcular el tiempo que transcurre en milisegundos 
    var respuesta = prompt("¿Cuánto es " + numero1 + " + " + numero2 + "?");
    var tiempo2 = performance.now();
    var val = parseInt(respuesta);
    var resultado = numero1 + numero2;
    var tiempoTotal = (tiempo2-tiempo1)/1000;
    
    if(val == resultado){
        document.write("Correcto, tardaste " + tiempoTotal + " segundos en resolverlo");
    } else{
        document.write("Incorrecto, tardaste " + tiempoTotal + " segundos en resolverlo");
    }
    document.write('<br><br><a href="Laboratorio04.html"> Regresar a la página principal</a>');
}


function crearArreglo(){
    var arreglo = new Array(10);
    for(var i = 0; i < arreglo.length; i++){
        arreglo [i]= Math.floor(Math.random() * 20)-10;
    }
    return arreglo;
}

function contador(array) {
   var totales = [0,0,0];
   for(var i = 0; i < array.length; i++){
       if(array[i]<0){
           totales[0]++;
       }
       if(array[i]==0){
           totales[1]++;
       }
        if(array[i]>0){
            totales[2]++;
        }
    }
    return totales;
}


function numPosNeg0(){
    var numeros = arreglo();
    var respuesta = contador(numeros);
    document.write("" + numeros 
                   + "<br><br>" 
                   + "Negativos: " + respuesta[0] + "<br>"
                   + "Positivos: " + respuesta[2] + "<br>"
                   + "Ceros: " + respuesta[1]);
    document.write('<br><br><a href="Laboratorio04.html"> Regresar a la página principal</a>');
}


function crearMatriz(){
    var matriz = [];
	for(var i=0; i < 5; i++) {
	    for(var j=0; j < 5; j++) {
	        matriz[i] = crearArregloProm();
	    }
	}
    return matriz;
}


function crearArregloProm(){
    var arreglo = new Array(5);
    for(var i = 0; i < arreglo.length; i++){
        arreglo [i]= Math.floor(Math.random() * 10);
    }
    return arreglo;
}


function generarPromedios(matriz){
    var suma = 0;
    var promedio = [0,0,0,0,0];
    var result = "";
    for(var i=0; i < 5; i++) {
	    for(var j=0; j < 5; j++) {
	        suma = suma + matriz[i][j];
	    }
        promedio[i] = suma/5;
        suma = 0;
	}
    return promedio;
}


function promedios(){
    var matriz = crearMatriz();
    var promedios = generarPromedios(matriz); 
    document.write("PROMEDIOS:" 
                   + "<br><br>" 
                   + "Primer renglón:   [" + matriz[0] + "]   Promedio: " + promedios[0] + "<br>" 
                   + "Segundo renglón:  [" + matriz[1] + "]   Promedio: " + promedios[1] + "<br>"
                   + "Tercer renglón:   [" + matriz[2] + "]   Promedio: " + promedios[2] + "<br>"
                   + "Cuarto renglón:   [" + matriz[3] + "]   Promedio: " + promedios[3] + "<br>"
                   + "Quinto renglón:   [" + matriz[4] + "]   Promedio: " + promedios[4] + "<br>");
    document.write('<br><br><a href="Laboratorio04.html"> Regresar a la página principal</a>');
    
}


function invertir(numero){
    var digito;
    var num = parseInt(numero);
    var aux = 0;
    while(num > 0){
        digito = num % 10;
        aux = (aux * 10) + digito;
        num = parseInt(num/10);
    }
    return aux;
}


function numeroInvertido(){
    var num = prompt("Ingresa el número a invertir");
    var numInver = invertir(num);
    document.write("Número invertido: " + numInver);
    document.write('<br><br><a href="Laboratorio04.html"> Regresar a la página principal</a>');
}



function theatreSquare(){
    var n = 6;
    var m = 6;
    var a = 4;
    
    
    var cuantosn = 0;
    var cuantosm = 0;
    var total = 0;
    
    if((a>n) && (a>m)){
        document.write("1");
    } else{
        if((n%a) > 0){
            cuantosn = (n/a) + 1;
            
        } else {
            cuantosn = n/a;       
        }
        
        if((m%a) > 0){
            cuantosm = (m/a) + 1;
        } else {
            cuantosm = m/a;
        }
        document.write(cuantosm); 
        document.write(cuantosn); 
        
        Math.trunc(cuantosn);
        Math.trunc(cuantosm);
        document.write(Math.trunc(cuantosm));
        document.write(Math.trunc(cuantosm));
        //total = cuantosn * cuantosm;
        
        //document.write(total); 
    }
}
/*function getRequestObject() {
  if(window.XMLHttpRequest) {
    return (new XMLHttpRequest());
  }
  else if (window.ActiveXObject) {
    return (new ActiveXObject("Microsoft.XMLHTTP"));
  } else {
    return(null);
  }
}*/


function sendRequest(){
   $.get("controller.php", { pattern: document.getElementById('userInput').value })
       .done(function(data)){
             var ajaxResponse = document.getElementById('ajaxResponse');
             ajaxResponse.innerHTML = data;
             ajaxResponse.style.visibility = "visible";
             });
}


function sendRequest2(){
   $.get("controller2.php", { pattern: document.getElementById('precio').value })
       .done(function(data)){
             var ajaxResponse1 = document.getElementById('ajaxResponse2');
             ajaxResponse.innerHTML = data;
             ajaxResponse.style.visibility = "visible";
             });
}


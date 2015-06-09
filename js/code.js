counter = 1;
var limit = 12;
var cantCat = 0;
var cantRubro = 0;
var contador = 1;
function eliminarElemento(id,descontar){
	input = document.getElementById(id);	
	if (!input){
		alert("Estas intentando una accion no permitida.");
	} else {
		padre = input.parentNode;
		padre.removeChild(input);
		if (descontar == 'rubro') {
			cantRubro--;
		};
		if (descontar == 'genericos') {
			counter--;
			contador--;
		};
		if (descontar == 'categoria') {
			cantCat--;
		};
	}
}

function agregarInput(divName,nombre){
	if (counter == limit){
		alert("No se pueden agregar mas campos!");
	}else{
		//Creo el elemento
		var nombreConcat = nombre+contador;
		var newdiv = document.createElement('div');
		newdiv.innerHTML = "<div class='col-lg-6' id="+nombre+""+contador+"  ><div class='form-group'><label class='col-lg-2 control-label'>"+nombre+"</label><div class='col-lg-4'><input type='text' name="+nombre+""+contador+" class='form-control'></div><button type='button' class='btn btn-default col-lg-2' onclick=eliminarElemento('"+nombreConcat+"','genericos');><span class='glyphicon glyphicon-minus-sign'></span></button></div></div>";
		document.getElementById(divName).appendChild(newdiv);
		counter++;
		contador++;
	}
}
		 
function cargarRubro(divName,nombre){
	if ((cantRubro == 1)){
		alert("No se pueden agregar mas campos!");
	}else{
		var newdiv = document.createElement('div');
		newdiv.innerHTML = "<div class='col-lg-12' id='rubro1'><div class='form-group'><label class='col-lg-2 control-label'>"+nombre+" </label><div class='col-lg-4'><input type='text' id='rubroAJAX' name='rubro1' class='form-control'></div><button type='button' class='btn btn-default col-lg-1' onclick=eliminarElemento('rubro1','rubro');><span class='glyphicon glyphicon-minus-sign'></span></button><button type='button' class='btn btn-default col-lg-1' onclick=eliminarElemento('');><span class='glyphicon glyphicon-ok'></span></button></div></div>";
		document.getElementById(divName).appendChild(newdiv);
		cantRubro++;
	}
}	 

function cargarCategoria(divName,nombre){
	if ((cantCat == 1)){
		alert("No se pueden agregar mas campos!");
	}else{
		var newdiv = document.createElement('div');
		newdiv.innerHTML = "<div class='col-lg-12' id='categoria1'><div class='form-group'><label class='col-lg-2 control-label'>"+nombre+" </label><div class='col-lg-4'><input type='text' id='categoriaAJAX' name='categoria1' class='form-control'></div><button type='button' class='btn btn-default col-lg-1' onclick=eliminarElemento('categoria1','categoria');><span class='glyphicon glyphicon-minus-sign'></span></button><button type='button' class='btn btn-default col-lg-1' id='comprobar' onclick='clickBoton();'><span class='glyphicon glyphicon-ok'></span></button></div></div>";
		document.getElementById(divName).appendChild(newdiv);
		cantCat++;
	}
}
//AJAX
//Generico
var READY_STATE_COMPLETE=4;
var peticion_http = null;

function inicializa_xhr() {
	if (window.XMLHttpRequest) {
		return new XMLHttpRequest(); 
	} else if (window.ActiveXObject) {
		return new ActiveXObject("Microsoft.XMLHTTP"); 
	} 
}
//aca se envian al controlador
function comprobar() {

	var categoriaAJAX = document.getElementById("categoriaAJAX").value;
	peticion_http = inicializa_xhr();
	if(peticion_http) {
		peticion_http.onreadystatechange = procesaRespuesta;
		peticion_http.open("POST", "../controlador/controladorCategoriaAJAX.php", true);
		peticion_http.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
		peticion_http.send("categoriaAJAX="+categoriaAJAX+"&nocache="+Math.random());
	}
}

function opcionNueva(texto){
	var option = document.createElement("option");
	option.text = texto;
	option.value = 111;
		
	var select = document.getElementById("categoria");
	select.appendChild(option);

}

function procesaRespuesta() {
	if(peticion_http.readyState == READY_STATE_COMPLETE) {
		if (peticion_http.status == 200) {
			var categoriaAJAX = document.getElementById("categoriaAJAX").value;
			var respuesta_json = peticion_http.responseText;
			var respuesta = eval("("+respuesta_json+")");	
			if(respuesta){
				opcionNueva(respuesta[2]);
				eliminarElemento('categoria1','categoria');
			}	
		}
	}
}

window.onload = function() {
	document.getElementById("comprobar123").onclick = comprobar;
}

function clickBoton() {
	document.getElementById("comprobar").onclick = comprobar;
}
	
	
counter = 1;
var limit = 12;
var cantCat = 0;
var cantRubro = 0;
var maxSocios = 20;
var contador = 1;
var contadorSoc = 1;
var cantSocios = 1;
var valorInput = 0;

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
		if(descontar == 'contactos'){
			cantSocios--;
			contadorSoc--;
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

$(document).ready(function() {
	$("#Medidor").css('display','none');
	$("#Abonado").css('display','none');
});

function esAbonado(valor){
	if (valor == 1){
		$("#botonMedidor").removeClass("activoSI");
		$("#Medidor").css('display','none');
		$("#botonAbonado").addClass("activoSI");
		$("#Abonado").css('display','block');
	}
	else {
		$("#botonAbonado").removeClass("activoSI");
		$("#Abonado").css('display','none');
		$("#botonMedidor").addClass("activoSI");
		$("#Medidor").css('display','block');
	}
}


function mostrarDiv(accion){
	
	if(valorInput >  19 ){
		alert('No es posible agregar mas socios');
	}
	if((accion == 'sumar') && (valorInput < 20)){
		valorInput++;
		$('#insertarContacto'+valorInput).removeClass('displayNone');
		$('#insertarContacto'+valorInput).addClass('displayBlock');
	}
	if ((accion == 'restar') && (valorInput != 0)) {
		$('#insertarContacto'+valorInput).removeClass('displayBlock');
		$('#insertarContacto'+valorInput).addClass('displayNone');
		valorInput--;
	};

}

function agregarContacto(divName,labelCaption1,id1,id2){
	if (cantSocios == maxSocios){
		alert("No se pueden agregar mas socios!");
	}else{
		//Creo el elemento
		var newdiv = document.createElement('div'); 
		newdiv.innerHTML = "<div class='row' id="+contadorSoc+"><div class='col-lg-6'><div class='form-group'><label class='col-lg-2 control-label'>"+labelCaption1+"</label><div class='col-lg-4'><select class='form-control' name=><option value='-1'>Socio</option>"+"{% for item in contactos %}"+"<option value='{{item.idcontacto}}'>"+"{{item.nombre}}"+"</option>"+"{% endfor %}"+"</select></div><button type='button' class='btn btn-default col-lg-2' onclick=eliminarElemento('"+contadorSoc+"','contactos');><span class='glyphicon glyphicon-minus-sign'></span></button></div></div><div class='col-lg-6'><div class='form-group'><label class='col-lg-2 control-label'>Relacion:</label><div class='col-lg-6'><input type='text' class='form-control' name="+id2+contadorSoc+"/></div></div></div></div>";
		document.getElementById(divName).appendChild(newdiv);
		cantSocios++;
		contadorSoc++;
	}
}

function agregarInput(divName,labelCaption1,id1,id2){
	if (counter == limit){
		alert("No se pueden agregar mas campos!");
	}else{
		//Creo el elemento
		var newdiv = document.createElement('div');
		newdiv.innerHTML = "<div class='row' id="+contador+"><div class='col-lg-6'><div class='form-group'><label class='col-lg-2 control-label'>"+labelCaption1+"</label><div class='col-lg-4'><input type='text' name="+id1+""+contador+" class='form-control'required/></div><button type='button' class='btn btn-default col-lg-2' onclick=eliminarElemento('"+contador+"','genericos');><span class='glyphicon glyphicon-minus-sign'></span></button></div></div><div class='col-lg-6'><div class='form-group'><label class='col-lg-3 control-label'>Nuevo "+id1+":</label><div class='col-lg-6'> <input type='text' class='form-control' name="+id2+contador+"/></div></div></div></div>";
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
		newdiv.innerHTML = "<div class='col-lg-12' id='rubro1'><div class='form-group'><label class='col-lg-2 control-label'>"+nombre+" </label><div class='col-lg-4'><input type='text' id='rubroAJAX' name='rubro1' class='form-control'></div><button type='button' class='btn btn-default col-lg-1' onclick=eliminarElemento('rubro1','rubro');><span class='glyphicon glyphicon-minus-sign'></span></button><button type='button' class='btn btn-default col-lg-1' id='comprobar' onclick=clickBoton('rubroAJAX','rubro','insertar');><span class='glyphicon glyphicon-ok'></span></button></div></div>";
		document.getElementById(divName).appendChild(newdiv);
		cantRubro++;
	}
}	 

function cargarCategoria(divName,nombre){
	if ((cantCat == 1)){
		alert("No se pueden agregar mas campos!");
	}else{
		var newdiv = document.createElement('div');
		newdiv.innerHTML = "<div class='col-lg-12' id='categoria1'><div class='form-group'><label class='col-lg-2 control-label'>"+nombre+" </label><div class='col-lg-4'><input type='text' id='categoriaAJAX' name='categoria1' class='form-control'></div><button type='button' class='btn btn-default col-lg-1' onclick=eliminarElemento('categoria1','categoria');><span class='glyphicon glyphicon-minus-sign'></span></button><button type='button' class='btn btn-default col-lg-1' id='comprobar' onclick=clickBoton('categoriaAJAX','categoria','insertar');><span class='glyphicon glyphicon-ok'></span></button></div></div>";
		document.getElementById(divName).appendChild(newdiv);
		cantCat++;
	}
}

function limita(elEvento, maximoCaracteres) {
	var elemento = document.getElementById("detactividad");

	// Obtener la tecla pulsada 
	var evento = elEvento || window.event;
	var codigoCaracter = evento.charCode || evento.keyCode;
	// Permitir utilizar las teclas con flecha horizontal
	if(codigoCaracter == 37 || codigoCaracter == 39) {
	  return true;
	}

	// Permitir borrar con la tecla Backspace y con la tecla Supr.
	if(codigoCaracter == 8 || codigoCaracter == 46) {
	  return true;
	}
	else if(elemento.value.length >= maximoCaracteres ) {
	  return false;
	}
	else {
	  return true;
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
function comprobar(valorID,entidad,accion) {

	var valor = document.getElementById(valorID).value;

	peticion_http = inicializa_xhr();
	if(peticion_http) {
		peticion_http.onreadystatechange = procesaRespuesta;
		peticion_http.open("POST", "../controlador/controladorAJAX.php", true);
		peticion_http.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
		peticion_http.send('entidad='+entidad+'&accion='+accion+'&descripcion='+valor+"&nocache="+Math.random());
	}
}

function opcionNueva(texto,id,input){
	var option = (document.createElement("option");
	option.text = texto;
	option.value = id;
	var select = document.getElementById(input);
	select.appendChild(option);
}

function procesaRespuesta() {
	if(peticion_http.readyState == READY_STATE_COMPLETE) {
		if (peticion_http.status == 200) {	
			var respuesta_json = peticion_http.responseText;
			var respuesta = eval("("+respuesta_json+")");	
			if (respuesta[4] == 'categoria') {
				if(respuesta[3] == 'ok'){
					opcionNueva(respuesta[1],respuesta[2],'categoria');
					eliminarElemento('categoria1','categoria');
				}else if (respuesta[3] == 'existe'){
					alert('La categoria ya existe!');
					eliminarElemento('categoria1','categoria');
				}else if (respuesta[3] == 'vacio') {
					alert('No completaste el campo!');
					eliminarElemento('categoria1','categoria');
				}
			}else if (respuesta[4] == 'rubro') {
				if(respuesta[3] == 'ok'){
					opcionNueva(respuesta[1],respuesta[2],'rubro');
					eliminarElemento('rubro1','rubro');
				}else if (respuesta[3] == 'existe'){
					alert('La categoria ya existe!');
					eliminarElemento('rubro1','rubro');
				}else if (respuesta[3] == 'vacio') {
					alert('No completaste el campo!');
					eliminarElemento('rubro1','rubro');
				}
			}
		}
	}
}

function clickBoton(valorid,entidad,accion) {
	document.getElementById("comprobar").onclick = comprobar(valorid,entidad,accion);
}
	
	

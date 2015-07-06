<?php

require_once '../vendor/twig/twig/lib/Twig/Autoloader.php';
require_once 'controladorContacto.php';
require_once 'controladorEmpresa.php';
require_once 'usuario.php';
require_once 'controladorRol.php';
require_once 'controladorMedidor.php';
require_once 'controladorCorreo.php';
require_once 'controladorExcel.php';
require_once 'controladorAbonado.php';

Twig_Autoloader::register();
$loader = new Twig_Loader_Filesystem('../vista');
$twig = new Twig_Environment($loader, array('debug' => 'false'));//'cache' => '../cache',')); 

 session_start();
	if (!isset($_SESSION['user']) and !isset($_SESSION['clave']) ){
		header("Location:index.php?aviso=5");
	}else{
		$user = $_SESSION['user'];

		$controlador=htmlEntities(@$_GET['c']); 
		$accion=htmlEntities(@$_GET['a']); 
		if ((!empty($controlador)) and (!empty($accion))){
			/* -------- CORREO ---------- */
			if ($controlador=='correo') {
				if($accion == 'mostrar'){
					controladorCorreo::renderCorreo();
				}elseif ($accion == 'enviar') {
					controladorCorreo::enviar();
				}

			/* -------- ECEL ---------- */
			}elseif ($controlador == 'excel') {
				if($accion == 'cargarmedidor'){
					controladorExcel::cargarmedidor();
				}elseif ($accion == 'listarinfmedidores') {
					controladorExcel::listarinfmedidores();
				}elseif ($accion == 'bajainformemedidor') {
					controladorExcel::bajainformemedidor();
				}elseif ($accion == 'bajainformesexel') {
					controladorExcel::bajainformesexel();
				}elseif ($accion == 'verdetalleinformemedidor') {
					controladorExcel::verdetalleinformemedidor();
				}elseif ($accion == 'cargarempresa') {
					controladorExcel::cargarempresa();
				}elseif ($accion == 'listarinfempresa') {
					controladorExcel::listarinfempresa();
				}elseif ($accion == 'bajainformeempresa') {
					controladorExcel::bajainformeempresa();
				}elseif ($accion == 'bajainfempresaall') {
					controladorExcel::bajainfempresaall();
				}elseif ($accion == 'verdetalleinfromeempresa') {
					controladorExcel::verdetalleinfromeempresa();
				}
			/* -------- INICIO ---------- */
			}elseif ($controlador=='inicio') {
				if($accion == 'inicio'){
					$template = $twig->loadTemplate('home.html.twig');
					echo $template->render(array('user'=>$user));
				}
			/* -------- ABONADO ---------- */
			
			}elseif ($controlador == 'abonado') {
				if($accion == 'alta'){
					if (isset($_GET['id'])) {
						$id=htmlEntities(@$_GET['id']); 
						controladorAbonado::alta($id);
					}
				}elseif ($accion == 'modificar') {
					controladorAbonado::modificar();
				}elseif ($accion == 'baja') {
					controladorAbonado::baja();
				}elseif ($accion == 'listar') {
					$pag =htmlEntities(@$_GET['pagina']); 
					controladorAbonado::listar($pag);
				}elseif ($accion == 'eleccion'){
					if (isset($_GET['id'])) {
						$id=htmlEntities(@$_GET['id']); 
						controladorAbonado::eleccion($id);
					}
				}elseif ($accion=='altaNormal') {
					controladorAbonado::altaNormal();
				}
			/* -------- CONTACTO ---------- */
			}elseif($controlador == 'contacto'){
				if($accion == 'alta'){
					controladorContacto::alta();
				}elseif($accion == 'modificar'){
					controladorContacto::modificar();
				}elseif($accion == 'baja'){
					controladorContacto::baja();
				}elseif($accion == 'listar'){
						/* FILTROS CONTACTOS*/
					if (isset($_POST['tipoFiltro'])){
								if (!empty($_POST['tipoFiltro']))
									$tipoFiltro=htmlEntities($_POST['tipoFiltro']);
					}
					else $tipoFiltro='nada';

					if (isset($_POST['dato'])){
								if (!empty($_POST['dato']))
									$datoFiltro=htmlEntities($_POST['dato']);
					}

					if ((isset($tipoFiltro)) and (isset($datoFiltro)))  controladorContacto::Filtros($tipoFiltro,$datoFiltro);
					else {
						$pag=htmlEntities(@$_GET['pagina']);
						controladorContacto::listar($pag);
					}
				}
				elseif($accion == 'pdf'){ //PDF Contacto
					if ($_POST['datosPDF']){
						$datosPDF=htmlEntities($_POST['datosPDF']);
						controladorContacto::pdfContacto($datosPDF);
					}
					else {header('Location:privado.php?c=contacto&a=listar');} //Si no vienen por post, arafue!
				}elseif ($accion == 'altaconid') {
					if (isset($_GET['id'])) {
						$id=htmlEntities(@$_GET['id']); 
						controladorContacto::altaconid($id);
					}
				}

			/* -------- ROLES ---------- */
			}elseif($controlador == 'roles'){
				if($accion == 'alta'){
					controladorRol::alta();
				}elseif($accion == 'modificar'){
					if ((isset($_POST['idrol'])) && (isset($_POST['idpermiso']))){
						$idrol=htmlEntities($_POST['idrol']);
						$idpermiso=htmlEntities($_POST['idpermiso']);
						controladorRol::modificar($idrol,$idpermiso);
					}
					else {header('Location:privado.php?c=roles&a=listar');} //Si no vienen por post, arafue!
				}elseif($accion == 'baja'){
					if ((isset($_POST['idrol'])) && (isset($_POST['idpermiso']))){
						$idrol=htmlEntities($_POST['idrol']);
						$idpermiso=htmlEntities($_POST['idpermiso']);
						controladorRol::baja($idrol,$idpermiso);
					}
					else {header('Location:privado.php?c=roles&a=listar');} //Si no vienen por post, arafue!
				}elseif($accion == 'listar'){
					controladorRol::listar();
				}
			}

			/* -------- EMPRESA ---------- */
			elseif($controlador == 'empresa'){
				if($accion == 'alta'){
					controladorEmpresa::alta();
				}elseif($accion == 'modificar'){
					controladorEmpresa::modificar();
				}elseif($accion == 'baja'){
					controladorEmpresa::baja();
				}elseif($accion == 'listar'){
					$pag=htmlEntities(@$_GET['pagina']);
					controladorEmpresa::listar($pag);
				}elseif($accion == 'detalle'){
					if (!empty($_POST['id'])){
						$idempresa=htmlEntities($_POST['id']);
						controladorEmpresa::detalle($idempresa);
					}
				}elseif($accion == 'modificarContactos'){
					controladorEmpresa::modificarContactos();
				}elseif ($accion == 'modificarTelefonos') {
					controladorEmpresa::modificarTelefonos();
				}elseif ($accion == 'modificarDomicilios') {
					controladorEmpresa::modificarDomicilios();	
				}elseif ($accion == 'modificarCorreos') {
					controladorEmpresa::modificarCorreos();
				}elseif ($accion == 'eleccion') {
					if (isset($_GET['id'])) {
						$id=htmlEntities(@$_GET['id']); 
						controladorEmpresa::eleccion($id);
					}
				}elseif ($accion == 'filtro') {
					controladorEmpresa::Filtros();
				}
				elseif($accion == 'pdf'){ //PDF Usuarios
					if ($_POST['datosPDF']){
						$datosPDF=htmlEntities($_POST['datosPDF']);
						controladorEmpresa::pdfEmpresa($datosPDF);
					}
					else {header('Location:privado.php?c=usuarios&a=listar');} //Si no vienen por post, arafue!
				}
			}

			/* -------- USUARIOS ---------- */
			elseif($controlador == 'usuarios'){
				//ALTA
				if($accion == 'alta'){
					controladorUsuario::alta();
				}elseif($accion == 'modificar'){
					if (!empty($_POST['idusuario'])){
						$idusuario=htmlEntities($_POST['idusuario']);
						controladorUsuario::modificar($idusuario);
					}
					else {header('Location:privado.php?c=usuarios&a=listar');} //Si no vienen por post, arafue!

				//BAJA
				}elseif($accion == 'baja'){ //invierte activos
					if (!empty($_GET['id'])){
						$idusuario=htmlEntities($_GET['id']);
						controladorUsuario::bajaUsuario($idusuario);
					}
					else {header('Location:privado.php?c=usuarios&a=listar');} //Si no vienen por post, arafue!

				//Listar
				}elseif($accion == 'listar'){
					/* FILTROS USUARIOS*/
					if (isset($_POST['tipoFiltro'])){
								if (!empty($_POST['tipoFiltro']))
									$tipoFiltro=htmlEntities($_POST['tipoFiltro']);
					}
					else $tipoFiltro='nada';

					if (isset($_POST['dato'])){
								if (!empty($_POST['dato']))
									$datoFiltro=htmlEntities($_POST['dato']);
					}

					if ((isset($tipoFiltro)) and (isset($datoFiltro)))  controladorUsuario::Filtros($tipoFiltro,$datoFiltro);
					else controladorUsuario::listar();

				//Detalle
				}elseif($accion == 'detalle'){
					if (!empty($_POST['id'])){
						$idusuario=htmlEntities($_POST['id']);
						$usuario=PDOusuario::detalleUsuario($idusuario);
						controladorUsuario::verUsuario($usuario);
					}
					else {header('Location:privado.php?c=usuarios&a=listar');} //Si no vienen por post, arafue!

				//Eliminar
				}elseif($accion == 'eliminar'){ //elimina fisicamente
					if (!empty($_GET['id'])){
						$idusuario=htmlEntities($_GET['id']);
						controladorUsuario::eliminaUsuario($idusuario);
					}
					else {header('Location:privado.php?c=usuarios&a=listar');} //Si no vienen por post, arafue!
				//Modif. Mis datos
				}elseif($accion == 'misdatos'){
						controladorUsuario::misDatos();
				}
				elseif($accion == 'pdf'){ //PDF Usuarios
					if ($_POST['datosPDF']){
						$datosPDF=htmlEntities($_POST['datosPDF']);
						controladorUsuario::pdfUsuario($datosPDF);
					}
					else {header('Location:privado.php?c=usuarios&a=listar');} //Si no vienen por post, arafue!
				}
				}
				/* -------- MEDIDOR ---------- */
				elseif($controlador == 'medidor'){
					if($accion == 'alta'){
						if (isset($_GET['id'])) {
							$id=htmlEntities(@$_GET['id']); 
							controladorMedidor::alta($id);	
						}
					}elseif($accion == 'modificar'){
						controladorMedidor::modificar();
					}elseif($accion == 'baja'){
						controladorMedidor::baja();
					}elseif ($accion == 'eleccion') {
					if (isset($_GET['id'])) {
						$id=htmlEntities(@$_GET['id']); 
						controladorMedidor::eleccion($id);
					}
				}elseif($accion == 'listar'){
					$pag=htmlEntities(@$_GET['pagina']);
					controladorMedidor::listar($pag);
					// esto ta invisidivle??' a carajo'
						/* FILTROS MEDIDOR*/
				/*		if (isset($_POST['tipoFiltro'])){
									if (!empty($_POST['tipoFiltro']))
										$tipoFiltro=htmlEntities($_POST['tipoFiltro']);
						}
						else $tipoFiltro='nada';

					if ((isset($_POST['dato'])) and ($_POST['dato'] != '')) {
								if (!empty($_POST['dato']))
									$datoFiltro=htmlEntities($_POST['dato']);
					}
					else ($datoFiltro='nada');

					//die('tipo '.$tipoFiltro.'. dato '.$datoFiltro);

					if ((isset($tipoFiltro)) and (isset($datoFiltro))) controladorMedidor::Filtros($tipoFiltro,$datoFiltro);
					else{

						$pag=htmlEntities(@$_GET['pagina']);
						controladorMedidor::listar($pag);
				*/
					//FILTROS
					}elseif ($accion == 'filtro') {
						controladorMedidor::Filtros();
					//Eliminar
					}elseif($accion == 'eliminar'){ //elimina fisicamente
						if (!empty($_GET['id'])){
							$idMedidor=htmlEntities($_GET['id']);
							controladorMedidor::eliminaMedidor($idMedidor);
						}
						else {header('Location:privado.php?c=usuarios&a=listar');} //Si no vienen por post, arafue!
					}
					elseif($accion == 'pdf'){ //PDF Medidor
					if ($_POST['datosPDF']){
						$datosPDF=htmlEntities($_POST['datosPDF']);
						controladorMedidor::pdfMedidor($datosPDF);
					}
					else {header('Location:privado.php?c=medidor&a=listar');} //Si no vienen por post, arafue!
					}
				}
		}else{
			//Avisar q pifio path
			//puso Acción o Controlador MAL
			header('Location:privado.php?c=inicio&a=inicio');
		}

	}
	
?>
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
require_once '../modelo/PDO/PDOPermisos.php';


Twig_Autoloader::register();
$loader = new Twig_Loader_Filesystem('../vista');
$twig = new Twig_Environment($loader, array('debug' => 'false'));//'cache' => '../cache',')); 

 session_start();
	if (!isset($_SESSION['user']) and !isset($_SESSION['clave']) ){
		header("Location:index.php?aviso=5");
	}else{
		/*-------------------------------------------------------------------------------------------------
			esta aprte busco los permisos del usuario que se acabade logerar. es LOG - IN (?)
		------------------------------------------------------------------------------------------------*/
		$user = $_SESSION['user'];
		$pass = $_SESSION['clave'];
		$usuario = PDOusuario::buscarUser($user,$pass);
		$idRol = $usuario['idrol'];
		$rol = PDOrol::rolPorID($idRol);
		$permiso = PDOPermisos::traerPermiso($rol[0]->idpermisos);
		var_dump($permiso);
		/*-------------------------------------------------------------------------------------------------

		Arranca el controlador como siempre.
		-------------------------------------------------------------------------------------------------*/
		$controlador=htmlEntities(@$_GET['c']); 
		$accion=htmlEntities(@$_GET['a']); 
		if ((!empty($controlador)) and (!empty($accion))){
			/*Esta parte no tiene controles ni permisos mala nuestra ... iguale s facil programador del futuro,
			solo deberias agregar mas propiedades al crud de la tabla permisos, modificar las vistas, poner carteles 
			... NO tiene control abonado, ni correo ni el tema del excel..*/
			/* -------- CORREO ---------- */
			if ($controlador=='correo') {
				if($accion == 'mostrar'){
					controladorCorreo::renderCorreo();
				}elseif ($accion == 'enviar') {
					controladorCorreo::enviar();
				}elseif ($accion ='verinf') {
					controladorCorreo::mostrarInforme();
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
					$pag=htmlEntities(@$_GET['pagina']);
					controladorAbonado::baja($pag);
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
					if ($permiso->csocio == 1) {
						controladorContacto::alta();
					}else{
						$template = $twig->loadTemplate('accesodenegado.html.twig');
						echo $template->render(array());
					}
				}elseif($accion == 'modificar'){
					if ($permiso->usocio == 1) {
						controladorContacto::modificar();
					}else{
						$template = $twig->loadTemplate('accesodenegado.html.twig');
						echo $template->render(array());
					}
				
				}elseif($accion == 'baja'){
					if ($permiso->dsocio == 1) {
						$pag =htmlEntities(@$_GET['pagina']); 
						controladorContacto::baja($pag);
					}else{
						$template = $twig->loadTemplate('accesodenegado.html.twig');
						echo $template->render(array());
					}
					
				}elseif($accion == 'listar'){
					if ($permiso->rsocio == 1) {
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
					}else{
						$template = $twig->loadTemplate('accesodenegado.html.twig');
						echo $template->render(array());
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
					if ($permiso->crol == 1) {
						controladorRol::alta();
					}else{
						$template = $twig->loadTemplate('accesodenegado.html.twig');
						echo $template->render(array());
					}
					
				}elseif($accion == 'modificar'){
					if ($permiso->urol == 1){
						if ((isset($_POST['idrol'])) && (isset($_POST['idpermiso']))){
							$idrol=htmlEntities($_POST['idrol']);
							$idpermiso=htmlEntities($_POST['idpermiso']);
							controladorRol::modificar($idrol,$idpermiso);
						}
						else {header('Location:privado.php?c=roles&a=listar');} //Si no vienen por post, arafue!
					}else{
						$template = $twig->loadTemplate('accesodenegado.html.twig');
						echo $template->render(array());
					}
					
				}elseif($accion == 'baja'){
					if ($permiso->drol == 1){
						if ((isset($_POST['idrol'])) && (isset($_POST['idpermiso']))){
							$idrol=htmlEntities($_POST['idrol']);
							$idpermiso=htmlEntities($_POST['idpermiso']);
							controladorRol::baja($idrol,$idpermiso);
						}
						else {header('Location:privado.php?c=roles&a=listar');} //Si no vienen por post, arafue!
					}else{
						$template = $twig->loadTemplate('accesodenegado.html.twig');
						echo $template->render(array());
					}
				}elseif($accion == 'listar'){
					if ($permiso->rrol == 1){
						controladorRol::listar();
					}else{
						$template = $twig->loadTemplate('accesodenegado.html.twig');
						echo $template->render(array());
					}
				}
			}

			/* -------- EMPRESA ---------- */
			elseif($controlador == 'empresa'){
				if($accion == 'alta'){
					controladorEmpresa::alta();
				}elseif($accion == 'modificar'){
					controladorEmpresa::modificar();
				}elseif($accion == 'baja'){
					$pag=htmlEntities(@$_GET['pagina']);
					controladorEmpresa::baja($pag);
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
					}elseif ($accion == 'altaNormal') {
						controladorMedidor::altaNormal();	
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
				
					}elseif ($accion == 'filtro') {
						controladorMedidor::Filtros();
					//Eliminar
					}elseif($accion == 'eliminar'){ 
						$pag=htmlEntities($_GET['pagina']);
						controladorMedidor::eliminaMedidor($pag);
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
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
			esta aprte busco los permisos del usuario que se acabade logerar. es LOG - IN (?) JAJA VIRGI
		------------------------------------------------------------------------------------------------*/
		$user = $_SESSION['user'];
		$pass = $_SESSION['clave'];
		$usuario = PDOusuario::buscarUser($user,$pass);
		$idRol = $usuario['idrol'];
		$rol = PDOrol::rolPorID($idRol);
		$permiso = PDOPermisos::traerPermiso($rol[0]->idpermisos);
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
					if ($permiso->enviarcorreo == 1) {
						controladorCorreo::renderCorreo();
					}else{
						$template = $twig->loadTemplate('accesodenegado.html.twig');
						echo $template->render(array());
					}
					
				}elseif ($accion == 'enviar') {
					if ($permiso->enviarcorreo == 1) {
						controladorCorreo::enviar();
					}else{
						$template = $twig->loadTemplate('accesodenegado.html.twig');
						echo $template->render(array());
					}
				}elseif ($accion ='verinf') {
					if ($permiso->verinfcorreo == 1) {
						controladorCorreo::mostrarInforme();
					}else{
						$template = $twig->loadTemplate('accesodenegado.html.twig');
						echo $template->render(array());
					}
				}

			/* -------- ECEL ---------- */
			}elseif ($controlador == 'excel') {
				if($accion == 'cargarmedidor'){
					if ($permiso->cargarexcelmedidor == 1) {
						controladorExcel::cargarmedidor();
					}else{
						$template = $twig->loadTemplate('accesodenegado.html.twig');
						echo $template->render(array());
					}	
				}elseif ($accion == 'listarinfmedidores') {
					if ($permiso->verinfexcelmedidor == 1) {
						controladorExcel::listarinfmedidores();
					}else{
						$template = $twig->loadTemplate('accesodenegado.html.twig');
						echo $template->render(array());
					}	
				}elseif ($accion == 'bajainformemedidor') {
					if ($permiso->verinfexcelmedidor == 1) {
						controladorExcel::bajainformemedidor();
					}else{
						$template = $twig->loadTemplate('accesodenegado.html.twig');
						echo $template->render(array());
					}	
				}elseif ($accion == 'bajainformesexel') {
					if ($permiso->verinfexcelmedidor == 1) {
						controladorExcel::bajainformesexel();
					}else{
						$template = $twig->loadTemplate('accesodenegado.html.twig');
						echo $template->render(array());
					}		
				}elseif ($accion == 'verdetalleinformemedidor') {
					if ($permiso->verinfexcelmedidor == 1) {
						controladorExcel::verdetalleinformemedidor();
					}else{
						$template = $twig->loadTemplate('accesodenegado.html.twig');
						echo $template->render(array());
					}	
				}elseif ($accion == 'cargarempresa') {
					controladorExcel::cargarempresa();
				}elseif ($accion == 'bajainfempresaall') {
					controladorExcel::bajainfempresaall();
				}elseif ($accion == 'verdetalleinfromeempresa') {
					controladorExcel::verdetalleinfromeempresa();
				}elseif ($accion == 'descargarExcel') {
					controladorExcel::descargarExcel();
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
					if ($permiso->cmedidor == 1) {
						if (isset($_GET['id'])) {
							$id=htmlEntities(@$_GET['id']); 
							controladorAbonado::alta($id);
						}
					}else{
						$template = $twig->loadTemplate('accesodenegado.html.twig');
						echo $template->render(array());
					}
				}elseif ($accion == 'modificar') {
					if ($permiso->umedidor == 1) {
						controladorAbonado::modificar();
					}else{
						$template = $twig->loadTemplate('accesodenegado.html.twig');
						echo $template->render(array());
					}
				}elseif ($accion == 'baja') {
					if ($permiso->dmedidor == 1) {
						$pag=htmlEntities(@$_GET['pagina']);
						controladorAbonado::baja($pag);
					}else{
						$template = $twig->loadTemplate('accesodenegado.html.twig');
						echo $template->render(array());
					}
				}elseif ($accion == 'listar') {
					if ($permiso->rmedidor == 1) {
						$pag =htmlEntities(@$_GET['pagina']); 
						controladorAbonado::listar($pag);
					}else{
						$template = $twig->loadTemplate('accesodenegado.html.twig');
						echo $template->render(array());
					}
				}elseif ($accion == 'eleccion'){
					if (isset($_GET['id'])) {
						$id=htmlEntities(@$_GET['id']); 
						controladorAbonado::eleccion($id);
					}
				}elseif ($accion=='altaNormal') {
					controladorAbonado::altaNormal();
				}elseif ($accion == 'filtro') {
					controladorAbonado::Filtros();
				}
				elseif($accion == 'pdf') //PDF Usuarios
						if ($_POST['datosPDF']){
							$datosPDF=htmlEntities($_POST['datosPDF']);
							controladorAbonado::pdfAbonado($datosPDF);
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
						//else $tipoFiltro='nada';

						if (isset($tipoFiltro))  controladorContacto::Filtros($tipoFiltro);
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
					if ($permiso->cci == 1) {
						controladorEmpresa::alta();
					}else{
						$template = $twig->loadTemplate('accesodenegado.html.twig');
						echo $template->render(array());
					}
				}elseif($accion == 'modificar'){
					if ($permiso->uci == 1) {
						controladorEmpresa::modificar();
					}else{
						$template = $twig->loadTemplate('accesodenegado.html.twig');
						echo $template->render(array());
					}
				}elseif($accion == 'baja'){
					if ($permiso->dci == 1) {
						$pag=htmlEntities(@$_GET['pagina']);
						controladorEmpresa::baja($pag);
					}else{
						$template = $twig->loadTemplate('accesodenegado.html.twig');
						echo $template->render(array());
					}
				}elseif($accion == 'listar'){
					if ($permiso->rci == 1) {
						$pag=htmlEntities(@$_GET['pagina']);
						controladorEmpresa::listar($pag);
					}else{
						$template = $twig->loadTemplate('accesodenegado.html.twig');
						echo $template->render(array());
					}
				}elseif($accion == 'detalle'){
					if (!empty($_POST['id'])){
						$idempresa=htmlEntities($_POST['id']);
						controladorEmpresa::detalle($idempresa);
					}
				}elseif($accion == 'modificarContactos'){
					if ($permiso->uci == 1) {
						controladorEmpresa::modificarContactos();
					}else{
						$template = $twig->loadTemplate('accesodenegado.html.twig');
						echo $template->render(array());
					}
				}elseif ($accion == 'modificarTelefonos') {
					if ($permiso->uci == 1) {
						controladorEmpresa::modificarTelefonos();
					}else{
						$template = $twig->loadTemplate('accesodenegado.html.twig');
						echo $template->render(array());
					}
				}elseif ($accion == 'modificarDomicilios') {
					if ($permiso->uci == 1) {
						controladorEmpresa::modificarDomicilios();	
					}else{
						$template = $twig->loadTemplate('accesodenegado.html.twig');
						echo $template->render(array());
					}
				}elseif ($accion == 'modificarCorreos') {
					if ($permiso->uci == 1) {
						controladorEmpresa::modificarCorreos();
					}else{
						$template = $twig->loadTemplate('accesodenegado.html.twig');
						echo $template->render(array());
					}
				}elseif ($accion == 'eleccion') {
					if (isset($_GET['id'])) {
						$id=htmlEntities(@$_GET['id']); 
						controladorEmpresa::eleccion($id);
					}
				}elseif ($accion == 'filtro') {
					controladorEmpresa::Filtros();
				}
				elseif($accion == 'pdf') //PDF Usuarios
						controladorEmpresa::pdfEmpresa();
			}

			/* -------- USUARIOS ---------- */
			elseif($controlador == 'usuarios'){
				//ALTA
				if($accion == 'alta'){
					if ($permiso->cusuario == 1) {
						controladorUsuario::alta();
					}else{
						$template = $twig->loadTemplate('accesodenegado.html.twig');
						echo $template->render(array());
					}
				}elseif($accion == 'modificar'){
					if ($permiso->uusuario == 1) {
						if (!empty($_POST['idusuario'])){
							$idusuario=htmlEntities($_POST['idusuario']);
							controladorUsuario::modificar($idusuario);
						}
						else {header('Location:privado.php?c=usuarios&a=listar');} 
					}else{
						$template = $twig->loadTemplate('accesodenegado.html.twig');
						echo $template->render(array());
					}
				
				//Listar
				}elseif($accion == 'listar'){
					if ($permiso->rusuario == 1) {
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

					}else{
						$template = $twig->loadTemplate('accesodenegado.html.twig');
						echo $template->render(array());
					}

				//Detalle
				}elseif($accion == 'detalle'){
					if (!empty($_POST['id'])){
						$idusuario=htmlEntities($_POST['id']);
						$usuario=PDOusuario::detalleUsuario($idusuario);
						controladorUsuario::verUsuario($usuario);
					}
					else {header('Location:privado.php?c=usuarios&a=listar');} //Si no vienen por post, arafue!

				//Eliminar
				}elseif($accion == 'eliminar'){ 
					if ($permiso->dusuario == 1) {
						if (!empty($_GET['id'])){
							$idusuario=htmlEntities($_GET['id']);
							controladorUsuario::eliminaUsuario($idusuario);
						}
						else {header('Location:privado.php?c=usuarios&a=listar');} 
					}else{
						$template = $twig->loadTemplate('accesodenegado.html.twig');
						echo $template->render(array());
					}
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
						if ($permiso->cmedidor == 1) {
							if (isset($_GET['id'])) {
								$id=htmlEntities(@$_GET['id']); 
								controladorMedidor::alta($id);	
							}
						}else{
							$template = $twig->loadTemplate('accesodenegado.html.twig');
							echo $template->render(array());
						}
					}elseif ($accion == 'altaNormal') {
						if ($permiso->cmedidor == 1) {
							controladorMedidor::altaNormal();
						}else{
							$template = $twig->loadTemplate('accesodenegado.html.twig');
							echo $template->render(array());
						}	
					}elseif($accion == 'modificar'){
						if ($permiso->umedidor == 1) {
							controladorMedidor::modificar();
						}else{
							$template = $twig->loadTemplate('accesodenegado.html.twig');
							echo $template->render(array());
						}
					}elseif ($accion == 'eleccion') {
					if (isset($_GET['id'])) {
						$id=htmlEntities(@$_GET['id']); 
						controladorMedidor::eleccion($id);
					}
					}elseif($accion == 'listar'){
						if ($permiso->rmedidor == 1) {
							$pag=htmlEntities(@$_GET['pagina']);
							controladorMedidor::listar($pag);
						}else{
							$template = $twig->loadTemplate('accesodenegado.html.twig');
							echo $template->render(array());
						}
				
					}elseif ($accion == 'filtro') {
						controladorMedidor::Filtros();
					//Eliminar
					}elseif($accion == 'eliminar'){ 
						if ($permiso->dmedidor == 1) {
							$pag=htmlEntities($_GET['pagina']);
							controladorMedidor::eliminaMedidor($pag);
						}else{
							$template = $twig->loadTemplate('accesodenegado.html.twig');
							echo $template->render(array());
						}
						
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
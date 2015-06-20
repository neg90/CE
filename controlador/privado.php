<?php

require_once '../vendor/twig/twig/lib/Twig/Autoloader.php';
require_once 'controladorContacto.php';
require_once 'controladorEmpresa.php';
require_once 'usuario.php';
require_once 'controladorRol.php';
require_once 'controladorMedidor.php';
require_once 'controladorCorreo.php';

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

			/* -------- INICIO ---------- */
			}elseif ($controlador=='inicio') {
				if($accion == 'inicio'){
					$template = $twig->loadTemplate('home.html.twig');
					echo $template->render(array('user'=>$user));
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
					else controladorContacto::listar();
				}
				elseif($accion == 'pdf'){ //PDF Contacto
					if ($_POST['datosPDF']){
						$datosPDF=htmlEntities($_POST['datosPDF']);
						controladorContacto::pdfContacto($datosPDF);
					}
					else {header('Location:privado.php?c=contacto&a=listar');} //Si no vienen por post, arafue!
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
					controladorEmpresa::listar();
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
						controladorMedidor::alta();
					}elseif($accion == 'modificar'){
						if (!empty($_POST['idmedidor'])){
							$idmedidor = htmlEntities($_POST['idmedidor']);
							controladorMedidor::modificar($idmedidor);
						}
					}elseif($accion == 'baja'){
						controladorMedidor::baja();
					}elseif($accion == 'listar'){
						/* FILTROS MEDIDOR*/
					if (isset($_POST['tipoFiltro'])){
								if (!empty($_POST['tipoFiltro']))
									$tipoFiltro=htmlEntities($_POST['tipoFiltro']);
					}
					else $tipoFiltro='nada';

					if (isset($_POST['dato'])){
								if (!empty($_POST['dato']))
									$datoFiltro=htmlEntities($_POST['dato']);
					}

					if ((isset($tipoFiltro)) and (isset($datoFiltro)))  controladorMedidor::Filtros($tipoFiltro,$datoFiltro);
					else controladorMedidor::listar();
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
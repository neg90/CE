<?php

require_once '../vendor/twig/twig/lib/Twig/Autoloader.php';
require_once 'controladorContacto.php';
require_once 'controladorEmpresa.php';
require_once 'usuario.php';
require_once 'controladorRol.php';
require_once 'controladorMedidor.php';

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
			/* -------- INICIO ---------- */
			if ($controlador=='inicio') {
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
					controladorContacto::listar();
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
					controladorUsuario::listar();

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
				}
				/* -------- MEDIDOR ---------- */
				elseif($controlador == 'medidor'){
					if($accion == 'alta'){
						controladorMedidor::alta();
					}elseif($accion == 'modificar'){
						controladorMedidor::modificar();
					}elseif($accion == 'baja'){
						controladorMedidor::baja();
					}elseif($accion == 'listar'){
						controladorMedidor::listar();
					}
			}
		}else{
			//Avisar q pifio path
			//puso Acción o Controlador MAL
			header('Location:privado.php?c=inicio&a=inicio');
		}

	}
	
?>
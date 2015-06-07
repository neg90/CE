<?php

require_once '../vendor/twig/twig/lib/Twig/Autoloader.php';
require_once 'controladorContacto.php';
require_once 'usuario.php';
require_once 'controladorRol.php';

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
			if ($controlador=='inicio') {
				if($accion == 'inicio'){
					$template = $twig->loadTemplate('home.html.twig');
					echo $template->render(array('user'=>$user));
				}
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
			}elseif($controlador == 'roles'){
				if($accion == 'alta'){
					controladorRol::alta();
				}elseif($accion == 'modificar'){
					controladorRol::modificar();
				}elseif($accion == 'baja'){
					controladorRol::baja();
				}elseif($accion == 'listar'){
					controladorRol::listar();
				}
			}
			//controladorRol
			elseif($controlador == 'usuarios'){
				if($accion == 'alta'){
					controladorUsuario::alta();
				}elseif($accion == 'modificar'){
					if (!empty($_POST['idusuario'])){
						$idusuario=htmlEntities($_POST['idusuario']);
						controladorUsuario::modificar($idusuario);
					}
				}elseif($accion == 'baja'){ //invierte activos
					if (!empty($_GET['id'])){
						$idusuario=htmlEntities($_GET['id']);
						controladorUsuario::bajaUsuario($idusuario);
					}
				}elseif($accion == 'eliminar'){ //elimina fisicamente
					if (!empty($_GET['id'])){
						$idusuario=htmlEntities($_GET['id']);
						controladorUsuario::eliminaUsuario($idusuario);
					}
				}elseif($accion == 'listar'){
					controladorUsuario::listar();
				}elseif($accion == 'detalle'){
					if (!empty($_POST['id'])){
						$idusuario=htmlEntities($_POST['id']);
						$usuario=PDOusuario::detalleUsuario($idusuario);
						controladorUsuario::verUsuario($usuario);
					}
					else {header('Location:privado.php?c=usuarios&a=listar');}
				}
			}
		}else{
			//Avisar q pifio path
			//puso Acción o Controlador MAL
		}

	}
	
?>
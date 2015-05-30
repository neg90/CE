<?php

require_once '../vendor/twig/twig/lib/Twig/Autoloader.php';
require_once 'controladorContacto.php';

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
			}
		}else{
			//Avisar q pifio path
			//puso Acción o Controlador MAL
		}

	}
	
?>
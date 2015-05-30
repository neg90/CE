<?php

	require_once('../modelo/conexionDB.php');
	require_once('../modelo/PDO/PDOContacto.php');
	require_once '../vendor/twig/twig/lib/Twig/Autoloader.php';
	

class controladorContacto {

	static function alta(){

	

		}
		

	static function listar(){

		Twig_Autoloader::register();
	  	$loader = new Twig_Loader_Filesystem('../vista');
	  	$twig = new Twig_Environment($loader, array('cache' => '../cache','debug' => 'false')); 
		
		
		
		$template = $twig->loadTemplate('contacto/listarContacto.html.twig');
		echo $template->render(array());

		}
		
	}



?>

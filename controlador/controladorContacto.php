<?php

	require_once('../modelo/conexionDB.php');
	require_once('../modelo/PDO/PDOContacto.php');
	

class controladorContacto {

	static function alta(){

		Twig_Autoloader::register();
	  	$loader = new Twig_Loader_Filesystem('../vista');
	  	$twig = new Twig_Environment($loader, array('cache' => '../cache','debug' => 'false')); 
		
		
		$template = $twig->loadTemplate('contacto.html.twig');
		echo $template->render(array('Correo'=>$Correo,'Ubicacion'=>$Ubicacion,'Telefono'=>$Telefono));

		}
		
	}



?>

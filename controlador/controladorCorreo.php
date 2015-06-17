<?php

	require_once '../vendor/twig/twig/lib/Twig/Autoloader.php';

	
class controladorCorreo {

	static function enviar(){
		Twig_Autoloader::register();
	  	$loader = new Twig_Loader_Filesystem('../vista');
	  	$twig = new Twig_Environment($loader, array('cache' => '../cache','debug' => 'false'));

	  	

	  	$template = $twig->loadTemplate('correo/correo.html.twig');
		echo $template->render(array());

	}
}
?>

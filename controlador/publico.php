<?php

require_once '../vendor/autoload.php';

class ControladorPublico {

	public function Principal(){

		Twig_Autoloader::register();
		$loader = new Twig_Loader_Filesystem('../vista');
	    $twig = new Twig_Environment($loader, array('debug' => 'false'));//'cache' => '../cache',')); 
		


		$template = $twig->loadTemplate('home.html.twig');
		echo $template->render(array('errorLoginVista'=>$errorLoginVista));
		
	}		
}

?>
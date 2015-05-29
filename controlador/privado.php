<?php

require_once '../vendor/autoload.php';
		session_start();
		$usuario = $_SESSION['user'];

		Twig_Autoloader::register();
		$loader = new Twig_Loader_Filesystem('../vista');
	    $twig = new Twig_Environment($loader, array('debug' => 'false'));//'cache' => '../cache',')); 
	
		$template = $twig->loadTemplate('home.html.twig');
		echo $template->render(array('usuario'=>$usuario));
	

?>
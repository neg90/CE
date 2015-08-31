<?php
	$error = $_SESSION['error'];
	//error_reporting(0);
	require_once '../vendor/twig/twig/lib/Twig/Autoloader.php';
	Twig_Autoloader::register();
	$loader = new Twig_Loader_Filesystem('../vista');
	$twig = new Twig_Environment($loader, array('debug' => 'false'));//'cache' => '../cache',')); 
	$template = $twig->loadTemplate('login.html.twig');
	echo $template->render(array('error' => $error));

?>
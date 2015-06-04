<?php

	require_once('../modelo/conexionDB.php');
	require_once('../modelo/PDO/PDORol.php');
	require_once('../modelo/PDO/PDOPermisos.php');
	require_once '../vendor/twig/twig/lib/Twig/Autoloader.php';

	

class controladorRol {

	static function listar(){

		Twig_Autoloader::register();
	  	$loader = new Twig_Loader_Filesystem('../vista');
	  	$twig = new Twig_Environment($loader, array('cache' => '../cache','debug' => 'false')); 
		
		$Roles = PDORol::listarRoles();
		$Permisos = PDOPermisos::listarPermisos();

		$template = $twig->loadTemplate('roles/listarRoles.html.twig');
		echo $template->render(array('Roles'=>$Roles, 'Permisos'=>$Permisos));

		}
		
	}



?>

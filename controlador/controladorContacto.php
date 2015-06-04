<?php

	require_once('../modelo/conexionDB.php');
	require_once('../modelo/PDO/PDOContacto.php');
	require_once '../vendor/twig/twig/lib/Twig/Autoloader.php';

	

class controladorContacto {

	static function alta(){
		Twig_Autoloader::register();
	  	$loader = new Twig_Loader_Filesystem('../vista');
	  	$twig = new Twig_Environment($loader, array('cache' => '../cache','debug' => 'false'));

	  	
		
		if (isset($_POST['enviarContacto'])){
			$nombre = htmlEntities($_POST['nombre']);
			$apellido = htmlEntities($_POST['apellido']);
			$telefono = htmlEntities($_POST['telefono']);
			$correo = htmlEntities($_POST['correo']);
			$domicilio = htmlEntities($_POST['domicilio']);
			//$sm = htmlEntities($_POST['sm']);
			//$activo = htmlentities($_POST['activo']);
			// de momento
			$sm =true; $activo = true;
			$unContacto = new PDOContacto($nombre,$apellido,$telefono,$domicilio,$correo,$sm,$activo);
			$unContacto->guardar();
			$aviso=true;
			//limpieza de los campos
			$_POST['enviarContacto'] = 1;
			$template = $twig->loadTemplate('contacto/altaContacto.html.twig');
			echo $template->render(array('aviso'=>$aviso));
		}else{
			$aviso=false;
			$template = $twig->loadTemplate('contacto/altaContacto.html.twig');
			echo $template->render(array('aviso'=>$aviso));
		}
		
		
		

	}
		

	static function listar(){

		Twig_Autoloader::register();
	  	$loader = new Twig_Loader_Filesystem('../vista');
	  	$twig = new Twig_Environment($loader, array('cache' => '../cache','debug' => 'false')); 
		
		$contactos = PDOContacto::listar();

		$template = $twig->loadTemplate('contacto/listarContacto.html.twig');
		echo $template->render(array('contactos'=>$contactos));

		}
		
	}



?>

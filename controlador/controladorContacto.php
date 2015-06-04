<?php

	require_once('../modelo/conexionDB.php');
	require_once('../modelo/PDO/PDOContacto.php');
	require_once '../vendor/twig/twig/lib/Twig/Autoloader.php';

	
//Valores para la variable aviso :
	//1->Inserto con exito
	//2->Ya existe un contacto igual
	//0->No mostrar mensaje, es solo carga del formulario.
class controladorContacto {

	static function alta(){
		Twig_Autoloader::register();
	  	$loader = new Twig_Loader_Filesystem('../vista');
	  	$twig = new Twig_Environment($loader, array('cache' => '../cache','debug' => 'false'));
	  	$modo = 'alta';

		
		if (isset($_POST['enviarContacto'])){
			$aviso=2;
			$nombre = htmlEntities($_POST['nombre']);
			$apellido = htmlEntities($_POST['apellido']);
			$telefono = htmlEntities($_POST['telefono']);
			$correo = htmlEntities($_POST['correo']);
			$domicilio = htmlEntities($_POST['domicilio']);
			if ( isset($_POST['sm'])) {
				$sm = true;
			}else{
				$sm = false;
			}
			
			//Veriifico que no exista uni identico, soluciona usuario soquete, f5 y reload de la pagina.
			$unContacto = new PDOContacto($nombre,$apellido,$telefono,$domicilio,$correo,$sm);

			if($unContacto->validarInsertar()){
				$unContacto->guardar();
				$aviso=1;
			}else{
				$aviso=2;
			}
			
			$template = $twig->loadTemplate('contacto/altaContacto.html.twig');
			echo $template->render(array('aviso'=>$aviso,'modo'=>$modo));

		}else{
			$aviso=0;
			$template = $twig->loadTemplate('contacto/altaContacto.html.twig');
			echo $template->render(array('aviso'=>$aviso,'modo'=>$modo));
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

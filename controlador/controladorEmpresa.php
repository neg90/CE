<?php

	require_once ('../modelo/conexionDB.php');
	
	
	require_once '../vendor/twig/twig/lib/Twig/Autoloader.php';

	
//Valores para la variable aviso :
	//1->Inserto con exito
	//2->Ya existe un contacto igual
	//0->No mostrar mensaje, es solo carga del formulario.
class controladorEmpresa {

	static function alta(){
		Twig_Autoloader::register();
	  	$loader = new Twig_Loader_Filesystem('../vista');
	  	$twig = new Twig_Environment($loader, array('cache' => '../cache','debug' => 'false'));
	  	$modo = 'alta';
	  	$aviso = 0;
		
		
		$template = $twig->loadTemplate('empresa/altaEmpresa.html.twig');
		echo $template->render(array('aviso'=>$aviso,'modo'=>$modo));

		
	}

	static function modificar(){
		
	}


	static function listar(){

		

	}
		
	public function baja(){

		
   }

}
?>

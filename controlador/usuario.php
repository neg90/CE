<?php

require_once '../modelo/clases/usuario.php';
require_once '../modelo/clases/PDOusuario.php';


static function listar(){
		$user=$_SESSION['user'];
		Twig_Autoloader::register();
		$loader = new Twig_Loader_Filesystem('../vista');
		$twig = new Twig_Environment($loader, array(
		//'cache' => '../cache','
		'debug' => 'false'
		));

		$ListaUsuarios=PDOusuario::listarUsuarios();

		$template = $twig->loadTemplate('Usuario/listar.html.twig');
		echo $template->render(array('user'=>$user,'ListaUsuarios'=>$ListaUsuarios));	
	}

?>
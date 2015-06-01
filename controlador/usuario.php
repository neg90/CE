<?php

require_once '../modelo/clases/usuario.php';
require_once '../modelo/PDO/PDOusuario.php';
require_once '../modelo/PDO/PDORol.php';


class controladorUsuario {

	static function listar(){
			$user=$_SESSION['user'];
			Twig_Autoloader::register();
			$loader = new Twig_Loader_Filesystem('../vista');
			$twig = new Twig_Environment($loader, array(
			//'cache' => '../cache','
			'debug' => 'false'
			));

			$ListaUsuarios=PDOusuario::listarUsuarios();
			$ListaRoles=PDORol::listarRoles();

			$template = $twig->loadTemplate('usuarios/listarUsuarios.html.twig');
			echo $template->render(array('user'=>$user,'ListaUsuarios'=>$ListaUsuarios,'ListaRoles'=>$ListaRoles));	
	}

	static function verUsuario($Usuario){
			$user=$_SESSION['user'];
			Twig_Autoloader::register();
			$loader = new Twig_Loader_Filesystem('../vista');
			$twig = new Twig_Environment($loader, array(
			//'cache' => '../cache','
			'debug' => 'false'
			));

			$ListaRoles=PDORol::listarRoles();

			$template = $twig->loadTemplate('usuarios/verUsuario.html.twig');
			echo $template->render(array('user'=>$user,'usuario'=>$Usuario,'ListaRoles'=>$ListaRoles));	
	}
}

?>
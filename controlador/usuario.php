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

	static function bajaUsuario($idusuario){
			PDOusuario::baja($idusuario);
			$ultPag = $_SERVER['HTTP_REFERER'];
			header('Location:'.$ultPag);
	}

	static function alta(){
		Twig_Autoloader::register();
	  	$loader = new Twig_Loader_Filesystem('../vista');
	  	$twig = new Twig_Environment($loader, array('cache' => '../cache','debug' => 'false')); 
		
		if (isset($_POST['enviarUsuario'])){
			$nombre = htmlEntities($_POST['nombre']);
			$apellido = htmlEntities($_POST['apellido']);
			$usuario = htmlEntities($_POST['usuario']);
			$password = htmlEntities($_POST['password']);
			$email = htmlEntities($_POST['email']);
			$rol = htmlEntities($_POST['rol']);
			//$sm = htmlEntities($_POST['sm']);
			//$activo = htmlentities($_POST['activo']);
			// de momento
			$activo = true;
			$unContacto = new PDOusuario($nombre,$apellido,$usuario,$password,$activo,$email,$rol);
			$unContacto->guardar();
			$aviso=true;
			$template = $twig->loadTemplate('usuarios/altaUsuario.html.twig');
			echo $template->render(array('aviso'=>$aviso));
		}else{
			$aviso=false;
			$template = $twig->loadTemplate('usuarios/altaUsuario.html.twig');
			echo $template->render(array('aviso'=>$aviso));
		}
	}
}
?>
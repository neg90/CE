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

	static function listarConCartel($eliminado){
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
			echo $template->render(array('user'=>$user,'ListaUsuarios'=>$ListaUsuarios,'ListaRoles'=>$ListaRoles,'eliminado'=>$eliminado));	
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

	static function eliminaUsuario($idusuario){
			if (PDOusuario::eliminar($idusuario)) ($usuarioEliminado=1);
			else $usuarioEliminado=0;
			self::listarConCartel($usuarioEliminado);
	}

	static function alta(){
		Twig_Autoloader::register();
	  	$loader = new Twig_Loader_Filesystem('../vista');
	  	$twig = new Twig_Environment($loader, array('cache' => '../cache','debug' => 'false')); 
		$user=$_SESSION['user'];		
		if (isset($_POST['enviarUsuario'])){
			$nombre = htmlEntities($_POST['nombre']);
			$apellido = htmlEntities($_POST['apellido']);
			$usuario = htmlEntities($_POST['usuario']);
			$password = htmlEntities($_POST['password']);
			$email = htmlEntities($_POST['email']);
			$rol = htmlEntities($_POST['rol']);
			if ( isset($_POST['activo'])) {
					$activo = true;
				}else{
					$activo = false;
				}
			$unUsuario = new PDOusuario($nombre,$apellido,$usuario,$password,$activo,$email,$rol);
			if (!PDOusuario::emailExiste($email)){
				$unUsuario->guardar();
				$aviso='Perfecto! El usuario fue dado de alta con éxito. ';
				$tipoAviso= 'exito';
			}
			else {$aviso='ERROR! El email ya se encuentra en uso.';
				  $tipoAviso='error';
			}
			$ListaRoles=PDORol::listarRoles();
			$template = $twig->loadTemplate('usuarios/altaUsuario.html.twig');
			echo $template->render(array('aviso'=>$aviso,'tipoAviso' => $tipoAviso,'ListaRoles'=>$ListaRoles,'user'=>$user));
		}else{
			$ListaRoles=PDORol::listarRoles();
			$aviso=false;
			$template = $twig->loadTemplate('usuarios/altaUsuario.html.twig');
			echo $template->render(array('aviso'=>$aviso,'ListaRoles'=>$ListaRoles,'user'=>$user));
		}
	}

	static function modificar($idusuario){
		Twig_Autoloader::register();
	  	$loader = new Twig_Loader_Filesystem('../vista');
	  	$twig = new Twig_Environment($loader, array('cache' => '../cache','debug' => 'false')); 
		$user=$_SESSION['user'];		
		if (isset($_POST['enviarUsuario'])){
			$nombre = htmlEntities($_POST['nombre']);
			$apellido = htmlEntities($_POST['apellido']);
			$usuario = htmlEntities($_POST['usuario']);
			$password = htmlEntities($_POST['password']);
			$email = htmlEntities($_POST['email']);
			$rol = htmlEntities($_POST['rol']);
			//$activo = htmlEntities($_POST['activo']);
			$activo=htmlEntities($_POST['activo']);
			$idusuario = htmlEntities($_POST['idusuario']);


			//ESTABA HACIENDO LA PARTE DE SI EL EMAIL EXISTE, PERO EL MODIFICAR SE ROMPIÓ,
			// VERIFICAR LO QUE LE LLEGA A LA CONSULTA.
			$datosAnteriores = PDOusuario::detalleUsuario($idusuario);
			$unUsuario = new PDOusuario($nombre,$apellido,$usuario,$password,$activo,$email,$rol);
			$unUsuario->setIdusuario($idusuario);
			if ($email == $datosAnteriores->correo){
				$unUsuario->setActivo($activo);
				$unUsuario->guardar();
				$aviso="Perfecto! El usuario fue modificado con éxito!";
				$tipoAviso= 'exito';
			}
			else{
				if (!PDOusuario::emailExiste($email)){
					$unUsuario->setActivo($activo);
					$unUsuario->guardar();
					$aviso="Perfecto! El usuario fue modificado con éxito!";
					$tipoAviso= 'exito';		
				}
				else {$aviso = 'ERROR! El email ya se encuentra en uso.';
				  	  $tipoAviso= 'error';}
			}

			$ListaRoles=PDORol::listarRoles();
			$template = $twig->loadTemplate('usuarios/modificarUsuario.html.twig');
			echo $template->render(array('aviso'=>$aviso,'tipoAviso' => $tipoAviso,'ListaRoles'=>$ListaRoles,'user'=>$user,'unUsuario'=>$unUsuario));
		}else{
			$unUsuario = PDOusuario::detalleUsuario($idusuario);
			$ListaRoles = PDORol::listarRoles();
			$aviso=null;
			$template = $twig->loadTemplate('usuarios/modificarUsuario.html.twig');
			echo $template->render(array('aviso'=>$aviso,'ListaRoles'=>$ListaRoles,'user'=>$user,'unUsuario'=>$unUsuario));
		}
	}
}
?>
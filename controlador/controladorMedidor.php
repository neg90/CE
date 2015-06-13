<?php

require_once '../modelo/clases/usuario.php';
require_once '../modelo/PDO/PDOMedidor.php';


class controladorMedidor {

	static function listar(){
			$user=$_SESSION['user'];
			Twig_Autoloader::register();
			$loader = new Twig_Loader_Filesystem('../vista');
			$twig = new Twig_Environment($loader, array(
			//'cache' => '../cache','
			'debug' => 'false'
			));

			$ListaMedidores=PDOMedidor::listarMedidores();

			$template = $twig->loadTemplate('medidor/listarMedidores.html.twig');
			echo $template->render(array('user'=>$user,'ListaMedidores'=>$ListaMedidores));	
	}

	static function listarConCartel($eliminado){
			$user=$_SESSION['user'];
			Twig_Autoloader::register();
			$loader = new Twig_Loader_Filesystem('../vista');
			$twig = new Twig_Environment($loader, array(
			//'cache' => '../cache','
			'debug' => 'false'
			));

			$ListaMedidores=PDOMedidor::listarMedidores();

			$template = $twig->loadTemplate('medidor/listarMedidores.html.twig');
			echo $template->render(array('user'=>$user,'ListaMedidores'=>$ListaMedidores,'eliminado'=>$eliminado));	
	}

	static function verMedidor($idmedidor){
			$user=$_SESSION['user'];
			Twig_Autoloader::register();
			$loader = new Twig_Loader_Filesystem('../vista');
			$twig = new Twig_Environment($loader, array(
			//'cache' => '../cache','
			'debug' => 'false'
			));

			$unMedidor=PDOMedidor::medidorPorID($idmedidor);

			$template = $twig->loadTemplate('usuarios/verUsuario.html.twig');
			echo $template->render(array('user'=>$user,'unMedidor'=>$unMedidor));	
	}

	/*static function bajaMedidor($idmedidor){
			PDOMedidor::baja($idusuario);
			$ultPag = $_SERVER['HTTP_REFERER'];
			header('Location:'.$ultPag);
	}*/

	static function eliminaMedidor($idMedidor){
			if ((PDOMedidor::borrar($idMedidor))==1) ($medidorEliminado=1);
			else $medidorEliminado=0;
			self::listarConCartel($medidorEliminado);
	}

	static function alta(){
		Twig_Autoloader::register();
	  	$loader = new Twig_Loader_Filesystem('../vista');
	  	$twig = new Twig_Environment($loader, array('cache' => '../cache','debug' => 'false')); 
		$user=$_SESSION['user'];		
		if (isset($_POST['enviarMedidor'])){
			$nomyap = htmlEntities($_POST['nomyap']);
			$telefono = htmlEntities($_POST['telefono']);
			$domicilio = htmlEntities($_POST['domicilio']);
			$importe = htmlEntities($_POST['importe']);
			$numusuario = htmlEntities($_POST['numusuario']);
			$numsuministro = htmlEntities($_POST['numsuministro']);
			$activo = true;

			$unMedidor = new PDOMedidor(0,$nomyap,$telefono,$domicilio,$importe,$numusuario,$numsuministro,$activo);
			if (empty(PDOMedidor::existeMedidor($numusuario,$numsuministro))){
				$unMedidor->guardar();
				$aviso='Perfecto! El titular fue dado de alta con éxito. ';
				$tipoAviso= 'exito';
			}
			else {$aviso='ERROR! El número de usuario / número de suministro ya se encuentran en uso.';
				  $tipoAviso='error';
			}
			$template = $twig->loadTemplate('medidor/altaMedidor.html.twig');
			echo $template->render(array('aviso'=>$aviso,'tipoAviso' => $tipoAviso,'unMedidor'=>$unMedidor,'user'=>$user));
		}else{
			$aviso=false;
			$template = $twig->loadTemplate('medidor/altaMedidor.html.twig');
			echo $template->render(array('aviso'=>$aviso,'user'=>$user));
		}
	}

	static function modificar($idMedidor){
		Twig_Autoloader::register();
	  	$loader = new Twig_Loader_Filesystem('../vista');
	  	$twig = new Twig_Environment($loader, array('cache' => '../cache','debug' => 'false')); 
		$user=$_SESSION['user'];		
		if (isset($_POST['enviarMedidor'])){
			$nomyap = htmlEntities($_POST['nomyap']);
			$telefono = htmlEntities($_POST['telefono']);
			$domicilio = htmlEntities($_POST['domicilio']);
			$importe = htmlEntities($_POST['importe']);
			$numusuario = htmlEntities($_POST['numusuario']);
			$numsuministro = htmlEntities($_POST['numsuministro']);
			$activo = htmlEntities($_POST['activo']);

			$unMedidor = new PDOMedidor(0,$nomyap,$telefono,$domicilio,$importe,$numusuario,$numsuministro,$activo);
			if (empty(PDOMedidor::existeMedidor($numusuario,$numsuministro))){
				$unMedidor->guardar();
				$aviso='Perfecto! El titular fue dado de alta con éxito. ';
				$tipoAviso= 'exito';
			}
			else {$aviso='ERROR! El número de usuario / número de suministro ya se encuentran en uso.';
				  $tipoAviso='error';
			}
			if ($email == $datosAnteriores->correo){
				$unUsuario->setActivo($activo);
				$unUsuario->guardar();
				$aviso="Perfecto! El usuario fue modificado con éxito!";
				$tipoAviso= 'exito';
			}
			else{
				if (empty(PDOusuario::emailExiste($email))){
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
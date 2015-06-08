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

		static function alta(){

		Twig_Autoloader::register();
	  	$loader = new Twig_Loader_Filesystem('../vista');
	  	$twig = new Twig_Environment($loader, array('cache' => '../cache','debug' => 'false')); 

	  	$user=$_SESSION['user'];
		if (isset($_POST['enviarRol'])){
			$nombre_rol = $_POST['nombre_rol'];
		  	$csocio = $_POST['csocio'];
		  	$rsocio = $_POST['rsocio'];
		  	$usocio = $_POST['usocio'];
		  	$dsocio = $_POST['dsocio'];
		  	$cmedidor = $_POST['cmedidor'];
		  	$rmedidor = $_POST['rmedidor'];
		  	$umedidor = $_POST['umedidor'];
		  	$dmedidor = $_POST['dmedidor'];
		  	$cci = $_POST['cci'];
		  	$rci = $_POST['rci'];
		  	$uci = $_POST['uci'];
		  	$dci = $_POST['dci'];
		  	$crol = $_POST['crol'];
		  	$rrol = $_POST['rrol'];
		  	$urol = $_POST['urol'];
		  	$drol = $_POST['drol'];
		  	$cusuario = $_POST['cusuario'];
		  	$rusuario = $_POST['rusuario'];
		  	$uusuario = $_POST['uusuario'];
		  	$dusuario = $_POST['dusuario'];

		  	if (!PDORol::existeRol($nombre_rol)){
			  	$unPermiso = new PDOPermisos(null,$csocio,$rsocio,$usocio,$dsocio,$cmedidor,$rmedidor,
			  								$umedidor,$dmedidor,$cci,$rci,$uci,$dci,$cusuario,$rusuario,
			  								$uusuario,$dusuario,$crol,$rrol,$urol,$drol);
			  	$unPermiso->guardar();

			  	//Recupero el último permiso creado para tomar el ID
			  	$ultPermisoCreado=PDOPermisos::ultimoPermisoCreado()->idpermiso;
			  	$unRol = new PDORol(null,$nombre_rol,$ultPermisoCreado);
			  	$unRol->guardar();

			  	$aviso='Perfecto! El rol ha sido creado correctamente';
		  		$tipoAviso='exito';
			}
			else {$aviso='ERROR! El rol ya existe';
				  $tipoAviso='error';}
		}
		else {$aviso=null; $tipoAviso=null;}
		$template = $twig->loadTemplate('roles/altaRol.html.twig');
		//echo $template->render(array('Roles'=>$Roles, 'Permisos'=>$Permisos));
		echo $template->render(array('user'=>$user,'aviso'=>$aviso,'tipoAviso'=>$tipoAviso));
		}
		
	
	static function baja(){

		Twig_Autoloader::register();
	  	$loader = new Twig_Loader_Filesystem('../vista');
	  	$twig = new Twig_Environment($loader, array('cache' => '../cache','debug' => 'false')); 
	  	self::listar();

	}


	}



?>

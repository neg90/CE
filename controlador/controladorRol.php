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

	static function listarConCartel($aviso,$tipoAviso){

		Twig_Autoloader::register();
	  	$loader = new Twig_Loader_Filesystem('../vista');
	  	$twig = new Twig_Environment($loader, array('cache' => '../cache','debug' => 'false')); 
		
		$Roles = PDORol::listarRoles();
		$Permisos = PDOPermisos::listarPermisos();
		$template = $twig->loadTemplate('roles/listarRoles.html.twig');
		echo $template->render(array('tipoAviso'=>$tipoAviso,'aviso'=>$aviso,'Roles'=>$Roles, 'Permisos'=>$Permisos));

		}

	static function modificar($idrol,$idpermiso){

		Twig_Autoloader::register();
	  	$loader = new Twig_Loader_Filesystem('../vista');
	  	$twig = new Twig_Environment($loader, array('cache' => '../cache','debug' => 'false')); 

	  	$user=$_SESSION['user'];

	  	if (isset($_POST['enviarRol'])){ //Si presionó submit

	  		$rol=PDORol::rolPorID($idrol);
		  	$permiso=PDOPermisos::listarPorID($idpermiso);
		  	$permiso=$permiso[0];
		  	$rol=$rol[0];
		  	//Actualizo el array para mostrar los SI/NO actualizados.
		  	$arrayPermiso[1]=$_POST['csocio'];
		  	$arrayPermiso[2]=$_POST['rsocio'];
		  	$arrayPermiso[3]=$_POST['usocio'];
		  	$arrayPermiso[4]=$_POST['dsocio'];
		  	$arrayPermiso[5]=$_POST['cmedidor'];
		  	$arrayPermiso[6]=$_POST['rmedidor'];
		  	$arrayPermiso[7]=$_POST['umedidor'];
		  	$arrayPermiso[8]=$_POST['dmedidor'];
		  	$arrayPermiso[9]=$_POST['cci'];
		  	$arrayPermiso[10]=$_POST['rci'];
		  	$arrayPermiso[11]=$_POST['uci'];
		  	$arrayPermiso[12]=$_POST['dci'];
		  	$arrayPermiso[13]=$_POST['crol'];
		  	$arrayPermiso[14]=$_POST['rrol'];
		  	$arrayPermiso[15]=$_POST['urol'];
		  	$arrayPermiso[16]=$_POST['drol'];
		  	$arrayPermiso[17]=$_POST['cusuario'];
		  	$arrayPermiso[18]=$_POST['rusuario'];
		  	$arrayPermiso[19]=$_POST['uusuario'];
		  	$arrayPermiso[20]=$_POST['dusuario'];
		  	$aviso=null;$tipoAviso=null;

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

		  	$rol->nombre=$nombre_rol;

		  	$nombreActual=PDORol::rolPorID($idrol)[0]->nombre;
		  	if ($nombre_rol == $nombreActual){
		  		$unPermiso = new PDOPermisos(null,$csocio,$rsocio,$usocio,$dsocio,$cmedidor,$rmedidor,
			  								$umedidor,$dmedidor,$cci,$rci,$uci,$dci,$cusuario,$rusuario,
			  								$uusuario,$dusuario,$crol,$rrol,$urol,$drol);
			  	$unPermiso->setIdpermiso($idpermiso);
			  	$unPermiso->guardar();

			  	//Recupero el último permiso creado para tomar el ID
			  	$ultPermisoCreado=PDOPermisos::ultimoPermisoCreado()->idpermiso;
			  	$unRol = new PDORol(null,$nombre_rol,$ultPermisoCreado);
			  	$unRol->setIdrol($idrol);
			  	$unRol->guardar();

			  	$aviso='Perfecto! El rol ha sido modificado correctamente';
		  		$tipoAviso='exito';
		  	}
		  	else {
			  	if (empty(PDORol::existeRol($nombre_rol))){
				  	$unPermiso = new PDOPermisos(null,$csocio,$rsocio,$usocio,$dsocio,$cmedidor,$rmedidor,
				  								$umedidor,$dmedidor,$cci,$rci,$uci,$dci,$cusuario,$rusuario,
				  								$uusuario,$dusuario,$crol,$rrol,$urol,$drol);
				  	$unPermiso->setIdpermiso($idpermiso);
				  	$unPermiso->guardar();

				  	//Recupero el último permiso creado para tomar el ID
				  	$ultPermisoCreado=PDOPermisos::ultimoPermisoCreado()->idpermiso;
				  	$unRol = new PDORol(null,$nombre_rol,$ultPermisoCreado);
				  	$unRol->setIdrol($idrol);
				  	$unRol->guardar();

				  	$aviso='Perfecto! El rol ha sido modificado correctamente';
			  		$tipoAviso='exito';
				}
				else {$aviso='ERROR! El rol ya existe';$tipoAviso='error';}
			}
	  	}
	  	else{//Cargo registro de la base de datos

		  	$rol=PDORol::rolPorID($idrol);
		  	$permiso=PDOPermisos::listarPorID($idpermiso);
		  	$permiso=$permiso[0];
		  	$rol=$rol[0];
		  	//Para achicar 200 líneas de código de la vista
		  	$arrayPermiso[1]=$permiso->csocio;
		  	$arrayPermiso[2]=$permiso->rsocio;
		  	$arrayPermiso[3]=$permiso->usocio;
		  	$arrayPermiso[4]=$permiso->dsocio;
		  	$arrayPermiso[5]=$permiso->cmedidor;
		  	$arrayPermiso[6]=$permiso->rmedidor;
		  	$arrayPermiso[7]=$permiso->umedidor;
		  	$arrayPermiso[8]=$permiso->dmedidor;
		  	$arrayPermiso[9]=$permiso->cci;
		  	$arrayPermiso[10]=$permiso->rci;
		  	$arrayPermiso[11]=$permiso->uci;
		  	$arrayPermiso[12]=$permiso->dci;
		  	$arrayPermiso[13]=$permiso->crol;
		  	$arrayPermiso[14]=$permiso->rrol;
		  	$arrayPermiso[15]=$permiso->urol;
		  	$arrayPermiso[16]=$permiso->drol;
		  	$arrayPermiso[17]=$permiso->cusuario;
		  	$arrayPermiso[18]=$permiso->rusuario;
		  	$arrayPermiso[19]=$permiso->uusuario;
		  	$arrayPermiso[20]=$permiso->dusuario;
		  	$aviso=null;$tipoAviso=null;
		}
		$template = $twig->loadTemplate('roles/modificarRol.html.twig');
		echo $template->render(array('aviso'=>$aviso,'tipoAviso'=>$tipoAviso,'rol'=>$rol,'arrayPermisos'=>$arrayPermiso,'user'=>$user));
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
		  	if (empty(PDORol::existeRol($nombre_rol))){
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
			else {$aviso='ERROR! El rol ya existe';$tipoAviso='error';}
		}
		else {$aviso=null; $tipoAviso=null;}
		$template = $twig->loadTemplate('roles/altaRol.html.twig');
		//echo $template->render(array('Roles'=>$Roles, 'Permisos'=>$Permisos));
		echo $template->render(array('user'=>$user,'aviso'=>$aviso,'tipoAviso'=>$tipoAviso));
		}
		
	
	static function baja($idrol,$idpermiso){

		Twig_Autoloader::register();
	  	$loader = new Twig_Loader_Filesystem('../vista');
	  	$twig = new Twig_Environment($loader, array('cache' => '../cache','debug' => 'false')); 

	  	if (empty(PDORol::rolEnUso($idrol))){
	  		PDORol::borrar($idrol);
	  		PDOPermisos::borrar($idpermiso);
	  		$aviso='Perfecto! El rol fue borrado correctamente.';
			$tipoAviso="exito";
	  	}
	  	else {$aviso='Error! Hay usuarios asignados dentro de ese grupo.';
			  $tipoAviso="error";}
	  	self::listarConCartel($aviso, $tipoAviso);

	}


	}



?>

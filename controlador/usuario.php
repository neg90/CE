<?php

require_once '../modelo/clases/usuario.php';
require_once '../modelo/PDO/PDOusuario.php';
require_once '../modelo/PDO/PDORol.php';
require('../modelo/PDO/PDF.php');


class controladorUsuario {

	static function pdfUsuario($datosPDF){

		$ListaRoles=PDORol::listarRoles();

		$pdf = new PDF();
		// Encabezados de tabla
		$header = array('Nombre', 'Apellido', 'Usuario', 'E-mail', 'Rol');
		// Cargo la info
		$data = html_entity_decode($datosPDF);
		$data = json_decode($data, true);
		$pdf->SetFont('Arial','',14);
		$_SESSION['tituloPDF']=('Usuarios'); //título PDF
		$pdf->AddPage();
		$pdf->TablaUsuarios($header,$data,$ListaRoles);
		$pdf->Output();
	}

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
			$filtroActivo = 0; //Si está filtrando la tabla, es 1.


			$template = $twig->loadTemplate('usuarios/listarUsuarios.html.twig');
			echo $template->render(array('user'=>$user,'ListaUsuarios'=>$ListaUsuarios,'ListaRoles'=>$ListaRoles, 'filtroActivo' => $filtroActivo));	
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
			$filtroActivo = 0; //Si está filtrando la tabla, es 1.


			$template = $twig->loadTemplate('usuarios/listarUsuarios.html.twig');
			echo $template->render(array('user'=>$user,'ListaUsuarios'=>$ListaUsuarios,'ListaRoles'=>$ListaRoles,'eliminado'=>$eliminado, 'filtroActivo' => $filtroActivo));	
	}

	static function Filtros($tipoFiltro,$datoFiltro){
			$user=$_SESSION['user'];
			Twig_Autoloader::register();
			$loader = new Twig_Loader_Filesystem('../vista');
			$twig = new Twig_Environment($loader, array(
			//'cache' => '../cache','
			'debug' => 'false'
			));

			//statusActivo es 2 si se ven Activos e Inactivos
			switch($tipoFiltro){ // Sino, es 2, entonces no filtra con ACTIVO
				case 'nomyap':
					$ListaUsuarios=PDOusuario::filtroNomyAp($datoFiltro);
					break;
				case 'usuario':
					$ListaUsuarios=PDOusuario::filtroUsuario($datoFiltro);
					break;
				case 'email':
					$ListaUsuarios=PDOusuario::filtroEmail($datoFiltro);
					break;
				case 'rol':
					$ListaUsuarios=PDOusuario::filtroRol($datoFiltro);
					$datoFiltro=PDORol::rolPorID($datoFiltro)[0]->nombre;
					break;
				case 'nada':
					$ListaUsuarios=PDOusuario::listarUsuarios();
					break;
			}
			$ListaRoles=PDORol::listarRoles();

			//Si está filtrando la tabla, es 1.
			if ($tipoFiltro != 'nada') $filtroActivo = 1; else $filtroActivo=0; 

			$template = $twig->loadTemplate('usuarios/listarUsuarios.html.twig');
			echo $template->render(array('user'=>$user,'ListaUsuarios'=>$ListaUsuarios,'ListaRoles'=>$ListaRoles, 'filtroActivo' => $filtroActivo, 'datoFiltro'=>$datoFiltro, 'tipoFiltro'=>$tipoFiltro));	
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
			$activo = true;
			
			$unUsuario = new PDOusuario($nombre,$apellido,$usuario,$password,$activo,$email,$rol);
			if (empty(PDOusuario::emailExiste($email))){
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

		static function misDatos(){
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

			$datosAnteriores = PDOusuario::detalleUsuario($idusuario);
			$unUsuario = new PDOusuario($nombre,$apellido,$usuario,$password,$activo,$email,$rol);
			$unUsuario->setIdusuario($idusuario);
			if ($email == $datosAnteriores->correo){
				$unUsuario->setActivo($activo);
				$unUsuario->guardar();
				$aviso="Perfecto! Sus datos fueron modificados con éxito!";
				$tipoAviso= 'exito';
			}
			else{
				if (empty(PDOusuario::emailExiste($email))){
					$unUsuario->setActivo($activo);
					$unUsuario->guardar();
					$aviso="Perfecto! Sus datos fueron modificados con éxito!";
					$tipoAviso= 'exito';		
				}
				else {$aviso = 'ERROR! El email ya se encuentra en uso.';
				  	  $tipoAviso= 'error';}
			}

			$ListaRoles=PDORol::listarRoles();
			$template = $twig->loadTemplate('usuarios/modificarMisDatos.html.twig');
			echo $template->render(array('aviso'=>$aviso,'tipoAviso' => $tipoAviso,'ListaRoles'=>$ListaRoles,'user'=>$user,'unUsuario'=>$unUsuario));
		}else{
			$idusuario=PDOusuario::buscarPorUsuario($user)->idusuario;
			$unUsuario = PDOusuario::detalleUsuario($idusuario);
			$ListaRoles = PDORol::listarRoles();
			$aviso=null;
			$template = $twig->loadTemplate('usuarios/modificarMisDatos.html.twig');
			echo $template->render(array('aviso'=>$aviso,'ListaRoles'=>$ListaRoles,'user'=>$user,'unUsuario'=>$unUsuario));
		}
	}
}
?>
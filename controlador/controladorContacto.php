<?php

	require_once ('../modelo/conexionDB.php');
	require_once ('../modelo/PDO/PDOContacto.php');
	
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

		
		if (isset($_POST['guardarContacto'])){
			$aviso=2;
			$nombre = htmlEntities($_POST['nombre']);
			$apellido = htmlEntities($_POST['apellido']);
			$telefono = htmlEntities($_POST['telefono']);
			$correo = htmlEntities($_POST['correo']);
			$domicilio = htmlEntities($_POST['domicilio']);
			$tipodocumento = htmlEntities($_POST['tipodocumento']);
			$documento = htmlEntities($_POST['documento']);
			if ( isset($_POST['sm'])) {
				$sm = true;
			}else{
				$sm = false;
			}
			//Veriifico que no exista uni identico, soluciona usuario soquete, f5 y reload de la pagina.
			//id 1 pero se gaurda incremental en el PDO
			$unContacto = new PDOContacto(0,$nombre,$apellido,$telefono,$domicilio,$correo,$sm,$tipodocumento,$documento);

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

	static function modificar(){
		Twig_Autoloader::register();
	  	$loader = new Twig_Loader_Filesystem('../vista');
	  	$twig = new Twig_Environment($loader, array('cache' => '../cache','debug' => 'false'));
	  	$modo = 'modificar';

		$idcontacto = htmlEntities($_POST['idcontacto']);

		if (isset($_POST['guardarContacto'])){
			$aviso=2;
			if (PDOContacto::buscarContacto($idcontacto)){

				$nombre = htmlEntities($_POST['nombre']);
				$apellido = htmlEntities($_POST['apellido']);
				$telefono = htmlEntities($_POST['telefono']);
				$correo = htmlEntities($_POST['correo']);
				$domicilio = htmlEntities($_POST['domicilio']);
				$tipodocumento = htmlEntities($_POST['tipodocumento']);
				$documento = htmlEntities($_POST['documento']);

				if ( isset($_POST['sm'])) {
					$sm = true;
				}else{
					$sm = false;
				}
				if ( isset($_POST['activo'])) {
					$activo = true;
				}else{
					$activo = false;
				}
				$unContacto = PDOContacto::buscarContacto($idcontacto);
				$unContacto->setNombre($nombre);
				$unContacto->setApellido($apellido);
				$unContacto->setTelefono($telefono);
				$unContacto->setDomicilio($domicilio);
				$unContacto->setCorreo($correo);
				$unContacto->setAsociadosm($sm);
				$unContacto->setActivo($activo);
				$unContacto->setDocumento($documento);
				$unContacto->setTipodocumento($tipodocumento);
				$unContacto->guardar();
				$aviso=1;

			}else{
				//No se encontro el contacto para modificar
				$aviso = 3;
			}

			$unContacto = PDOContacto::buscarContacto($idcontacto);

			$template = $twig->loadTemplate('contacto/altaContacto.html.twig');
			echo $template->render(array('aviso'=>$aviso,'modo'=>$modo,'idcontacto'=>$idcontacto,'contacto'=>$unContacto));

		}else{
			$unContacto = PDOContacto::buscarContacto($idcontacto);
			$aviso=0;
			$template = $twig->loadTemplate('contacto/altaContacto.html.twig');
			echo $template->render(array('aviso'=>$aviso,'modo'=>$modo,'idcontacto'=>$idcontacto,'contacto'=>$unContacto));
		}
	}


	static function listar(){
		$user=$_SESSION['user'];
		Twig_Autoloader::register();
	  	$loader = new Twig_Loader_Filesystem('../vista');
	  	$twig = new Twig_Environment($loader, array('cache' => '../cache','debug' => 'false')); 
		
		$contactos = PDOContacto::listar();

		$template = $twig->loadTemplate('contacto/listarContacto.html.twig');
		echo $template->render(array('user'=>$user,'contactos'=>$contactos));

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
					$contactos=PDOContacto::filtroNomyAp($datoFiltro);
					break;
				case 'telefono':
					$contactos=PDOContacto::filtroTelefono($datoFiltro);
					break;
				case 'documento':
					$contactos=PDOContacto::filtroDocumento($datoFiltro);
					break;
				case 'correo':
					$contactos=PDOContacto::filtroCorreo($datoFiltro);
					break;
				case 'asociadossm':
					$contactos=PDOContacto::filtroAsociadosSM($datoFiltro);
					break;
				case 'nada':
					$contactos = PDOContacto::listar();
					break;
			}

			//Si está filtrando la tabla, es 1.
			if ($tipoFiltro != 'nada') $filtroActivo = 1; else $filtroActivo=0; 

			$template = $twig->loadTemplate('contacto/listarContacto.html.twig');
			echo $template->render(array('user'=>$user,'contactos'=>$contactos, 'datoFiltro'=>$datoFiltro, 'filtroActivo'=>$filtroActivo));	
	}
		
	public function baja(){

		Twig_Autoloader::register();
	  	$loader = new Twig_Loader_Filesystem('../vista');
	  	$twig = new Twig_Environment($loader, array('cache' => '../cache','debug' => 'false')); 
		
	  	$idcontacto = htmlentities($_POST['idcontacto']);
		
		if(PDOContacto::buscarContacto($idcontacto)){
			PDOContacto::baja($idcontacto);
			$aviso = 1;
		}else{
			$aviso = 2;
		}
		$contactos = PDOContacto::listar();
		
		$template = $twig->loadTemplate('contacto/listarContacto.html.twig');
		echo $template->render(array('contactos'=>$contactos,'aviso'=>$aviso));
      
   }

}
?>

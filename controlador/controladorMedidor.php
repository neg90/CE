<?php

require_once '../modelo/clases/usuario.php';
require_once '../modelo/PDO/PDOMedidor.php';
require_once '../modelo/PDO/PDOmedidorempresa.php';


class controladorMedidor {

	static function pdfMedidor($datosPDF){

		$pdf = new PDF();
		// Encabezados de tabla
		$header = array('Apellido y Nombre', utf8_decode('Teléfono'), 'Domicilio', 'Imp. Pago','Num. Usuario', 'Num. Suministro');
		// Cargo la info
		$data = html_entity_decode($datosPDF);
		$data = json_decode($data, true);
		$pdf->SetFont('Arial','',14);
		$_SESSION['tituloPDF']=('Titulares de Medidores'); //título PDF
		$pdf->AddPage();
		$pdf->TablaMedidor($header,$data);
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

			$ListaMedidores=PDOMedidor::listarMedidores();

			$template = $twig->loadTemplate('medidor/listarMedidores.html.twig');
			echo $template->render(array('user'=>$user,'ListaMedidores'=>$ListaMedidores));	
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
					$ListaMedidores=PDOMedidor::filtroNomyAp($datoFiltro);
					break;
				case 'telefono':
					$ListaMedidores=PDOMedidor::filtroTelefono($datoFiltro);
					break;
				case 'domicilio':
					$ListaMedidores=PDOMedidor::filtroDomicilio($datoFiltro);
					break;
				case 'empresa':
					$ListaMedidores=PDOMedidor::filtroEmpresa($datoFiltro);
					break;
				case 'numusuario':
					$ListaMedidores=PDOMedidor::filtroNumusuario($datoFiltro);
					break;
				case 'numsuministro':
					$ListaMedidores=PDOMedidor::filtroNumsuministro($datoFiltro);
					break;
				case 'nada':
					$ListaMedidores=PDOMedidor::listarMedidores();
					break;
			}

			//Si está filtrando la tabla, es 1.
			if ($tipoFiltro != 'nada') $filtroActivo = 1; else $filtroActivo=0; 

			$template = $twig->loadTemplate('medidor/listarMedidores.html.twig');
			echo $template->render(array('user'=>$user,'ListaMedidores'=>$ListaMedidores, 'datoFiltro'=>$datoFiltro, 'filtroActivo'=>$filtroActivo));	
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

	static function alta($idempresa){

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
			
				$untimoID = $unMedidor->guardar();
				$relacion = new PDOmedidorempresa(0,$untimoID,$idempresa);
				$relacion->guardar();
				$aviso='Perfecto! El titular fue dado de alta con éxito. ';
				$tipoAviso= 'exito';

			header('Location:privado.php?c=medidor&a=listar');

		}else{
			$aviso=false;
			$template = $twig->loadTemplate('medidor/altaMedidor.html.twig');
			echo $template->render(array('aviso'=>$aviso,'user'=>$user,'idempresa'=>$idempresa));
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
			if ( isset($_POST['activo'])) {
				$activo = true;
			}else{
				$activo = false;
			}

			$unMedidor = new PDOMedidor($idMedidor,$nomyap,$telefono,$domicilio,$importe,$numusuario,$numsuministro,$activo);
			if (empty(PDOMedidor::existeMedidor($numusuario,$numsuministro))){
				$unMedidor->setIdmedidor($idMedidor);
				$unMedidor->guardar();
				$aviso='Perfecto! El titular fue modificado con éxito. ';
				$tipoAviso= 'exito';
			}
			else {$aviso='ERROR! El número de usuario / número de suministro ya se encuentran en uso.';
				  $tipoAviso='error';
			}

			$template = $twig->loadTemplate('medidor/modificarMedidor.html.twig');
			echo $template->render(array('aviso'=>$aviso,'tipoAviso' => $tipoAviso,'unMedidor'=>$unMedidor,'user'=>$user));
		}else{
			$unMedidor=PDOMedidor::medidorPorID($idMedidor);
			$aviso=false;
			$template = $twig->loadTemplate('medidor/modificarMedidor.html.twig');
			echo $template->render(array('aviso'=>$aviso,'user'=>$user,'unMedidor'=>$unMedidor));
		}
	}
}
?>
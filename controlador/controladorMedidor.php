<?php

require_once '../modelo/clases/usuario.php';
require_once '../modelo/PDO/PDOMedidor.php';
require_once '../modelo/PDO/PDOmedidorempresa.php';
require_once '../modelo/PDO/PDOempresa.php';


class controladorMedidor {

	public static function eleccion($idempresa){
		
		Twig_Autoloader::register();
	  	$loader = new Twig_Loader_Filesystem('../vista');
	  	$twig = new Twig_Environment($loader, array('cache' => '../cache','debug' => 'false'));

	  	if (isset($_POST['nuevoSocio'])) {
	  		header('Location:privado.php?c=contacto&a=altaconid&id='.$idempresa);	
	  	}

	  	$template = $twig->loadTemplate('medidor/eleccion.html.twig');
		echo $template->render(array('idempresa'=>$idempresa));
	}


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


	static function listar($pag){
			
			$user=$_SESSION['user'];
			$cantResultados = 25;
			Twig_Autoloader::register();
			$loader = new Twig_Loader_Filesystem('../vista');
			$twig = new Twig_Environment($loader, array('cache' => '../cache','debug' => 'false'));
			$medidoresempresa = PDOmedidorempresa::listar();
			if (intval($pag) == 1) {
				$valor = 0;
			}else{
				$valor = intval($pag-1) * $cantResultados ;
			}
			$cantPaginas = ceil(count(PDOMedidor::listarMedidores()) / $cantResultados);

			if ($pag == 1 ) {
				$actual = 1;
			}else{
				$actual = $pag -1;
			}
			if ($cantPaginas > 5) {
				if(($pag + 5) > $cantPaginas ){
					
					$actual = $cantPaginas-5;
					$cantMostrar = $cantPaginas;
				}else{
					$cantMostrar = intval($pag) + 5; 
				}
			}else{
				$cantMostrar = $cantPaginas;
			}
			$ListaMedidores = PDOMedidor::listarPaginacion($valor,$cantResultados);
				
			if (intval($pag) == 1) {
				$valor = 0;
			}else{
				$valor = intval($pag-1) * $cantResultados ;
			}
			;	
			//Sig
			if ($pag == $cantPaginas ) {
				$sig = $cantPaginas;
			}else{
				$sig = $pag + 1;
			}
			//ant
			if($pag == 1){
				$ant = 1 ;
			}else{
				$ant = $pag - 1;
			}
			$paginaBaja = $pag;
			$arayVista = '';

			for ($i=0; $i < count($medidoresempresa); $i++) { 
				$denominasao = PDOempresa::buscarEmpresa($medidoresempresa[$i]->idempresa);
				$arrayUnario = array ('idmedidor'=>$medidoresempresa[$i]->idmedidor,'denominacion'=>$denominasao->getDenominacion());
				$arayVista[$i] = $arrayUnario;
			}
			$template = $twig->loadTemplate('medidor/listarMedidores.html.twig');
			echo $template->render(array('pag'=>$pag,'paginaBaja'=>$paginaBaja,'actual'=>$actual,'cantMostrar'=>$cantMostrar,
			'sig'=>$sig,'ant'=>$ant,'cantidadPaginas'=>$cantPaginas,'user'=>$user,'ListaMedidores'=>$ListaMedidores,
			'relacion'=>$arayVista));	
	}

	public static function Filtros(){
			$user=$_SESSION['user'];

			Twig_Autoloader::register();
			$loader = new Twig_Loader_Filesystem('../vista');
			$twig = new Twig_Environment($loader, array(
			//'cache' => '../cache','
			'debug' => 'false'
			));

			if (isset($_POST['tipoFiltro'])){
				if (!empty($_POST['tipoFiltro']))
					$tipoFiltro=htmlEntities($_POST['tipoFiltro']);
			}

			if (isset($_POST['dato'])){
				if (!empty($_POST['dato']))
					$datoFiltro=htmlEntities($_POST['dato']);
			}

			/* if ((isset($tipoFiltro)) and (isset($datoFiltro))) $ok = true;
			elseif ((isset($tipoFiltro))!='sinempresa') {
				header('Location:privado.php?c=medidor&a=listar');
			}*/

			if (isset($_POST['datoActivo'])){
				$datoFiltro=htmlEntities($_POST['datoActivo']);
			}

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
				case 'sinempresa':
					$ListaMedidores=PDOMedidor::filtroSinEmpresa();
					$datoFiltro=null;
					break;
				case 'nada':
					$ListaMedidores=PDOMedidor::listarMedidores();
					break;
				case 'activo':
					$ListaMedidores=PDOMedidor::filtroActivo($datoFiltro);
				break;
			}

			$medidoresempresa = PDOmedidorempresa::listar();

			$arayVista = '';
			for ($i=0; $i < count($medidoresempresa); $i++) { 
				$denominasao = PDOempresa::buscarEmpresa($medidoresempresa[$i]->idempresa);
				$arrayUnario = array ('idmedidor'=>$medidoresempresa[$i]->idmedidor,'denominacion'=>$denominasao->getDenominacion());
				$arayVista[$i] = $arrayUnario;
			}

			//Si está filtrando la tabla, es 1.
			if ($tipoFiltro != 'nada') $filtroActivo = 1; else $filtroActivo=0; 

			$template = $twig->loadTemplate('medidor/listarMedidores.html.twig');
			echo $template->render(array('user'=>$user,'ListaMedidores'=>$ListaMedidores, 'datoFiltro'=>$datoFiltro, 'filtroActivo'=>$filtroActivo, 'tipoFiltro'=>$tipoFiltro, 'relacion'=>$arayVista));	
	}

	static function verMedidor($idmedidor){
			$user=$_SESSION['user'];
			Twig_Autoloader::register();
			$loader = new Twig_Loader_Filesystem('../vista');
			$twig = new Twig_Environment($loader, array('cache' => '../cache','debug' => 'false'));

			$unMedidor=PDOMedidor::medidorPorID($idmedidor);

			$template = $twig->loadTemplate('usuarios/verUsuario.html.twig');
			echo $template->render(array('user'=>$user,'unMedidor'=>$unMedidor));	
	}

	
	public static function eliminaMedidor($pag){
		$cantResultados = 25;

		$user=$_SESSION['user'];
		Twig_Autoloader::register();
		$loader = new Twig_Loader_Filesystem('../vista');
		$twig = new Twig_Environment($loader, array('cache' => '../cache','debug' => 'false'));
		
		$idMedidor = htmlentities($_POST['idmedidor']);
		if (PDOMedidor::borrar($idMedidor) == 1) {
			$eliminado = 1;
		}else{
			$eliminado = 2;
		}

		$medidoresempresa = PDOmedidorempresa::listar();
		if (intval($pag) == 1) {
			$valor = 0;
		}else{
			$valor = intval($pag-1) * $cantResultados ;
		}
		$cantPaginas = ceil(count(PDOMedidor::listarMedidores()) / $cantResultados);

		if ($pag == 1 ) {
			$actual = 1;
		}else{
			$actual = $pag -1;
		}
		if ($cantPaginas > 5) {
			if(($pag + 5) > $cantPaginas ){
				$actual = $cantPaginas-5;
				$cantMostrar = $cantPaginas;
			}else{
				$cantMostrar = intval($pag) + 5; 
			}
		}else{
			$cantMostrar = $cantPaginas;
		}
		$ListaMedidores = PDOMedidor::listarPaginacion($valor,$cantResultados);
		//Sig
		if ($pag == $cantPaginas ) {
			$sig = $cantPaginas;
		}else{
			$sig = $pag + 1;
		}
		//ant
		if($pag == 1){
			$ant = 1 ;
		}else{
			$ant = $pag - 1;
		}	
		if (intval($pag) == 1) {
			$valor = 0;
		}else{
			$valor = intval($pag-1) * $cantResultados ;
		}
		$paginaBaja = $pag;
		$arayVista = '';		

		for ($i=0; $i < count($medidoresempresa); $i++) { 
			$denominasao = PDOempresa::buscarEmpresa($medidoresempresa[$i]->idempresa);
			$arrayUnario = array ('idmedidor'=>$medidoresempresa[$i]->idmedidor,'denominacion'=>$denominasao->getDenominacion());
			$arayVista[$i] = $arrayUnario;
		}
		
		$template = $twig->loadTemplate('medidor/listarMedidores.html.twig');
		echo $template->render(array('pag'=>$pag,'paginaBaja'=>$paginaBaja,'actual'=>$actual,'cantMostrar'=>$cantMostrar,
		'sig'=>$sig,'ant'=>$ant,'cantidadPaginas'=>$cantPaginas,'user'=>$user,'ListaMedidores'=>$ListaMedidores,
		'eliminado'=>$eliminado,'relacion'=>$arayVista));	
	}

	public static function alta($idempresa){

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
			$fechadeultimopago = htmlentities($_POST['fechadeultimopago']);
			$activo = true;

			$unMedidor = new PDOMedidor(0,$nomyap,$telefono,$domicilio,$importe,$numusuario,$numsuministro,$activo,$fechadeultimopago);
			if($unMedidor->validarInsertar()){
				$untimoID = $unMedidor->guardar();
				//Aca se trae la empresa y se le guarda el numero de usuario para desp arreglar los informes.
				$unaEmpresa = PDOempresa::buscarEmpresa($idempresa);
				$unaEmpresa->setnumusuario(PDOMedidor::buscarNumerodeUsuario($untimoID));
				$unaEmpresa->setImportemensual($importe);
				$unaEmpresa->guardar();
				$relacion = new PDOmedidorempresa(0,$untimoID,$idempresa);
				$relacion->guardar();
				
				header('Location:privado.php?c=medidor&a=eleccion&id='.$idempresa);
			}else{
				$aviso=2;
				$template = $twig->loadTemplate('medidor/altaMedidor.html.twig');
				echo $template->render(array('aviso'=>$aviso,'user'=>$user,'idempresa'=>$idempresa));
			}
			

		}else{
			$aviso=0;
			$template = $twig->loadTemplate('medidor/altaMedidor.html.twig');
			echo $template->render(array('aviso'=>$aviso,'user'=>$user,'idempresa'=>$idempresa));
		}
	}


	public static function altaNormal(){

		Twig_Autoloader::register();
	  	$loader = new Twig_Loader_Filesystem('../vista');
	  	$twig = new Twig_Environment($loader, array('cache' => '../cache','debug' => 'false')); 
		$user=$_SESSION['user'];
		$modo = 'altaNormal';
		if (isset($_POST['enviarMedidor'])){
			$aviso=2;
			$nomyap = htmlEntities($_POST['nomyap']);
			$telefono = htmlEntities($_POST['telefono']);
			$domicilio = htmlEntities($_POST['domicilio']);
			$importe = htmlEntities($_POST['importe']);
			$numusuario = htmlEntities($_POST['numusuario']);
			$numsuministro = htmlEntities($_POST['numsuministro']);
			$fechadeultimopago = htmlentities($_POST['fechadeultimopago']);
			$activo = true;

			$unMedidor = new PDOMedidor(0,$nomyap,$telefono,$domicilio,$importe,$numusuario,$numsuministro,$activo,$fechadeultimopago);
			if($unMedidor->validarInsertar()){
				$unMedidor->guardar();
				
				$aviso=1;
				$tipoAviso= 'exito';
				$template = $twig->loadTemplate('medidor/altaMedidor.html.twig');
				echo $template->render(array('aviso'=>$aviso,'user'=>$user,'modo'=>$modo));
			}else{
				$tipoAviso= 2;
				$template = $twig->loadTemplate('medidor/altaMedidor.html.twig');
				echo $template->render(array('aviso'=>$aviso,'user'=>$user,'modo'=>$modo));
			}

		}else{
			$aviso=0;
			$template = $twig->loadTemplate('medidor/altaMedidor.html.twig');
			echo $template->render(array('aviso'=>$aviso,'user'=>$user,'modo'=>$modo));
		}
	}

	static function modificar(){

		Twig_Autoloader::register();
	  	$loader = new Twig_Loader_Filesystem('../vista');
	  	$twig = new Twig_Environment($loader, array('cache' => '../cache','debug' => 'false')); 
		
		$user=$_SESSION['user'];		
		$idmedidor = $_POST['idmedidor'];

		if (isset($_POST['enviarMedidor'])){
			$nomyap = htmlEntities($_POST['nomyap']);
			$telefono = htmlEntities($_POST['telefono']);
			$domicilio = htmlEntities($_POST['domicilio']);
			$importe = htmlEntities($_POST['importe']);
			$numusuario = htmlEntities($_POST['numusuario']);
			$numsuministro = htmlEntities($_POST['numsuministro']);
			$fechadeultimopago = htmlentities($_POST['fechadeultimopago']);
			
			if (isset($_POST['activo'])) {
				$activo = true;
			}else{
				$activo = false;
			}

			$unMedidor = new PDOMedidor($idmedidor,$nomyap,$telefono,$domicilio,$importe,$numusuario,$numsuministro,$activo,$fechadeultimopago);

			$unMedidor->setIdmedidor($idmedidor);

			$unaEmpresa = PDOempresa::buscarEmpresaMedidor($numusuario);
		
			$unaEmpresa->setnumusuario($numusuario);
			$unaEmpresa->setImportemensual($importe);
			$unaEmpresa->guardar();

			if ($unMedidor->guardar()) {
				$aviso = 1;
			}else{
				$aviso = 2;
			}

			$template = $twig->loadTemplate('medidor/modificarMedidor.html.twig');
			echo $template->render(array('aviso'=>$aviso,'unMedidor'=>$unMedidor,'user'=>$user));
		
		}else{
			
			$unMedidor=PDOMedidor::medidorPorID($idmedidor);
			$aviso=false;
			$template = $twig->loadTemplate('medidor/modificarMedidor.html.twig');
			echo $template->render(array('idmedidor'=>$idmedidor,'aviso'=>$aviso,'user'=>$user,'unMedidor'=>$unMedidor));
		
		}
	}
}
?>
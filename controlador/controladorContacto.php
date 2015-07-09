<?php

	require_once ('../modelo/conexionDB.php');
	require_once ('../modelo/PDO/PDOContacto.php');
	require_once '../modelo/PDO/PDOcontactoempresa.php';

	require_once '../vendor/twig/twig/lib/Twig/Autoloader.php';

	
//Valores para la variable aviso :
//1->Inserto con exito
//2->Ya existe un contacto igual
//0->No mostrar mensaje, es solo carga del formulario.
class controladorContacto {

	
	static function pdfContacto($datosPDF){

		$pdf = new PDF();
		// Encabezados de tabla
		$header = array('Nombre', 'Apellido', 'Documento', utf8_decode('Teléfono'),'Domicilio', 'Correo','SM');
		// Cargo la info
		$data = html_entity_decode($datosPDF);
		$data = json_decode($data, true);
		$pdf->SetFont('Arial','',14);
		$_SESSION['tituloPDF']=('Contactos'); //título PDF
		$pdf->AddPage();
		$pdf->TablaContacto($header,$data);
		$pdf->Output();
	}
	static function altaconid($idempresa){
		$user=$_SESSION['user'];
		Twig_Autoloader::register();
	  	$loader = new Twig_Loader_Filesystem('../vista');
	  	$twig = new Twig_Environment($loader, array('cache' => '../cache','debug' => 'false'));
	  	$modo = 'altaconid';

		$ultimoID = null;
		if (isset($_POST['guardarContacto'])){
			$aviso=2;
			$nombre = htmlEntities($_POST['nombre']);
			$apellido = htmlEntities($_POST['apellido']);
			$telefono = htmlEntities($_POST['telefono']);
			$correo = htmlEntities($_POST['correo']);
			$domicilio = htmlEntities($_POST['domicilio']);
			$tipodocumento = htmlEntities($_POST['tipodocumento']);
			$documento = htmlEntities($_POST['documento']);
			$relacion = htmlentities($_POST['relacion']);
			if ( isset($_POST['sm'])) {
				$sm = true;
			}else{
				$sm = false;
			}
			//Veriifico que no exista uni identico, soluciona usuario soquete, f5 y reload de la pagina.
			//id 1 pero se gaurda incremental en el PDO
			$unContacto = new PDOContacto(0,$nombre,$apellido,$telefono,$domicilio,$correo,$sm,$tipodocumento,$documento);

			if($unContacto->validarInsertar()){
				$ultimoID = $unContacto->guardar();
				$relacion = new PDOcontactoempresa(0,$ultimoID,$idempresa,$relacion);
				$relacion->guardar();
				$aviso=1;
			}else{
				$aviso=2;
			}
			
			//en un futuro no muy lejano deberia llevarlo al listado mostrando solo este y 
			//con un aviso de que se cargo correctamente,minimamente que se cargo correctamente
			header('Location:privado.php?c=abonado&a=eleccion&id='.$idempresa);

		}else{
			$aviso=0;
			$template = $twig->loadTemplate('contacto/altaContacto.html.twig');
			echo $template->render(array('user'=>$user,'aviso'=>$aviso,'modo'=>$modo,'idempresa'=>$idempresa));
		}
	}


	static function alta(){
		$user=$_SESSION['user'];
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
			echo $template->render(array('user'=>$user,'aviso'=>$aviso,'modo'=>$modo));

		}else{
			$aviso=0;
			$template = $twig->loadTemplate('contacto/altaContacto.html.twig');
			echo $template->render(array('user'=>$user,'aviso'=>$aviso,'modo'=>$modo));
		}
	}

	static function modificar(){
		$user=$_SESSION['user'];
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
			echo $template->render(array('user'=>$user,'aviso'=>$aviso,'modo'=>$modo,'idcontacto'=>$idcontacto,'contacto'=>$unContacto));

		}else{
			$unContacto = PDOContacto::buscarContacto($idcontacto);
			$aviso=0;
			$template = $twig->loadTemplate('contacto/altaContacto.html.twig');
			echo $template->render(array('user'=>$user,'aviso'=>$aviso,'modo'=>$modo,'idcontacto'=>$idcontacto,'contacto'=>$unContacto));
		}
	}


	static function listar($pag){

		$user=$_SESSION['user'];
		$cantResultados = 25;
		Twig_Autoloader::register();
	  	$loader = new Twig_Loader_Filesystem('../vista');
	  	$twig = new Twig_Environment($loader, array('cache' => '../cache','debug' => 'false')); 
		
		if (intval($pag) == 1) {
			$valor = 0;
		}else{
			$valor = intval($pag-1) * $cantResultados ;
		}
		$cantPaginas = ceil(count(PDOContacto::listar()) / $cantResultados);

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
		$contactos = PDOContacto::listarPaginacion($valor,$cantResultados);
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

		$template = $twig->loadTemplate('contacto/listarContacto.html.twig');
		echo $template->render(array('pag'=>$pag,'user'=>$user,'paginaBaja'=>$paginaBaja,'actual'=>$actual,
		'cantMostrar'=>$cantMostrar,'sig'=>$sig,'ant'=>$ant,'cantidadPaginas'=>$cantPaginas,
		'user'=>$user,'contactos'=>$contactos));

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
			echo $template->render(array('user'=>$user,'contactos'=>$contactos, 'tipoFiltro'=>$tipoFiltro ,'datoFiltro'=>$datoFiltro, 'filtroActivo'=>$filtroActivo));	
	}
		
	public function baja($pag){
		$user=$_SESSION['user'];

		$cantResultados = 25;
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
		if (intval($pag) == 1) {
			$valor = 0;
		}else{
			$valor = intval($pag-1) * $cantResultados ;
		}
		$cantPaginas = ceil(count(PDOContacto::listar()) / $cantResultados);

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
		$contactos = PDOContacto::listarPaginacion($valor,$cantResultados);
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
		
		$template = $twig->loadTemplate('contacto/listarContacto.html.twig');
		echo $template->render(array('pag'=>$pag,'user'=>$user,'paginaBaja'=>$paginaBaja,'actual'=>$actual,
		'cantMostrar'=>$cantMostrar,'sig'=>$sig,'ant'=>$ant,'cantidadPaginas'=>$cantPaginas,
		'contactos'=>$contactos,'aviso'=>$aviso));
      
   }

}
?>

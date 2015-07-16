<?php
	require_once '../modelo/conexionDB.php';
	require_once '../modelo/PDO/PDOempresa.php';
	require_once '../modelo/PDO/PDOcategoria.php';
	require_once '../modelo/PDO/PDOrubro.php';
	require_once '../modelo/PDO/PDOtelefonoempresa.php';
	require_once '../modelo/PDO/PDOdomicilioempresa.php';
	require_once '../modelo/PDO/PDOcorreoempresa.php';	
	require_once '../modelo/PDO/PDOContacto.php';
	require_once '../modelo/PDO/PDOmedidorempresa.php';
	require_once '../modelo/PDO/PDOcontactoempresa.php';
	require_once '../modelo/PDO/PDOabonado.php';
	require_once '../modelo/PDO/PDOMedidor.php';
	require_once '../modelo/PDO/PDOabonadoempresa.php';
	require_once '../vendor/twig/twig/lib/Twig/Autoloader.php';
	
//Valores para la variable aviso :
//1->Inserto con exito
//2->Ya existe un contacto igual
//0->No mostrar mensaje, es solo carga del formulario.
class controladorEmpresa {


	public static function pdfEmpresa(){

	if (isset($_POST['datosPDF'])){
		self::pdfEmpresaListado(htmlentities($_POST['datosPDF']));
	}
	else{
			if (isset($_POST['idempresa']))
				$idempresa=htmlEntities($_POST['idempresa']);
	
			if (isset($_POST['datosPDFrubro']))
				$rubro=htmlEntities($_POST['datosPDFrubro']);
	
			if (isset($_POST['datosPDFcategoria']))
				$categoria=htmlEntities($_POST['datosPDFcategoria']);
	
			if (isset($_POST['datosPDFcontactos']))
				$contactos=htmlEntities($_POST['datosPDFcontactos']);
	
			if (isset($_POST['datosPDFmedidores']))
				$medidores=htmlEntities($_POST['datosPDFmedidores']);
	
			if (isset($_POST['datosPDFtelefonos']))
				$telefonos=htmlEntities($_POST['datosPDFtelefonos']);
	
			if (isset($_POST['datosPDFcorreos']))
				$correos=htmlEntities($_POST['datosPDFcorreos']);
	
			if (isset($_POST['datosPDFdomicilios']))
				$domicilios=htmlEntities($_POST['datosPDFdomicilios']);
	
			if (isset($_POST['datosPDFabonados']))
				$abonados=htmlEntities($_POST['datosPDFabonados']);
	
			$pdf = new PDF();
			// Cargo la info
			//$data = html_entity_decode($datosPDF);
			//$data = json_decode($data, true);
			$pdf->SetFont('Arial','',14);
			$empresa= PDOEmpresa::buscarEmpresa($idempresa);
			$_SESSION['tituloPDF']=($empresa->getDenominacion()); //título PDF
			$pdf->AddPage('P','A4');
			$pdf->TablaEmpresa($idempresa, $rubro, $categoria,$contactos,$medidores,
					 $telefonos, $correos,$domicilios,$abonados);
			$pdf->Output();
		}
	}

	public static function pdfEmpresaListado($datosPDF){

		$pdf = new PDF();
		// Cargo la info
		$header = array(utf8_decode('Denominación'), 'CUIT', 'Rubro', utf8_decode('Categoría'),'Importe Mensual', 'Cant. Empleados');
		$data = html_entity_decode($datosPDF);
		$data = json_decode($data, true);
		$pdf->SetFont('Arial','',14);
		$_SESSION['tituloPDF']=('Listado de Empresas'); //título PDF
		$pdf->AddPage();
		$pdf->TablaListadoEmpresas($header,$data);
		$pdf->Output();
	}

	public static function filtros(){
		$user=$_SESSION['user'];

		/* FILTROS USUARIOS*/
		if (isset($_POST['tipoFiltro'])){
				if (!empty($_POST['tipoFiltro']))
					$tipoFiltro=htmlEntities($_POST['tipoFiltro']);
		}

		if (isset($_POST['dato'])){
			if ($tipoFiltro == 'activo'){
						$datoFiltro=htmlEntities($_POST['datoActivo']);
			}
			elseif (!empty($_POST['dato'])){
					$datoFiltro=htmlEntities($_POST['dato']);
			}
			else
					$datoFiltro='';
		}


		/* if ((isset($tipoFiltro)) and (isset($datoFiltro))) $ok = true;
		else header('Location:privado.php?c=empresa&a=listar'); */

		if (isset($_POST['datoCriterio'])){
			$criterio=htmlEntities($_POST['datoCriterio']);
		}
		


		Twig_Autoloader::register();
	  	$loader = new Twig_Loader_Filesystem('../vista');
	  	$twig = new Twig_Environment($loader, array('cache' => '../cache','debug' => 'false')); 
		$categorias = PDOcategoria::listar();
		//$empresas = PDOempresa::listar();

		if (($datoFiltro != null) AND ($datoFiltro != ''))
		switch($tipoFiltro){
			case 'denominacion':
				$empresas=PDOempresa::filtroDenominacion($datoFiltro);
				break;

			case 'cuit':
				$empresas=PDOempresa::filtroCUIT($datoFiltro);
				break;

			case 'cantempleados':
				$empresas=PDOempresa::filtroCantempleados($datoFiltro);
				break;	

			case 'importe':
				$empresas=PDOempresa::filtroImporte($criterio,$datoFiltro);
				break;

			case 'rubro':
				$rubros=PDOrubro::filtroRubro($datoFiltro);
				$empresas=PDOempresa::filtroRubro($rubros);
				break;

			case 'categoria':
				$cats=PDOcategoria::filtroCategoria($datoFiltro);
				$empresas=PDOempresa::filtroCategoria($cats);
				break;

			case 'activo':
				$empresas=PDOempresa::filtroActivo($datoFiltro);
				break;
		}
		else header('Location:privado.php?c=empresa&a=listar&pagina=1');


		$rubros = PDOrubro::listar();
		$totalEmpresas = intval(PDOempresa::contarEmpresas()['count(idempresa)']);
		$contactos = PDOContacto::listar();
		$abonados = PDOabonado::listar();
		$medidores = PDOMedidor::listarMedidores();
		$arrayVista[0] = '';
		if (count($empresas)>0){
				foreach ($empresas as $empresa) { 
					$contactosRelacionados = PDOcontactoempresa::buscarContactosRelacionados($empresa->idempresa);
					$medidordeEmpresa = PDOmedidorempresa::buscarMedidorRelacionados($empresa->idempresa);
					$unAbonadoRelacionado = PDOabonadoempresa::buscarAbonadosRelacionados($empresa->idempresa);
					$arrayUnario = array('idempresa'=>$empresa->idempresa,'contactos'=>$contactosRelacionados,'medidor'=>$medidordeEmpresa,'abonado'=>$unAbonadoRelacionado);
					$arrayVista[$empresa->idempresa] = $arrayUnario;
				}
		}
		$filtroActivo=1;
		$template = $twig->loadTemplate('empresa/listarEmpresa.html.twig');
		echo $template->render(array('empresas'=>$empresas,'rubros'=>$rubros,'categorias'=>$categorias,'contactos'=>$contactos,
		'medidores'=>$medidores,'arrayVista'=>$arrayVista,'abonados'=>$abonados,'user'=>$user, 'filtroActivo'=>$filtroActivo, 'tipoFiltro'=>$tipoFiltro,'datoFiltro'=>$datoFiltro));
	}

	public static function detalle($idempresa){
		$user=$_SESSION['user'];
		Twig_Autoloader::register();
	  	$loader = new Twig_Loader_Filesystem('../vista');
	  	$twig = new Twig_Environment($loader, array('cache' => '../cache','debug' => 'false')); 
		$empresa = PDOempresa::buscarEmpresa($idempresa);
		$categoria = PDOcategoria::buscarDescripcion($empresa->getIdcategoria());
		$rubro = PDOrubro::buscarDescripcion($empresa->getIdrubro());

		$contactos=null;
		$contactosTodos = PDOcontacto::listar();
		for ($ct=0; $ct<count($contactosTodos);$ct++){
			$contactoEncontrado = PDOcontactoempresa::buscarContactoId($contactosTodos[$ct]->idcontacto);
			if (isset($contactoEncontrado['idempresa'])){
				if ($contactoEncontrado['idempresa'] == $empresa->getIdempresa()){
					$contactos[$ct] = PDOcontacto::buscarContacto($contactosTodos[$ct]->idcontacto);
				}
			}
		}

		$medidores=null;
		$medidoresTodos = PDOMedidor::listarMedidores();
		for ($mt=0; $mt<count($medidoresTodos);$mt++){
			$medidorEncontrado = PDOmedidorempresa::buscarMedidorId($medidoresTodos[$mt]->idmedidor);
			if (isset($medidorEncontrado->idempresa)){
						if ($medidorEncontrado->idempresa  == $empresa->getIdempresa()){
									$medidores[$mt] = PDOMedidor::medidorPorID($medidoresTodos[$mt]->idmedidor);
						}
			}
		}
		$abonados = null;
		$abonadosTodos = PDOabonado::listar();
		for ($at=0; $at<count($abonadosTodos);$at++){
			$abonadoEncontrado = PDOabonadoempresa::buscarAbonadoId($abonadosTodos[$at]->numabonado);
			if (isset($abonadoEncontrado->idempresa)){
						if ($abonadoEncontrado->idempresa == $empresa->getIdempresa()){
									$abonados[$at] = PDOabonado::buscarAbonado($abonadosTodos[$at]->numabonado);
						}
			}
		}
		$correos = PDOcorreoempresa::buscarCorreos($empresa->getIdempresa());
		$domicilios = PDOdomicilioempresa::buscarDomicilios($empresa->getIdempresa());
		$telefonos = PDOtelefonoempresa::buscarTelefonos($idempresa);

		$template = $twig->loadTemplate('empresa/verEmpresa.html.twig');
		echo $template->render(array('empresa'=>$empresa,'rubro'=>$rubro,'categoria'=>$categoria,
		'contactos'=>$contactos,'medidores'=>$medidores,'telefonos'=>$telefonos,'correos'=>$correos, 'domicilios'=>$domicilios,'abonados'=>$abonados,'user'=>$user));
	}
	public static function listar($pag){
		
		$user=$_SESSION['user'];
		$cantResultados = 25;
		Twig_Autoloader::register();
	  	$loader = new Twig_Loader_Filesystem('../vista');
	  	$twig = new Twig_Environment($loader, array('cache' => '../cache','debug' => 'false')); 
		$categorias = PDOcategoria::listar();

		if (intval($pag) == 1) {
			$valor = 0;
		}else{
			$valor = intval($pag-1) * $cantResultados ;
		}
		$cantPaginas = ceil(count(PDOempresa::listar()) / $cantResultados);

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
		$empresas = PDOempresa::listarPaginacion($valor,$cantResultados);
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
		$rubros = PDOrubro::listar();
		
		$contactos = PDOContacto::listar();
		$abonados = PDOabonado::listar();
		$medidores = PDOMedidor::listarMedidores();
		$arrayVista[0] = '';
		for ($i=0; $i < count($empresas) ; $i++) { 
			$contactosRelacionados = PDOcontactoempresa::buscarContactosRelacionados($empresas[$i]->idempresa);
			$medidordeEmpresa = PDOmedidorempresa::buscarMedidorRelacionados($empresas[$i]->idempresa);
			$unAbonadoRelacionado = PDOabonadoempresa::buscarAbonadosRelacionados($empresas[$i]->idempresa);
			$arrayUnario = array('idempresa'=>$empresas[$i]->idempresa,'contactos'=>$contactosRelacionados,'medidor'=>$medidordeEmpresa,'abonado'=>$unAbonadoRelacionado);
			$arrayVista[$i] = $arrayUnario;
		}
		
		$filtroActivo = 0; //Si está filtrando la tabla, es 1.

		$template = $twig->loadTemplate('empresa/listarEmpresa.html.twig');
		echo $template->render(array('pag'=>$pag,'paginaBaja'=>$paginaBaja,'actual'=>$actual,'cantMostrar'=>$cantMostrar,
		'sig'=>$sig,'ant'=>$ant,'cantidadPaginas'=>$cantPaginas,'empresas'=>$empresas,'rubros'=>$rubros,
		'categorias'=>$categorias,'contactos'=>$contactos,'medidores'=>$medidores,'arrayVista'=>$arrayVista,
		'abonados'=>$abonados,'user'=>$user, 'filtroActivo' => $filtroActivo));
	}
	public function baja($pag){
		$cantResultados = 25;
		$user=$_SESSION['user'];
		Twig_Autoloader::register();
	  	$loader = new Twig_Loader_Filesystem('../vista');
	  	$twig = new Twig_Environment($loader, array('cache' => '../cache','debug' => 'false')); 
		
	  	$idempresa = htmlentities($_POST['idempresa']);
		
		if(PDOempresa::buscarEmpresa($idempresa)){
			PDOempresa::baja($idempresa);
			$aviso = 1;
		}else{
			$aviso = 2;
		}
		$categorias = PDOcategoria::listar();
		//$empresas = PDOempresa::listar();
		if (intval($pag) == 1) {
			$valor = 0;
		}else{
			$valor = intval($pag-1) * $cantResultados ;
		}
		$cantPaginas = ceil(count(PDOempresa::listar()) / $cantResultados);
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
		$empresas = PDOempresa::listarPaginacion($valor,$cantResultados);
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
		$rubros = PDOrubro::listar();
		$paginaBaja = $pag;
		//$totalEmpresas = intval(PDOempresa::contarEmpresas()['count(idempresa)']);
		$contactos = PDOContacto::listar();
		$abonados = PDOabonado::listar();
		$medidores = PDOMedidor::listarMedidores();
		$arrayVista[0] = '';
		for ($i=0; $i < count($empresas)  ; $i++) { 
			$contactosRelacionados = PDOcontactoempresa::buscarContactosRelacionados($empresas[$i]->idempresa);
			$medidordeEmpresa = PDOmedidorempresa::buscarMedidorRelacionados($empresas[$i]->idempresa);
			$unAbonadoRelacionado = PDOabonadoempresa::buscarAbonadosRelacionados($empresas[$i]->idempresa);
			$arrayUnario = array('idempresa'=>$empresas[$i]->idempresa,'contactos'=>$contactosRelacionados,'medidor'=>$medidordeEmpresa,'abonado'=>$unAbonadoRelacionado);
			$arrayVista[$i] = $arrayUnario;
		}
		
		$template = $twig->loadTemplate('empresa/listarEmpresa.html.twig');
		echo $template->render(array('pag'=>$pag,'aviso'=>$aviso,'paginaBaja'=>$paginaBaja,'actual'=>$actual,'cantMostrar'=>$cantMostrar,'sig'=>$sig,'ant'=>$ant,
		'cantidadPaginas'=>$cantPaginas,'idempresa'=>$idempresa,'empresas'=>$empresas,'rubros'=>$rubros,'categorias'=>$categorias,'contactos'=>$contactos,
		'medidores'=>$medidores,'arrayVista'=>$arrayVista,'abonados'=>$abonados,'user'=>$user));
   }

   /*
   ------------------------------------------------------------------------------------------------------------------------
   la cuestion() lo que hace es recibe una cantidad desconocida de inputs por post los recorre y los carga en las tablas 
   intermedias de empresa (telefono,correo,domicilio) la cantidad deseada, esto cuando el usuario da de alta una empresa ahora 
   cuando el usuario modifica deberias ver el medoto modidicar del controlador, trabaja de forma parecida.
   ------------------------------------------------------------------------------------------------------------------------
   */
	private static function laCuestionDelTelefono ($idempresa){
		for ($i=0; $i < 13; $i++) { 
			$auxStrtel = 'telefono' . $i;
			$auxStrdesc = 'caractel' . $i .'/';
			if(isset($_POST[$auxStrtel]) ){
				if($_POST[$auxStrtel] != ''){
					$varTel = htmlentities($_POST[$auxStrtel]);
					$varCarac = htmlentities($_POST[$auxStrdesc]);
					//cargar telefono en tabla intermedia 
					$unTelefono = new PDOtelefonoempresa (0,$idempresa,$varTel,$varCarac);
					//validado con ajax
					$unTelefono->guardar();
					$unTelefono = null;
				}
				
			}
		}
	}
	private static function laCuestionDelDomicilio ($idempresa){
		for ($i=0; $i < 13; $i++) { 
			$auxStrDom = 'domicilio' . $i;
			$auxStrdesc = 'caracdom' . $i .'/';
			if (isset($_POST[$auxStrDom])){
				if($_POST[$auxStrDom] != ''){
					$varDom = htmlentities($_POST[$auxStrDom]);
					$varCarac = htmlentities($_POST[$auxStrdesc]);
					//cargar domicilios en tabla intermedia 
					$unDomicilio = new PDOdomicilioempresa (0,$idempresa,$varDom,$varCarac);
					//validado con ajax
					$unDomicilio->guardar();
					$unDomicilio = null;
				}	
			}
		}
	}

	private static function laCuestionDelCorreo ($idempresa){
		for ($i=0; $i < 13; $i++) { 
			$auxStrCor = 'correo' . $i ;
			$auxStrdesc = 'caraccorreo' . $i .'/';
			if (isset($_POST[$auxStrCor])){
				if($_POST[$auxStrCor] != ''){
					$varCor = htmlentities($_POST[$auxStrCor]);
					$varCarac = htmlentities($_POST[$auxStrdesc]);
					//cargar telefono en tabla intermedia 
					$unCorreo = new PDOcorreoempresa (0,$idempresa,$varCor,$varCarac);
					//validado con ajax
					$unCorreo->guardar();
					$unCorreo = null;
				}
				
			}
		}
	
	}
	private static function validarMedidores ($idempresa){
		for ($i=0; $i < 21 ; $i++) { 
			$strContacto = 'contacto' . $i;
			$strRelacion = 'relacion' . $i;
				
			$idCOntacto = htmlentities($_POST[$strContacto]);
			$relacion = htmlentities($_POST[$strRelacion]);
			//sale carga del socio en la tabla intermedia
			$unContactoIntermedio = new PDOcontactoempresa (0,$idCOntacto,$idempresa,$relacion);
			$unContactoIntermedio->guardar();
			
		}
	}
	static function alta(){
		$user=$_SESSION['user'];
		Twig_Autoloader::register();
	  	$loader = new Twig_Loader_Filesystem('../vista');
	  	$twig = new Twig_Environment($loader, array('cache' => '../cache','debug' => 'false'));
	  	$modo = 'alta';
	  	$aviso = 0;
	  	$fechaActual = date('Y-m-d');
	  	//Traigo contactos !! :D
	  	$unosContactos = PDOcontacto::listar();
	  	$unosMedidores = PDOMedidor::listarMedidores();
	  	$unasCategorias = PDOcategoria::listar();
	  	$unosRubros = PDOrubro::listar();
	  	$unosAbonados = PDOabonado::listar();
	  	$ultimoIdempresaInsertado = null;
		if (isset($_POST['guardarEmpresa'])){
			$denominacion = htmlEntities($_POST['denominacion']);
			$cantempleados = htmlEntities($_POST['cantempleados']);
			$importemensual = htmlEntities($_POST['importemensual']);
			$cuit = htmlEntities($_POST['cuit']);
			$web = htmlEntities($_POST['web']);
			$fechainicioce = htmlEntities($_POST['fechainicioce']);
			$fechafundacion = htmlEntities($_POST['fechafundacion']);
			$rubroAJAX = htmlEntities($_POST['rubro']);
			$categoriaAJAX = htmlEntities($_POST['categoria']);
			$detactividad = htmlEntities($_POST['detactividad']);
			$numabonado = htmlEntities($_POST['abonado']);
			$idMedidor = htmlentities($_POST['medidor']);
			$numusuario = htmlentities($_POST['numusuario']);
			$activo = true;
			
			//Veriifico que no exista uni identico, soluciona usuario soquete, f5 y reload de la pagina.
			//id 0 pero se guarda incremental en el PDO
			$unaEmpresa = new PDOempresa(0,$denominacion,$web,$rubroAJAX,$detactividad,$cantempleados,$categoriaAJAX,
			$fechainicioce,$activo,$cuit,$fechafundacion,$importemensual,$numusuario);
			if($unaEmpresa->validarInsertar()){
				
				$ultimoIdempresaInsertado = $unaEmpresa->guardar();
				$aviso=1;
				//Todo salio bien y se guardo traigo el objeto y empiezo a llenar tablas relacionadas.
				//$unaEmpresa = PDOempresa::BuscarID($denominacion,$web,$rubroAJAX,$detactividad,$cantempleados,$categoriaAJAX,$fechainicioce,
				//$activo,$cuit,$fechafundacion,$importemensual,$nrosocio,$numusuario);
				$unaEmpresa = PDOempresa::buscarEmpresa($ultimoIdempresaInsertado);
				//alta socio
				controladorEmpresa::validarMedidores($unaEmpresa->getIdempresa());
				//alta abonado
				$cargoContrubuyente = false;
				/*if (isset($_POST['abonadoCheck'])) {
					$cargoContrubuyente = true;

					$activo= true;
					$abonadoAUX = new PDOabonado(0,$unaEmpresa->getImportemensual(),0,$activo);
					$ultimaID  = $abonadoAUX->guardar();
					$unAbonado = new PDOabonadoempresa(0,$ultimaID,$unaEmpresa->getIdempresa());
					$unAbonado->guardar();

					//$numabonado = htmlEntities($_POST['abonado']);
				}
				//alta medidor
				*/
				if( $idMedidor <>'-1'){
					$cargoContrubuyente = true;
					$unaEmpresa->setNumusuario(PDOMedidor::buscarNumerodeUsuario($idMedidor));
					$unaEmpresa->guardar();
					$unMedidor = new PDOmedidorempresa(0,$idMedidor,$unaEmpresa->getIdempresa());
					$unMedidor->guardar(); 
				}
	
				//Alta telefonos extra
				controladorEmpresa::laCuestionDelTelefono($unaEmpresa->getIdempresa());
				//alta domicilios extra
				controladorEmpresa::laCuestionDelDomicilio($unaEmpresa->getIdempresa());
				//alta domicilios extra
				controladorEmpresa::laCuestionDelCorreo($unaEmpresa->getIdempresa());

			}else{
				//falla la validacion vamos de nuevo.
				$aviso=2;
				$template = $twig->loadTemplate('empresa/altaEmpresa.html.twig');
				echo $template->render(array('fecha'=>$fechaActual,'aviso'=>$aviso,'contactos'=>$unosContactos,'medidores'=>$unosMedidores,
				'rubros'=>$unosRubros,'categorias'=>$unasCategorias,'abonados'=>$unosAbonados));
			}

			//Decide si cargo o no cargo contribuyente
			if ($cargoContrubuyente) {
				header('Location:privado.php?c=empresa&a=listar&pagina=1');
			}else{
				header('Location:privado.php?c=empresa&a=eleccion&id='.$ultimoIdempresaInsertado);
				//Todo salio bien se cargo la empresa deberia seguir cargando cosas..	
			}

		
		}elseif ($ultimoIdempresaInsertado == null) {
			//primera vez que entra al formulario.
			$aviso=0;
			$template = $twig->loadTemplate('empresa/altaEmpresa.html.twig');
			echo $template->render(array('fecha'=>$fechaActual,'aviso'=>$aviso,'contactos'=>$unosContactos,'medidores'=>$unosMedidores,
			'rubros'=>$unosRubros,'categorias'=>$unasCategorias,'abonados'=>$unosAbonados,'user'=>$user));
		}
	}

	public static function eleccion($idempresa){
		$user=$_SESSION['user'];
		Twig_Autoloader::register();
	  	$loader = new Twig_Loader_Filesystem('../vista');
	  	$twig = new Twig_Environment($loader, array('cache' => '../cache','debug' => 'false'));

	  	if (isset($_POST['nuevoMedidor'])) {
	  		//alta de medidor
	  		$idempresa = $idempresa;
	  		header('Location:privado.php?c=medidor&a=alta&id='.$idempresa);
	  	}elseif (isset($_POST['nuevoAbonado'])) {
	  		//alta abonado
	  		$idempresa = $idempresa;
	  		var_dump($idempresa);
	  		header('Location:privado.php?c=abonado&a=alta&id='.$idempresa);
	  	}else{
	  		$template = $twig->loadTemplate('empresa/eleccion.html.twig');
			echo $template->render(array('idempresa'=>$idempresa,'user'=>$user));
	  	}
	}


	static function modificar(){
		$user=$_SESSION['user'];
		Twig_Autoloader::register();
	  	$loader = new Twig_Loader_Filesystem('../vista');
	  	$twig = new Twig_Environment($loader, array('cache' => '../cache','debug' => 'false'));
	  	$aviso = 0;

		$idempresa = $_POST['idempresa'];

	  	$unosContactos = PDOcontacto::listar();
	  	$unosMedidores = PDOMedidor::listarMedidores();
	  	$unasCategorias = PDOcategoria::listar();
	  	$unosRubros = PDOrubro::listar();
	  	$medidorRelacionado = PDOmedidorempresa::buscarMedidorRelacionados($idempresa);
	  	$unAbonadoRelacionado = PDOabonadoempresa::buscarAbonadosRelacionados($idempresa);
	  	$unosAbonados = PDOabonado::listar();
		if (isset($_POST['guardarEmpresa'])){
			if(PDOempresa::buscarEmpresa($idempresa)){
				$denominacion = htmlEntities($_POST['denominacion']);
				$cantempleados = htmlEntities($_POST['cantempleados']);
				$importemensual = htmlEntities($_POST['importemensual']);
				$cuit = htmlEntities($_POST['cuit']);
				$web = htmlEntities($_POST['web']);
				$fechainicioce = htmlEntities($_POST['fechainicioce']);
				$fechafundacion = htmlEntities($_POST['fechafundacion']);
				$rubroAJAX = htmlEntities($_POST['rubro']);
				$categoriaAJAX = htmlEntities($_POST['categoria']);
				$detactividad = htmlEntities($_POST['detactividad']);
				$numabonado = htmlEntities($_POST['abonado']);
				$idMedidor = htmlentities($_POST['medidor']);
				if (isset($_POST['activo'])) {
					$activo = true;
				}else{
					$activo = false;
				}
				$unaEmpresa = PDOempresa::buscarEmpresa($idempresa);
				$unaEmpresa->setDenominacion($denominacion);
				$unaEmpresa->setWeb($web);
				$unaEmpresa->setIdrubro($rubroAJAX);
				$unaEmpresa->setDetactividad($detactividad);
				$unaEmpresa->setCantempleados($cantempleados);
				$unaEmpresa->setIdcategoria($categoriaAJAX);
				$unaEmpresa->setFechainicioce($fechainicioce);
				$unaEmpresa->setActivo($activo);
				$unaEmpresa->setCuit($cuit);
				$unaEmpresa->setFechafundacion($fechafundacion);
				$unaEmpresa->setImportemensual($importemensual);

				//Si pone activo el false tngo q deshabilitar el abonado.
				$thisrelacionAbonadoForYou = PDOabonadoempresa::buscarAbonadosRelacionados($unaEmpresa->getIdempresa());
				if ($thisrelacionAbonadoForYou) {
					$abonadoMod = PDOabonado::buscarAbonado($thisrelacionAbonadoForYou->numabonado);
					$abonadoMod->setActivo($activo);
					$abonadoMod->guardar();
				}
				
				//Agrego el nuevo o el mismo :/
				if( $idMedidor <> '-1'){
					//en caso de que anteriormente tengamos un abonado lo fleto
					PDOabonadoempresa::borrarAbonadosEmpresa($unaEmpresa->getIdempresa());
					//en caso de que anteriormente tengoamos un medidor lo fleto.
					PDOmedidorempresa::borrarMedidorEmpresa($unaEmpresa->getIdempresa());
					//busco el numero de usuario para modificarlo.
					$unaEmpresa->setNumusuario(PDOMedidor::buscarNumerodeUsuario($idMedidor));
					$unMedidor = new PDOmedidorempresa(0,$idMedidor,$unaEmpresa->getIdempresa());
					$unMedidor->guardar(); 
				}
				
				if (isset($_POST['abonadoCheck'])) {
					//Borro el abonado
					$thisrelacionAbonadoForYou = PDOabonadoempresa::buscarAbonadosRelacionados($unaEmpresa->getIdempresa());
					PDOabonado::baja($thisrelacionAbonadoForYou->numabonado);
					//en caso de que anteriormente tengamos un abonado lo fleto
					PDOabonadoempresa::borrarAbonadosEmpresa($unaEmpresa->getIdempresa());
					//y borra el numero de usuario
					$unaEmpresa->setNumusuario(00000000);
					//en caso de que anteriormente tengoamos un medidor lo fleto.
					PDOmedidorempresa::borrarMedidorEmpresa($unaEmpresa->getIdempresa());
					//aca new de abonado.
					$activo = true;
					$abonadoAUX = new PDOabonado(0,$unaEmpresa->getImportemensual(),0,$activo);
					$ultimaID  = $abonadoAUX->guardar();
					$unAbonado = new PDOabonadoempresa(0,$ultimaID,$unaEmpresa->getIdempresa());
					$unAbonado->guardar();
				}
					
				$unaEmpresa->guardar();
				$aviso=1;
				//Busco de nuevo la empresa actualizada.
				$medidorRelacionado = PDOmedidorempresa::buscarMedidorRelacionados($idempresa);
				$unAbonadoRelacionado = PDOabonadoempresa::buscarAbonadosRelacionados($idempresa);
				$unaEmpresa = PDOempresa::buscarEmpresa($idempresa);
				$template = $twig->loadTemplate('empresa/modificarEmpresa.html.twig');
				echo $template->render(array('idempresa'=>$idempresa,'aviso'=>$aviso,'contactos'=>$unosContactos,'medidores'=>$unosMedidores,
				'rubros'=>$unosRubros,'categorias'=>$unasCategorias,'unaEmpresa'=>$unaEmpresa,'medidorRelacionado'=>$medidorRelacionado,
				'abonados'=>$unosAbonados,'abonadoRelacionado'=>$unAbonadoRelacionado,'user'=>$user));
			}else{
				//No se encontro la empresa para modificar
				$aviso = 3;
			}
		}else{
			$aviso=0;
			$unaEmpresa = PDOempresa::buscarEmpresa($idempresa);
			$template = $twig->loadTemplate('empresa/modificarEmpresa.html.twig');
			echo $template->render(array('idempresa'=>$idempresa,'aviso'=>$aviso,'contactos'=>$unosContactos,'medidores'=>$unosMedidores,
			'rubros'=>$unosRubros,'categorias'=>$unasCategorias,'unaEmpresa'=>$unaEmpresa,'medidorRelacionado'=>$medidorRelacionado
			,'abonados'=>$unosAbonados,'abonadoRelacionado'=>$unAbonadoRelacionado,'user'=>$user));
		}
		
	}
	public function modificarTelefonos(){
		$user=$_SESSION['user'];
		Twig_Autoloader::register();
	  	$loader = new Twig_Loader_Filesystem('../vista');
	  	$twig = new Twig_Environment($loader, array('cache' => '../cache','debug' => 'false'));	
		$aviso = 0 ;
		$idempresa = $_POST['idempresa'];
		$telefonosRelacionados = PDOtelefonoempresa::buscarTelefonos($idempresa); 
	  	if (isset($_POST['guardarEmpresa'])){
	  		//Borro lo que esta guardado.
	  		PDOtelefonoempresa::borrarTelefonosRelacionados($idempresa);
	  		//Cargar los nuevos.
	  		controladorEmpresa::laCuestionDelTelefono($idempresa);
	  		$aviso = 1 ;
	  		$telefonosRelacionados = PDOtelefonoempresa::buscarTelefonos($idempresa); 
			$template = $twig->loadTemplate('empresa/modificarTelefonosEmpresa.html.twig');
			echo $template->render(array('idempresa'=>$idempresa,'telefonosRelacionados'=>$telefonosRelacionados,'aviso'=>$aviso));
	  	}else{
	  		$template = $twig->loadTemplate('empresa/modificarTelefonosEmpresa.html.twig');
			echo $template->render(array ('idempresa'=>$idempresa,'telefonosRelacionados'=>$telefonosRelacionados,'aviso'=>$aviso,'user'=>$user));
	  	}
	}
	public function modificarCorreos(){
		$user=$_SESSION['user'];
		Twig_Autoloader::register();
	  	$loader = new Twig_Loader_Filesystem('../vista');
	  	$twig = new Twig_Environment($loader, array('cache' => '../cache','debug' => 'false'));	
		$aviso = 0 ;
		$idempresa = $_POST['idempresa'];
		$correosRelacionados = PDOcorreoempresa::buscarCorreos($idempresa); 
	  	if (isset($_POST['guardarEmpresa'])){
	  		//Borro lo que esta guardado.
	  		PDOcorreoempresa::borrarCorreosRelacionados($idempresa);
	  		//Cargar los nuevos.
	  		controladorEmpresa::laCuestionDelCorreo($idempresa);
	  		$aviso = 1 ;
	  		$correosRelacionados = PDOcorreoempresa::buscarCorreos($idempresa); 
			$template = $twig->loadTemplate('empresa/modificarCorreosEmpresa.html.twig');
			echo $template->render(array('idempresa'=>$idempresa,'correosRelacionados'=>$correosRelacionados,'aviso'=>$aviso,'user'=>$user));
	  	}else{
	  		$template = $twig->loadTemplate('empresa/modificarCorreosEmpresa.html.twig');
			echo $template->render(array ('idempresa'=>$idempresa,'correosRelacionados'=>$correosRelacionados,'aviso'=>$aviso,'user'=>$user));
	  	}
	}
	public function modificarContactos (){
		$user=$_SESSION['user'];
		Twig_Autoloader::register();
	  	$loader = new Twig_Loader_Filesystem('../vista');
	  	$twig = new Twig_Environment($loader, array('cache' => '../cache','debug' => 'false'));		
		$aviso = 0 ;

		$idempresa = $_POST['idempresa'];

		//Traigo los contactos relacionados.
	  	$unosContactosRelacionados = PDOcontactoempresa::buscarContactosRelacionados($idempresa);
	  	$unosContactos = PDOcontacto::listar();  
	  	if (isset($_POST['guardarEmpresa'])){
	  		//Boroo los que hay actualmente
	  		PDOcontactoempresa::borrarContactosRelacionados($idempresa);
	  		//Cargo los nuevos
			controladorEmpresa::validarMedidores($idempresa);
			$aviso = 1 ;
			$unosContactosRelacionados = PDOcontactoempresa::buscarContactosRelacionados($idempresa);
	  		$unosContactos = PDOcontacto::listar();  
			$template = $twig->loadTemplate('empresa/modificarContactosEmpresa.html.twig');
			echo $template->render(array('contactosRelacionados'=>$unosContactosRelacionados,'contactos'=>$unosContactos,
			'idempresa'=>$idempresa,'user'=>$user,'aviso'=>$aviso));
	  	}else{
	  		$template = $twig->loadTemplate('empresa/modificarContactosEmpresa.html.twig');
			echo $template->render(array('contactosRelacionados'=>$unosContactosRelacionados,'contactos'=>$unosContactos,
			'idempresa'=>$idempresa,'user'=>$user,'aviso'=>$aviso));
	  	}
	}
	public function modificarDomicilios(){
		$user=$_SESSION['user'];
		Twig_Autoloader::register();
	  	$loader = new Twig_Loader_Filesystem('../vista');
	  	$twig = new Twig_Environment($loader, array('cache' => '../cache','debug' => 'false'));	
		$aviso = 0 ;
		$idempresa = $_POST['idempresa'];
		$domiciliosRelacionados = PDOdomicilioempresa::buscarDomicilios($idempresa); 
	  	if (isset($_POST['guardarEmpresa'])){
	  		//Borro lo que esta guardado.
	  		PDOdomicilioempresa::borrarDomiciliosRelacionados($idempresa);
	  		//Cargar los nuevos.
	  		controladorEmpresa::laCuestionDelDomicilio($idempresa);
	  		//Busco nuevos datos apra llevar a la vista!
			$domiciliosRelacionados = PDOdomicilioempresa::buscarDomicilios($idempresa); 
			//Aviso todo correcto
	  		$aviso = 1 ;
			$template = $twig->loadTemplate('empresa/modificarDomiciliosEmpresa.html.twig');
			echo $template->render(array('idempresa'=>$idempresa,'domiciliosRelacionados'=>$domiciliosRelacionados,'aviso'=>$aviso,'user'=>$user));
	  	}else{
	  		$template = $twig->loadTemplate('empresa/modificarDomiciliosEmpresa.html.twig');
			echo $template->render(array ('idempresa'=>$idempresa,'domiciliosRelacionados'=>$domiciliosRelacionados,'aviso'=>$aviso,'user'=>$user));
	  	}
	}
}
?>
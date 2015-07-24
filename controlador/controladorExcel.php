<?php

	require_once '../modelo/conexionDB.php';	 
	require_once '../modelo/PDO/PDOMedidor.php';
	require_once '../modelo/PDO/PDOempresa.php';
	require_once '../modelo/PDO/PDOinfmedidorexcel.php';
	

class controladorExcel {

	/* Recibe el registro actual del arrayexel y verifica todos los campos antes de insertarlo en caso de que el 
	registro nose pueda insertar devuelve si esta sano o no. */
	private static function validarFila ($unRegistro){
		$esValido = true;
		if(empty($unRegistro[0])){
			$esValido = false;
		}
		if(empty($unRegistro[1])){
			$esValido = false;
		}
		if (empty($unRegistro[5])){
			$esValido = false;
		}
		if (empty($unRegistro[3])){
			$esValido = false;
		} 
		return $esValido; 
	}

	public function descargarExcel (){
		$user=$_SESSION['user'];
		Twig_Autoloader::register();
	  	$loader = new Twig_Loader_Filesystem('../vista');
	  	$twig = new Twig_Environment($loader, array('cache' => '../cache','debug' => 'false'));

		require_once '../vendor/PHPExcel/Classes/PHPExcel.php';
		date_default_timezone_set('America/Argentina/Buenos_Aires');

		if (PHP_SAPI == 'cli'){
			$template = $twig->loadTemplate('falloDescarga.html.twig');
			echo $template->render(array('user'=>$user));
		}else{
			// Se crea el objeto PHPExcel
 			$archivoExcel = new PHPExcel();
 			//Propiedades excel
 			$fecha = date('Y-m-d');
	 		// Se asignan las propiedades del libro
			$archivoExcel->getProperties()->setCreator($user) // Nombre del autor
   			->setLastModifiedBy($user) //Ultimo usuario que lo modificó
    		->setTitle("Asociados CETA" . $fecha) // Titulo
   			->setDescription("Reporte de Asociado CETA"); //Descripción
   			$tituloReporte = "Asociados CETA " . $fecha;
			$titulosColumnas = array('Nro Asociado','Denominacion','Importe','CUIT','Rubro','Categoria','Cantidad de Empleados','Fecha de Asociacion','Fecha de Fundacion','WEB','Usuario CELTA','Activo');
			$archivoExcel->setActiveSheetIndex(0)
    		->mergeCells('A1:L1');

    		// Se agregan los titulos del reporte
			$archivoExcel->setActiveSheetIndex(0)
		    ->setCellValue('A1',$tituloReporte) // Titulo del reporte
		    ->setCellValue('A2',  $titulosColumnas[0]) //Titulo de las columnas
		    ->setCellValue('B2',  $titulosColumnas[1])
		    ->setCellValue('C2',  $titulosColumnas[2]) 
		    ->setCellValue('D2',  $titulosColumnas[3])
		    ->setCellValue('E2',  $titulosColumnas[4]) 
		    ->setCellValue('F2',  $titulosColumnas[5])
		    ->setCellValue('G2',  $titulosColumnas[6]) 
		    ->setCellValue('H2',  $titulosColumnas[7])
		    ->setCellValue('I2',  $titulosColumnas[8]) 
		    ->setCellValue('J2',  $titulosColumnas[9])
		    ->setCellValue('K2',  $titulosColumnas[10])
		    ->setCellValue('L2',  $titulosColumnas[11]);

		    //traigo los datos de las empresas
		    $asociados = PDOempresa::listar();
		    //Centrar texto
		    $archivoExcel->getActiveSheet()->getStyle('A1:L1')->getAlignment()->setHorizontal(PHPExcel_Style_Alignment::HORIZONTAL_CENTER);
		    $archivoExcel->getActiveSheet()->getStyle('A2:L2')->getAlignment()->setHorizontal(PHPExcel_Style_Alignment::HORIZONTAL_CENTER);
		    //Codigo para darle auto size a las celdas..
		    $sheet = $archivoExcel->getActiveSheet(); 
		    $cellIterator = $sheet->getRowIterator()->current()->getCellIterator();
		    $cellIterator->setIterateOnlyExistingCells( true );
		    foreach( $cellIterator as $cell ){ 
		    	$sheet->getColumnDimension( $cell->getColumn() )->setAutoSize( true ); 
		    } 

		    for ($i=3; $i < count($asociados) ; $i++) { 
		    	//Centrar texto
		    	 $archivoExcel->getActiveSheet()->getStyle('A'.$i)->getAlignment()->setHorizontal(PHPExcel_Style_Alignment::HORIZONTAL_CENTER);
		    	 $archivoExcel->getActiveSheet()->getStyle('B'.$i)->getAlignment()->setHorizontal(PHPExcel_Style_Alignment::HORIZONTAL_CENTER);
		    	 $archivoExcel->getActiveSheet()->getStyle('C'.$i)->getAlignment()->setHorizontal(PHPExcel_Style_Alignment::HORIZONTAL_CENTER);
		    	 $archivoExcel->getActiveSheet()->getStyle('D'.$i)->getAlignment()->setHorizontal(PHPExcel_Style_Alignment::HORIZONTAL_CENTER);
		    	 $archivoExcel->getActiveSheet()->getStyle('E'.$i)->getAlignment()->setHorizontal(PHPExcel_Style_Alignment::HORIZONTAL_CENTER);
		    	 $archivoExcel->getActiveSheet()->getStyle('F'.$i)->getAlignment()->setHorizontal(PHPExcel_Style_Alignment::HORIZONTAL_CENTER);
		    	 $archivoExcel->getActiveSheet()->getStyle('G'.$i)->getAlignment()->setHorizontal(PHPExcel_Style_Alignment::HORIZONTAL_CENTER);
		    	 $archivoExcel->getActiveSheet()->getStyle('H'.$i)->getAlignment()->setHorizontal(PHPExcel_Style_Alignment::HORIZONTAL_CENTER);
		    	 $archivoExcel->getActiveSheet()->getStyle('I'.$i)->getAlignment()->setHorizontal(PHPExcel_Style_Alignment::HORIZONTAL_CENTER);
		    	 $archivoExcel->getActiveSheet()->getStyle('J'.$i)->getAlignment()->setHorizontal(PHPExcel_Style_Alignment::HORIZONTAL_CENTER);
		    	 $archivoExcel->getActiveSheet()->getStyle('K'.$i)->getAlignment()->setHorizontal(PHPExcel_Style_Alignment::HORIZONTAL_CENTER);
		    	 $archivoExcel->getActiveSheet()->getStyle('L'.$i)->getAlignment()->setHorizontal(PHPExcel_Style_Alignment::HORIZONTAL_CENTER);
		    	//Cargo todo en el excel
		    	 $archivoExcel->setActiveSheetIndex(0)->setCellValue('A'.$i, $asociados[$i]->idempresa);
			     $archivoExcel->setActiveSheetIndex(0)->setCellValue('B'.$i, $asociados[$i]->denominacion);
			     $archivoExcel->setActiveSheetIndex(0)->setCellValue('C'.$i, $asociados[$i]->importemensual); 
		   		 $archivoExcel->setActiveSheetIndex(0)->setCellValue('D'.$i, $asociados[$i]->cuit);
		   		 $rubro = PDOrubro::buscarDescripcion($asociados[$i]->idrubro);
			     $archivoExcel->setActiveSheetIndex(0)->setCellValue('E'.$i, $rubro['descripcion']);
			     $categoria = PDOcategoria::buscarDescripcion($asociados[$i]->idcategoria);
			     $archivoExcel->setActiveSheetIndex(0)->setCellValue('F'.$i, $categoria['descripcion']);
			     $archivoExcel->setActiveSheetIndex(0)->setCellValue('G'.$i, $asociados[$i]->cantempleados);
			     $archivoExcel->setActiveSheetIndex(0)->setCellValue('H'.$i, $asociados[$i]->fechainicioce);
			     $archivoExcel->setActiveSheetIndex(0)->setCellValue('I'.$i, $asociados[$i]->fechafundacion); 
			     $archivoExcel->setActiveSheetIndex(0)->setCellValue('J'.$i, $asociados[$i]->web);
			     $archivoExcel->setActiveSheetIndex(0)->setCellValue('K'.$i, $asociados[$i]->numusuario);
			     if ($asociados[$i]->activo) {
			    	$archivoExcel->setActiveSheetIndex(0)->setCellValue('L'.$i, 'SI');
			     }else{
					$archivoExcel->setActiveSheetIndex(0)->setCellValue('L'.$i, 'NO');
			     }
			    
		    }
		
		    // Se manda el archivo al navegador web, con el nombre que se indica, en formato 2007
			header('Content-Type: application/vnd.openxmlformats-officedocument.spreadsheetml.sheet');
			header('Content-Disposition: attachment;filename="Asociados CETA.xls"');
			header('Cache-Control: max-age=0');

			$objWriter = PHPExcel_IOFactory::createWriter($archivoExcel, 'Excel2007');
			$objWriter->save('php://output');
			exit;

		}
   		
	}


	private function crearInstanciaMedidro($arrayExcel,$i){
		
		if (empty($arrayExcel[$i][2])) {
			$domicilio = 0;
		}else{
			$domicilio = $arrayExcel[$i][2];
		}
		if (empty($arrayExcel[$i][4])) {
			$telefono = 0;
		}else{
			$telefono = $arrayExcel[$i][4];
		}
		$activo = true;
		$fechadeultimopago = date('Y-m-d');
		$unMedidor = new PDOMedidor(0,$arrayExcel[$i][5],$telefono,$domicilio,$arrayExcel[$i][3],
		$arrayExcel[$i][0],$arrayExcel[$i][1],$activo,$fechadeultimopago);

		return $unMedidor;
	}

	private function insertarRelacion($unMedidor,$ulIdM){
		$unaEmpresa = PDOempresa::buscarMedidor($unMedidor->getNumusuario());
		$relacion = new PDOmedidorempresa(0,$ulIdM,$unaEmpresa[0]->idempresa);
		return $relacion;
	}

	private function actualizarEmpresa($unMedidor,$idemrpesa){
		$unaEmpresaAct = PDOempresa::buscarEmpresa($idemrpesa);	
		if ($unaEmpresaAct->getImportemensual() != $unMedidor->getImportepago()) {
			$unaEmpresaAct->setImportemensual($unMedidor->getImportepago());
			$unaEmpresaAct->guardar();	
			return true;
		}else{
			return false;
		}
		
	}
	/*Si el parametro tip vale 2 es por que el medidor se actualizo si es 1 entonces fue insertar*/
	private function informeActualizacion($actImp,$unMedidor,$tipo,$idempresa){
		
		if($actImp ){
			$unaEmpresaAct = PDOempresa::buscarEmpresa($idempresa);	
			if ($tipo == 1) {
				$aux = array('ModImpo' => 'Si','Empresa'=>'Actualizada','imp' => $unMedidor->getImportepago(),
				'Medidor' => 'Insertado','denominacion'=>$unaEmpresaAct->getDenominacion(),'cuit'=>$unaEmpresaAct->getCuit(),
				'titular'=>$unMedidor->getNomyap());
				return $aux;
			}elseif ($tipo == 2) {
				$aux = array('ModImpo' => 'Si','Empresa'=>'Actualizada','imp' => $unMedidor->getImportepago(),
				'Medidor' => 'Actualizado','denominacion'=>$unaEmpresaAct->getDenominacion(),'cuit'=>$unaEmpresaAct->getCuit(),
				'titular'=>$unMedidor->getNomyap());
				return $aux;
			}
			
		}
		
	}

	private function actualizarMedidor($unMedidor){

		$fechadeultimopago = date('Y-m-d');

		$unMedidorActualizable = PDOMedidor::medidorporNumusuario($unMedidor->getNumusuario());
		$unMedidorActualizable->setFechadeultimopago($fechadeultimopago);
		$unMedidorActualizable->setImportepago($unMedidor->getImportepago());
		return $unMedidorActualizable;

	}

	private function informeErrores($unRegistro,$nroFila){

		$user=$_SESSION['user'];
		$erroNumusuario = 'Correcto';
		$errorNumSuminsitros = 'Correcto' ;
		$errorApeynom = 'Correcto';
		$errorImporte = 'Correcto' ;
		if(empty($unRegistro[0])){
			$erroNumusuario = 'Revisar';
		}
		if(empty($unRegistro[1])){
			$errorNumSuminsitros = 'Revisar';
		}
		if (empty($unRegistro[5])){
			$errorApeynom = 'Revisar';
		}
		if (empty($unRegistro[3])){
			$errorImporte = 'Revisar';
		} 
		$informeErrores = array('user'=>$user,'numusuario' =>$erroNumusuario, 'numsuministros' =>$errorNumSuminsitros, 
		'apeynom' =>$errorApeynom, 'importe' =>$errorImporte,'numerodefila'=>$nroFila );
		return $informeErrores;
	}
	/**/
	public function cargarmedidor(){
		require_once '../vendor/PHPepeExcel/PHPepeExcel.php';
		$user=$_SESSION['user'];
		Twig_Autoloader::register();
	  	$loader = new Twig_Loader_Filesystem('../vista');
	  	$twig = new Twig_Environment($loader, array('cache' => '../cache','debug' => 'false'));

	  	if (isset($_POST['enviarExcel'])) {
	  		$archivoExcel = $_FILES['adjunto']; 
	  		$ruta = $archivoExcel['tmp_name'];
	  		$options = array ('start' => 1, 'limit'=>6);
			$arrayExcel =  PHPepeExcel::xls2array($ruta, array ( ), "medidores", $options );

		/* [x][0]->numusuario
		   [x][1]->numsuministro
		   [x][2]->domicilio
		   [x][3]->importepago
		   [x][4]->telefono
		   [x][5]->apynom
		   //1->por que la primer fila tiene una boludes.
		   //termina 1 antes por lo mismo.*/

		  //¿como saber si falla la carga de algun registro?
		  //Inicio variables.
		  $registroNoInsertado = 0;
		  $medidorInsertado = 0;
		  $medidorActualizado = 0;
		  $empresaActualizada = 0;
		  $relacionInsertada = 0;
		  $medidorSinEmpresaInsertado = 0;
		  $medidorSinEmpresaActualizado = 0;
		  $actualizados = '' ;
		  $fallados = '' ;
		  $totalRegistros = count($arrayExcel) - 2;
		  //Fin de inicio de variables
		  for ($i=1 ; $i < count($arrayExcel) - 1  ; $i++) {
		  	if (self::validarFila($arrayExcel[$i],$i)){
		  		//Genero una instancia de medidor valida.
		  		$unMedidor = self::crearInstanciaMedidro($arrayExcel,$i);
		  		//Averiguo si existe el medidor .
		  		//En este caso el medidor no existe.
		  		if ($unMedidor->validarInsertar()){
		  			$medidorInsertado++;
		  			$ulIdM = $unMedidor->guardar();
		  			//Consulto si existe la empresa para este medidor.
		  			if(PDOempresa::buscarMedidorUno($unMedidor->getNumusuario())){
		  				$unaRelacion = self::insertarRelacion($unMedidor,$ulIdM);
		  				$UltIdR = $unaRelacion->guardar();
		  				$actImp = self::actualizarEmpresa($unMedidor,$unaRelacion->getIdempresa());
		  				if($actImp)$empresaActualizada++;
		  				$actualizados[$i] = self::informeActualizacion($actImp,$unMedidor,1,$unaRelacion->getIdempresa());
		  				$relacionInsertada++;
		  			}else{
		  				$medidorSinEmpresaInsertado++;
		  			}
		  		//Aca existe medidor
		  		}else{
		  			//Traer medidor
		  			$unMedidorAct = self::actualizarMedidor($unMedidor);
		  			$unMedidorAct->guardar();
		  			$medidorActualizado++;
		  			//pregunto si existe la empresa
		  			if(PDOempresa::buscarMedidorUno($unMedidorAct->getNumusuario())){
		  				if (PDOmedidorempresa::buscarMedidorIdArray($unMedidorAct->getIdmedidor())) {
		  					$unaRelacion = PDOmedidorempresa::buscarMedidorIdArray($unMedidorAct->getIdmedidor());
		  					$actImp = self::actualizarEmpresa($unMedidorAct,$unaRelacion['idempresa']);
		  					if($actImp){
		  						$actualizados[$i] = self::informeActualizacion($actImp,$unMedidorAct,2,$unaRelacion['idempresa']);
		  						$empresaActualizada++;
		  					}
		  				}else{
		  					$unaRelacion = self::insertarRelacion($unMedidor,$ulIdM);
		  					$UltIdR = $unaRelacion->guardar();
		  					$relacionInsertada++;
		  					$actImp = self::actualizarEmpresa($unMedidorAct,$unaRelacion->idempresa);
		  					if($actImp){
		  						$actualizados[$i] = self::informeActualizacion($actImp,$unMedidorAct,2,$unaRelacion->idempresa);
		  						$empresaActualizada++;
		  					}
		  				}
		  			}else{
		  				$medidorSinEmpresaActualizado++;
		  			}
		  		}
		  	}else{
		  		$registroNoInsertado++;
		  		$fallados[$i]=self::informeErrores($arrayExcel[$i],$i);
		  	}
		  }
		  $fechaActual = date('Y-m-d h:m:s');
		  $jsonfallados = json_encode($fallados);
		  $jsonactualizados = json_encode($actualizados);
		  $unInforme = new PDOinfmedidorexcel(0,$jsonfallados,$jsonactualizados,$totalRegistros,$fechaActual,$medidorInsertado,
		  $registroNoInsertado,$medidorActualizado,$empresaActualizada,$relacionInsertada,$medidorSinEmpresaInsertado,$medidorSinEmpresaActualizado);
		  $unInforme->guardar();

		  self::listarinfmedidores();
		 
	  	}else{
	  		$template = $twig->loadTemplate('excel/cargarExcelMedidor.html.twig');
			echo $template->render(array('user'=>$user));
	  }
	  	/* Descomentar para borrar todo en tabla medidor */
	  	//PDOMedidor::borrartodoslosmedidoresporquedaaltapajadesdephpmyadmin();

	}

	public function listarinfmedidores(){
	  $user=$_SESSION['user'];
	  Twig_Autoloader::register();
	  $loader = new Twig_Loader_Filesystem('../vista');
	  $twig = new Twig_Environment($loader, array('cache' => '../cache','debug' => 'false'));

	  $unInforme = PDOinfmedidorexcel::listar();

	  $template = $twig->loadTemplate('excel/listadoInformesMedidor.html.twig');
	  echo $template->render(array('user'=>$user,'informes'=>$unInforme));

	
	}

	public function bajainformesexel(){
		$user=$_SESSION['user'];
		Twig_Autoloader::register();
	  $loader = new Twig_Loader_Filesystem('../vista');
	  $twig = new Twig_Environment($loader, array('cache' => '../cache','debug' => 'false'));

	  //borro todo
	  PDOinfmedidorexcel::borrarTodo();
	  //nueva info (todo blanco)
	  $unInforme = PDOinfmedidorexcel::listar();

	  $template = $twig->loadTemplate('excel/listadoInformesMedidor.html.twig');
		echo $template->render(array('user'=>$user,'informes'=>$unInforme));

	
	}

	public function bajainformemedidor(){
		$user=$_SESSION['user'];
	  Twig_Autoloader::register();
	  $loader = new Twig_Loader_Filesystem('../vista');
	  $twig = new Twig_Environment($loader, array('cache' => '../cache','debug' => 'false'));

	  $id = $_POST['id'];
		PDOinfmedidorexcel::borrarID($id);
	  //nueva info (todo blanco)
	  $unInforme = PDOinfmedidorexcel::listar();

	  $template = $twig->loadTemplate('excel/listadoInformesMedidor.html.twig');
		echo $template->render(array('user'=>$user,'informes'=>$unInforme));
	}

	public function verdetalleinformemedidor(){
		$user=$_SESSION['user'];
	  	Twig_Autoloader::register();
	 	$loader = new Twig_Loader_Filesystem('../vista');
	  	$twig = new Twig_Environment($loader, array('cache' => '../cache','debug' => 'false'));

	  	$id = $_POST['id'];
	  	$unInforme = PDOinfmedidorexcel::buscarID($id);

	  	$fallaAux = html_entity_decode($unInforme->fallados);
	  	$fallados = json_decode($fallaAux,true);
		
	  	$acuAux = html_entity_decode($unInforme->actualizados);
	  	$actualizados = json_decode($acuAux,true);

	 	$totalRegistros = $unInforme->totalregistros;
		$medidorInsertado = $unInforme->medidorInsertado;
		$registroNoInsertado = $unInforme->registroNoInsertado;
		$medidorActualizado = $unInforme->medidorActualizado;
		$empresaActualizada = $unInforme->empresaActualizada;
		$relacionInsertada = $unInforme->relacionInsertada;
		$medidorSinEmpresaInsertado = $unInforme->medidorSinEmpresaInsertado;
		$medidorSinEmpresaActualizado = $unInforme->medidorSinEmpresaActualizado;
	  	$fecha = $unInforme->fecha;

	$template = $twig->loadTemplate('excel/detalleInformeMedidor.html.twig');
	echo $template->render(array(
	'user'=>$user,
	'fallados'=>$fallados,
	'actualizados'=>$actualizados,
	'totalRegistros'=>$totalRegistros,
	'fecha'=>$fecha,
	'medidorInsertado'=>$medidorInsertado,
	'registroNoInsertado'=>$registroNoInsertado,
	'medidorActualizado'=>$medidorActualizado,
	'empresaActualizada'=>$empresaActualizada,
	'relacionInsertada'=>$relacionInsertada,
	'medidorSinEmpresaInsertado'=>$medidorSinEmpresaInsertado,
	'medidorSinEmpresaActualizado'=>$medidorSinEmpresaActualizado));
	}

	public static function medidoresdesactualizados(){
		
		$user=$_SESSION['user'];
	  	Twig_Autoloader::register();
	 	$loader = new Twig_Loader_Filesystem('../vista');
	  	$twig = new Twig_Environment($loader, array('cache' => '../cache','debug' => 'false'));
		//Medidores que no fueron actualizados este mes o que hace rato nos e actualizan!
	  	$hoy = date('Y-m-d');
	  	$fechaActual = strtotime($hoy);	
	  	$mesActual = date("m", $fechaActual );
	  	
	  	$medidores = PDOmedidor::listarMedidores();
	  	$medidoresDesactualizados= '';
	  	for ($i=0; $i < count($medidores); $i++) { 
	  		$fechadePago = strtotime($medidores[$i]->fechadeultimopago);	
	  		$mes = date("m", $fechadePago );
	  		
	  		if ($mes != $mesActual) {
	  			$medidoresDesactualizados[$i] = $medidores[$i]; 			
	  		}
	  	}
	  	$fecha =  date('Y-m-d');
	 
	  	//esto es para ver la empresa en el listado 
	  	$arayVista = '';
	  	$medidoresempresa = PDOmedidorempresa::listar();
	  	for ($i=0; $i < count($medidoresempresa); $i++) { 
			$denominasao = PDOempresa::buscarEmpresa($medidoresempresa[$i]->idempresa);
			$arrayUnario = array ('idmedidor'=>$medidoresempresa[$i]->idmedidor,'denominacion'=>$denominasao->getDenominacion());
			$arayVista[$i] = $arrayUnario;
		}
	  	$cantDesactualizados = count($medidoresDesactualizados);
	  	$cant = count($medidores);
	  	$template = $twig->loadTemplate('excel/medidoresDesactualizados.html.twig');
		echo $template->render(array('user'=>$user,'cantDesactualizados'=>$cantDesactualizados,
		'cantMedidores'=>$cant,'fecha'=>$fecha,'medidoresDesactualizados'=>$medidoresDesactualizados,'mes'=>$mesActual,
		'relacion'=>$arayVista));
	}

	

	private function insertarRelacionE($nu,$idempresa){
		$medidor = PDOmedidor::medidorporNumusuario($nu);
		$unaRelacion = new  PDOmedidorempresa(0,$medidor->getIdmedidor(),$idempresa);
		return $unaRelacion;
	}

	public static function cargarempresa(){
		$user=$_SESSION['user'];
		require_once '../vendor/PHPepeExcel/PHPepeExcel.php';
		Twig_Autoloader::register();
	 	$loader = new Twig_Loader_Filesystem('../vista');
	  	$twig = new Twig_Environment($loader, array('cache' => '../cache','debug' => 'false'));

	  	if (isset($_POST['enviarExcel'])) {
	  		$archivoExcel = $_FILES['adjunto']; 
	  		$ruta = $archivoExcel['tmp_name'];
	  		$options = array ('start' => 1, 'limit'=>3);
			$arrayExcel =  PHPepeExcel::xls2array($ruta, array ( ), "empresas", $options );

		/* 
		   [x][0]->Aociado//denominacion
		   [x][1]->Numero de usuario
		   [x][2]->Web
		   													*/
			$empresaExiste = 0;
		    $empresaNoInsertada = 0;
			$totalregistros = count($arrayExcel);
			$rotas = '';

			for ($i=0; $i < $totalregistros; $i++) { 

				if(self::filaEmpresaValida($arrayExcel[$i])){

					$unaEmpresa = self::crearInstanciaEmpresa($arrayExcel[$i]);

					$id = $unaEmpresa->guardar();
				

					if ($arrayExcel[$i][1] != 999999) {
						if(PDOempresa::buscarEmpresaNumeroUsuario($arrayExcel[$i][1])){
							//relacion
							$unaRelacion = self::insertarRelacionE($arrayExcel[$i][1],$id);
							$unaRelacion->guardar();
						}else{
							
							var_dump($arrayExcel[$i][0]);
						}
					}			
				}else{
					$empresaNoInsertada++;
				}
			}
			
		}else{
			$template = $twig->loadTemplate('excel/cargarExcelEmpresa.html.twig');
			echo $template->render(array('user'=>$user));
		} 	
	}

	private function crearInstanciaEmpresa($unRegistro){
   		if (empty($unRegistro[2])) {
   			$web = '';
   		}else{
   			$web = $unRegistro[2];
   		}
   		$fechainicioce = date('Y-m-d');
   		$activo = false;
   		
		$unaEmpresa = new PDOempresa (0,$unRegistro[0],$web,17,'Sin completar',0,24,$fechainicioce,$activo,0,$fechainicioce,0,$unRegistro[1]);
		
		return $unaEmpresa;

	}


	private function filaEmpresaValida($registro){
		$esValido = true;
		if(empty($registro[0])){
			$esValido = false;
		}
		if(empty($registro[1])){
			$esValido = false;
		}
		return $esValido; 

	}

}
?>

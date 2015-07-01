<?php

	require_once '../modelo/conexionDB.php';	 
	require_once '../vendor/PHPepeExcel/PHPepeExcel.php';
	require_once '../modelo/PDO/PDOMedidor.php';
	require_once '../modelo/PDO/PDOempresa.php';
	require_once '../modelo/PDO/PDOinfmedidorexcel.php';

class controladorExcel {

	/* Recibe el registro actual del arrayexel y verifica todos los campos antes de insertarlo en caso de que el 
	registro nose pueda insertar devuelve si esta sano o no. */
	private static function validarFila ($unRegistro,$nroFila){
		$erroNumusuario = 'Correcto';
		$errorNumSuminsitros = 'Correcto' ;
		$errorApeynom = 'Correcto';
		$errorImporte = 'Correcto' ;
		$esValido = true;
		if(empty($unRegistro[0])){
			$erroNumusuario = 'Revisar';
			$esValido = false;
		}
		if(empty($unRegistro[1])){
			$errorNumSuminsitros = 'Revisar';
			$esValido = false;
		}
		if (empty($unRegistro[5])){
			$errorApeynom = 'Revisar';
			$esValido = false;
		}
		if (empty($unRegistro[3])){
			$errorImporte = 'Revisar';
			$esValido = false;
		} 
		return $esValido; 
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
		$informeErrores = array('numusuario' =>$erroNumusuario, 'numsuministros' =>$errorNumSuminsitros, 
		'apeynom' =>$errorApeynom, 'importe' =>$errorImporte,'numerodefila'=>$nroFila );
		return $informeErrores;
	}
	/**/
	public function cargarmedidor(){

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
		  			if(PDOempresa::buscarMedidor($unMedidor->getNumusuario())){
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
		  			$medidorActualizado++;
		  			//pregunto si existe la empresa
		  			if(PDOempresa::buscarMedidor($unMedidorAct->getNumusuario())){
		  				if (empty(PDOmedidorempresa::buscarMedidorIdArray($unMedidorAct->getIdmedidor()))) {
		  					//si esta vacio
		  					$unaRelacion = self::insertarRelacion($unMedidor,$ulIdM);
		  					$UltIdR = $unaRelacion->guardar();
		  					$relacionInsertada++;
		  					$actImp = self::actualizarEmpresa($unMedidorAct,$unaRelacion->idempresa);
		  					if($actImp){
		  						$actualizados[$i] = self::informeActualizacion($actImp,$unMedidorAct,2,$unaRelacion->idempresa);
		  						$empresaActualizada++;
		  					}
		  				}else{
		  					$unaRelacion = PDOmedidorempresa::buscarMedidorId($unMedidorAct->getIdmedidor());
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
			echo $template->render(array());
	  }
	  	/* Descomentar para borrar todo en tabla medidor */
	  	//PDOMedidor::borrartodoslosmedidoresporquedaaltapajadesdephpmyadmin();

	}

	public function listarinfmedidores(){
		Twig_Autoloader::register();
	  $loader = new Twig_Loader_Filesystem('../vista');
	  $twig = new Twig_Environment($loader, array('cache' => '../cache','debug' => 'false'));

	  $unInforme = PDOinfmedidorexcel::listar();

	  $template = $twig->loadTemplate('excel/listadoInformesMedidor.html.twig');
	  echo $template->render(array('informes'=>$unInforme));

	
	}

	public function bajainformesexel(){
		Twig_Autoloader::register();
	  $loader = new Twig_Loader_Filesystem('../vista');
	  $twig = new Twig_Environment($loader, array('cache' => '../cache','debug' => 'false'));

	  //borro todo
	  PDOinfmedidorexcel::borrarTodo();
	  //nueva info (todo blanco)
	  $unInforme = PDOinfmedidorexcel::listar();

	  $template = $twig->loadTemplate('excel/listadoInformesMedidor.html.twig');
		echo $template->render(array('informes'=>$unInforme));

	
	}

	public function bajainformemedidor(){
		Twig_Autoloader::register();
	  $loader = new Twig_Loader_Filesystem('../vista');
	  $twig = new Twig_Environment($loader, array('cache' => '../cache','debug' => 'false'));

		$id = $_POST['id'];
		PDOinfmedidorexcel::borrarID($id);
	  //nueva info (todo blanco)
	  $unInforme = PDOinfmedidorexcel::listar();

	  $template = $twig->loadTemplate('excel/listadoInformesMedidor.html.twig');
		echo $template->render(array('informes'=>$unInforme));
	}

	public function verdetalleinformemedidor(){
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
	

}
?>

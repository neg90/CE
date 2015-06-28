<?php

	require_once '../modelo/conexionDB.php';	 
	require_once '../vendor/PHPepeExcel/PHPepeExcel.php';
	require_once '../modelo/PDO/PDOMedidor.php';
	require_once '../modelo/PDO/PDOempresa.php';
	require_once '../modelo/PDO/PDOinfmedidorexcel.php';

class controladorExcel {
	/* Recibe el registro actual del arrayexel y verifica todos los campos antes de insertarlo en caso de que el 
	registro nose pueda insertar devuelve si esta sano o no. */
	public static function validarRegistro($unRegistro){
		$erroNumusuario = '0';
		$errorNumSuminsitros = '0';
		$errorApeynom = '0';
		$errorImporte = '0';
		$esValido = true;
		if($unRegistro[0] == ''){
			$erroNumusuario = 'El numero de usuario esta en blanco';
			$esValido = false;
		}
		if($unRegistro[1] == ''){
			$errorNumSuminsitros = 'El numero de suministro esta en blanco';
			$esValido = false;
		}
		if ($unRegistro[5] == ''){
			$errorApeynom = 'El nombre del titular del medidor se encuentra en blanco';
			$esValido = false;
		}
		if ($unRegistro[3] == ''){
			$errorImporte = 'El importe se encuentra en blanco';
			$esValido = false;
		} 
		$informeErrores = array('esValido' =>$esValido , 'numusuario' =>$erroNumusuario, 'numsuministros' =>$errorNumSuminsitros, 
		'apeynom' =>$errorApeynom, 'importe' =>$errorImporte );
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
		 	$cantErrores = 0;
		 	$cantInsertados = 0;
		 	$cantActualizados = 0;
		 	$actualizados = '' ;
		 	$informeErrores = '' ;
		 	$totalRegistros = count($arrayExcel) - 2;
			for ($i=1 ; $i < count($arrayExcel) - 1  ; $i++) { 
				// variables generales 
				$activo = true;
				$fechadeultimopago = date('Y-m-d');
				$informeErrores[$i] = controladorExcel::validarRegistro($arrayExcel[$i]);
				/* en lo posible usar $unMedidor */
				if ($informeErrores[$i]['esValido'] == true ) {
					$unMedidor = new PDOMedidor(0,$arrayExcel[$i][5],$arrayExcel[$i][4],$arrayExcel[$i][2],$arrayExcel[$i][3],$arrayExcel[$i][0],
					$arrayExcel[$i][1],$activo,$fechadeultimopago);
					if ($unMedidor->validarInsertar()){
						//no existe	
						$idultiomomedidor = $unMedidor->guardar();
						if (PDOempresa::buscarMedidor($unMedidor->getNumusuario())) {
							//existe empresa para este medidor entonces creamos la relacion
							$unaEmpresa = PDOempresa::buscarMedidor($unMedidor->getNumusuario());
							$relacion = new PDOmedidorempresa(0,$idultiomomedidor,$unaEmpresa[0]->idempresa);	
							$relacion->guardar();	
							$cantInsertados++;		
						}else{
							//luego vemos.
						}
					}else{
						//si existe
						//busco el medidor y lo actualizo
						$unMedidorActualizable = PDOMedidor::medidorporNumusuario($unMedidor->getNumusuario());
						$unMedidorActualizable->setFechadeultimopago($fechadeultimopago);
						$unMedidorActualizable->setImportepago($unMedidor->getImportepago());
						//busco la tabla que relaciona
						$relacion = PDOmedidorempresa::buscarMedidorId($unMedidorActualizable->getIdmedidor());
						//traigo empresa y actualizo importe
						$unaEmpresaActualizable = PDOempresa::buscarEmpresa($relacion->idempresa);
						$unaEmpresaActualizable->setImportemensual($unMedidor->getImportepago());
						$unaEmpresaActualizable->guardar();
						$unMedidorActualizable->guardar();
						$actualizados[$i] = array('nomyape' => $unMedidorActualizable->getNomyap(),
						'numusuario'=>$unMedidorActualizable->getNumusuario(),'fechadeultimopago'=>$unMedidorActualizable->getFechadeultimopago(),
						'importe'=>$unMedidorActualizable->getImportepago());
						$cantActualizados++;
					}
				}else{
					$cantErrores++;
				}
				$fechaActual = date('Y-m-d h:m:s');
				$jsoninforme = json_encode($informeErrores);
				$jsonactualizados = json_encode($actualizados);
				$unInforme = new PDOinfmedidorexcel(0,$jsoninforme,$jsonactualizados,$totalRegistros,$cantInsertados,$fechaActual);
				$unInforme->guardar();
			}
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

		$regAux = html_entity_decode($unInforme->informe);
		$registros = json_decode($regAux,true);
		
		$acuAux = html_entity_decode($unInforme->actualizados);
		$registrosActualizados = json_decode($acuAux);
		var_dump($registrosActualizados);
		$totalActualizados = count($registrosActualizados);
		$totalRegistros = $unInforme->totalregistros;
		$totalInsertados = $unInforme->cantinsertados;
		$fecha = $unInforme->fecha;

	$template = $twig->loadTemplate('excel/detalleInformeMedidor.html.twig');
	echo $template->render(array('registros'=>$registros,'registrosActualizados'=>$registrosActualizados,
	'totalRegistros'=>$totalRegistros,'totalInsertados'=>$totalInsertados,'fecha'=>$fecha,'totalActualizados'=>$totalActualizados));

	}
	

}
?>

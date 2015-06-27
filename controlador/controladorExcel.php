<?php

	require_once '../modelo/conexionDB.php';	 
	include_once '../vendor/PHPepeExcel/PHPepeExcel.php';
	require_once '../modelo/PDO/PDOMedidor.php';
	require_once '../modelo/PDO/PDOempresa.php';

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
				$jsoninforme = json_encode($informeErrores);
				$jsonactualizados = json_encode($actualizados);

			}
			$template = $twig->loadTemplate('excel/aviso.html.twig');
			echo $template->render(array('informe'=>$informeErrores,'cantErrores'=>$cantErrores,'actualizados' => $actualizados,
			'cantInsertados'=>$cantInsertados,'cantActualizados'=>$cantActualizados));

	  	}else{

	  		$template = $twig->loadTemplate('excel/cargarExcelMedidor.html.twig');
				echo $template->render(array());
	  	}
	  	/* Descomentar para borrar todoe n tabla medidor */
	  	//PDOMedidor::borrartodoslosmedidoresporquedaaltapajadesdephpmyadmin();
	  
	
	

	}
	


}
?>

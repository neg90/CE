<?php

	require_once '../modelo/conexionDB.php';	 
	include_once '../vendor/PHPepeExcel/PHPepeExcel.php';
	require_once '../modelo/PDO/PDOMedidor.php';
	require_once '../modelo/PDO/PDOempresa.php';

class controladorExcel {


	/**/
	public function cargarmedidor(){

		Twig_Autoloader::register();
	  	$loader = new Twig_Loader_Filesystem('../vista');
	  	$twig = new Twig_Environment($loader, array('cache' => '../cache','debug' => 'false'));

	  	$tenemosExcel = false;

	  	if (isset($_POST['enviarExcel'])) {
	  		$archivoExcel = $_FILES['adjunto']; 
	  		$ruta = $archivoExcel['tmp_name'];
	  		$options = array ('start' => 1, 'limit'=>6);
			$arrayExcel =  PHPepeExcel::xls2array($ruta, array ( ), "medidores", $options );
			$tenemosExcel = true;
	  	}

		/* [x][0]->numusuario
		   [x][1]->numsuministro
		   [x][2]->domicilio
		   [x][3]->importepago
		   [x][4]->telefono
		   [x][5]->apynom
			//1->por que la primer fila tiene una boludes.
			//termina 1 antes pro lo mismo.*/

		   //¿como saber si falla la carga de algun registro?
		if ($tenemosExcel) {
			for ($i=1 ; $i < count($arrayExcel) -1  ; $i++) { 
				// variables generales 
				$activo = true;
				$fechadeultimopago = date('Y-m-d');
				$unMedidor = new PDOMedidor(0,$arrayExcel[$i][5],$arrayExcel[$i][4],$arrayExcel[$i][2],$arrayExcel[$i][3],$arrayExcel[$i][0],
				$arrayExcel[$i][1],$activo,$fechadeultimopago);
				if ($unMedidor->validarInsertar()){
					//no existe	
					$idultiomomedidor = $unMedidor->guardar();
					if (PDOempresa::buscarMedidor($unMedidor->getNumsuministro())) {
						//existe empresa para este medidor entonces creamos la relacion
						$unaEmpresa = PDOempresa::buscarMedidor($unMedidor->getNumsuministro());
						var_dump($unaEmpresa[0]->idempresa());
						$relacion = new PDOmedidorempresa(0,$idultiomomedidor,$unaEmpresa[0]->idempresa());	
						$relacion->guardar();			
					}else{
						//luego vemos.
					}
				}else{
					//si existe

				}
	
			}
	  	
		}
	

		$template = $twig->loadTemplate('excel/cargarExcelMedidor.html.twig');
		echo $template->render(array());

	}
	


}
?>

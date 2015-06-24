<?php

	require_once '../modelo/conexionDB.php';	 
	include_once '../vendor/PHPepeExcel/PHPepeExcel.php';
	require_once '../modelo/PDO/PDOMedidor.php';

class controladorExcel {


	public function cargarmedidor(){

		Twig_Autoloader::register();
	  	$loader = new Twig_Loader_Filesystem('../vista');
	  	$twig = new Twig_Environment($loader, array('cache' => '../cache','debug' => 'false'));

	  	if (isset($_POST['enviarExcel'])) {

	  		$archivoExcel = $_FILES['adjunto']; 
	  		$ruta = $archivoExcel['tmp_name'];
	  		$options = array ('start' => 1, 'limit'=>6);
			$arrayExcel =  PHPepeExcel::xls2array($ruta, array ( ), 
			"medidores", $options );
	  	}
		//1->por que la primer fila tiene una boludes.
		//termina 1 antes pro lo mismo.
		for ($i=1 ; $i < count($arrayExcel) -1  ; $i++) { 
						
		}
	  	

		$template = $twig->loadTemplate('excel/cargarExcelMedidor.html.twig');
		echo $template->render(array());

	}
	


}
?>

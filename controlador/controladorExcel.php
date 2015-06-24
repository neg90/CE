<?php

	require_once '../modelo/conexionDB.php';	 
	include_once '../vendor/PHPepeExcel/PHPepeExcel.php';
	

class controladorExcel {


	public function cargar(){

		Twig_Autoloader::register();
	  	$loader = new Twig_Loader_Filesystem('../vista');
	  	$twig = new Twig_Environment($loader, array('cache' => '../cache','debug' => 'false'));

	  	if (isset($_POST['enviarExcel'])) {
	  		$archivoExcel = $_FILES['adjunto']; 
	  		$ruta = $archivoExcel['tmp_name'];
	  		$options = array ('start' => 1, 'limit'=>6);
			$arrayExcel =  PHPepeExcel::xls2array($ruta, array ("numusuario", "numsuministro","domicilio" ,"importepago" ,"telefono", "apynom" ), 
			"medidores", $options );
	  	}
	


		$template = $twig->loadTemplate('excel/cargarExcel.html.twig');
		echo $template->render(array());

	}
	


}
?>

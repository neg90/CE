<?php

	require_once '../modelo/conexionDB.php';
	require_once '../modelo/PDO/PDOabonado.php';
	require_once '../modelo/PDO/PDOempresa.php';
	require_once '../modelo/PDO/PDOabonadoempresa.php';
	require_once '../vendor/twig/twig/lib/Twig/Autoloader.php';

	
//Valores para la variable aviso :
	//1->Inserto con exito
	//2->Ya existe un contacto igual
	//0->No mostrar mensaje, es solo carga del formulario.
class controladorAbonado {


	public static function filtros(){
		$user=$_SESSION['user'];

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
		}

		if (isset($_POST['datoCriterio'])){
			$criterio=htmlEntities($_POST['datoCriterio']);
		}


		Twig_Autoloader::register();
	  	$loader = new Twig_Loader_Filesystem('../vista');
	  	$twig = new Twig_Environment($loader, array('cache' => '../cache','debug' => 'false')); 

		switch($tipoFiltro){
			case 'numabonado':
				$abonado=PDOabonado::filtroNumabonado($datoFiltro);
				break;

			case 'empresa':
				$abonado=PDOabonado::filtroEmpresa($datoFiltro);
				break;

			case 'importe':
				$abonado=PDOabonado::filtroImporte($criterio,$datoFiltro);
				break;

			case 'activo':
				$abonado=PDOabonado::filtroActivo($datoFiltro);
				break;
		}

		$filtroActivo=1;

		$abonadoempresas = PDOabonadoempresa::listar();
		$arayVista = '';
		for ($i=0; $i < count($abonadoempresas); $i++) { 
			$denominasao = PDOempresa::buscarEmpresa($abonadoempresas[$i]->idempresa);
			$arrayUnario = array ('numabonado'=>$abonadoempresas[$i]->numabonado,'denominacion'=>$denominasao->getDenominacion());
			$arayVista[$i] = $arrayUnario;
		}

		$empresas = PDOempresa::listar();

		$template = $twig->loadTemplate('abonado/listarAbonados.html.twig');
		echo $template->render(array('user'=>$user,'abonado'=>$abonado,
		'empresas'=>$empresas,'relacion'=>$arayVista,'abonado'=>$abonado,'user'=>$user, 'filtroActivo'=>$filtroActivo, 'tipoFiltro'=>$tipoFiltro,'datoFiltro'=>$datoFiltro));

		/*
		
		$empresas = PDOempresa::listar();
		$template = $twig->loadTemplate('abonado/listarAbonados.html.twig');
		echo $template->render(array('pag'=>$pag,'paginaBaja'=>$paginaBaja,'actual'=>$actual,'cantMostrar'=>$cantMostrar,
		'sig'=>$sig,'ant'=>$ant,'cantidadPaginas'=>$cantPaginas,'user'=>$user,'abonado'=>$abonado,
		'empresas'=>$empresas,'relacion'=>$arayVista));

		*/
	}


	static function alta($idempresa){
		$user=$_SESSION['user'];
		
		Twig_Autoloader::register();
	  	$loader = new Twig_Loader_Filesystem('../vista');
	  	$twig = new Twig_Environment($loader, array('cache' => '../cache','debug' => 'false'));

	  	$untimoID = null;

		if (isset($_POST['guardarAbonado'])) {
			$aviso=2;

			$fechadeultimopago = htmlEntities($_POST['fechadeultimopago']);
			$importe = htmlEntities($_POST['importe']);
			$activo = true;

			$unAbonado = new PDOabonado(0,$importe,$fechadeultimopago,$activo);

			$untimoID = $unAbonado->guardar();
			$relacion = new PDOabonadoempresa(0,$untimoID,$idempresa);
			$relacion->guardar();

			$unaEmpresa = PDOempresa::buscarEmpresa($idempresa);
			$unaEmpresa->setImportemensual($importe);
			$unaEmpresa->guardar();

			$aviso=1;
			
			//en un futuro no muy lejano deberia llevarlo al listado mostrando solo este y 
			//con un aviso de que se cargo correctamente,minimamente que se cargo correctamente
			header('Location:privado.php?c=abonado&a=eleccion&id='.$idempresa);

		}elseif ($untimoID == null) {
			$aviso=0;
			$template = $twig->loadTemplate('abonado/altaAbonado.html.twig');
			echo $template->render(array('user'=>$user,'aviso'=>$aviso,'idempresa'=>$idempresa));
		}
	}

	/*static function altaNormal(){
		$user=$_SESSION['user'];
		
		Twig_Autoloader::register();
	  	$loader = new Twig_Loader_Filesystem('../vista');
	  	$twig = new Twig_Environment($loader, array('cache' => '../cache','debug' => 'false'));
		$aviso=0;
		$modo = 'altaNormal';
		if (isset($_POST['guardarAbonado'])) {
			$aviso=2;

			$fechadeultimopago = htmlEntities($_POST['fechadeultimopago']);
			$importe = htmlEntities($_POST['importe']);
			$activo = true;
			$unAbonado = new PDOabonado(0,$importe,$fechadeultimopago,$activo);
			$unAbonado->guardar();
			$aviso=1;
			$template = $twig->loadTemplate('abonado/altaAbonado.html.twig');
			echo $template->render(array('user'=>$user,'aviso'=>$aviso,'modo'=>$modo));

		}else{
			$template = $twig->loadTemplate('abonado/altaAbonado.html.twig');
			echo $template->render(array('user'=>$user,'aviso'=>$aviso,'modo'=>$modo));
		}
		
	}*/

	public static function eleccion($idempresa){
		$user=$_SESSION['user'];
		Twig_Autoloader::register();
	  	$loader = new Twig_Loader_Filesystem('../vista');
	  	$twig = new Twig_Environment($loader, array('cache' => '../cache','debug' => 'false'));


	  	if (isset($_POST['nuevoSocio'])) {

	  		header('Location:privado.php?c=contacto&a=altaconid&id='.$idempresa);	

	  	}

	  	$template = $twig->loadTemplate('abonado/eleccion.html.twig');
		echo $template->render(array('user'=>$user,'idempresa'=>$idempresa));
	}

	static function modificar(){
		$user=$_SESSION['user'];
		Twig_Autoloader::register();
	  	$loader = new Twig_Loader_Filesystem('../vista');
	  	$twig = new Twig_Environment($loader, array('cache' => '../cache','debug' => 'false'));

		$numabonado = htmlEntities($_POST['numabonado']);

		if (isset($_POST['guardarAbonado'])){
			$aviso=2;
			if (PDOabonado::buscarAbonado($numabonado)){

				$importe = htmlEntities($_POST['importe']);
				$fechadeultimopago = htmlEntities($_POST['fechadeultimopago']);

				if ( isset($_POST['activo'])) {
					$activo = true;
				}else{
					$activo = false;
				}

				$unAbonado = PDOabonado::buscarAbonado($numabonado);

				$unAbonado->setImporte($importe);
				///modifico importe de la empresa cuando cambia el importe del abonado.
				$buscarIDEMPRESA = PDOabonadoempresa::buscarAbonadoId($numabonado);
				$unaEmpresa = PDOempresa::buscarEmpresa($buscarIDEMPRESA->idempresa);
				$unaEmpresa->setImportemensual($importe);
				$unaEmpresa->guardar();
				$unAbonado->setFechadeultimopago($fechadeultimopago);
				$unAbonado->setActivo($activo);
				$unAbonado->guardar();
				$aviso=1;

			}else{
				//No se encontro el contacto para modificar
				$aviso = 3;
			}

			$unAbonado = PDOabonado::buscarAbonado($numabonado);

			$template = $twig->loadTemplate('abonado/modificarAbonado.html.twig');
			echo $template->render(array('aviso'=>$aviso,'abonado'=>$unAbonado,'numabonado'=>$numabonado));

		}else{
			$unAbonado = PDOabonado::buscarAbonado($numabonado);
			$aviso=0;
			$template = $twig->loadTemplate('abonado/modificarAbonado.html.twig');
			echo $template->render(array('user'=>$user,'aviso'=>$aviso,'numabonado'=>$numabonado,'abonado'=>$unAbonado));
		}
	}


	static function listar($pag){
		$user=$_SESSION['user'];
		Twig_Autoloader::register();
	  	$loader = new Twig_Loader_Filesystem('../vista');
	  	$twig = new Twig_Environment($loader, array('cache' => '../cache','debug' => 'false')); 
		$cantResultados = 25;
		
		$abonadoempresas = PDOabonadoempresa::listar();

		if (intval($pag) == 1) {
			$valor = 0;
		}else{
			$valor = intval($pag-1) * $cantResultados ;
		}
		$cantPaginas = ceil(count(PDOabonado::listar()) / $cantResultados);

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
		$abonado = PDOabonado::listarPaginacion($valor,$cantResultados);
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
		for ($i=0; $i < count($abonadoempresas); $i++) { 
			$denominasao = PDOempresa::buscarEmpresa($abonadoempresas[$i]->idempresa);
			$arrayUnario = array ('numabonado'=>$abonadoempresas[$i]->numabonado,'denominacion'=>$denominasao->getDenominacion());
			$arayVista[$i] = $arrayUnario;
		}
		
		$empresas = PDOempresa::listar();
		$template = $twig->loadTemplate('abonado/listarAbonados.html.twig');
		echo $template->render(array('pag'=>$pag,'paginaBaja'=>$paginaBaja,'actual'=>$actual,'cantMostrar'=>$cantMostrar,
		'sig'=>$sig,'ant'=>$ant,'cantidadPaginas'=>$cantPaginas,'user'=>$user,'abonado'=>$abonado,
		'empresas'=>$empresas,'relacion'=>$arayVista));

	}
	
		
	public function baja($pag){
		$user=$_SESSION['user'];
		Twig_Autoloader::register();
	  	$loader = new Twig_Loader_Filesystem('../vista');
	  	$twig = new Twig_Environment($loader, array('cache' => '../cache','debug' => 'false')); 
		
	  	$numabonado = htmlentities($_POST['numabonado']);

		
		if(PDOabonado::buscarAbonado($numabonado)){
			PDOabonado::baja($numabonado);
			$aviso = 1;
		}else{
			$aviso = 2;
		}
		$cantResultados = 25;
		
		$abonadoempresas = PDOabonadoempresa::listar();

		if (intval($pag) == 1) {
			$valor = 0;
		}else{
			$valor = intval($pag-1) * $cantResultados ;
		}
		$cantPaginas = ceil(count(PDOabonado::listar()) / $cantResultados);

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
		$abonado = PDOabonado::listarPaginacion($valor,$cantResultados);
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

		for ($i=0; $i < count($abonadoempresas); $i++) { 
			$denominasao = PDOempresa::buscarEmpresa($abonadoempresas[$i]->idempresa);
			$arrayUnario = array ('pag'=>$pag,'numabonado'=>$abonadoempresas[$i]->numabonado,'denominacion'=>$denominasao->getDenominacion());
			$arayVista[$i] = $arrayUnario;
		}

		
		$empresas = PDOempresa::listar();
		
		$template = $twig->loadTemplate('abonado/listarAbonados.html.twig');
		echo $template->render(array('paginaBaja'=>$paginaBaja,'actual'=>$actual,'cantMostrar'=>$cantMostrar,
		'sig'=>$sig,'ant'=>$ant,'cantidadPaginas'=>$cantPaginas,'user'=>$user,'empresas'=>$empresas,'abonado'=>$abonado,'aviso'=>$aviso,'relacion'=>$arayVista));
      
   }

}
?>

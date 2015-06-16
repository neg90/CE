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
	require_once '../modelo/PDO/PDOMedidor.php';
	require_once '../vendor/twig/twig/lib/Twig/Autoloader.php';

	
//Valores para la variable aviso :
//1->Inserto con exito
//2->Ya existe un contacto igual
//0->No mostrar mensaje, es solo carga del formulario.
class controladorEmpresa {

	public static function listar(){

		Twig_Autoloader::register();
	  	$loader = new Twig_Loader_Filesystem('../vista');
	  	$twig = new Twig_Environment($loader, array('cache' => '../cache','debug' => 'false')); 
		$categorias = PDOcategoria::listar();
		$empresas = PDOempresa::listar();
		$rubros = PDOrubro::listar();
		$totalEmpresas = intval(PDOempresa::contarEmpresas());
		$contactos = PDOContacto::listar();

		$medidores = PDOMedidor::listarMedidores();

		for ($i=0; $i < $totalEmpresas + 1 ; $i++) { 
			$contactosRelacionados = PDOcontactoempresa::buscarContactosRelacionados($empresas[$i]->idempresa);
			$medidordeEmpresa = PDOmedidorempresa::buscarMedidorRelacionados($empresas[$i]->idempresa);
			$arrayUnario = array('idempresa'=>$empresas[$i]->idempresa,'contactos'=>$contactosRelacionados,'medidor'=>$medidordeEmpresa);
			$arrayVista[$i] = $arrayUnario;
		}
		
		$template = $twig->loadTemplate('empresa/listarEmpresa.html.twig');
		echo $template->render(array('empresas'=>$empresas,'rubros'=>$rubros,'categorias'=>$categorias,'contactos'=>$contactos,
		'medidores'=>$medidores,'arrayVista'=>$arrayVista));

	}

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

		Twig_Autoloader::register();
	  	$loader = new Twig_Loader_Filesystem('../vista');
	  	$twig = new Twig_Environment($loader, array('cache' => '../cache','debug' => 'false'));
	  	$modo = 'alta';
	  	$aviso = 0;

	  	//Traigo contactos !! :D
	  	$unosContactos = PDOcontacto::listar();
	  	$unosMedidores = PDOMedidor::listarMedidores();
	  	$unasCategorias = PDOcategoria::listar();
	  	$unosRubros = PDOrubro::listar();

		if (isset($_POST['guardarEmpresa'])){
			
			$denominacion = htmlEntities($_POST['denominacion']);
			$cantempleados = htmlEntities($_POST['cantempleados']);
			$nrosocio = htmlEntities($_POST['nrosocio']);
			$importemensual = htmlEntities($_POST['importemensual']);
			$cuit = htmlEntities($_POST['cuit']);
			$web = htmlEntities($_POST['web']);
			$fechainicioce = htmlEntities($_POST['fechainicioce']);
			$fechafundacion = htmlEntities($_POST['fechafundacion']);
			$rubroAJAX = htmlEntities($_POST['rubro']);
			$categoriaAJAX = htmlEntities($_POST['categoria']);
			$detactividad = htmlEntities($_POST['detactividad']);

			if (isset($_POST['activo'])) {
				$activo = true;
			}else{
				$activo = false;
			}
		
			//Veriifico que no exista uni identico, soluciona usuario soquete, f5 y reload de la pagina.
			//id 0 pero se guarda incremental en el PDO
			$unaEmpresa = new PDOempresa(0,$denominacion,$web,$rubroAJAX,$detactividad,$cantempleados,$categoriaAJAX,$fechainicioce,
			$activo,$cuit,$fechafundacion,$importemensual,$nrosocio);

			if($unaEmpresa->validarInsertar()){
				$unaEmpresa->guardar();
				$aviso=1;
				//Todo salio bien y se guardo traigo el objeto y empiezo a llenar tablas relacionadas.
				$unaEmpresa = PDOempresa::BuscarID($denominacion,$web,$rubroAJAX,$detactividad,$cantempleados,$categoriaAJAX,$fechainicioce,
				$activo,$cuit,$fechafundacion,$importemensual,$nrosocio);

				//alta socio
				controladorEmpresa::validarMedidores($unaEmpresa->getIdempresa());

				//alta medidor
				$idMedidor = htmlentities($_POST['medidor']);
				
				if( $idMedidor == '-1'){
					//ir a crear uno nuevo.
				}else{
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
				$aviso=2;
			}
			
			$template = $twig->loadTemplate('empresa/altaEmpresa.html.twig');
			echo $template->render(array('aviso'=>$aviso,'modo'=>$modo,'contactos'=>$unosContactos,'medidores'=>$unosMedidores,
			'rubros'=>$unosRubros,'categorias'=>$unasCategorias));

		}else{
			$aviso=0;
			$template = $twig->loadTemplate('empresa/altaEmpresa.html.twig');
			echo $template->render(array('aviso'=>$aviso,'modo'=>$modo,'contactos'=>$unosContactos,'medidores'=>$unosMedidores,
			'rubros'=>$unosRubros,'categorias'=>$unasCategorias));
		}
		
	}

	static function modificar(){

		Twig_Autoloader::register();
	  	$loader = new Twig_Loader_Filesystem('../vista');
	  	$twig = new Twig_Environment($loader, array('cache' => '../cache','debug' => 'false'));
	  	$modo = 'modificar';
	  	$aviso = 0;

		$idempresa = $_POST['idempresa'];
	  	//Traigo contactos,medidores,categorias y rubros !! :D
	  	$unosContactos = PDOcontacto::listar();
	  	$unosMedidores = PDOMedidor::listarMedidores();
	  	$unasCategorias = PDOcategoria::listar();
	  	$unosRubros = PDOrubro::listar();
	   
	  	//busco la empresa 
	  	
	  	


		if (isset($_POST['guardarEmpresa'])){
			
			$denominacion = htmlEntities($_POST['denominacion']);
			$cantempleados = htmlEntities($_POST['cantempleados']);
			$nrosocio = htmlEntities($_POST['nrosocio']);
			$importemensual = htmlEntities($_POST['importemensual']);
			$cuit = htmlEntities($_POST['cuit']);
			$web = htmlEntities($_POST['web']);
			$fechainicioce = htmlEntities($_POST['fechainicioce']);
			$fechafundacion = htmlEntities($_POST['fechafundacion']);
			$rubroAJAX = htmlEntities($_POST['rubro']);
			$categoriaAJAX = htmlEntities($_POST['categoria']);
			$detactividad = htmlEntities($_POST['detactividad']);

			if (isset($_POST['activo'])) {
				$activo = true;
			}else{
				$activo = false;
			}
		
			//Veriifico que no exista uni identico, soluciona usuario soquete, f5 y reload de la pagina.
			//id 0 pero se guarda incremental en el PDO
			$unaEmpresa = new PDOempresa(0,$denominacion,$web,$rubroAJAX,$detactividad,$cantempleados,$categoriaAJAX,$fechainicioce,
			$activo,$cuit,$fechafundacion,$importemensual,$nrosocio);

			if($unaEmpresa->validarInsertar()){
				$unaEmpresa->guardar();
				$aviso=1;
				$unaEmpresa = PDOempresa::buscarEmpresa($idempresa);
				//Todo salio bien y se guardo traigo el objeto y empiezo a llenar tablas relacionadas.
				$unaEmpresa = PDOempresa::BuscarID($denominacion,$web,$rubroAJAX,$detactividad,$cantempleados,$categoriaAJAX,$fechainicioce,
				$activo,$cuit,$fechafundacion,$importemensual,$nrosocio);

				//alta socio
				controladorEmpresa::validarMedidores($unaEmpresa->getIdempresa());

				//alta medidor
				$idMedidor = htmlentities($_POST['medidor']);
				
				if( $idMedidor == '-1'){
					//ir a crear uno nuevo.
				}else{
					$unMedidor = new PDOmedidorempresa(0,$idMedidor,$unaEmpresa->getIdempresa());
					$unMedidor->guardar(); 
				}

			}else{
				$aviso=2;
			}
			
			$template = $twig->loadTemplate('empresa/modificarEmpresa.html.twig');
			echo $template->render(array('aviso'=>$aviso,'modo'=>$modo,'contactos'=>$unosContactos,'medidores'=>$unosMedidores,
			'rubros'=>$unosRubros,'categorias'=>$unasCategorias,'unaEmpresa'=>$	$unaEmpresa));

		}else{
			$unaEmpresa = PDOempresa::buscarEmpresa($idempresa);
			$aviso=0;
			$template = $twig->loadTemplate('empresa/modificarEmpresa.html.twig');
			echo $template->render(array('aviso'=>$aviso,'modo'=>$modo,'contactos'=>$unosContactos,'medidores'=>$unosMedidores,
			'rubros'=>$unosRubros,'categorias'=>$unasCategorias,'unaEmpresa'=>$unaEmpresa));
		}
		
	}

	public function modificarTelefonos(){
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
			echo $template->render(array ('idempresa'=>$idempresa,'telefonosRelacionados'=>$telefonosRelacionados,'aviso'=>$aviso));

	  	}
	}

	public function modificarCorreos(){
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
			echo $template->render(array('idempresa'=>$idempresa,'correosRelacionados'=>$correosRelacionados,'aviso'=>$aviso));
	  	}else{
	  		$template = $twig->loadTemplate('empresa/modificarCorreosEmpresa.html.twig');
			echo $template->render(array ('idempresa'=>$idempresa,'correosRelacionados'=>$correosRelacionados,'aviso'=>$aviso));
	  	}
	}

	public function modificarContactos (){
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
			'idempresa'=>$idempresa));
	  	}else{
	  		$template = $twig->loadTemplate('empresa/modificarContactosEmpresa.html.twig');
			echo $template->render(array('contactosRelacionados'=>$unosContactosRelacionados,'contactos'=>$unosContactos,
			'idempresa'=>$idempresa));
	  	}
	}

	public function modificarDomicilios(){
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
			echo $template->render(array('idempresa'=>$idempresa,'domiciliosRelacionados'=>$domiciliosRelacionados,'aviso'=>$aviso));
	  	}else{
	  		$template = $twig->loadTemplate('empresa/modificarDomiciliosEmpresa.html.twig');
			echo $template->render(array ('idempresa'=>$idempresa,'domiciliosRelacionados'=>$domiciliosRelacionados,'aviso'=>$aviso));

	  	}
	}
		
	public function baja(){

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

		$empresas = PDOempresa::listar();
		
		$rubros = PDOrubro::listar();

		$categorias = PDOcategoria::listar();


		$template = $twig->loadTemplate('empresa/listarEmpresa.html.twig');
		echo $template->render(array('empresas'=>$empresas,'rubros'=>$rubros,'categorias'=>$categorias,'aviso'=>$aviso));

   }

}
?>

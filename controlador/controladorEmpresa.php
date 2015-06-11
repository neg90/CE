<?php

	require_once '../modelo/conexionDB.php';
	require_once '../modelo/PDO/PDOempresa.php';

	require_once '../vendor/twig/twig/lib/Twig/Autoloader.php';

	
//Valores para la variable aviso :
//1->Inserto con exito
//2->Ya existe un contacto igual
//0->No mostrar mensaje, es solo carga del formulario.
class controladorEmpresa {

	public static function laCuestionDelTelefono(){
		for ($i=1; $i < 12; $i++) { 
			$auxStrtel = 'telefono' . $i ;
			$auxStrdesc = 'caractel' . $i;
			if(isset($_POST["auxStrtel"])){
				$auxStrtel = htmlentities($_POST['auxStrtel']);
				$auxStrdesc = htmlentities($_POST['auxStrdesc']);
				//cargar telefono en tabla intermedia
			}
		}
	}

	public static function laCuestionDelDomicilio(){
		for ($i=1; $i < 12; $i++) { 
			$auxStrtel = 'domicilio' . $i ;
			$auxStrdesc = 'caracdom' . $i;
			if(isset($_POST["auxStrtel"])){
				$auxStrtel = htmlentities($_POST['auxStrtel']);
				$auxStrdesc = htmlentities($_POST['auxStrdesc']);
				//cargar telefono en tabla intermedia
			}
		}
	}

	public static function laCuestionDelCorreo(){
		for ($i=1; $i < 12; $i++) { 
			$auxStrtel = 'correo' . $i ;
			$auxStrdesc = 'caraccorreo' . $i;
			if(isset($_POST["auxStrtel"])){
				$auxStrtel = htmlentities($_POST['auxStrtel']);
				$auxStrdesc = htmlentities($_POST['auxStrdesc']);
				//cargar telefono en tabla intermedia
			}
		}
	}

	public static function ejecutarTablasAux(){
		controladorEMpresa::laCuestionDelCorreo();
		controladorEMpresa::laCuestionDelDomicilio();
		controladorEMpresa::laCuestionDelTelefono();
	}

	static function alta(){
		Twig_Autoloader::register();
	  	$loader = new Twig_Loader_Filesystem('../vista');
	  	$twig = new Twig_Environment($loader, array('cache' => '../cache','debug' => 'false'));
	  	$modo = 'alta';
	  	$aviso = 0;

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
			
			//Telefonos
			$telefono0 = htmlEntities($_POST['telefono0']);
			$caractel0 = htmlEntities($_POST['caractel0']);

			//domicilio
			$domicilio0 = htmlEntities($_POST['domicilio0']);
			$caracdom0 = htmlEntities($_POST['caracdom0']);

			//Correo
			$correo0 = htmlEntities($_POST['correo0']);
			$caraccorreo0 = htmlEntities($_POST['caraccorreo0']);

			controladorEMpresa::ejecutarTablasAux();

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
				
			}else{
				$aviso=2;
			}
			
			$template = $twig->loadTemplate('empresa/altaEmpresa.html.twig');
			echo $template->render(array('aviso'=>$aviso,'modo'=>$modo));

		}else{
			$aviso=0;
			$template = $twig->loadTemplate('empresa/altaEmpresa.html.twig');
			echo $template->render(array('aviso'=>$aviso,'modo'=>$modo));
		}
		
	}

	static function modificar(){
		
	}


	static function listar(){

		

	}
		
	public function baja(){

		
   }

}
?>

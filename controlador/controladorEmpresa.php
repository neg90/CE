<?php

	require_once '../modelo/conexionDB.php';
	require_once '../modelo/PDO/PDOempresa.php';
	require_once '../modelo/PDO/PDOtelefonoempresa.php';
	require_once '../modelo/PDO/PDOdomicilioempresa.php';
	require_once '../modelo/PDO/PDOcorreoempresa.php';	
	require_once '../modelo/PDO/PDOContacto.php';
	require_once '../modelo/PDO/PDOmedidorempresa.php';
	require_once '../modelo/PDO/PDOMedidor.php';
	require_once '../vendor/twig/twig/lib/Twig/Autoloader.php';

	
//Valores para la variable aviso :
//1->Inserto con exito
//2->Ya existe un contacto igual
//0->No mostrar mensaje, es solo carga del formulario.
class controladorEmpresa {

	private static function laCuestionDelTelefono ($idempresa){
		for ($i=1; $i < 12; $i++) { 
			$auxStrtel = 'telefono' . $i;
			$auxStrdesc = 'caractel' . $i .'/';
			if(isset($_POST[$auxStrtel]) ){
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

	private static function laCuestionDelDomicilio ($idempresa){
		for ($i=1; $i < 12; $i++) { 
			$auxStrDom = 'domicilio' . $i;
			$auxStrdesc = 'caracdom' . $i .'/';
			if (isset($_POST[$auxStrDom])){
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

	private static function laCuestionDelCorreo ($idempresa){
		for ($i=1; $i < 12; $i++) { 
			$auxStrCor = 'correo' . $i ;
			$auxStrdesc = 'caraccorreo' . $i .'/';
			if (isset($_POST[$auxStrCor])){
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

	static function alta(){

		Twig_Autoloader::register();
	  	$loader = new Twig_Loader_Filesystem('../vista');
	  	$twig = new Twig_Environment($loader, array('cache' => '../cache','debug' => 'false'));
	  	$modo = 'alta';
	  	$aviso = 0;

	  	//Traigo contactos !! :D
	  	$unosContactos = PDOcontacto::listar();
	  	$unosMedidores = PDOMedidor::listarMedidores();

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

				//alta medidor
				$idMedidor = htmlentities($_POST['medidor']);
				
				if( $idMedidor == '-1'){
					//ir a crear uno nuevo.
				}else{
					$unMedidor = new PDOmedidorempresa(0,$idMedidor,$unaEmpresa->getIdempresa());
					$unMedidor->guardar(); 
				}

				//Telefonos 
				$telefono0 = htmlEntities($_POST['telefono0']);
				$caractel0 = htmlEntities($_POST['caractel0']);
			
				//alta telefono base.
				$unTelefono = new PDOtelefonoempresa (0,$unaEmpresa->getIdempresa(),$telefono0,$caractel0);
				
				//validado con ajax
				$unTelefono->guardar();

				//Alta telefonos extra
				controladorEmpresa::laCuestionDelTelefono($unaEmpresa->getIdempresa());

				//domicilio
				$domicilio0 = htmlEntities($_POST['domicilio0']);
				$caracdom0 = htmlEntities($_POST['caracdom0']);

				//alta domicilio base.
				$unDomicilio = new PDOdomicilioempresa (0,$unaEmpresa->getIdempresa(),$domicilio0,$caracdom0);
				$unDomicilio->guardar();

				//alta domicilios extra
				controladorEmpresa::laCuestionDelDomicilio($unaEmpresa->getIdempresa());

				//Correo
				$correo0 = htmlEntities($_POST['correo0']);
				$caraccorreo0 = htmlEntities($_POST['caraccorreo0']);

				//alta correo base.
				$unCorreo = new PDOcorreoempresa (0,$unaEmpresa->getIdempresa(),$correo0,$caraccorreo0);
				$unCorreo->guardar();

				//alta domicilios extra
				controladorEmpresa::laCuestionDelCorreo($unaEmpresa->getIdempresa());

			}else{
				$aviso=2;
			}
			
			$template = $twig->loadTemplate('empresa/altaEmpresa.html.twig');
			echo $template->render(array('aviso'=>$aviso,'modo'=>$modo,'contactos'=>$unosContactos,'medidores'=>$unosMedidores));

		}else{
			$aviso=0;
			$template = $twig->loadTemplate('empresa/altaEmpresa.html.twig');
			echo $template->render(array('aviso'=>$aviso,'modo'=>$modo,'contactos'=>$unosContactos,'medidores'=>$unosMedidores));
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

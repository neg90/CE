<?php

	require_once '../modelo/conexionDB.php';
	require_once '../modelo/PDO/PDOabonado.php';
	require_once '../modelo/PDO/PDOempresa.php';
	require_once '../vendor/twig/twig/lib/Twig/Autoloader.php';

	
//Valores para la variable aviso :
	//1->Inserto con exito
	//2->Ya existe un contacto igual
	//0->No mostrar mensaje, es solo carga del formulario.
class controladorAbonado {

	static function alta(){
		Twig_Autoloader::register();
	  	$loader = new Twig_Loader_Filesystem('../vista');
	  	$twig = new Twig_Environment($loader, array('cache' => '../cache','debug' => 'false'));

		
		if (isset($_POST['guardarAbonado'])){
			$aviso=2;
			$fechadeultimopago = htmlEntities($_POST['fechadeultimopago']);
			$importe = htmlEntities($_POST['importe']);
			$activo = true;
			$unAbonado = new PDOabonado(0,$importe,$fechadeultimopago,$activo);

			if ($unAbonado->validarInsertar()){
				$unAbonado->guardar();
				$aviso=1;
			}else{
				$aviso=2;
			}
			
			$template = $twig->loadTemplate('abonado/altaAbonado.html.twig');
			echo $template->render(array('aviso'=>$aviso));

		}else{
			$aviso=0;
			$template = $twig->loadTemplate('abonado/altaAbonado.html.twig');
			echo $template->render(array('aviso'=>$aviso));
		}
	}

	static function modificar(){
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
				var_dump($unAbonado);
				$unAbonado->setImporte($importe);
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
			echo $template->render(array('aviso'=>$aviso,'numabonado'=>$numabonado,'abonado'=>$unAbonado));
		}
	}


	static function listar(){
		$user=$_SESSION['user'];

		Twig_Autoloader::register();
	  	$loader = new Twig_Loader_Filesystem('../vista');
	  	$twig = new Twig_Environment($loader, array('cache' => '../cache','debug' => 'false')); 
		
		$abonado = PDOabonado::listar();

		$empresas = PDOempresa::listar();
	
		$template = $twig->loadTemplate('abonado/listarAbonados.html.twig');
		echo $template->render(array('user'=>$user,'abonado'=>$abonado,'empresas'=>$empresas));

	}
	
		
	public function baja(){

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

		$abonado = PDOabonado::listar();
		$empresas = PDOempresa::listar();
		
		$template = $twig->loadTemplate('abonado/listarAbonados.html.twig');
		echo $template->render(array('empresas'=>$empresas,'abonado'=>$abonado,'aviso'=>$aviso));
      
   }

}
?>
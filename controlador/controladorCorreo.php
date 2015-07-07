<?php

	require '../vendor/PHPMailer/PHPMailerAutoload.php';
	require_once '../vendor/twig/twig/lib/Twig/Autoloader.php';
	require_once '../modelo/PDO/PDOempresa.php';
	require_once '../modelo/PDO/PDOinfcorreo.php';

	
class controladorCorreo {

	//evita la inyeccion de mail
	private static function ValidarDatos($campo){
		//Array con las posibles cabeceras a utilizar por un spammer
		$badHeads = array("Content-Type:",
		"MIME-Version:",
		"Content-Transfer-Encoding:",
		"Return-path:",
		"Subject:",
		"From:",
		"Envelope-to:",
		"To:",
		"bcc:",
		"cc:");
		//Comprobamos que entre los datos no se encuentre alguna de
		//las cadenas del array. Si se encuentra alguna cadena se
		//dirige a una página de Forbidden
		foreach($badHeads as $valor){
			if(strpos(strtolower($campo), strtolower($valor)) !== false){
			
			exit;
			}
		}
	}

	public static function renderCorreo(){

		Twig_Autoloader::register();
	  	$loader = new Twig_Loader_Filesystem('../vista');

	  	$twig = new Twig_Environment($loader, array('cache' => '../cache','debug' => 'false'));
	  	$empresas = $_POST['arrayIdempresa'];

	  	$template = $twig->loadTemplate('correo/correo.html.twig');
		echo $template->render(array('empresas'=>$empresas));

	}

	public static function enviar(){


	  	if (isset($_POST['enviarCorreo'])){
	  		$cantContactos=0;
	  		$cantEmpresas = 0;
	  		$empresas = $_POST['arrayIdempresa'];
	  		$limitEmpresas = count($empresas);
	  	

	  		$adjunto = $_FILES['adjunto'];
	  		$asunto = $_POST['asunto'];
	  		$cuerpo = $_POST['cuerpoMensaje'];

	  		for ($i=0; $i < $limitEmpresas ; $i++) { 
	  			//Emrpesa ACTUAL
	  			$unosCorreo = PDOcorreoempresa::buscarCorreosArray($empresas[$i]);
	  			//correos relacionados a la empresa.
	  			$limitCorreos = count($unosCorreo);
	  			for ($c=0; $c < $limitCorreos ; $c++){ 
	  				controladorCorreo::enviarCorreo($unosCorreo[$c]['correo'],$adjunto,$asunto,$cuerpo);
	  				$cantEmpresas++;
	  			}
	  			//busco el contacto con la idempresa.
	  			$relaciones = PDOcontactoempresa::buscarContactosRelacionados($empresas[$i]);
	  			for ($c=0; $c < count($relaciones) ; $c++){ 
	  				$unContacto = PDOcontacto::buscarContacto($relaciones[$i]->idcontacto);
	  				$unCorreo = $unContacto->getCorreo();
	  				$cantContactos++;
	  				controladorCorreo::enviarCorreo($unCorreo,$adjunto,$asunto,$cuerpo);
	  			}
	  			$unaEmpresa = null;
	  			
	  		}

	  		//delete del anterior.
	  		PDOinfcorreo::eliminar();
	  		//cargo nuevo :D
	  		$fechaActual = date('Y-m-d h:m:s');
	  		$empresasJSON = json_encode($empresas);
	  		$unInforme = new PDOinfcorreo(0,$cantContactos,$cantEmpresas,$empresasJSON,$fechaActual);
	  		$unInforme->guardar();
	  		self::mostrarInforme();

	  			
	  	}
	}

	public static function mostrarInforme(){
		Twig_Autoloader::register();
	  	$loader = new Twig_Loader_Filesystem('../vista');
	  	$twig = new Twig_Environment($loader, array('cache' => '../cache','debug' => 'false'));
	  	
	  	$unInforme = PDOinfcorreo::traerInforme();

	  	$idsEmpresas = html_entity_decode($unInforme->arrayempresas);
	  	$empresas = json_decode($idsEmpresas,true);

	  	$empresasVista1 = '';
	  	$empresasVista2 = '';

	  	$total1 = floor(count($empresas)/2);

	  	for ($i=0; $i < $total1 ; $i++) { 
	  		$emrpesaAct = PDOempresa::buscarEmpresa($empresas[$i]);
	  		$empresasVista1[$i] = $emrpesaAct->getDenominacion();
	  	}

	  	for ($i= $total1; $i < count($empresas) ; $i++) { 
	  		$emrpesaAct = PDOempresa::buscarEmpresa($empresas[$i]);
	  		$empresasVista2[$i] = $emrpesaAct->getDenominacion();
	  	}
	  	
	  	$template = $twig->loadTemplate('correo/detalleCorreo.html.twig');
		echo $template->render(array(
			'empresasVista1'=>$empresasVista1,
			'empresasVista2'=>$empresasVista2,
			'cantEmpresas'=>$unInforme->cantempresas,
			'cantContactos'=>$unInforme->cantcontactos));
	}


	private static function enviarCorreo($unEmail,$adjunto,$asunto,$cuerpo){
		//controlar errores del adjunto
	  		$ruta = $adjunto['tmp_name'];
	  		$nombre = $adjunto['name'];
	  		$error = $adjunto['error'];
	  		$tamaño = $adjunto['size'];
	  		$tipo = $adjunto['type'];
	  		$encoding = "base64";

	  		//Creacion de correo.
	  		$mail = new PHPMailer();
	  		$mail->isSMTP();                                      
			$mail->Host = 'smtp.gmail.com';  
			$mail->SMTPAuth = true;                              
			$mail->Username = 'neg90.ng@gmail.com';              
			$mail->Password = 'kapanga123';                          
			$mail->SMTPSecure = 'tls';                          
			$mail->Port = 587;

			$mail->FromName = '';
			$mail->addAddress($unEmail);    
			$mail->Subject = $asunto;
			$mail->AddAttachment($ruta,$nombre,$encoding,$tipo);
			
		    $mail->Body = $cuerpo;
		    $mail->IsHTML(true);
		    $mail->send();

	  	}

}

?>

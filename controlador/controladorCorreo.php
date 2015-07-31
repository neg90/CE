<?php

	require_once '../vendor/PHPMailer/PHPMailerAutoload.php';
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
	  	if (!isset($_POST['arrayIdempresa'])) {
	  		$empresas = $_POST['arrayIdempresa'];
	  	}else{
	  		$template = $twig->loadTemplate('correo/correo.html.twig');
			echo $template->render(array('empresas'=>$empresas));
	  	}

	  	$template = $twig->loadTemplate('FalloCargaMail.html.twig');
		echo $template->render(array('empresas'=>$empresas));

	}
	/* Error 1 , es por que no tiene emrpesas seleccionadas , Error 2 sobrepasa el tamañ permiido por el server
	Error 3 se canselo el envio durante la carga del archivo, Error 4 tiene tamaño nulo */
	public static function enviar(){
		Twig_Autoloader::register();
	  	$loader = new Twig_Loader_Filesystem('../vista');
	  	$twig = new Twig_Environment($loader, array('cache' => '../cache','debug' => 'false'));

	  	if (isset($_POST['enviarCorreo'])){
	  		$cantContactos=0;
	  		$cantEmpresas = 0;
	  		$empresas = $_POST['arrayIdempresa'];
	  		if (count($empresas) == 0 ) {
	  			$error = 1;
	  			$template = $twig->loadTemplate('correo/correo.html.twig');
				echo $template->render(array('error'=>$error,'empresas'=>$empresas));
	  			
	  		}else{
		  		$limitEmpresas = count($empresas);

		  		$adjunto = $_FILES['adjunto'];
		  		if (empty($adjunto)) {
		  			if($adjunto['error'] == 1 ){
		  			$error = 2;
		  			$template = $twig->loadTemplate('correo/correo.html.twig');
					echo $template->render(array('error'=>$error,'empresas'=>$empresas));
	  			
			  		}elseif ($adjunto['error'] == 4) {
			  			$error = 3;
			  			$template = $twig->loadTemplate('correo/correo.html.twig');
						echo $template->render(array('error'=>$error,'empresas'=>$empresas));
			  		}elseif ($adjunto['error'] == 3) {
			  			$error = 4;
			  			$template = $twig->loadTemplate('correo/correo.html.twig');
						echo $template->render(array('error'=>$error,'empresas'=>$empresas));
			  		}else{
			  			$asunto = $_POST['asunto'];
			  			$cuerpo = $_POST['cuerpoMensaje'];

			  			for ($i=0; $i < $limitEmpresas ; $i++) { 
				  			//Emrpesa ACTUAL
				  			$unosCorreo = PDOcorreoempresa::buscarCorreosArray($empresas[$i]);
				  			//correos relacionados a la empresa.
				  			$limitCorreos = count($unosCorreo);
				  			for ($c=0; $c < $limitCorreos ; $c++){ 
				  				if (!controladorCorreo::enviarCorreo($unosCorreo[$c]['correo'],$adjunto,$asunto,$cuerpo)) {
	  								$template = $twig->loadTemplate('falloCorreo.html.twig');
									echo $template->render(array('empresas'=>$empresas));
									exit();
				  				}
				  				$cantEmpresas++;
				  			}
				  			//busco el contacto con la idempresa.
				  			$relaciones = PDOcontactoempresa::buscarContactosRelacionados($empresas[$i]);
				  			for ($c=0; $c < count($relaciones) ; $c++){ 
				  				$unContacto = PDOcontacto::buscarContacto($relaciones[$i]->idcontacto);
				  				$unCorreo = $unContacto->getCorreo();
				  				$cantContactos++;
				  				if (!controladorCorreo::enviarCorreo($unCorreo,$adjunto,$asunto,$cuerpo)) {
								  	$template = $twig->loadTemplate('falloCorreo.html.twig');
									echo $template->render(array('empresas'=>$empresas));
									exit();
				  				}
				  			}
				  			$unaEmpresa = null;
			  			}

				  		//delete del anterior.
				  		PDOinfcorreo::eliminar();
				  		//cargo nuevo :D
				  		$fechaActual = date('Y-m-d h:m:s');
				  		$empresasJSON = json_encode($empresas);
				  		$adjuntoJSON = json_encode($adjunto);
				  		$unInforme = new PDOinfcorreo(0,$cantContactos,$cantEmpresas,$empresasJSON,$fechaActual,$asunto,$adjuntoJSON,$cuerpo);
				  		$unInforme->guardar();
				  		self::mostrarInforme();
			
			  		}
		  		}else{
		  			$asunto = $_POST['asunto'];
			  			$cuerpo = $_POST['cuerpoMensaje'];

			  			for ($i=0; $i < $limitEmpresas ; $i++) { 
				  			//Emrpesa ACTUAL
				  			$unosCorreo = PDOcorreoempresa::buscarCorreosArray($empresas[$i]);
				  			//correos relacionados a la empresa.
				  			$limitCorreos = count($unosCorreo);
				  			for ($c=0; $c < $limitCorreos ; $c++){ 
				  				if (!controladorCorreo::enviarCorreo($unosCorreo[$c]['correo'],$adjunto,$asunto,$cuerpo)) {
	  								$template = $twig->loadTemplate('falloCorreo.html.twig');
									echo $template->render(array('empresas'=>$empresas));
									exit();
				  				}
				  				$cantEmpresas++;
				  			}
				  			//busco el contacto con la idempresa.
				  			$relaciones = PDOcontactoempresa::buscarContactosRelacionados($empresas[$i]);
				  			for ($c=0; $c < count($relaciones) ; $c++){ 
				  				$unContacto = PDOcontacto::buscarContacto($relaciones[$i]->idcontacto);
				  				$unCorreo = $unContacto->getCorreo();
				  				$cantContactos++;
				  				if (!controladorCorreo::enviarCorreo($unCorreo,$adjunto,$asunto,$cuerpo)) {
								  	$template = $twig->loadTemplate('falloCorreo.html.twig');
									echo $template->render(array('empresas'=>$empresas));
									exit();
				  				}
				  			}
				  			$unaEmpresa = null;
			  			}
			  			
				  		//delete del anterior.
				  		PDOinfcorreo::eliminar();
				  		//cargo nuevo :D
				  		$fechaActual = date('Y-m-d h:m:s');
				  		$empresasJSON = json_encode($empresas);
				  		$adjuntoJSON = json_encode($adjunto);
				  		$unInforme = new PDOinfcorreo(0,$cantContactos,$cantEmpresas,$empresasJSON,$fechaActual,$asunto,$adjuntoJSON,$cuerpo);
				  		$unInforme->guardar();
				  		self::mostrarInforme();
			
		  		}
		  		
		  		
	  		}
	  	}
	  	
	}

	public static function mostrarInforme(){
		Twig_Autoloader::register();
	  	$loader = new Twig_Loader_Filesystem('../vista');
	  	$twig = new Twig_Environment($loader, array('cache' => '../cache','debug' => 'false'));
	  	
	  	$unInforme = PDOinfcorreo::traerInforme();

	  	$idsEmpresas = html_entity_decode($unInforme->arrayempresas);
	  	$empresas = json_decode($idsEmpresas,true);

	  	$auxAdjunto = html_entity_decode($unInforme->adjunto);
	  	$adjunto = json_decode($auxAdjunto,true);

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
			'cuerpo'=>html_entity_decode($unInforme->mensaje),
			'asunto'=>$unInforme->asunto,
			'adjunto'=>$adjunto,
			'fecha'=>$unInforme->fecha,
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
	  		//$mail->SMTPDebug = 4;
	  		$mail->isSMTP();                                      
			$mail->Host = 'smtp.gmail.com';  
			$mail->SMTPAuth = true;                              
			$mail->Username = '';
			$mail->AddReplyTo("", "");
			$mail->Password = '';
			$mail->SMTPSecure = 'tls';                          
			$mail->Port = 587;
			$mail->SetFrom('', '');
			
			$mail->addAddress($unEmail);    
			$mail->Subject = $asunto;
			if (!empty($ruta)) {
				$mail->AddAttachment($ruta,$nombre,$encoding,$tipo);
			}			
		    $mail->Body = $cuerpo;
		    $mail->IsHTML(true);
		 	
		 	if ($mail->send()) {
		 		return true;  
		 	}else{
		 		return false;
		 	}  
	  	}

}

?>
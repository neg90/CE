<?php

	require '../vendor/PHPMailer/PHPMailerAutoload.php';
	require_once '../vendor/twig/twig/lib/Twig/Autoloader.php';
	require_once '../modelo/PDO/PDOempresa.php';

	
class controladorCorreo {

	//evita la inyeccion de mail
	static function ValidarDatos($campo){
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

			$aviso = 4;
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
	  		$empresas = $_POST['arrayIdempresa'];
	  		$limitEmpresas = count($empresas);

	  		$adjunto = $_FILES['adjunto'];
	  		$asunto = $_POST['asunto'];
	  		$cuerpo = $_POST['cuerpoMensaje'];

	  		for ($i=0; $i < $limitEmpresas ; $i++) { 
	  			$unosCorreo = PDOcorreoempresa::buscarCorreosArray($empresas[$i]);
	  			$limitCorreos = count($unosCorreo);
	  			for ($c=0; $c < $limitCorreos ; $c++){ 
	  				controladorCorreo::enviarCorreo($unosCorreo[$c]['correo'],$adjunto,$asunto,$cuerpo);
	  			}
	  			$unaEmpresa = null;
	  		}
	  		//Datos del adjunto
	  	}
	}

	static function enviarCorreo($unEmail,$adjunto,$asunto,$cuerpo){

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
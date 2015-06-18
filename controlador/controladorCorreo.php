<?php


	require '../vendor/PHPMailer/PHPMailerAutoload.php';
	require_once '../vendor/twig/twig/lib/Twig/Autoloader.php';

	
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


	static function enviar(){

		Twig_Autoloader::register();
	  	$loader = new Twig_Loader_Filesystem('../vista');
	  	$twig = new Twig_Environment($loader, array('cache' => '../cache','debug' => 'false'));

	  	if (isset($_POST['enviarCorreo'])){
	  		//Datos del adjunto
	  		$adjunto = $_FILES['adjunto'];
	  		var_dump($adjunto);
	  		/*$ruta = $adjunto['tmp_name'];
	  		$nombre = $adjunto['name'];
	  		$error = $adjunto['error'];
	  		$tamaño = $adjunto['size'];
	  		$tipo = $adjunto['type'];
	  		$encoding = "base64";

	  		$asunto = $_POST['asunto'];
	  		$cuerpo = $_POST['cuerpoMensaje'];


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
			$mail->addAddress('sistemas@cresta.edu.ar');    
			$mail->Subject = $asunto;
			$mail->AddAttachment($ruta,$nombre,$encoding,$tipo);
			
			
		    
		    $mail->Body = $cuerpo;
		    $mail->IsHTML(true);
		    $mail->send();*/

	  		
	  	}else{
	  		$template = $twig->loadTemplate('correo/correo.html.twig');
			echo $template->render(array());
	  	}
	  
	  	
		
		
		
	 }
	 

}

?>

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
	  		$path = $_FILES['uploaded_file'];
	  		var_dump($path);
	  		$mail = new PHPMailer();
	  		$mail->isSMTP();                                      
			$mail->Host = 'smtp.gmail.com';  
			$mail->SMTPAuth = true;                              
			$mail->Username = 'neg90.ng@gmail.com';              
			$mail->Password = 'kapanga123';                          
			$mail->SMTPSecure = 'tls';                          
			$mail->Port = 587;

			$mail->FromName = '';
			$mail->addAddress('neg90.ng@gmail.com');    
			$mail->Subject = 'Pedido de informacion';
			$mail->AddAttachment($path['tmp_name'], $name = "asd", $encoding = "base64",$type = "application/octet-stream");
			
			
		    $mensaje = "Probandooooo \n";
		    $mail->Body = $mensaje;
		    $mail->send();

	  		
	  	}else{
	  		$template = $twig->loadTemplate('correo/correo.html.twig');
			echo $template->render(array());
	  	}
	  
	  	
		
		

		$mail->FromName = '';
		$mail->addAddress('neg90.ng@gmail.com');    
		$mail->Subject = 'Pedido de informacion';
		$mail->AddAttachment('var/www/CE/las_mejores_fotos_de_marloes_horst_159697754_1000x667.jpg', $name = "las_mejores_fotos_de_marloes_horst_159697754_1000x667", $encoding = "base64",$type = "application/octet-stream");
		
		
	    $mensaje = "Enviado desde www.naveyra.com.ar \n";
	    $mail->Body = $mensaje;
		
	 }
	 

}

?>

<?php

session_start();
require_once('../modelo/conexionDB.php');
require_once('../modelo/PDO/PDOusuario.php');

	if (!isset($_SESSION['user']) && (htmlEntities(isset($_POST['user'])))) {
		if (!empty(htmlEntities($_POST['user'])) && !empty(htmlEntities($_POST['clave']))){
			$user = filter_var(htmlEntities($_POST['user']), FILTER_SANITIZE_STRING); //FILTER_SANITIZE_STRING -> Elimina etiquetas, opcionalmente elimina o codifica caracteres especiales.
			$clave = filter_var(htmlEntities($_POST['clave']), FILTER_SANITIZE_STRING);

			try {
				$conexion = new conexion;
				$user = htmlEntities($_POST['user']);
				$clave = htmlEntities($_POST['clave']);

				$verificado=PDOusuario::verificarUser($user,$clave);
				
				if ($verificado == 1) {
					$_SESSION['user'] = htmlEntities($_POST['user']);
					header("Location:privado.php?c=inicio&a=inicio");
				} else {
					//aca el usuario no existe por uno u otro campo
	        		header("Location:index.php?aviso=4");
				}
			}catch(Exception $e){
				
			}
		}elseif (empty(htmlEntities($_POST['user'])) && !empty(htmlEntities($_POST['clave']))) {
	        header("Location: index.php?aviso=1");
	        //falla la usuario
		}elseif (!empty(htmlEntities($_POST['user'])) && empty(htmlEntities($_POST['clave']))){
	        header("Location: index.php?aviso=2");
	        //falla el clave
		}else {
	        header("Location: index.php?aviso=3");
	        //quilombo en la franja de gaza
		}
	}
 
?>
<?php

require_once '../modelo/conexionDB.php';
require_once '../modelo/clases/usuario.php';

class PDOusuario extends usuario{
	

	public function __construct ($id,$user,$email,$password,$activo,$id_rol,$id_persona){

		parent::__construct($id,$user,$email,$password,$activo,$id_rol,$id_persona);
	}

	public static function verificarUser($unusername,$unapassword){
		try {
		$conexion = new conexion; //creo instancia de la conexion
		}catch (PDOException $e){}
		$consulta = $conexion->prepare('SELECT * FROM usuario WHERE username = :username and password = :password');
		$consulta->bindParam(':username',$unusername);
		$consulta->bindParam(':password',$unapassword);
		$consulta->execute();
		$existe=$consulta->fetch();
		
		if($existe==true){
			return 1;
		}else{
			return 0;
		}	
			

	}
//revisar
	public function buscarUser ($user,$password){
		try {
		$conexion = new conexion; //creo instancia de la conexion
		}catch (PDOException $e){}
		$consulta = $conexion->prepare('SELECT * FROM usuario WHERE username = :username and password = :password');
		$consulta->execute();
		$existe=$consulta->fetch();
		

	}


	public static function modificar($user,$password){
		try {
		$conexion = new conexion; //creo instancia de la conexion
		}catch (PDOException $e){}
		$consulta = $conexion->prepare('UPDATE usuario SET username = :username AND password = :password  WHERE username = :username');
		$consulta->bindParam(':username',$unusername);
		$consulta->bindParam(':password',$unapassword);
		$consulta->execute();
		
	}
}
?>
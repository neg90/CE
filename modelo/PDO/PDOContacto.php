<?php

require_once '../modelo/conexionDB.php';
require_once '../modelo/clases/contacto.php';

class PDOcontacto extends contacto{
	

	public function __construct ($id,$idcontacto,$nombre,$apellido,$telefono,$domicio,$correo,$asociadosm,$fechainicioce,$activo){

		parent::__construct($id,$idcontacto,$nombre,$apellido,$telefono,$domicio,$correo,$asociadosm,$fechainicioce,$activo);
	}

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
<?php

require_once '../modelo/conexionDB.php';
require_once '../modelo/clases/contacto.php';

class PDOcontacto extends contacto{
	

	public function __construct ($id,$idcontacto,$nombre,$apellido,$telefono,$domicio,$correo,$asociadosm,$fechainicioce,$activo){

		parent::__construct($id,$idcontacto,$nombre,$apellido,$telefono,$domicio,$correo,$asociadosm,$fechainicioce,$activo);
	}

	
	public static function listar(){
		try {$conexion = new conexion;}catch (PDOException $e){}
		$consulta = $conexion->prepare('SELECT * FROM contacto');
		$consulta->execute();
		$objeto = $consulta->fetchAll(PDO::FETCH_OBJ);
		
		return $objeto;
	}

	
}
?>
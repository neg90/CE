<?php

require_once '../modelo/conexionDB.php';
require_once '../modelo/clases/infmedidorexcel.php';

class PDOinfmedidorexcel extends infmedidorexcel {
	

	public function __construct ($id,$informe,$actualizados,$totalregistros,$cantinsertados){

		parent::__construct($id,$informe,$actualizados,$totalregistros,$cantinsertados);
	}

	
	public static function listar(){
		try {$conexion = new conexion;}catch (PDOException $e){}
		$consulta = $conexion->prepare('SELECT * FROM infmedidorexcel');
		$consulta->execute();
		$objeto = $consulta->fetchAll(PDO::FETCH_OBJ);

		return $objeto;
	}

}
?>
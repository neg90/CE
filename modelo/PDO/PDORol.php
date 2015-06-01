<?php

require_once '../modelo/conexionDB.php';
require_once '../modelo/clases/rol.php';

class PDORol extends rol{
	

	public function	__construct ($idrol,$nombre,$idpermiso){
		
		parent::__construct($idrol,$nombre,$idpermiso);
	
	}
	
	public static function listarRoles(){
		try{
			$conexion=new conexion; //creo la instancia de la conexión
		}
		catch (PDOException $e){}
		$consulta = $conexion->prepare('SELECT * FROM rol');
		$consulta->execute();
		$objeto = $consulta->fetchAll(PDO::FETCH_OBJ);
		return $objeto;
	}
}
?>
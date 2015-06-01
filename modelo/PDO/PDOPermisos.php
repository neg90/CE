<?php

require_once '../modelo/conexionDB.php';
require_once '../modelo/clases/permisos.php';

class PDOPermisos extends permisos{
	

	public function	__construct ($idpermiso,$csocio,$rsocio,$usocio,$dsocio,$cmedidor,$rmedidor,$umedidor,$dmedidor,$cci,$rci,$uci,$dci,
	$cusuario,$rusuario,$uusuario,$dusuario,$crol,$rrol,$urol,$drol){
		
		parent::__construct($idpermiso,$csocio,$rsocio,$usocio,$dsocio,$cmedidor,$rmedidor,$umedidor,$dmedidor,$cci,$rci,$uci,$dci,
	$cusuario,$rusuario,$uusuario,$dusuario,$crol,$rrol,$urol,$drol)
	
	}
	
	public static function listarPermisos(){
		try{
			$conexion=new conexion; //creo la instancia de la conexión
		}
		catch (PDOException $e){}
		$consulta = $conexion->prepare('SELECT * FROM permisos');
		$consulta->execute();
		$objeto = $consulta->fetchAll(PDO::FETCH_OBJ);
		return $objeto;
	}
}
?>
<?php

require_once '../modelo/conexionDB.php';
require_once '../modelo/clases/permisos.php';

class PDOPermisos extends permisos{
	

	public function	__construct ($idpermiso,$csocio,$rsocio,$usocio,$dsocio,$cmedidor,$rmedidor,$umedidor,$dmedidor,$cci,$rci,$uci,$dci,
	$cusuario,$rusuario,$uusuario,$dusuario,$crol,$rrol,$urol,$drol){
		
		parent::__construct($idpermiso,$csocio,$rsocio,$usocio,$dsocio,$cmedidor,$rmedidor,$umedidor,$dmedidor,$cci,$rci,$uci,$dci,
	$cusuario,$rusuario,$uusuario,$dusuario,$crol,$rrol,$urol,$drol);
	
	}
   public static function traerPermiso($id){
      try{
         $conexion=new conexion; //creo la instancia de la conexión
      }
      catch (PDOException $e){}
      $consulta = $conexion->prepare('SELECT * FROM permisos WHERE idpermiso = :idpermiso');
      $consulta->bindParam(':idpermiso',$id);
      $consulta->execute();
      $objeto = $consulta->fetch(PDO::FETCH_OBJ);
      return $objeto;
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

	public static function listarPorID($idpermiso){
		try{
			$conexion=new conexion; //creo la instancia de la conexión
		}
		catch (PDOException $e){}
		$consulta = $conexion->prepare('SELECT * FROM permisos WHERE idpermiso = :idpermiso');
		$consulta->bindParam(':idpermiso',$idpermiso);
		$consulta->execute();
		$objeto = $consulta->fetchAll(PDO::FETCH_OBJ);
		return $objeto;
	}

	public function guardar(){
      try {$conexion = new conexion;}catch (PDOException $e){}
      if($this->getIdpermiso()) /*Si tiene id entonces existe y solo lo modifico*/ {
         $consulta = $conexion->prepare('UPDATE permisos SET 
         csocio = :csocio, rsocio = :rsocio, usocio = :usocio, dsocio = :dsocio,
         cmedidor = :cmedidor, rmedidor = :rmedidor, umedidor = :umedidor, dmedidor = :dmedidor,
         cci = :cci, rci = :rci, uci = :uci, dci = :dci,
         crol = :crol, rrol = :rrol,urol = :urol, drol = :drol,
         cusuario = :cusuario, rusuario = :rusuario, uusuario = :uusuario, dusuario = :dusuario WHERE idpermiso = :idpermiso');
         
         $consulta->bindParam(':csocio', $this->getCsocio());
         $consulta->bindParam(':rsocio', $this->getRsocio());
         $consulta->bindParam(':usocio', $this->getUsocio());
         $consulta->bindParam(':dsocio', $this->getDsocio());
         $consulta->bindParam(':cmedidor', $this->getCmedidor());
         $consulta->bindParam(':rmedidor', $this->getRmedidor());
         $consulta->bindParam(':umedidor', $this->getUmedidor());
         $consulta->bindParam(':dmedidor', $this->getDmedidor());
         $consulta->bindParam(':cci', $this->getCci());
         $consulta->bindParam(':rci', $this->getRci());
         $consulta->bindParam(':uci', $this->getUci());
         $consulta->bindParam(':dci', $this->getDci());
         $consulta->bindParam(':crol', $this->getCrol());
         $consulta->bindParam(':rrol', $this->getRrol());
         $consulta->bindParam(':urol', $this->getUrol());
         $consulta->bindParam(':drol', $this->getDrol());
         $consulta->bindParam(':cusuario', $this->getCusuario());
         $consulta->bindParam(':rusuario', $this->getRusuario());
         $consulta->bindParam(':uusuario', $this->getUusuario());
         $consulta->bindParam(':dusuario', $this->getDusuario());
         $consulta->bindParam(':idpermiso', $this->getIdpermiso());
         $consulta->execute();

      }else /*si no tiene id es un campo mas apra la tabla.*/ {
         $consulta = $conexion->prepare('INSERT INTO permisos (csocio, rsocio, usocio, dsocio, cmedidor, rmedidor, umedidor, dmedidor, cci, rci, uci, dci, crol, rrol, urol, drol, cusuario, rusuario, uusuario, dusuario) 
         VALUES(:csocio, :rsocio, :usocio, :dsocio, :cmedidor, :rmedidor, :umedidor, :dmedidor, :cci, :rci, :uci, :dci, :crol, :rrol, :urol, :drol, :cusuario, :rusuario, :uusuario, :dusuario)');         
         
         $consulta->bindParam(':csocio', $this->getCsocio());
         $consulta->bindParam(':rsocio', $this->getRsocio());
         $consulta->bindParam(':usocio', $this->getUsocio());
         $consulta->bindParam(':dsocio', $this->getDsocio());
         $consulta->bindParam(':cmedidor', $this->getCmedidor());
         $consulta->bindParam(':rmedidor', $this->getRmedidor());
         $consulta->bindParam(':umedidor', $this->getUmedidor());
         $consulta->bindParam(':dmedidor', $this->getDmedidor());
         $consulta->bindParam(':cci', $this->getCci());
         $consulta->bindParam(':rci', $this->getRci());
         $consulta->bindParam(':uci', $this->getUci());
         $consulta->bindParam(':dci', $this->getDci());
         $consulta->bindParam(':crol', $this->getCrol());
         $consulta->bindParam(':rrol', $this->getRrol());
         $consulta->bindParam(':urol', $this->getUrol());
         $consulta->bindParam(':drol', $this->getDrol());
         $consulta->bindParam(':cusuario', $this->getCusuario());
         $consulta->bindParam(':uusuario', $this->getRusuario());
         $consulta->bindParam(':rusuario', $this->getUusuario());
         $consulta->bindParam(':dusuario', $this->getDusuario());
         $consulta->execute();
         
      }

      $conexion = null;
   }

   public static function ultimoPermisoCreado(){
      try{
         $conexion=new conexion; //creo la instancia de la conexión
      }
      catch (PDOException $e){}
      $consulta = $conexion->prepare('SELECT * FROM permisos ORDER BY idpermiso DESC');
      $consulta->execute();
      $objeto = $consulta->fetch(PDO::FETCH_OBJ);
      return $objeto;
   }

   public static function borrar($idpermiso){
      try{
         $conexion=new conexion; //creo la instancia de la conexión
      }
      catch (PDOException $e){}
      $consulta = $conexion->prepare('DELETE FROM permisos WHERE idpermiso = :idpermiso');
      $consulta->bindParam(':idpermiso', $idpermiso);
      $consulta->execute();
   }

}
?>
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

	public static function rolPorID($idrol){
		try{
			$conexion=new conexion; //creo la instancia de la conexión
		}
		catch (PDOException $e){}
		$consulta = $conexion->prepare('SELECT * FROM rol WHERE idrol = :idrol');
		$consulta -> bindParam(':idrol',$idrol);
		$consulta->execute();
		$objeto = $consulta->fetchAll(PDO::FETCH_OBJ);
		return $objeto;
	}

	public function guardar(){
      try {$conexion = new conexion;}catch (PDOException $e){}
      if($this->getIdrol()) /*Si tiene id entonces existe y solo lo modifico*/ {
         $consulta = $conexion->prepare('UPDATE rol SET nombre = :nombre, idpermisos = :idpermisos WHERE idrol = :idrol');
         
         $consulta->bindParam(':nombre', $this->getNombre());
         $consulta->bindParam(':idpermisos', $this->getIdpermisos());
         $consulta->bindParam(':idrol', $this->getIdrol());
         $consulta->execute();

      }else /*si no tiene id es un campo mas apra la tabla.*/ {
         $consulta = $conexion->prepare('INSERT INTO rol (nombre, idpermisos) 
         VALUES(:nombre, :idpermisos)');         
         
         $consulta->bindParam(':nombre', $this->getNombre());
         $consulta->bindParam(':idpermisos', $this->getIdpermisos());
         $consulta->execute();
         
      }

      $conexion = null;
   }

   public static function borrar($idrol){
      try{
         $conexion=new conexion; //creo la instancia de la conexión
      }
      catch (PDOException $e){}
      $consulta = $conexion->prepare('DELETE FROM rol WHERE idrol = :idrol');
      $consulta->bindParam(':idrol', $idrol);
      $consulta->execute();
   }

   public static function existeRol($nombre){
      try{
         $conexion=new conexion; //creo la instancia de la conexión
      }
      catch (PDOException $e){}
      $consulta = $conexion->prepare('SELECT * FROM rol WHERE nombre = :nombre');
      $consulta->bindParam(':nombre', $nombre);
      $consulta->execute();
      $objeto = $consulta->fetch(PDO::FETCH_OBJ);
      return $objeto;
   }

   public static function rolEnUso($idrol){
      try{
         $conexion=new conexion; //creo la instancia de la conexión
      }
      catch (PDOException $e){}
      $consulta = $conexion->prepare('SELECT * FROM usuario WHERE idrol = :idrol');
      $consulta->bindParam(':idrol', $idrol);
      $consulta->execute();
      $objeto = $consulta->fetch(PDO::FETCH_OBJ);
      return $objeto;
   }

}
?>
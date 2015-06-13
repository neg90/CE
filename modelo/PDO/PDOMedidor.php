<?php

require_once '../modelo/conexionDB.php';
require_once '../modelo/clases/medidor.php';

class PDOMedidor extends medidor{
	

	public function	__construct ($id,$nomyap,$telefono,$domicilio,$importepago,$numusuario,$numsuministro,$activo){
		
		parent::__construct($id,$nomyap,$telefono,$domicilio,$importepago,$numusuario,$numsuministro,$activo);
	
	}
	
	public static function listarMedidores(){
		try{
			$conexion=new conexion; //creo la instancia de la conexión
		}
		catch (PDOException $e){}
		$consulta = $conexion->prepare('SELECT * FROM medidor');
		$consulta->execute();
		$objeto = $consulta->fetchAll(PDO::FETCH_OBJ);
		return $objeto;
	}

	public static function medidorPorID($idmedidor){
		try{
			$conexion=new conexion; //creo la instancia de la conexión
		}
		catch (PDOException $e){}
		$consulta = $conexion->prepare('SELECT * FROM medidor WHERE idmedidor = :idmedidor');
		$consulta -> bindParam(':idmedidor',$idmedidor);
		$consulta->execute();
		$objeto = $consulta->fetchAll(PDO::FETCH_OBJ);
		return $objeto;
	}

	public function guardar(){
      try {$conexion = new conexion;}catch (PDOException $e){}
      if($this->getIdmedidor()) /*Si tiene id entonces existe y solo lo modifico*/ {

         //$id,$idcontacto,$nomyap,$telefono,$domicio,$importepago,$numusuario,$numsuministro,$activo
         $consulta = $conexion->prepare('UPDATE medidor SET nomyap = :nomyap, telefono = :telefono, domicilio = :domicilio, importepago = :importepago, numusuario = :numusuario, numsuministro = :numsuministro, activo = :activo WHERE idmedidor = :idmedidor');
         
         $consulta->bindParam(':nomyap', $this->getNomyap());
         $consulta->bindParam(':telefono', $this->getTelefono());
         $consulta->bindParam(':domicilio', $this->getDomicilio());
         $consulta->bindParam(':importepago', $this->getImportepago());
         $consulta->bindParam(':numusuario', $this->getNumusuario());
         $consulta->bindParam(':numsuministro', $this->getNumsuministro());
         $consulta->bindParam(':activo', $this->getActivo());
         $consulta->execute();

      }else /*si no tiene id es un campo mas apra la tabla.*/ {
         $consulta = $conexion->prepare('INSERT INTO medidor (nomyap, telefono, domicilio, importepago, numusuario, numsuministro, activo) 
         VALUES(:nomyap, :telefono, :domicilio, :importepago, :numusuario, :numsuministro, :activo)');         
         
         $consulta->bindParam(':nomyap', $this->getNomyap());
         $consulta->bindParam(':telefono', $this->getTelefono());
         $consulta->bindParam(':domicilio', $this->getDomicilio());
         $consulta->bindParam(':importepago', $this->getImportepago());
         $consulta->bindParam(':numusuario', $this->getNumusuario());
         $consulta->bindParam(':numsuministro', $this->getNumsuministro());
         $consulta->bindParam(':activo', $this->getActivo());
         $consulta->execute();
         
      }

      $conexion = null;
   }

   public static function borrar($idmedidor){
      try{
         $conexion=new conexion; //creo la instancia de la conexión
      }
      catch (PDOException $e){}
      $consulta = $conexion->prepare('DELETE FROM medidor WHERE idmedidor = :idmedidor');
      $consulta->bindParam(':idmedidor', $idmedidor);
      $consulta->execute();
      if (empty(self::medidorPorID($idmedidor))){ //si no se encuentra el usuario, lo eliminó
         return 1;
      }
      else return 0;
   }

   public static function existeMedidor($numusuario, $numsuministro){
      try{
         $conexion=new conexion; //creo la instancia de la conexión
      }
      catch (PDOException $e){}
      $consulta = $conexion->prepare('SELECT * FROM medidor WHERE numusuario = :numusuario AND numsuministro = :numsuministro');
      $consulta->bindParam(':numusuario', $numusuario);
      $consulta->bindParam(':numsuministro', $numsuministro);
      $consulta->execute();
      $objeto = $consulta->fetch(PDO::FETCH_OBJ);
      return $objeto;
   }
}
?>
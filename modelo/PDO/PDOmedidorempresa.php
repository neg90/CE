<?php

require_once '../modelo/conexionDB.php';
require_once '../modelo/clases/medidorempresa.php';

class PDOmedidorempresa extends medidorempresa{
	

	public function __construct ($id,$idmedidor,$idempresa){
		
		parent::__construct($id,$idmedidor,$idempresa);
	
	}

    public static function listar(){
      try {$conexion = new conexion;}catch (PDOException $e){}
      $consulta = $conexion->prepare('SELECT * FROM medidorempresa');
      $consulta->execute();
      $objeto = $consulta->fetchAll(PDO::FETCH_OBJ);
      
      return $objeto;
   
   }

   public function guardar(){
      try {$conexion = new conexion;}catch (PDOException $e){}
      
      if($this->getId()) /*Si tiene id entonces existe y solo lo modifico*/ {
         $consulta = $conexion->prepare('UPDATE medidorempresa SET idempresa = :idempresa,idmedidor = :idmedidor WHERE id = :id');
         $consulta->bindParam(':idempresa', $this->getIdempresa());
         $consulta->bindParam(':idmedidor', $this->getIdmedidor());
         $consulta->bindParam(':id', $this->getId());
         $consulta->execute();

      }else /*si no tiene id es un campo mas apra la tabla.*/ {
         
         $consulta = $conexion->prepare('INSERT INTO medidorempresa (idempresa,idmedidor) VALUES(:idempresa,:idmedidor)');
         
         $consulta->bindParam(':idempresa', $this->getIdempresa());
         $consulta->bindParam(':idmedidor', $this->getIdmedidor());
       
      
         $consulta->execute();
         
      }

      $conexion = null;
   }

   public static function buscarMedidorRelacionados ($idempresa){
      try {$conexion = new conexion;}catch (PDOException $e){}
      
      $consulta = $conexion->prepare('SELECT * FROM medidorempresa WHERE idempresa = :idempresa');

      $consulta->bindParam(':idempresa',$idempresa);

      $consulta->execute();

      $objeto = $consulta->fetch(PDO::FETCH_OBJ);
      
      return $objeto;
   }

   public static function buscarMedidor ($idempresa){
      try {$conexion = new conexion;}catch (PDOException $e){}
      
      $consulta = $conexion->prepare('SELECT * FROM medidorempresa WHERE idempresa = :idempresa');

      $consulta->bindParam(':idempresa',$idempresa);

      $consulta->execute();

      $objeto = $consulta->fetchAll(PDO::FETCH_OBJ);
      
      return $objeto;
   }

   public static function buscarMedidorId ($idmedidor){
      try {$conexion = new conexion;}catch (PDOException $e){}

      $consulta = $conexion->prepare('SELECT * FROM medidorempresa WHERE idmedidor = :idmedidor');

      $consulta->bindParam(':idmedidor',$idmedidor);

      $consulta->execute();

      $objeto = $consulta->fetch(PDO::FETCH_OBJ);
      
      return $objeto;
   }

    public function borrarMedidorEmpresa ($idempresa){

      try {$conexion = new conexion;}catch (PDOException $e){} 
      
      $consulta = $conexion->prepare('DELETE FROM medidorempresa WHERE idempresa =  :idempresa');

      $consulta->bindParam(':idempresa', $idempresa);
    
      $consulta->execute();
      
   }


}
?>
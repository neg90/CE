<?php

require_once '../modelo/conexionDB.php';
require_once '../modelo/clases/abonadoempresa.php';

class PDOabonadoempresa extends abonadoempresa{
	

	public function __construct ($id,$numabonado,$idempresa){
		
		parent::__construct($id,$numabonado,$idempresa);
	
	}

   public function guardar(){
      try {$conexion = new conexion;}catch (PDOException $e){}
      
      if($this->getId()) /*Si tiene id entonces existe y solo lo modifico*/ {
         $consulta = $conexion->prepare('UPDATE abonadoempresa SET numabonado = :numabonado,idempresa = :idempresa WHERE id = :id');
         $consulta->bindParam(':numabonado', $this->getNumabonado());
         $consulta->bindParam(':idempresa', $this->getIdempresa());
         $consulta->bindParam(':id', $this->getId());
         $consulta->execute();

      }else /*si no tiene id es un campo mas apra la tabla.*/ {
         
         $consulta = $conexion->prepare('INSERT INTO abonadoempresa (idempresa,numabonado) VALUES(:idempresa,:numabonado)');
         
         $consulta->bindParam(':numabonado', $this->getNumabonado());
         $consulta->bindParam(':idempresa', $this->getIdempresa());
       
         $consulta->execute();

         
      }
   

      $conexion = null;
   }

   public static function buscarAbonadosRelacionados ($idempresa){
      try {$conexion = new conexion;}catch (PDOException $e){}
      
      $consulta = $conexion->prepare('SELECT * FROM abonadoempresa WHERE idempresa = :idempresa');

      $consulta->bindParam(':idempresa',$idempresa);

      $consulta->execute();

      $objeto = $consulta->fetch(PDO::FETCH_OBJ);
      
      return $objeto;
   }

   public static function buscaAbonados ($idempresa){
      try {$conexion = new conexion;}catch (PDOException $e){}
      
      $consulta = $conexion->prepare('SELECT * FROM abonadoempresa WHERE idempresa = :idempresa');

      $consulta->bindParam(':idempresa',$idempresa);

      $consulta->execute();

      $objeto = $consulta->fetchAll(PDO::FETCH_OBJ);
      
      return $objeto;
   }

    public function borrarAbonadosEmpresa ($idempresa){

      try {$conexion = new conexion;}catch (PDOException $e){} 
      
      $consulta = $conexion->prepare('DELETE FROM abonadoempresa WHERE idempresa =  :idempresa');

      $consulta->bindParam(':idempresa', $idempresa);
    
      $consulta->execute();
      
   }


}
?>
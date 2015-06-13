<?php

require_once '../modelo/conexionDB.php';
require_once '../modelo/clases/medidorempresa.php';

class PDOmedidorempresa extends medidorempresa{
	

	public function __construct ($id,$idmedidor,$idempresa){
		
		parent::__construct($id,$idmedidor,$idempresa);
	
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

}
?>
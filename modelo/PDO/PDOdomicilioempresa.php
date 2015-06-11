<?php

require_once '../modelo/conexionDB.php';
require_once '../modelo/clases/correoempresa.php';

class PDOdomicilioempresa extends domicilioempresa{
	

	public function	__construct ($id,$idempresa,$domicilio,$descripcion){
		
		parent::__construct($id,$idempresa,$domicilio,$descripcion);
	
	}

   public function guardar(){
      try {$conexion = new conexion;}catch (PDOException $e){}
      
      if($this->getId()) /*Si tiene id entonces existe y solo lo modifico*/ {
         $consulta = $conexion->prepare('UPDATE domicilioempresa SET idempresa = :idempresa,domicilio = :domicilio, descripcion = :descripcion
         WHERE id = :id');
         $consulta->bindParam(':idempresa', $this->getIdempresa());
         $consulta->bindParam(':domicilio', $this->getDomicilio());
         $consulta->bindParam(':descripcion', $this->getDescripcion());
         $consulta->bindParam(':id', $this->getId());
         $consulta->execute();

      }else /*si no tiene id es un campo mas apra la tabla.*/ {
         
         $consulta = $conexion->prepare('INSERT INTO telefonoempresa (idempresa,domicilio,descripcion) VALUES(:idempresa,:domicilio,
         :descripcion)');
         
         $consulta->bindParam(':idempresa', $this->getIdempresa());
         $consulta->bindParam(':domicilio', $this->getDomicilio());
         $consulta->bindParam(':descripcion', $this->getDescripcion());
       
         $consulta->execute();
         
      }

      $conexion = null;
   }



   /*public static function buscarID($descripcion){

      try {$conexion = new conexion;}catch (PDOException $e){} 
      $consulta = $conexion->prepare('SELECT * FROM rubro WHERE (descripcion = :descripcion)');
        
      $consulta->bindParam(':descripcion', $descripcion);

      $consulta->execute();

      $resultado = $consulta->fetch();

      $objeto = new PDOrubro($resultado['id'],$resultado['descripcion']);
      
      return $objeto;

   }


   public function validarInsertar(){
      try {$conexion = new conexion;}catch (PDOException $e){} 
      $consulta = $conexion->prepare('SELECT * FROM rubro WHERE (descripcion = :descripcion)');
      
      $consulta->bindParam(':descripcion', $this->getDescripcion());

      $consulta->execute();

      $objeto = $consulta->fetch(PDO::FETCH_OBJ);
      if ($objeto) {
         //Si el array de obejtos viene cargado
         return false;
      }else{
         return true;
      }

   }*/


}

?>
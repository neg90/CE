<?php

require_once '../modelo/conexionDB.php';
require_once '../modelo/clases/infcorreo.php';

class PDOinfcorreo extends infcorreo{
	

	public function __construct ($id,$cantContactos,$cantEmpresas,$arrayEmpresas,$fecha,$asunto,$adjunto,$mensaje){

		parent::__construct($id,$cantContactos,$cantEmpresas,$arrayEmpresas,$fecha,$asunto,$adjunto,$mensaje);
	}

   public function guardar(){
      try {$conexion = new conexion;}catch (PDOException $e){}
      
      if($this->getId()) /*Si tiene id entonces existe y solo lo modifico*/ {
         $consulta = $conexion->prepare('UPDATE infcorreo SET  cantContactos = :cantContactos, 
         cantEmpresas = :cantEmpresas, arrayEmpresas = :arrayEmpresas, fecha = :fecha, asunto =:asunto,
         adjunto = :adjunto,mensaje = :mensaje WHERE id = :id');
         
         $consulta->bindParam(':cantContactos', $this->getCantContactos());
         $consulta->bindParam(':cantEmpresas', $this->getCantEmpresas());
         $consulta->bindParam(':arrayEmpresas', $this->getArrayEmpresas());
         $consulta->bindParam(':fecha', $this->getFecha());
         $consulta->bindParam(':id', $this->getId());
         $consulta->bindParam(':asunto', $this->getAsunto());
         $consulta->bindParam(':adjunto', $this->getAdjunto());
         $consulta->bindParam(':mensaje', $this->getMensaje());
         $consulta->execute();

      }else /*si no tiene id es un campo mas apra la tabla.*/ {
         
         $consulta = $conexion->prepare('INSERT INTO infcorreo (cantContactos,cantEmpresas,arrayEmpresas,fecha,asunto,adjunto,mensaje) 
         VALUES(:cantContactos,:cantEmpresas,:arrayEmpresas,:fecha,:asunto,:adjunto,:mensaje)');
      
       
         $consulta->bindParam(':cantContactos', $this->getCantContactos());
         $consulta->bindParam(':cantEmpresas', $this->getCantEmpresas());
         $consulta->bindParam(':arrayEmpresas', $this->getArrayEmpresas());
         $consulta->bindParam(':fecha', $this->getFecha());
         $consulta->bindParam(':asunto', $this->getAsunto());
         $consulta->bindParam(':adjunto', $this->getAdjunto());
         $consulta->bindParam(':mensaje', $this->getMensaje());

         $consulta->execute();
         return $conexion->lastInsertId();
         
      }
      $conexion = null;
   }

   public static function eliminar(){
      try {$conexion = new conexion;}catch (PDOException $e){}
      $consulta = $conexion->prepare('DELETE FROM infcorreo');
      $consulta->execute();
 
   }
   

   public static function traerInforme(){
      try {$conexion = new conexion;}catch (PDOException $e){}
      $consulta = $conexion->prepare('SELECT * FROM infcorreo');
      $consulta->execute();
      $objeto = $consulta->fetch(PDO::FETCH_OBJ);
      
      return $objeto;
   }
}
?>
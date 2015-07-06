<?php

require_once '../modelo/conexionDB.php';
require_once '../modelo/clases/infcorreo.php';

class PDOinfcorreo extends infcorreo{
	

	public function __construct ($id,$cantContactos,$cantEmpresas,$arrayEmpresas,$fecha){

		parent::__construct($id,$cantContactos,$cantEmpresas,$arrayEmpresas,$fecha);
	}

   public function guardar(){
      try {$conexion = new conexion;}catch (PDOException $e){}
      
      if($this->getId()) /*Si tiene id entonces existe y solo lo modifico*/ {
         $consulta = $conexion->prepare('UPDATE infcorreo SET  cantContactos = :cantContactos, 
         cantEmpresas = :cantEmpresas, arrayEmpresas = :arrayEmpresas, fecha = :fecha WHERE id = :id');
         
         $consulta->bindParam(':cantContactos', $this->getCantContactos());
         $consulta->bindParam(':cantEmpresas', $this->getCantEmpresas());
         $consulta->bindParam(':arrayEmpresas', $this->getArrayEmpresas());
         $consulta->bindParam(':fecha', $this->getFecha());
         $consulta->bindParam(':id', $this->getId());
         $consulta->execute();

      }else /*si no tiene id es un campo mas apra la tabla.*/ {
         
         $consulta = $conexion->prepare('INSERT INTO infcorreo (cantContactos,cantEmpresas,arrayEmpresas,fecha) VALUES(:cantContactos,:cantEmpresas,:arrayEmpresas,:fecha)');
      
       
         $consulta->bindParam(':cantContactos', $this->getCantContactos());
         $consulta->bindParam(':cantEmpresas', $this->getCantEmpresas());
         $consulta->bindParam(':arrayEmpresas', $this->getArrayEmpresas());
         $consulta->bindParam(':fecha', $this->getFecha());
        

         $consulta->execute();
         return $conexion->lastInsertId();
         
      }
      $conexion = null;
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
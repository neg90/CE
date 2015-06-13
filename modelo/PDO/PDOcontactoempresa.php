<?php

require_once '../modelo/conexionDB.php';
require_once '../modelo/clases/contactoempresa.php';

class PDOcontactoempresa extends contactoempresa {
	

	public function __construct ($id,$idcontacto,$idempresa,$relacion){
		
		parent::__construct($id,$idcontacto,$idempresa,$relacion);
	
	}

   public function guardar(){
      try {$conexion = new conexion;}catch (PDOException $e){}
      
      if($this->getId()) /*Si tiene id entonces existe y solo lo modifico*/ {
         $consulta = $conexion->prepare('UPDATE contactoempresa SET idcontacto = :idcontacto,idempresa = :idempresa,relacion = :relacion WHERE id = :id');
         $consulta->bindParam(':idcontacto', $this->getIdcontacto());
         $consulta->bindParam(':idempresa', $this->getIdempresa());
         $consulta->bindParam(':relacion', $this->getRelacion());
         $consulta->bindParam(':id', $this->getId());
         $consulta->execute();

      }else /*si no tiene id es un campo mas apra la tabla.*/ {
         
         $consulta = $conexion->prepare('INSERT INTO contactoempresa (idcontacto,idempresa,relacion) VALUES(:idcontacto,:idempresa,:relacion)');
         
         $consulta->bindParam(':relacion', $this->getRelacion());
         $consulta->bindParam(':idcontacto', $this->getIdcontacto());
         $consulta->bindParam(':idempresa', $this->getIdempresa());
       
      
         $consulta->execute();
         
      }

      $conexion = null;
   }

}
?>
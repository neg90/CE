<?php

require_once '../modelo/conexionDB.php';
require_once '../modelo/clases/categoria.php';

class PDOcategoria extends categoria{
	

	public function	__construct ($descripcion){
		
		parent::__construct($descripcion);
	
	}

	public function guardar(){
      try {$conexion = new conexion;}catch (PDOException $e){}
      
      if($this->getIdcategoria()) /*Si tiene id entonces existe y solo lo modifico*/ {
         $consulta = $conexion->prepare('UPDATE categoria SET descripcion = :descripcion WHERE id = :id');
         $consulta->bindParam(':descripcion', $this->getDescripcion());
         $consulta->execute();

      }else /*si no tiene id es un campo mas apra la tabla.*/ {
         
         $consulta = $conexion->prepare('INSERT INTO categoria (descripcion) VALUES(:descripcion)');
         
         $consulta->bindParam(':descripcion', $this->getDescripcion());
      
         $consulta->execute();
         
      }

      $conexion = null;
   }


}

?>
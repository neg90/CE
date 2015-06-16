<?php

require_once '../modelo/conexionDB.php';
require_once '../modelo/clases/correoempresa.php';

class PDOcorreoempresa extends correoempresa{
	

	public function	__construct ($id,$idempresa,$correo,$descripcion){
		
		parent::__construct($id,$idempresa,$correo,$descripcion);
	
	}

   public function guardar(){
      try {$conexion = new conexion;}catch (PDOException $e){}
      
      if($this->getId()) /*Si tiene id entonces existe y solo lo modifico*/ {
         $consulta = $conexion->prepare('UPDATE correoempresa SET idempresa = :idempresa,correo = :correo, descripcion = :descripcion
         WHERE id = :id');
         $consulta->bindParam(':idempresa', $this->getIdempresa());
         $consulta->bindParam(':correo', $this->getCorreo());
         $consulta->bindParam(':descripcion', $this->getDescripcion());
         $consulta->bindParam(':id', $this->getId());
         $consulta->execute();

      }else /*si no tiene id es un campo mas apra la tabla.*/ {
         
         $consulta = $conexion->prepare('INSERT INTO correoempresa (idempresa,correo,descripcion) VALUES(:idempresa,:correo,
         :descripcion)');
         
         $consulta->bindParam(':idempresa', $this->getIdempresa());
         $consulta->bindParam(':correo', $this->getCorreo());
         $consulta->bindParam(':descripcion', $this->getDescripcion());
       
      
         $consulta->execute();
         
      }

      $conexion = null;
   }

    public static function buscarCorreos ($idempresa){
      try {$conexion = new conexion;}catch (PDOException $e){}
      
      $consulta = $conexion->prepare('SELECT * FROM correoempresa WHERE idempresa = :idempresa');

      $consulta->bindParam(':idempresa',$idempresa);

      $consulta->execute();

      $objeto = $consulta->fetchAll(PDO::FETCH_OBJ);
      
      return $objeto;
   }

   public static function borrarCorreosRelacionados($idempresa){
       try {$conexion = new conexion;}catch (PDOException $e){}

       $consulta = $conexion->prepare('DELETE FROM correoempresa WHERE idempresa = :idempresa');

       $consulta->bindParam(':idempresa',$idempresa);

       $consulta->execute();
 
   }

}

?>
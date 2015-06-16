<?php

require_once '../modelo/conexionDB.php';
require_once '../modelo/clases/contactoempresa.php';

class PDOcontactoempresa extends contactoempresa {
	

	public function __construct ($id,$idcontacto,$idempresa,$relacion){
		
		parent::__construct($id,$idcontacto,$idempresa,$relacion);

	}

  public static function listar(){
      try {$conexion = new conexion;}catch (PDOException $e){}
      $consulta = $conexion->prepare('SELECT * FROM contactoempresa');
      $consulta->execute();
      $objeto = $consulta->fetchAll(PDO::FETCH_OBJ);
      
      return $objeto;
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

    public static function contarCOntactosRelacionados ($idempresa){
      try {$conexion = new conexion;}catch (PDOException $e){}
      
      $consulta = $conexion->prepare('SELECT count(*) FROM contactoempresa WHERE idempresa = :idempresa');

      $consulta->bindParam(':idempresa',$idempresa);

      $consulta->execute();

      $objeto = $consulta->fetch();
      
      return $objeto;
   }

   public static function borrarContactosRelacionados($idempresa){
       try {$conexion = new conexion;}catch (PDOException $e){}

       $consulta = $conexion->prepare('DELETE FROM contactoempresa WHERE idempresa = :idempresa');

       $consulta->bindParam(':idempresa',$idempresa);

       $consulta->execute();
 
   }

   public static function buscarContactosRelacionados ($idempresa){
      try {$conexion = new conexion;}catch (PDOException $e){}
      
      $consulta = $conexion->prepare('SELECT * FROM contactoempresa WHERE idempresa = :idempresa');

      $consulta->bindParam(':idempresa',$idempresa);

      $consulta->execute();

      $objeto = $consulta->fetchAll(PDO::FETCH_OBJ);
      
      return $objeto;
   }

}
?>
<?php

require_once '../modelo/conexionDB.php';
require_once '../modelo/clases/rubro.php';

class PDOrubro extends rubro{
	

	public function	__construct ($idrubro,$descripcion){
		
		parent::__construct($idrubro,$descripcion);
	
	}

   public static function listar(){
      try {$conexion = new conexion;}catch (PDOException $e){}
      $consulta = $conexion->prepare('SELECT * FROM rubro');
      $consulta->execute();
      $objeto = $consulta->fetchAll(PDO::FETCH_OBJ);
      
      return $objeto;
   }

   public static function buscarID($descripcion){

      try {$conexion = new conexion;}catch (PDOException $e){} 
      $consulta = $conexion->prepare('SELECT * FROM rubro WHERE (descripcion = :descripcion)');
        
      $consulta->bindParam(':descripcion', $descripcion);

      $consulta->execute();

      $resultado = $consulta->fetch();

      $objeto = new PDOrubro($resultado['id'],$resultado['descripcion']);
      
      return $objeto;

   }

   public static function buscarDescripcion($id){

      try {$conexion = new conexion;}catch (PDOException $e){} 
      $consulta = $conexion->prepare('SELECT * FROM rubro WHERE (id = :id)');
        
      $consulta->bindParam(':id', $id);

      $consulta->execute();

      $resultado = $consulta->fetch();
      
      return $resultado;

   }

	public function guardar(){
      try {$conexion = new conexion;}catch (PDOException $e){}
      
      if($this->getIdrubro()) /*Si tiene id entonces existe y solo lo modifico*/ {
         $consulta = $conexion->prepare('UPDATE rubro SET descripcion = :descripcion WHERE id = :id');
         $consulta->bindParam(':descripcion', $this->getDescripcion());
         $consulta->bindParam(':id', $this->getIdrubro());
         $consulta->execute();

      }else /*si no tiene id es un campo mas apra la tabla.*/ {
         
         $consulta = $conexion->prepare('INSERT INTO rubro (descripcion) VALUES(:descripcion)');
         
         $consulta->bindParam(':descripcion', $this->getDescripcion());
      
         $consulta->execute();
         
      }

      $conexion = null;
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

   }


}

?>
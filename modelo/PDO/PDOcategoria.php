<?php

require_once '../modelo/conexionDB.php';
require_once '../modelo/clases/categoria.php';

class PDOcategoria extends categoria{
	

	public function	__construct ($idcategoria,$descripcion){
		
		parent::__construct($idcategoria,$descripcion);
	
	}

   /* FILTROS */

   public static function filtroCategoria($descripcion){
      try{
         $conexion=new conexion; //creo la instancia de la conexión
      }
      catch (PDOException $e){}
      $consulta = $conexion->prepare("SELECT * FROM categoria WHERE (descripcion LIKE concat('%',:descripcion,'%'))");
      $consulta->bindParam(':descripcion',$descripcion);
      $consulta->execute();
      $objeto = $consulta->fetchAll(PDO::FETCH_OBJ);
      return $objeto;
   }

   /* FIN FILTROS */


   public static function listar(){
      try {$conexion = new conexion;}catch (PDOException $e){}
      $consulta = $conexion->prepare('SELECT * FROM categoria');
      $consulta->execute();
      $objeto = $consulta->fetchAll(PDO::FETCH_OBJ);
      
      return $objeto;
   }

   public static function buscarID($descripcion){

      try {$conexion = new conexion;}catch (PDOException $e){} 
      $consulta = $conexion->prepare('SELECT * FROM categoria WHERE (descripcion = :descripcion)');
        
      $consulta->bindParam(':descripcion', $descripcion);

      $consulta->execute();

      $resultado = $consulta->fetch();

      $objeto = new PDOcategoria($resultado['id'],$resultado['descripcion']);
      
      return $objeto;

   }

   public static function buscarDescripcion($id){

      try {$conexion = new conexion;}catch (PDOException $e){} 
      $consulta = $conexion->prepare('SELECT * FROM categoria WHERE (id = :id)');
        
      $consulta->bindParam(':id', $id);

      $consulta->execute();

      $resultado = $consulta->fetch();
      
      return $resultado;

   }

	public function guardar(){
      try {$conexion = new conexion;}catch (PDOException $e){}
      
      if($this->getIdcategoria()) /*Si tiene id entonces existe y solo lo modifico*/ {
         $consulta = $conexion->prepare('UPDATE categoria SET descripcion = :descripcion WHERE id = :id');
         $consulta->bindParam(':descripcion', $this->getDescripcion());
         $consulta->bindParam(':id', $this->getIdcategoria());
         $consulta->execute();

      }else /*si no tiene id es un campo mas apra la tabla.*/ {
         
         $consulta = $conexion->prepare('INSERT INTO categoria (descripcion) VALUES(:descripcion)');
         
         $consulta->bindParam(':descripcion', $this->getDescripcion());
      
         $consulta->execute();
         
      }

      $conexion = null;
   }

   public function validarInsertar(){
      try {$conexion = new conexion;}catch (PDOException $e){} 
      $consulta = $conexion->prepare('SELECT * FROM categoria WHERE (descripcion = :descripcion)');
      
      
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
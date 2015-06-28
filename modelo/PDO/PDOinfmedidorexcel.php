<?php

require_once '../modelo/conexionDB.php';
require_once '../modelo/clases/infmedidorexcel.php';

class PDOinfmedidorexcel extends infmedidorexcel {
	

	public function __construct ($id,$informe,$actualizados,$totalregistros,$cantinsertados,$fecha,$fallados){

		parent::__construct($id,$informe,$actualizados,$totalregistros,$cantinsertados,$fecha,$fallados);
	}

	
	public static function listar(){
		try {$conexion = new conexion;}catch (PDOException $e){}
		$consulta = $conexion->prepare('SELECT * FROM infmedidorexcel');
		$consulta->execute();
		$objeto = $consulta->fetchAll(PDO::FETCH_OBJ);

		return $objeto;
	}

   public function guardar(){
      try {$conexion = new conexion;}catch (PDOException $e){}
      
      if($this->getId()) /*Si tiene id entonces existe y solo lo modifico*/ {
         $consulta = $conexion->prepare('UPDATE infmedidorexcel SET informe = :informe and actualizados = :actualizados
         and totalregistros = :totalregistros and  cantinsertados = :cantinsertados and fecha = :fecha and 
         fallados = :fallados WHERE id = :id');
         $consulta->bindParam(':informe', $this->getInforme());
         $consulta->bindParam(':actualizados', $this->getActualizados());
         $consulta->bindParam(':totalregistros', $this->getTotalregistros());
         $consulta->bindParam(':cantinsertados', $this->getCantinsertados());
         $consulta->bindParam(':id',$this->getId());
         $consulta->bindParam(':fecha',$this->getFecha());
         $consulta->bindParam(':fallados',$this->getFallados());


         $consulta->execute();

      }else /*si no tiene id es un campo mas apra la tabla.*/ {
         
         $consulta = $conexion->prepare('INSERT INTO infmedidorexcel (informe,actualizados,totalregistros,cantinsertados,fecha,fallados)
         VALUES(:informe,:actualizados,:totalregistros,:cantinsertados,:fecha,:fallados)');
     
         $consulta->bindParam(':informe', $this->getInforme());
         $consulta->bindParam(':actualizados', $this->getActualizados());
         $consulta->bindParam(':totalregistros', $this->getTotalregistros());
         $consulta->bindParam(':cantinsertados', $this->getCantinsertados());
         $consulta->bindParam(':fecha',$this->getFecha());
         $consulta->bindParam(':fallados',$this->getFallados());
      
         $consulta->execute();
         
      }

      $conexion = null;
   }

   public static function borrarTodo (){
      try {$conexion = new conexion;}catch (PDOException $e){}
      $consulta = $conexion->prepare('DELETE FROM infmedidorexcel');
      $consulta->execute();
 
   }

    public static function borrarID ($id){

      try {$conexion = new conexion;}catch (PDOException $e){}
      $consulta = $conexion->prepare('DELETE FROM infmedidorexcel WHERE id = :id');
      $consulta->bindParam(':id',$id);
      $consulta->execute();
 
   }

    public static function buscarID ($id){

      try {$conexion = new conexion;}catch (PDOException $e){}
      $consulta = $conexion->prepare('SELECT * FROM infmedidorexcel WHERE id = :id');
      $consulta->bindParam(':id',$id);
      $consulta->execute();
      $objeto = $consulta->fetch(PDO::FETCH_OBJ);

      return $objeto;
   }




}
?>
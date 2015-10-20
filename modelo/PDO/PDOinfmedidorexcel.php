<?php

require_once '../modelo/conexionDB.php';
require_once '../modelo/clases/infmedidorexcel.php';

class PDOinfmedidorexcel extends infmedidorexcel {
	

	public function __construct ($id,$fallados,$actualizados,$totalregistros,$fecha,$medidorInsertado,$registroNoInsertado,
   $medidorActualizado,$empresaActualizada,$relacionInsertada,$medidorSinEmpresaInsertado,$medidorSinEmpresaActualizado){

		parent::__construct($id,$fallados,$actualizados,$totalregistros,$fecha,$medidorInsertado,$registroNoInsertado,
   $medidorActualizado,$empresaActualizada,$relacionInsertada,$medidorSinEmpresaInsertado,$medidorSinEmpresaActualizado);
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
         $consulta = $conexion->prepare('UPDATE infmedidorexcel SET actualizados = :actualizados
         and totalregistros = :totalregistros and fecha = :fecha and fallados = :fallados 
         and medidorInsertado = :medidorInsertado and registroNoInsertado = :registroNoInsertado
         and medidorActualizado = :medidorActualizado and empresaActualizada = :empresaActualizada and
         relacionInsertada = :relacionInsertada and  medidorSinEmpresaInsertado = :medidorSinEmpresaInsertado 
         and medidorSinEmpresaActualizado = :medidorSinEmpresaActualizado  WHERE id = :id'); 
         
         $consulta->bindParam(':fecha',$this->getFecha());
         $consulta->bindParam(':totalregistros', $this->getTotalregistros());
         $consulta->bindParam(':actualizados', $this->getActualizados());
         $consulta->bindParam(':id',$this->getId());
         $consulta->bindParam(':fallados',$this->getFallados());
         $consulta->bindParam(':medidorInsertado',$this->getMedidorInsertado());
         $consulta->bindParam(':registroNoInsertado',$this->getRegistroNoInsertado());
         $consulta->bindParam(':medidorActualizado',$this->getMedidorActualizado());
         $consulta->bindParam(':empresaActualizada',$this->getEmpresaActualizada());
         $consulta->bindParam(':relacionInsertada',$this->getRelacionInsertada());
         $consulta->bindParam(':medidorSinEmpresaInsertado',$this->getMedidorSinEmpresaInsertado());
         $consulta->bindParam(':medidorSinEmpresaActualizado',$this->getMedidorSinEmpresaActualizado());
         $consulta->execute();

      }else /*si no tiene id es un campo mas apra la tabla.*/ {
         
         $consulta = $conexion->prepare('INSERT INTO infmedidorexcel (actualizados,totalregistros,fecha,fallados,medidorInsertado,registroNoInsertado,
         medidorActualizado,empresaActualizada,relacionInsertada,medidorSinEmpresaInsertado,medidorSinEmpresaActualizado)
         VALUES(:actualizados,:totalregistros,:fecha,:fallados,:medidorInsertado,:registroNoInsertado,:medidorActualizado,:empresaActualizada,:relacionInsertada,
         :medidorSinEmpresaInsertado,:medidorSinEmpresaActualizado)');
     
         $consulta->bindParam(':fecha',$this->getFecha());
         $consulta->bindParam(':totalregistros', $this->getTotalregistros());
         $consulta->bindParam(':actualizados', $this->getActualizados());
         $consulta->bindParam(':fallados',$this->getFallados());
         $consulta->bindParam(':medidorInsertado',$this->getMedidorInsertado());
         $consulta->bindParam(':registroNoInsertado',$this->getRegistroNoInsertado());
         $consulta->bindParam(':medidorActualizado',$this->getMedidorActualizado());
         $consulta->bindParam(':empresaActualizada',$this->getEmpresaActualizada());
         $consulta->bindParam(':relacionInsertada',$this->getRelacionInsertada());
         $consulta->bindParam(':medidorSinEmpresaInsertado',$this->getMedidorSinEmpresaInsertado());
         $consulta->bindParam(':medidorSinEmpresaActualizado',$this->getMedidorSinEmpresaActualizado());
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
<?php

require_once '../modelo/conexionDB.php';
require_once '../modelo/clases/servicio.php';

class PDOservicio extends servicio{
	

	public function __construct ($id,$idempresarecibe,$idempresaofrece){
		parent::__construct($id,$idempresarecibe,$idempresaofrece);
	}

   public function guardar(){
      try {$conexion = new conexion;}catch (PDOException $e){}
      
      if($this->getId()) /*Si tiene id entonces existe y solo lo modifico*/ {
         $consulta = $conexion->prepare('UPDATE servicio SET  idempresarecibe = :idempresarecibe, 
         idempresaofrece = :idempresaofrece WHERE id = :id');
         
         $consulta->bindParam(':idempresarecibe', $this->getIdempresarecibe());
         $consulta->bindParam(':idempresaofrece', $this->getIdempresaofrece());
         $consulta->bindParam(':id', $this->getId());
         $consulta->execute();

      }else /*si no tiene id es un campo mas apra la tabla.*/ {
         
         $consulta = $conexion->prepare('INSERT INTO servicio (idempresarecibe,idempresaofrece) VALUES(:idempresarecibe,
         :idempresaofrece)');
      
         $consulta->bindParam(':idempresarecibe', $this->getIdempresarecibe());
         $consulta->bindParam(':idempresaofrece', $this->getIdempresaofrece());
         $consulta->execute();
        
         
         return $conexion->lastInsertId();
         
      }
      $conexion = null;
   }

   public static function listar(){
      
      try {$conexion = new conexion;}catch (PDOException $e){}
      $consulta = $conexion->prepare('SELECT * FROM servicio');
      $consulta->execute();
      $objeto = $consulta->fetchAll(PDO::FETCH_OBJ);
      
      return $objeto;
   }

   public static function recibeServiciosID($idempresa){
      try {$conexion = new conexion;}catch (PDOException $e){}
      $consulta = $conexion->prepare('SELECT idempresaofrece FROM servicio WHERE idempresarecibe = :idempresarecibe');
      $consulta->bindParam(':idempresarecibe',$idempresa);
      $consulta->execute();
      $objeto = $consulta->fetchAll(PDO::FETCH_OBJ);

      return $objeto;  
   }

   public static function recibeServiciosIDFull($idempresa){
      try {$conexion = new conexion;}catch (PDOException $e){}
      $consulta = $conexion->prepare('SELECT * FROM servicio WHERE idempresarecibe = :idempresarecibe');
      $consulta->bindParam(':idempresarecibe',$idempresa);
      $consulta->execute();
      $objeto = $consulta->fetchAll(PDO::FETCH_OBJ);

      return $objeto;  
   }

   
   public function borrarPorIdemrpesa($idempresa){
      try {$conexion = new conexion;}catch (PDOException $e){} 
      $consulta = $conexion->prepare('DELETE FROM servicio WHERE  idempresarecibe =  :idempresarecibe');

      $consulta->bindParam(':idempresarecibe', $idempresa);
    
      $consulta->execute();
      
   }
   
   public function borrarPorIdemrpesaV2($idempresa){
      try {$conexion = new conexion;}catch (PDOException $e){} 
      $consulta = $conexion->prepare('DELETE FROM servicio WHERE  idempresaofrece =  :idempresaofrece');

      $consulta->bindParam(':idempresaofrece', $idempresa);
    
      $consulta->execute();
      
   }

  /* public function buscarAbonado ($numabonado){
      try {$conexion = new conexion;}catch (PDOException $e){} 
      $consulta = $conexion->prepare('SELECT * FROM abonado WHERE (numabonado = :numabonado)');
      
      $consulta->bindParam(':numabonado', $numabonado);
    
      $consulta->execute();

      $resultado = $consulta->fetch();
     
      $objeto = new PDOabonado ($resultado['numabonado'],$resultado['importe'],$resultado['fechadeultimopago'],$resultado['activo']);
      
      return $objeto;

   }

  
   public static function listarPaginacion($valor,$cantResultados){
     
      try {$conexion = new conexion;}catch (PDOException $e){}
      $consulta = $conexion->prepare('SELECT * FROM abonado LIMIT :valor,:cantResultados');
      $consulta->bindParam(':valor', $valor,PDO::PARAM_INT);
      $consulta->bindParam(':cantResultados', $cantResultados,PDO::PARAM_INT);
      $consulta->execute();
      $objeto = $consulta->fetchAll(PDO::FETCH_OBJ);
      
      return $objeto;
   }

   public function baja($numabonado){
      try {$conexion = new conexion;}catch (PDOException $e){} 
      $consulta = $conexion->prepare('DELETE FROM abonado WHERE numabonado =  :numabonado');

      $consulta->bindParam(':numabonado', $numabonado);
    
      $consulta->execute();
      
   }
*/




	
	

}
?>
<?php

require_once '../modelo/conexionDB.php';
require_once '../modelo/clases/abonado.php';

class PDOabonado extends abonado{
	

	public function __construct ($numabonado,$importe,$fechadeultimopago,$activo){

		parent::__construct($numabonado,$importe,$fechadeultimopago,$activo);
	}

   public function guardar(){
      try {$conexion = new conexion;}catch (PDOException $e){}
      
      if($this->getNumabonado()) /*Si tiene id entonces existe y solo lo modifico*/ {
         $consulta = $conexion->prepare('UPDATE abonado SET  importe = :importe, 
         fechadeultimopago = :fechadeultimopago, activo = :activo WHERE numabonado = :numabonado');
         
         $consulta->bindParam(':importe', $this->getImporte());
         $consulta->bindParam(':fechadeultimopago', $this->getFechadeultimopago());
         $consulta->bindParam(':activo', $this->getActivo());
         $consulta->bindParam(':numabonado', $this->getNumabonado());
         $consulta->execute();

      }else /*si no tiene id es un campo mas apra la tabla.*/ {
         
         $consulta = $conexion->prepare('INSERT INTO abonado (importe,fechadeultimopago,activo) VALUES(:importe,:fechadeultimopago,:activo)');
      
       
         $consulta->bindParam(':importe', $this->getImporte());
         $consulta->bindParam(':fechadeultimopago', $this->getFechadeultimopago());
         $consulta->bindParam(':activo', $this->getActivo());
        

         $consulta->execute();
         return $conexion->lastInsertId();
         
      }
      $conexion = null;
   }

   

   public function buscarAbonado ($numabonado){
      try {$conexion = new conexion;}catch (PDOException $e){} 
      $consulta = $conexion->prepare('SELECT * FROM abonado WHERE (numabonado = :numabonado)');
      
      $consulta->bindParam(':numabonado', $numabonado);
    
      $consulta->execute();

      $resultado = $consulta->fetch();
     
      $objeto = new PDOabonado ($resultado['numabonado'],$resultado['importe'],$resultado['fechadeultimopago'],$resultado['activo']);
      
      return $objeto;

   }

   public static function listar(){
      try {$conexion = new conexion;}catch (PDOException $e){}
      $consulta = $conexion->prepare('SELECT * FROM abonado');
      $consulta->execute();
      $objeto = $consulta->fetchAll(PDO::FETCH_OBJ);
      
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





	
	

}
?>
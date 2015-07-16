<?php

require_once '../modelo/conexionDB.php';
require_once '../modelo/clases/abonado.php';

class PDOabonado extends abonado{
	

	public function __construct ($numabonado,$importe,$fechadeultimopago,$activo){

		parent::__construct($numabonado,$importe,$fechadeultimopago,$activo);
	}

   public static function filtroNumabonado($numabonado){
      try{
         $conexion=new conexion; //creo la instancia de la conexión
      }
      catch (PDOException $e){}
      $consulta = $conexion->prepare("SELECT * FROM abonado WHERE numabonado = :numabonado");
      $consulta->bindParam(':numabonado',$numabonado);
      $consulta->execute();
      $objeto = $consulta->fetchAll(PDO::FETCH_OBJ);
      return $objeto;
   }

   public static function filtroImporte($crit,$importe){
      try{
         $conexion=new conexion; //creo la instancia de la conexión
      }
      catch (PDOException $e){}

      $crit = htmlentities($crit);

      if ($crit == 1) $criterio = '>';
      elseif ($crit == 2) $criterio = '=';
      else $criterio = '<';

      $consulta = $conexion->prepare("SELECT * FROM abonado WHERE importe ".$criterio. ":importe");
      $consulta->bindParam(':importe',$importe);
      $consulta->execute();
      $objeto = $consulta->fetchAll(PDO::FETCH_OBJ);
      return $objeto;
   } 

   public static function filtroActivo($datoActivo){
      if ($datoActivo=='2') $datoActivo=0;

      try{
         $conexion=new conexion; //creo la instancia de la conexión
      }
      catch (PDOException $e){}
      $consulta = $conexion->prepare("SELECT * FROM abonado WHERE activo = :datoActivo");
      $consulta->bindParam(':datoActivo',$datoActivo);
      $consulta->execute();
      $objeto = $consulta->fetchAll(PDO::FETCH_OBJ);
      return $objeto;
   }  


   public static function filtroEmpresa($datoFiltro){
      try{
         $conexion=new conexion; //creo la instancia de la conexión
      }
      catch (PDOException $e){}

      $consulta = $conexion->prepare("SELECT * FROM abonado WHERE numabonado IN 
                                       ( SELECT numabonado from abonadoempresa WHERE idempresa IN
                                          (SELECT idempresa FROM empresa WHERE denominacion LIKE concat('%',:datoFiltro,'%')))");
      $consulta->bindParam(':datoFiltro',$datoFiltro);
      $consulta->execute();
      $objeto = $consulta->fetchAll(PDO::FETCH_OBJ);

      return $objeto;
   } 

      public static function filtroSinEmpresa(){
      try{
         $conexion=new conexion; //creo la instancia de la conexión
      }
      catch (PDOException $e){}

      $consulta= $conexion->prepare(
         'SELECT * FROM abonado WHERE numabonado NOT IN 
            (SELECT numabonado FROM abonadoempresa)');

      $consulta->execute();
      $objeto = $consulta->fetchAll(PDO::FETCH_OBJ);
      return $objeto;
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
<?php

require_once '../modelo/conexionDB.php';
require_once '../modelo/clases/empresa.php';

class PDOempresa extends empresa{
	

	public function __construct ($idempresa,$denominacion,$web,$idrubro,$detactividad,$cantempleados,$idcategoria,$fechainicioce,$activo,
   $cuit,$fechafundacion,$importemensual,$nrosocio,$numusuario){

		parent::__construct($idempresa,$denominacion,$web,$idrubro,$detactividad,$cantempleados,$idcategoria,$fechainicioce,$activo,
      $cuit,$fechafundacion,$importemensual,$nrosocio,$numusuario);

	}

	/* FILTROS */

   public static function filtroDenominacion($denominacion){
      try{
         $conexion=new conexion; //creo la instancia de la conexión
      }
      catch (PDOException $e){}
      $consulta = $conexion->prepare("SELECT * FROM empresa WHERE (denominacion LIKE concat('%',:denominacion,'%'))");
      $consulta->bindParam(':denominacion',$denominacion);
      $consulta->execute();
      $objeto = $consulta->fetchAll(PDO::FETCH_OBJ);
      return $objeto;
   }

   public static function filtroCUIT($cuit){
      try{
         $conexion=new conexion; //creo la instancia de la conexión
      }
      catch (PDOException $e){}
      $consulta = $conexion->prepare("SELECT * FROM empresa WHERE (cuit LIKE concat('%',:cuit,'%'))");
      $consulta->bindParam(':cuit',$cuit);
      $consulta->execute();
      $objeto = $consulta->fetchAll(PDO::FETCH_OBJ);
      return $objeto;
   }

   public static function filtroRubro($arrayRubros){
      try{
         $conexion=new conexion; //creo la instancia de la conexión
      }
      catch (PDOException $e){}
      $rubros='';
      $cant= count($arrayRubros);

      foreach ($arrayRubros as $unRubro){
         $rubros .= $unRubro->id; //Armo un string con los id, de la forma: '12345678'
      }
      if ($cant != 0){
            if ($cant==1){
                        //$consulta = $conexion->prepare("SELECT * FROM empresa WHERE (idempresa LIKE concat('%',:idempresa,'%'))");
                  $consulta = $conexion->prepare("SELECT * FROM empresa WHERE idrubro = :idrubro");
                  $consulta->bindParam(':idrubro',$rubros);
            }
            else {
                  $consulta = $conexion->prepare("SELECT * FROM empresa WHERE idrubro IN :rubros");
                  $consulta->bindParam(':rubros',$rubros);
            }
            $consulta->execute();
            $objeto = $consulta->fetchAll(PDO::FETCH_OBJ);
            return $objeto;
      }
      else return null;
   }

   public static function filtroCategoria($arrayCategorias){
      try{
         $conexion=new conexion; //creo la instancia de la conexión
      }
      catch (PDOException $e){}
      $cats='';
      $cant= count($arrayCategorias);

      foreach ($arrayCategorias as $unaCategoria){
         $cats .= $unaCategoria->id; //Armo un string con los id, de la forma: '12345678'
      }
      if ($cant != 0){
            if ($cant==1){
                        //$consulta = $conexion->prepare("SELECT * FROM empresa WHERE (idempresa LIKE concat('%',:idempresa,'%'))");
                  $consulta = $conexion->prepare("SELECT * FROM empresa WHERE idcategoria = :idcategoria");
                  $consulta->bindParam(':idcategoria',$cats);
            }
            else {
                  $consulta = $conexion->prepare("SELECT * FROM empresa WHERE idcategoria IN :cats");
                  $consulta->bindParam(':cats',$cats);
            }
            $consulta->execute();
            $objeto = $consulta->fetchAll(PDO::FETCH_OBJ);
            return $objeto;
      }
      else return null;
   }

   public static function filtroCantempleados($cantempleados){
      try{
         $conexion=new conexion; //creo la instancia de la conexión
      }
      catch (PDOException $e){}
      $consulta = $conexion->prepare("SELECT * FROM empresa WHERE cantempleados = :cantempleados");
      $consulta->bindParam(':cantempleados',$cantempleados);
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

      $consulta = $conexion->prepare("SELECT * FROM empresa WHERE importemensual ".$criterio. ":importemensual");
      $consulta->bindParam(':importemensual',$importe);
      $consulta->execute();
      $objeto = $consulta->fetchAll(PDO::FETCH_OBJ);
      return $objeto;
   }   


   /* Fin FILTROS */


	public static function listar(){
		try {$conexion = new conexion;}catch (PDOException $e){}
		$consulta = $conexion->prepare('SELECT * FROM empresa');
		$consulta->execute();
		$objeto = $consulta->fetchAll(PDO::FETCH_OBJ);
		
		return $objeto;
	}

   public static function contarEmpresas (){
      try {$conexion = new conexion;}catch (PDOException $e){}
      
      $consulta = $conexion->prepare('SELECT count(idempresa) FROM empresa ');
                 
      $consulta->execute();

      $objeto = $consulta->fetch();
      
      return $objeto;
   }

   public function validarInsertar(){
      try {$conexion = new conexion;}catch (PDOException $e){} 

      $consulta = $conexion->prepare('SELECT * FROM empresa WHERE (denominacion = :denominacion and 
      web = :web and idrubro = :idrubro and detactividad = :detactividad and idcategoria = :idcategoria and fechainicioce = :fechainicioce
      and activo = :activo and cuit = :cuit and importemensual = :importemensual and nrosocio = :nrosocio 
      and cantempleados = :cantempleados and numusuario = :numusuario)');
      
         
      $consulta->bindParam(':denominacion', $this->getDenominacion());

      $consulta->bindParam(':web', $this->getWeb());

      $consulta->bindParam(':idrubro', $this->getIdrubro());

      $consulta->bindParam(':detactividad', $this->getDetactividad());

      $consulta->bindParam(':cantempleados', $this->getCantempleados());

      $consulta->bindParam(':idcategoria', $this->getIdcategoria());

      $consulta->bindParam(':fechainicioce',$this->getFechainicioce());

      $consulta->bindParam(':activo', $this->getActivo());

      $consulta->bindParam(':cuit', $this->getCuit());

      $consulta->bindParam(':importemensual', $this->getImportemensual());

      $consulta->bindParam(':nrosocio', $this->getNrosocio());

      $consulta->bindParam(':numusuario', $this->getNumusuario());

      $consulta->execute();

      $objeto = $consulta->fetch(PDO::FETCH_OBJ);
      
      if ($objeto) {
         //Si el array de obejtos viene cargado
         return false;
      }else{
         return true;
      }


   }

	public function guardar(){
      try {$conexion = new conexion;}catch (PDOException $e){}
      
      if($this->getIdempresa()) /*Si tiene id entonces existe y solo lo modifico*/ {
         $consulta = $conexion->prepare('UPDATE empresa SET denominacion = :denominacion, web = :web, idrubro = :idrubro, 
         detactividad = :detactividad, idcategoria = :idcategoria, fechainicioce = :fechainicioce, activo = :activo,
         cuit = :cuit, fechafundacion = :fechafundacion, importemensual = :importemensual, nrosocio = :nrosocio, cantempleados = :cantempleados,
         numusuario = :numusuario WHERE idempresa = :idempresa');
         
         $consulta->bindParam('idempresa',$this->getIdempresa());

         $consulta->bindParam(':denominacion', $this->getDenominacion());

         $consulta->bindParam(':web', $this->getWeb());

         $consulta->bindParam(':idrubro', $this->getIdrubro());

         $consulta->bindParam(':detactividad', $this->getDetactividad());

         $consulta->bindParam(':cantempleados', $this->getCantempleados());

         $consulta->bindParam(':idcategoria', $this->getIdcategoria());

         $consulta->bindParam(':fechainicioce',$this->getFechainicioce());

         $consulta->bindParam(':activo', $this->getActivo());

         $consulta->bindParam(':cuit', $this->getCuit());

         $consulta->bindParam(':fechafundacion', $this->getFechafundacion());

         $consulta->bindParam(':importemensual', $this->getImportemensual());

         $consulta->bindParam(':nrosocio', $this->getNrosocio());
       
         $consulta->bindParam(':numusuario' ,$this->getNumusuario());
       
         $consulta->execute();

      }else /*si no tiene id es un campo mas apra la tabla.*/ {
         
         $consulta = $conexion->prepare('INSERT INTO empresa (denominacion, web, idrubro, detactividad, cantempleados, idcategoria, fechainicioce,
         activo, cuit,fechafundacion, importemensual, nrosocio,numusuario) VALUES(:denominacion,:web,:idrubro,:detactividad,:cantempleados,:idcategoria,:fechainicioce,
         :activo,:cuit,:fechafundacion,:importemensual,:nrosocio,:numusuario)');

         $consulta->bindParam(':denominacion', $this->getDenominacion());

         $consulta->bindParam(':web', $this->getWeb());

         $consulta->bindParam(':idrubro', $this->getIdrubro());

         $consulta->bindParam(':detactividad', $this->getDetactividad());

         $consulta->bindParam(':cantempleados', $this->getCantempleados());

         $consulta->bindParam(':idcategoria', $this->getIdcategoria());

         $consulta->bindParam(':fechainicioce',$this->getFechainicioce());

         $consulta->bindParam(':activo', $this->getActivo());

         $consulta->bindParam(':cuit', $this->getCuit());

         $consulta->bindParam(':fechafundacion', $this->getFechafundacion());

         $consulta->bindParam(':importemensual', $this->getImportemensual());

         $consulta->bindParam(':nrosocio', $this->getNrosocio());

         $consulta->bindParam(':numusuario' ,$this->getNumusuario());
      
         $consulta->execute();

         return $conexion->lastInsertId();
         
      }

      $conexion = null;
   }

   public function baja($idempresa){
      try {$conexion = new conexion;}catch (PDOException $e){} 
      $consulta = $conexion->prepare('DELETE FROM empresa WHERE idempresa =  :idempresa');

      $consulta->bindParam(':idempresa', $idempresa);
    
      $consulta->execute();
      
   }

    public function BuscarID($denominacion,$web,$rubroAJAX,$detactividad,$cantempleados,$categoriaAJAX,$fechainicioce,
    $activo,$cuit,$fechafundacion,$importemensual,$nrosocio){

      try {$conexion = new conexion;}catch (PDOException $e){} 

      $consulta = $conexion->prepare('SELECT * FROM empresa WHERE (denominacion = :denominacion and cuit = :cuit)');
      
      
      $consulta->bindParam(':denominacion', $denominacion);

      $consulta->bindParam(':cuit',$cuit);

      $consulta->execute();

      $resultado = $consulta->fetch();
      

      $objeto = new PDOempresa($resultado['idempresa'],$resultado['denominacion'],$resultado['web'],$resultado['idrubro'],
      $resultado['detactividad'],$resultado['cantempleados'],$resultado['idcategoria'],$resultado['fechainicioce'],
      $resultado['activo'],$resultado['cuit'],$resultado['fechafundacion'],$resultado['importemensual'],$resultado['nrosocio'],
      $resultado['numusuario']);

      return $objeto;

   }
   public static function buscarEmpresaNumeroUsuario($numusuario){
      try {$conexion = new conexion;}catch (PDOException $e){} 
      $consulta = $conexion->prepare('SELECT * FROM empresa WHERE (numusuario = :numusuario)');
      
      $consulta->bindParam(':numusuario',$numusuario);
      $consulta->execute();
      
      $objeto = $consulta->fetchAll(PDO::FETCH_OBJ);
               
      return $objeto;
   }

   public static function buscarEmpresa ($idempresa){
      try {$conexion = new conexion;}catch (PDOException $e){} 
      $consulta = $conexion->prepare('SELECT * FROM empresa WHERE (idempresa = :idempresa)');
      
      $consulta->bindParam(':idempresa', $idempresa);
    
      $consulta->execute();

      $resultado = $consulta->fetch();

      $objeto = new PDOempresa($resultado['idempresa'],$resultado['denominacion'],$resultado['web'],$resultado['idrubro'],
      $resultado['detactividad'],$resultado['cantempleados'],$resultado['idcategoria'],$resultado['fechainicioce'],$resultado['activo'],
      $resultado['cuit'],$resultado['fechafundacion'],$resultado['importemensual'],$resultado['nrosocio'],$resultado['numusuario']);
      
      return $objeto;

   }

   public static function buscarMedidor($numusuario){
     try {$conexion = new conexion;}catch (PDOException $e){}
               
     $consulta = $conexion->prepare('SELECT * FROM empresa WHERE numusuario = :numusuario');
               
     $consulta->bindParam(':numusuario',$numusuario);
     $consulta->execute();
               
     $objeto = $consulta->fetchAll(PDO::FETCH_OBJ);
               
     return $objeto;
   }

  
	
}
?>
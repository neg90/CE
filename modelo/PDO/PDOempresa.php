<?php

require_once '../modelo/conexionDB.php';
require_once '../modelo/clases/empresa.php';

class PDOempresa extends empresa{
	

	public function __construct ($idempresa,$denominacion,$web,$idrubro,$detactividad,$cantempleados,$idcategoria,$fechainicioce,$activo,
   $cuit,$fechafundacion,$importemensual,$nrosocio){

		parent::__construct($idempresa,$denominacion,$web,$idrubro,$detactividad,$cantempleados,$idcategoria,$fechainicioce,$activo,
      $cuit,$fechafundacion,$importemensual,$nrosocio);

	}

	
	public static function listar(){
		try {$conexion = new conexion;}catch (PDOException $e){}
		$consulta = $conexion->prepare('SELECT * FROM emrpesa');
		$consulta->execute();
		$objeto = $consulta->fetchAll(PDO::FETCH_OBJ);
		
		return $objeto;
	}

   public function validarInsertar(){
      try {$conexion = new conexion;}catch (PDOException $e){} 

      $consulta = $conexion->prepare('SELECT * FROM empresa WHERE (denominacion = :denominacion and 
      web = :web and idrubro = :idrubro and detactividad = :detactividad and idcategoria = :idcategoria and fechainicioce = :fechainicioce
      and activo = :activo and cuit = :cuit and fechafundacion = :fechafundacion and importemensual = :importemensual and nrosocio = :nrosocio 
      and cantempleados = :cantempleados)');
      
         
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
         cuit = :cuit, fechafundacion = :fechafundacion, importemensual = :importemensual, nrosocio = :nrosocio, cantempleados = :cantempleados 
         WHERE idempresa = :idempresa');
         
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
       
         $consulta->execute();

      }else /*si no tiene id es un campo mas apra la tabla.*/ {
         
         $consulta = $conexion->prepare('INSERT INTO empresa (denominacion, web, idrubro, detactividad, cantempleados, idcategoria, fechainicioce,
         activo, cuit,fechafundacion, importemensual, nrosocio) VALUES(:denominacion,:web,:idrubro,:detactividad,:cantempleados,:idcategoria,:fechainicioce,
         :activo,:cuit,:fechafundacion,:importemensual,:nrosocio)');

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
      
         $consulta->execute();
         
      }

      $conexion = null;
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
      $resultado['activo'],$resultado['cuit'],$resultado['fechafundacion'],$resultado['importemensual'],$resultado['nrosocio']);

      return $objeto;

   }

   /*public function buscarContacto ($idcontacto){
      try {$conexion = new conexion;}catch (PDOException $e){} 
      $consulta = $conexion->prepare('SELECT * FROM contacto WHERE (idcontacto = :idcontacto)');
      
      $consulta->bindParam(':idcontacto', $idcontacto);
    
      $consulta->execute();

      $resultado = $consulta->fetch();
     
      $objeto = new PDOcontacto($resultado['idcontacto'],$resultado['nombre'],$resultado['apellido'],$resultado['telefono'],
      $resultado['domicilio'],$resultado['correo'],$resultado['asociadosm'],$resultado['tipodocumento'],$resultado['documento']);
      
      return $objeto;

   }

   public function baja($idcontacto){
      try {$conexion = new conexion;}catch (PDOException $e){} 
      $consulta = $conexion->prepare('DELETE FROM contacto WHERE idcontacto =  :idcontacto');

      $consulta->bindParam(':idcontacto', $idcontacto);
    
      $consulta->execute();
      
   }*/
	
}
?>
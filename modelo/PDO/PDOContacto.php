<?php

require_once '../modelo/conexionDB.php';
require_once '../modelo/clases/contacto.php';

class PDOcontacto extends contacto{
	

	public function __construct ($idcontacto,$nombre,$apellido,$telefono,$domicilio,$correo,$asociadosm,$tipodocumento,$documento){

		parent::__construct($idcontacto,$nombre,$apellido,$telefono,$domicilio,$correo,$asociadosm,$tipodocumento,$documento);
	}

	
	public static function listar(){
		try {$conexion = new conexion;}catch (PDOException $e){}
		$consulta = $conexion->prepare('SELECT * FROM contacto');
		$consulta->execute();
		$objeto = $consulta->fetchAll(PDO::FETCH_OBJ);
		
		return $objeto;
	}
   
   public static function listarPaginacion($valor,$cantResultados){
     
      try {$conexion = new conexion;}catch (PDOException $e){}
      $consulta = $conexion->prepare('SELECT * FROM contacto LIMIT :valor,:cantResultados');
      $consulta->bindParam(':valor', $valor,PDO::PARAM_INT);
      $consulta->bindParam(':cantResultados', $cantResultados,PDO::PARAM_INT);
      $consulta->execute();
      $objeto = $consulta->fetchAll(PDO::FETCH_OBJ);
      
      return $objeto;
   }

   public function validarInsertar(){
      try {$conexion = new conexion;}catch (PDOException $e){} 
      $consulta = $conexion->prepare('SELECT * FROM contacto WHERE (nombre = :nombre and apellido = :apellido and 
      telefono = :telefono and domicilio = :domicilio and tipodocumento = :tipodocumento and documento = :documento and correo = :correo)');
      
      
      $consulta->bindParam(':nombre', $this->getNombre());
      $consulta->bindParam(':apellido', $this->getApellido());
      $consulta->bindParam(':telefono', $this->getTelefono());
      $consulta->bindParam(':domicilio', $this->getDomicilio());
      $consulta->bindParam(':tipodocumento', $this->getTipodocumento());
      $consulta->bindParam(':documento', $this->getDocumento());
      $consulta->bindParam(':correo',$this->getCorreo());


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
      
      if($this->getIdcontacto()) /*Si tiene id entonces existe y solo lo modifico*/ {
         $consulta = $conexion->prepare('UPDATE contacto SET nombre = :nombre, apellido = :apellido, 
         telefono = :telefono, domicilio = :domicilio, correo = :correo, asociadosm = :asociadosm, activo = :activo, tipodocumento = :tipodocumento, 
         documento = :documento WHERE idcontacto = :idcontacto');
         
         $consulta->bindParam(':nombre', $this->getNombre());
         $consulta->bindParam(':apellido', $this->getApellido());
         $consulta->bindParam(':telefono', $this->getTelefono());
         $consulta->bindParam(':domicilio', $this->getDomicilio());
         $consulta->bindParam(':correo', $this->getCorreo());
         $consulta->bindParam(':asociadosm', $this->getAsociadosm());
         $consulta->bindParam(':activo', $this->getActivo());
         $consulta->bindParam(':idcontacto', $this->getIdcontacto());
         $consulta->bindParam(':tipodocumento', $this->getTipodocumento());
         $consulta->bindParam(':documento', $this->getDocumento());
         $consulta->execute();

      }else /*si no tiene id es un campo mas apra la tabla.*/ {
         
         $consulta = $conexion->prepare('INSERT INTO contacto (nombre, apellido, telefono, domicilio, correo, asociadosm, activo,
         tipodocumento, documento) VALUES(:nombre,:apellido,:telefono,:domicilio,:correo,:asociadosm,:activo,:tipodocumento,:documento)');
         
         $consulta->bindParam(':nombre', $this->getNombre());
         $consulta->bindParam(':apellido', $this->getApellido());
         $consulta->bindParam(':telefono', $this->getTelefono());
         $consulta->bindParam(':domicilio', $this->getDomicilio());
         $consulta->bindParam(':correo', $this->getCorreo());
         $consulta->bindParam(':asociadosm', $this->getAsociadosm());
         $consulta->bindParam(':activo', $this->getActivo());
         $consulta->bindParam(':tipodocumento', $this->getTipodocumento());
         $consulta->bindParam(':documento', $this->getDocumento());

         $consulta->execute();
         return $conexion->lastInsertId();
      }

      $conexion = null;
   }

   public static  function buscarContacto ($idcontacto){
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
      
   }

   public static function filtroActivo($datoActivo){
      if ($datoActivo=='2') $datoActivo=0;

      try{
         $conexion=new conexion; //creo la instancia de la conexión
      }
      catch (PDOException $e){}
      $consulta = $conexion->prepare("SELECT * FROM contacto WHERE activo = :datoActivo");
      $consulta->bindParam(':datoActivo',$datoActivo);
      $consulta->execute();
      $objeto = $consulta->fetchAll(PDO::FETCH_OBJ);
      return $objeto;
   }

   public static function filtroNomyAp($NomyAp){
      try{
         $conexion=new conexion; //creo la instancia de la conexión
      }
      catch (PDOException $e){}
      $consulta = $conexion->prepare("SELECT * FROM contacto WHERE ((nombre LIKE concat('%',:nomyap,'%')) OR (apellido LIKE concat('%',:nomyap,'%')))");
      $consulta->bindParam(':nomyap',$NomyAp);
      $consulta->execute();
      $objeto = $consulta->fetchAll(PDO::FETCH_OBJ);

      if ($objeto == null){ //Si es null, puede ser que esté buscando el nombre completo.
         $datosSeparados = explode(" ",$NomyAp); //Separo la cadena $NomyAp, me devuelve un string
         if (!empty($datosSeparados)){
            for ($i=1; $i< count($datosSeparados); $i++){ //Busco por separado.
               $consulta = $conexion->prepare("SELECT * FROM contacto WHERE ((nombre LIKE concat('%',:nomyap,'%')) OR (apellido LIKE concat('%',:nomyap,'%')))");
               $consulta->bindParam(':nomyap',$datosSeparados[$i]);
               $consulta->execute();
               $objeto = $consulta->fetchAll(PDO::FETCH_OBJ);
               if ($objeto) break;
            }
         }
      }

      return $objeto;
   }

   public static function filtroTelefono($telefono){
      try{
         $conexion=new conexion; //creo la instancia de la conexión
      }
      catch (PDOException $e){}
      $consulta = $conexion->prepare("SELECT * FROM contacto WHERE (telefono LIKE concat('%',:telefono,'%'))");
      $consulta->bindParam(':telefono',$telefono);
      $consulta->execute();
      $objeto = $consulta->fetchAll(PDO::FETCH_OBJ);
      return $objeto;
   }

   public static function filtroDocumento($documento){
      try{
         $conexion=new conexion; //creo la instancia de la conexión
      }
      catch (PDOException $e){}
      $consulta = $conexion->prepare("SELECT * FROM contacto WHERE (documento LIKE concat('%',:documento,'%'))");
      $consulta->bindParam(':documento',$documento);
      $consulta->execute();
      $objeto = $consulta->fetchAll(PDO::FETCH_OBJ);
      return $objeto;
   }
	
   public static function filtroCorreo($correo){
      try{
         $conexion=new conexion; //creo la instancia de la conexión
      }
      catch (PDOException $e){}
      $consulta = $conexion->prepare("SELECT * FROM contacto WHERE (correo LIKE concat('%',:correo,'%'))");
      $consulta->bindParam(':correo',$correo);
      $consulta->execute();
      $objeto = $consulta->fetchAll(PDO::FETCH_OBJ);
      return $objeto;
   }

   public static function filtroAsociadosSM($dato){
      try{
         $conexion=new conexion; //creo la instancia de la conexión
      }
      catch (PDOException $e){}
      if ($dato == 2) $dato = 0;
      $consulta = $conexion->prepare("SELECT * FROM contacto WHERE (asociadosm LIKE concat('%',:dato,'%'))");
      $consulta->bindParam(':dato',$dato);
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
         'SELECT * FROM contacto WHERE idcontacto NOT IN 
            (SELECT idcontacto FROM contactoempresa)');

      $consulta->execute();
      $objeto = $consulta->fetchAll(PDO::FETCH_OBJ);
      return $objeto;
   }

}
?>
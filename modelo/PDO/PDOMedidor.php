<?php

require_once '../modelo/conexionDB.php';
require_once '../modelo/clases/medidor.php';

class PDOMedidor extends medidor{
	

	public function	__construct ($id,$nomyap,$telefono,$domicilio,$importepago,$numusuario,$numsuministro,$activo,$fechadeultimopago){
		
		parent::__construct($id,$nomyap,$telefono,$domicilio,$importepago,$numusuario,$numsuministro,$activo,$fechadeultimopago);
	
	}
   /* FILTROS */

   public static function filtroNomyAp($NomyAp){
      try{
         $conexion=new conexion; //creo la instancia de la conexión
      }
      catch (PDOException $e){}
      $consulta = $conexion->prepare("SELECT * FROM medidor WHERE (nomyap LIKE concat('%',:nomyap,'%'))");
      $consulta->bindParam(':nomyap',$NomyAp);
      $consulta->execute();
      $objeto = $consulta->fetchAll(PDO::FETCH_OBJ);

      if ($objeto == null){ //Si es null, puede ser que esté buscando el nombre completo.
         $datosSeparados = explode(" ",$NomyAp); //Separo la cadena $NomyAp, me devuelve un string
         if (!empty($datosSeparados)){
            for ($i=1; $i< count($datosSeparados); $i++){ //Busco por separado.
               $consulta = $conexion->prepare("SELECT * FROM medidor WHERE (nomyap LIKE concat('%',:nomyap,'%'))");
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
      $consulta = $conexion->prepare("SELECT * FROM medidor WHERE (telefono LIKE concat('%',:telefono,'%'))");
      $consulta->bindParam(':telefono',$telefono);
      $consulta->execute();
      $objeto = $consulta->fetchAll(PDO::FETCH_OBJ);
      return $objeto;
   }

   public static function filtroDomicilio($domicilio){
      try{
         $conexion=new conexion; //creo la instancia de la conexión
      }
      catch (PDOException $e){}
      $consulta = $conexion->prepare("SELECT * FROM medidor WHERE (domicilio LIKE concat('%',:domicilio,'%'))");
      $consulta->bindParam(':domicilio',$domicilio);
      $consulta->execute();
      $objeto = $consulta->fetchAll(PDO::FETCH_OBJ);
      return $objeto;
   }

   public static function filtroNumusuario($numusuario){
      try{
         $conexion=new conexion; //creo la instancia de la conexión
      }
      catch (PDOException $e){}
      $consulta = $conexion->prepare("SELECT * FROM medidor WHERE (numusuario LIKE concat('%',:numusuario,'%'))");
      $consulta->bindParam(':numusuario',$numusuario);
      $consulta->execute();
      $objeto = $consulta->fetchAll(PDO::FETCH_OBJ);
      return $objeto;
   }

   public static function filtroNumsuministro($numsuministro){
      try{
         $conexion=new conexion; //creo la instancia de la conexión
      }
      catch (PDOException $e){}
      $consulta = $conexion->prepare("SELECT * FROM medidor WHERE (numsuministro LIKE concat('%',:numsuministro,'%'))");
      $consulta->bindParam(':numsuministro',$numsuministro);
      $consulta->execute();
      $objeto = $consulta->fetchAll(PDO::FETCH_OBJ);
      return $objeto;
   }



   /* FIN FILTROS */
	
	public static function listarMedidores(){
		try{
			$conexion=new conexion; //creo la instancia de la conexión
		}
		catch (PDOException $e){}
		$consulta = $conexion->prepare('SELECT * FROM medidor');
		$consulta->execute();
		$objeto = $consulta->fetchAll(PDO::FETCH_OBJ);
		return $objeto;
	}

	public static function medidorPorID($idmedidor){
		try{
			$conexion=new conexion; //creo la instancia de la conexión
		}
		catch (PDOException $e){}
		$consulta = $conexion->prepare('SELECT * FROM medidor WHERE idmedidor = :idmedidor');
		$consulta -> bindParam(':idmedidor',$idmedidor);
		$consulta->execute();
		$objeto = $consulta->fetch(PDO::FETCH_OBJ);
		return $objeto;
	}

	public function guardar(){
      try {$conexion = new conexion;}catch (PDOException $e){}
      if($this->getIdmedidor()) /*Si tiene id entonces existe y solo lo modifico*/ {
         //$id,$idcontacto,$nomyap,$telefono,$domicio,$importepago,$numusuario,$numsuministro,$activo
         $consulta = $conexion->prepare('UPDATE medidor SET nomyap = :nomyap, telefono = :telefono, domicilio = :domicilio, importepago = :importepago, numusuario = :numusuario, numsuministro = :numsuministro, activo = :activo ,fechadeultimopago = :fechadeultimopago WHERE idmedidor = :idmedidor');
         
         $consulta->bindParam(':idmedidor', $this->getIdmedidor());
         $consulta->bindParam(':nomyap', $this->getNomyap());
         $consulta->bindParam(':telefono', $this->getTelefono());
         $consulta->bindParam(':domicilio', $this->getDomicilio());
         $consulta->bindParam(':importepago', $this->getImportepago());
         $consulta->bindParam(':numusuario', $this->getNumusuario());
         $consulta->bindParam(':numsuministro', $this->getNumsuministro());
         $consulta->bindParam(':activo', $this->getActivo());
         $consulta->bindParam(':fechadeultimopago',$this->getFechadeultimopago());
         $consulta->execute();

      }else /*si no tiene id es un campo mas apra la tabla.*/ {
         $consulta = $conexion->prepare('INSERT INTO medidor (nomyap, telefono, domicilio, importepago, numusuario, numsuministro, activo,fechadeultimopago) 
         VALUES(:nomyap, :telefono, :domicilio, :importepago, :numusuario, :numsuministro, :activo,:fechadeultimopago)');         
         
         $consulta->bindParam(':nomyap', $this->getNomyap());
         $consulta->bindParam(':telefono', $this->getTelefono());
         $consulta->bindParam(':domicilio', $this->getDomicilio());
         $consulta->bindParam(':importepago', $this->getImportepago());
         $consulta->bindParam(':numusuario', $this->getNumusuario());
         $consulta->bindParam(':numsuministro', $this->getNumsuministro());
         $consulta->bindParam(':activo', $this->getActivo());
         $consulta->bindParam(':fechadeultimopago',$this->getFechadeultimopago());
         $consulta->execute();
         return $conexion->lastInsertId();
         
      }

      $conexion = null;
   }

   public static function borrar($idmedidor){
      try{
         $conexion=new conexion; //creo la instancia de la conexión
      }
      catch (PDOException $e){}
      $consulta = $conexion->prepare('DELETE FROM medidor WHERE idmedidor = :idmedidor');
      $consulta->bindParam(':idmedidor', $idmedidor);
      $consulta->execute();
      if (empty(self::medidorPorID($idmedidor))){ //si no se encuentra el usuario, lo eliminó
         return 1;
      }
      else return 0;
   }

   public function validarInsertar(){

      try {$conexion = new conexion;}catch (PDOException $e){} 

      $consulta = $conexion->prepare('SELECT * FROM medidor WHERE (numusuario = :numusuario)');
      
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

   public static function borrartodoslosmedidoresporquedaaltapajadesdephpmyadmin(){
       try{
         $conexion=new conexion; //creo la instancia de la conexión
      }
      catch (PDOException $e){}
      $consulta = $conexion->prepare('DELETE FROM medidor');
      $consulta->execute();
      
   }

   public static function medidorporNumusuario($numusuario){
      try{$conexion=new conexion;}catch (PDOException $e){}
     
      $consulta = $conexion->prepare('SELECT * FROM medidor WHERE numusuario = :numusuario');

      $consulta->bindParam(':numusuario', $numusuario);

      $consulta->execute();
      $resultado = $consulta->fetch();
      
      $objeto = new PDOMedidor ($resultado['idmedidor'],$resultado['nomyap'],$resultado['telefono'],
      $resultado['domicilio'],$resultado['importepago'],$resultado['numusuario'],$resultado['numsuministro'],
      $resultado['activo'],$resultado['fechadeultimopago']);
     
      return $objeto;
   }

  /* public static function existeMedidor($numusuario, $numsuministro){
      try{
         $conexion=new conexion; //creo la instancia de la conexión
      }
      catch (PDOException $e){}
      $consulta = $conexion->prepare('SELECT * FROM medidor WHERE numusuario = :numusuario AND numsuministro = :numsuministro');
      $consulta->bindParam(':numusuario', $numusuario);
      $consulta->bindParam(':numsuministro', $numsuministro);
      $consulta->execute();
      $objeto = $consulta->fetch(PDO::FETCH_OBJ);
      return $objeto;
   }*/
}
?>
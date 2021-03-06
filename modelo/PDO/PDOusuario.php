<?php

require_once '../modelo/conexionDB.php';
require_once '../modelo/clases/usuario.php';

class PDOusuario extends usuario{
	

	public function __construct ($nombre,$apellido,$username,$password,$activo,$correo,$idrol){

		parent::__construct($nombre,$apellido,$username,$password,$activo,$correo,$idrol);
	}

	public static function verificarUser($unusername,$unapassword){
		try {
		$conexion = new conexion; //creo instancia de la conexion
		}catch (PDOException $e){}
		$consulta = $conexion->prepare('SELECT * FROM usuario WHERE username = :username and password = :password');
		$consulta->bindParam(':username',$unusername);
		$consulta->bindParam(':password',$unapassword);
		$consulta->execute();
		$existe=$consulta->fetch();
		if($existe==true){
			return 1;
		}else{
			return 0;
		}	
			

	}
//revisar
	public function buscarUser ($user,$password){
		try {
		$conexion = new conexion; //creo instancia de la conexion
		}catch (PDOException $e){}
		$consulta = $conexion->prepare('SELECT * FROM usuario WHERE username = :username and password = :password');
		$consulta->bindParam(':username',$user);
		$consulta->bindParam(':password',$password);
		$consulta->execute();
		return $existe=$consulta->fetch();

	}


	public static function modificar($user,$password){
		try {
		$conexion = new conexion; //creo instancia de la conexion
		}catch (PDOException $e){}
		$consulta = $conexion->prepare('UPDATE usuario SET username = :username AND password = :password  WHERE username = :username');
		$consulta->bindParam(':username',$unusername);
		$consulta->bindParam(':password',$unapassword);
		$consulta->execute();
		
	}

	public static function listarUsuarios(){
		try{
			$conexion=new conexion; //creo la instancia de la conexión
		}
		catch (PDOException $e){}
		$consulta = $conexion->prepare('SELECT * FROM usuario');
		$consulta->execute();
		$objeto = $consulta->fetchAll(PDO::FETCH_OBJ);
		return $objeto;
	}

	public static function filtroActivo($activo){
		try{
			$conexion=new conexion; //creo la instancia de la conexión
		}
		catch (PDOException $e){}
		$consulta = $conexion->prepare('SELECT * FROM usuario WHERE activo = :activo');
		$consulta->bindParam(':activo',$activo);
		$consulta->execute();
		$objeto = $consulta->fetchAll(PDO::FETCH_OBJ);
		return $objeto;
	}

	public static function filtroNomyAp($NomyAp){
		try{
			$conexion=new conexion; //creo la instancia de la conexión
		}
		catch (PDOException $e){}
		$consulta = $conexion->prepare("SELECT * FROM usuario WHERE ((nombre LIKE concat('%',:nomyap,'%')) OR (apellido LIKE concat('%',:nomyap,'%')))");
		$consulta->bindParam(':nomyap',$NomyAp);
		$consulta->execute();
		$objeto = $consulta->fetchAll(PDO::FETCH_OBJ);

		if ($objeto == null){ //Si es null, puede ser que esté buscando el nombre completo.
			$datosSeparados = explode(" ",$NomyAp); //Separo la cadena $NomyAp, me devuelve un string
			if (!empty($datosSeparados)){
				for ($i=1; $i< count($datosSeparados); $i++){ //Busco por separado.
					$consulta = $conexion->prepare("SELECT * FROM usuario WHERE ((nombre LIKE concat('%',:nomyap,'%')) OR (apellido LIKE concat('%',:nomyap,'%')))");
					$consulta->bindParam(':nomyap',$datosSeparados[$i]);
					$consulta->execute();
					$objeto = $consulta->fetchAll(PDO::FETCH_OBJ);
					if ($objeto) break;
				}
			}
		}

		return $objeto;
	}

	public static function filtroUsuario($usuario){
		try{
			$conexion=new conexion; //creo la instancia de la conexión
		}
		catch (PDOException $e){}
		$consulta = $conexion->prepare("SELECT * FROM usuario WHERE (username LIKE concat('%',:usuario,'%'))");
		$consulta->bindParam(':usuario',$usuario);
		$consulta->execute();
		$objeto = $consulta->fetchAll(PDO::FETCH_OBJ);
		return $objeto;
	}

	public static function filtroEmail($email){
		try{
			$conexion=new conexion; //creo la instancia de la conexión
		}
		catch (PDOException $e){}
		$consulta = $conexion->prepare("SELECT * FROM usuario WHERE (correo LIKE concat('%',:email,'%'))");
		$consulta->bindParam(':email',$email);
		$consulta->execute();
		$objeto = $consulta->fetchAll(PDO::FETCH_OBJ);
		return $objeto;
	}

	public static function filtroRol($idrol){
		try{
			$conexion=new conexion; //creo la instancia de la conexión
		}
		catch (PDOException $e){}
		$consulta = $conexion->prepare("SELECT * FROM usuario WHERE (idrol LIKE concat('%',:idrol,'%'))");
		$consulta->bindParam(':idrol',$idrol);
		$consulta->execute();
		$objeto = $consulta->fetchAll(PDO::FETCH_OBJ);
		return $objeto;
	}

	public static function detalleUsuario($idusuario){
		try {
		$conexion = new conexion; //creo instancia de la conexion
		}catch (PDOException $e){}
		$consulta = $conexion->prepare('SELECT * FROM usuario WHERE idusuario = :id');
		$consulta->bindParam(':id',$idusuario);
		$consulta->execute();
		$objeto = $consulta->fetch(PDO::FETCH_OBJ);
		return $objeto;
	}

	public static function baja($idusuario){
		try {
		$conexion = new conexion; //creo instancia de la conexion
		}catch (PDOException $e){}
		$usuario=self::detalleUsuario($idusuario);
		if ($usuario->activo) $activo=0;
								 else $activo=1;


		$consulta = $conexion->prepare('UPDATE usuario SET activo = :activo WHERE idusuario = :id');
		$consulta->bindParam(':id',$idusuario);
		$consulta->bindParam(':activo',$activo);
		$consulta->execute();
		$objeto = $consulta->fetch(PDO::FETCH_OBJ);
		return $objeto;
	}

	public static function eliminar($idusuario){
		try {
		$conexion = new conexion; //creo instancia de la conexion
		}catch (PDOException $e){}
		//ELIMINAR USUARIO
		$consulta = $conexion->prepare('DELETE FROM usuario WHERE idusuario = :idusuario');
		$consulta->bindParam(':idusuario', $idusuario);
		$consulta->execute();

		if (empty(self::detalleUsuario($idusuario))){ //si no se encuentra el usuario, lo eliminó
			return 1;
		}
		else return 0;
	}


	public function guardar(){
      try {$conexion = new conexion;}catch (PDOException $e){}
      if($this->getIdusuario()) /*Si tiene id entonces existe y solo lo modifico*/ {
         $consulta = $conexion->prepare('UPDATE usuario SET nombre = :nombre, apellido = :apellido, 
         username = :username, password = :password, activo = :activo, correo = :correo, idrol = :idrol WHERE idusuario = :idusuario');
         
         $consulta->bindParam(':nombre', $this->getNombre());
         $consulta->bindParam(':apellido', $this->getApellido());
         $consulta->bindParam(':username', $this->getUsername());
         $consulta->bindParam(':password', $this->getPassword());
         $consulta->bindParam(':activo', $this->getActivo());
         $consulta->bindParam(':correo', $this->getCorreo());
         $consulta->bindParam(':idrol', $this->getIdrol());
         $consulta->bindParam(':idusuario', $this->getIdusuario());
         $consulta->execute();

      }else /*si no tiene id es un campo mas apra la tabla.*/ {
         $consulta = $conexion->prepare('INSERT INTO usuario (nombre, apellido, username, password, activo, correo, idrol) 
         VALUES(:nombre, :apellido, :username, :password, :activo, :correo, :idrol)');
         
         
         $consulta->bindParam(':nombre', $this->getNombre());
         $consulta->bindParam(':apellido', $this->getApellido());
         $consulta->bindParam(':username', $this->getUsername());
         $consulta->bindParam(':password', $this->getPassword());
         $consulta->bindParam(':activo', $this->getActivo());
         $consulta->bindParam(':correo', $this->getCorreo());
         $consulta->bindParam(':idrol', $this->getIdrol());
         $consulta->execute();
         
      }

      $conexion = null;
   }

   public static function emailExiste($email){
		try {
		$conexion = new conexion; //creo instancia de la conexion
		}catch (PDOException $e){}
		$consulta = $conexion->prepare('SELECT * FROM usuario WHERE correo = :email');
		$consulta->bindParam(':email', $email);
		$consulta->execute();
		$objeto = $consulta->fetch(PDO::FETCH_OBJ);
      	return $objeto;
	}

	public static function buscarPorUsuario($username){
		try {
		$conexion = new conexion; //creo instancia de la conexion
		}catch (PDOException $e){}
		$consulta = $conexion->prepare('SELECT * FROM usuario WHERE username = :username');
		$consulta->bindParam(':username', $username);
		$consulta->execute();
		$objeto = $consulta->fetch(PDO::FETCH_OBJ);
      	return $objeto;
	}
	public static function buscarPorUsuarioArray($username){
		try {
		$conexion = new conexion; //creo instancia de la conexion
		}catch (PDOException $e){}
		$consulta = $conexion->prepare('SELECT * FROM usuario WHERE username = :username');
		$consulta->bindParam(':username', $username);
		$consulta->execute();
		$objeto = $consulta->fetch();
      	return $objeto;
	}

}
?>
<?php

class usuario {
	//Atributos
	private $id;
	private $username;
	private $nombre;
	private $apellido;
	private $password;
	private $correo;
	private $activo;	
	private $idrol;
	

	public function	__construct ($id,$username,$correo,$password,$nombre,$apellido,$idrol) {
		//Se crea activo el user
		$this->id = $id;
		$this->nombre = $nombre;
		$this->apellido = $apellido;
		$this->username = $username;
		$this->correo = $correo;
		$this->password = $password;
		$this->activo = true;
		$this->idrol = $idrol;
	}

	//id
	public function getId(){
		return $this->id;
	}

	//nombre
	public function getNombre(){
		return $this->nombre;
	}

	public function setNombre($nombre){
		$this->nombre = $nombre;
		return $this;
	}

	//Activo
	public function getActivo(){
		return $this->activo;
	}

	public function setActivo($activo){
		$this->activo = $activo;
		return $this;
	}

	//idrol
	public function getIdrol(){
		return $this->idrol;
	}

	public function setIdrol($idrol){
		$this->idrol = $idrol;
		return $this;
	}


	//apellido
	public function getApellido(){
		return $this->apellido;
	}

	public function setApellido($apellido){
		$this->apellido = $apellido;
		return $this;
	}
	
	//username
	public function getUsername(){
		return $this->username;
	}

	public function setUsername($username){
		$this->username = $username;
		return $this;
	}

	//Correo
	public function getCorreo () {
		return $this->correo;
	}

	public function setCorreo ($correo) {
		$this->correo = $correo;
		return $this;
	}

	//Password
	public function getPassword(){
		return $this->password;
	}

	public function setPassword($password){
		$this->password = $password;
		return $this;
	}
}
?>
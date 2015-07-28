<?php

class convenios {
	//Atributos
	private $id;
	private $nombre;
	private $descripcion;
	private $contacto;
	private $correo;
	private $web;
	private $telefono;
	private $domicilio;
	
	public function	__construct($id,$nombre,$descripcion,$contacto,$correo,$web,$telefono,$domicilio) {
	
		$this->id = $id;
		$this->nombre = $nombre;
		$this->descripcion = $descripcion;
		$this->contacto = $contacto;
		$this->correo = $correo;
		$this->web = $web;
		$this->telefono = $telefono;
		$this->domicilio = $domicilio;
		
	}

	public function setId($id){
		$this->id = $id;
	}

	public function getNombre(){
		return $this->nombre;
	}

	public function setNombre($nombre){
		$this->nombre = $nombre;
	}

	public function getDescripcion(){
		return $this->descripcion;
	}

	public function setDescripcion($descripcion){
		$this->descripcion = $descripcion;
	}

	public function getContacto(){
		return $this->contacto;
	}

	public function setContacto($contacto){
		$this->contacto = $contacto;
	}

	public function getCorreo(){
		return $this->correo;
	}

	public function setCorreo($correo){
		$this->correo = $correo;
	}

	public function getWeb(){
		return $this->web;
	}

	public function setWeb($web){
		$this->web = $web;
	}

	public function getTelefono(){
		return $this->telefono;
	}

	public function setTelefono($telefono){
		$this->telefono = $telefono;
	}

	public function getDomicilio(){
		return $this->domicilio;
	}

	public function setDomicilio($domicilio){
		$this->domicilio = $domicilio;
	}

	
}

?>
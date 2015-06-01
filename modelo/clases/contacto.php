<?php

class contacto {
	//Atributos
	private $idcontacto;
	private $nombre;
	private $apellido;
	private $telefono;
	private $domicilio;
	private $correo;
	private $asociadosm;
	private $activo;
	

	public function	__construct($nombre,$apellido,$telefono,$domicilio,$correo,$asociadosm,$activo) {

		$this->nombre = $nombre;
		$this->apellido = $apellido;
		$this->telefono = $telefono;
		$this->domicilio = $domicilio;
		$this->correo = $correo;
		$this->asociadosm = $asociadosm;
		$this->activo = true;
	
	}

	public function getIdcontacto(){
		return $this->idcontacto;
	}

	public function getNombre(){
		return $this->nombre;
	}

	public function setNombre($nombre){
		$this->nombre = $nombre;
	}

	public function getApellido(){
		return $this->apellido;
	}

	public function setApellido($apellido){
		$this->apellido = $apellido;
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

	public function getCorreo(){
		return $this->correo;
	}

	public function setCorreo($correo){
		$this->correo = $correo;
	}

	public function getAsociadosm(){
		return $this->asociadosm;
	}

	public function setAsociadosm($asociadosm){
		$this->asociadosm = $asociadosm;
	}

	public function getActivo(){
		return $this->activo;
	}

	public function setActivo($activo){
		$this->activo = $activo;
	}

}
?>
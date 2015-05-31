<?php

class contacto {
	//Atributos
	private $idcontacto;
	private $nombre;
	private $apellido;
	private $telefono;
	private $domicio;
	private $correo;
	private $asociadosm;
	private $activo;
	

	public function	__construct($idcontacto,$nombre,$apellido,$telefono,$domicio,$correo,$asociadosm,$activo) {
	
		$this->idcontacto = $idcontacto;
		
		$this->nombre = $nombre;
		$this->apellido = $apellido;
		$this->telefono = $telefono;
		$this->domicio = $domicio;
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

	public function getDomicio(){
		return $this->domicio;
	}

	public function setDomicio($domicio){
		$this->domicio = $domicio;
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
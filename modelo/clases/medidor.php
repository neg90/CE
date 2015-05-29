<?php

class medidor {
	//Atributos
	private $idmedidor;
	private $nombre;
	private $apellido;
	private $telefono;
	private $domicio;
	private $importepago;
	private $numusuario;
	private $numsuministro;
	private $activo;
	

	public function	__construct($id,$idcontacto,$nombre,$apellido,$telefono,$domicio,$importepago,$numusuario,$numsuministro,$activo) {
	
		$this->idcontacto = $idcontacto;
		
		$this->nombre = $nombre;
		$this->apellido = $apellido;
		$this->telefono = $telefono;
		$this->domicio = $domicio;
		$this->importepago = $importepago;
		$this->numusuario = $numusuario;
		$this->numsuministro = $numsuministro;
		$this->activo = true;
	
	}

	public function getIdmedidor(){
		return $this->idmedidor;
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

	public function getImportepago(){
		return $this->importepago;
	}

	public function setImportepago($importepago){
		$this->importepago = $importepago;
	}

	public function getNumusuario(){
		return $this->numusuario;
	}

	public function setNumusuario($numusuario){
		$this->numusuario = $numusuario;
	}

	public function getNumsuministro(){
		return $this->numsuministro;
	}

	public function setNumsuministro($numsuministro){
		$this->numsuministro = $numsuministro;
	}

	public function getActivo(){
		return $this->activo;
	}

	public function setActivo($activo){
		$this->activo = $activo;
	}

	

}
?>
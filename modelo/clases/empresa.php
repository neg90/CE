<?php

class empresa {
	//Atributos
	private $idempresa;
	private $denominacion;
	private $telefono;
	private $domicilio;
	private $web;
	private $idrubro;
	private $detactividad;
	private $cantempleados;
	private $idcategoria;
	private $fechainicioce;
	private $nrosocio;  //de momento autoincremental. no tiene set!!
	private $activo;

	public function	__construct($idempresa,$denominacion,$telefono,$domicilio,$web,$idrubro,
	$detactividad,$cantempleados,$idcategoria,$fechainicioce,$nrosocio,$activo) {
	
		$this->idempresa = $idempresa;
		$this->denominacion = $denominacion;
		$this->telefono = $telefono;
		$this->domicilio = $domicilio;
		$this->web = $web;
		$this->idrubro = $idrubro;
		$this->detactividad = $detactividad;
		$this->cantempleados = $cantempleados;
		$this->idcategoria = $idcategoria;
		$this->fechainicioce = $fechainicioce;
		$this->nrosocio = $nrosocio;
		$this->activo = true;
	
	}

	public function getIdempresa(){
		return $this->idempresa;
	}

	public function getDenominacion(){
		return $this->denominacion;
	}

	public function setDenominacion($denominacion){
		$this->denominacion = $denominacion;
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

	public function getWeb(){
		return $this->web;
	}

	public function setWeb($web){
		$this->web = $web;
	}

	public function getIdrubro(){
		return $this->idrubro;
	}

	public function setIdrubro($idrubro){
		$this->idrubro = $idrubro;
	}

	public function getDetactividad(){
		return $this->detactividad;
	}

	public function setDetactividad($detactividad){
		$this->detactividad = $detactividad;
	}

	public function getCantempleados(){
		return $this->cantempleados;
	}

	public function setCantempleados($cantempleados){
		$this->cantempleados = $cantempleados;
	}

	public function getIdcategoria(){
		return $this->idcategoria;
	}

	public function setIdcategoria($idcategoria){
		$this->idcategoria = $idcategoria;
	}

	public function getFechainicioce(){
		return $this->fechainicioce;
	}

	public function setFechainicioce($fechainicioce){
		$this->fechainicioce = $fechainicioce;
	}

	public function getNrosocio(){
		return $this->nrosocio;
	}

	public function setActivo($activo){
		$this->activo = $activo;
	}
	public function getActivo(){
		return $this->activo;
	}

}
?>
<?php

class empresa {
	//Atributos
	private $idempresa;
	private $denominacion;
	private $web;
	private $idrubro;
	private $detactividad;
	private $cantempleados;
	private $idcategoria;
	private $fechainicioce;
	private $nrosocio;  //de momento autoincremental. no tiene set!!
	private $activo;
	private $cuit;
	private $fechafundacion;
	private $importemensual;

	public function	__construct($idempresa,$denominacion,$web,$idrubro,$detactividad,$cantempleados,$idcategoria,$fechainicioce,
	$activo,$cuit,$fechafundacion,$importemensual) {
	
		$this->idempresa = $idempresa;
		$this->denominacion = $denominacion;
		$this->web = $web;
		$this->idrubro = $idrubro;
		$this->detactividad = $detactividad;
		$this->cantempleados = $cantempleados;
		$this->idcategoria = $idcategoria;
		$this->fechainicioce = $fechainicioce;
		$this->activo = true;
		$this->cuit = $cuit;
		$this->fechafundacion = $fechafundacion;
		$this->importemensual = $importemensual;
	
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

	public function getCuit(){
		return $this->cuit;
	}

	public function setCuit($cuit){
		$this->cuit = $cuit;
	}

	public function getFechafundacion(){
		return $this->fechafundacion;
	}

	public function setFechafundacion($fechafundacion){
		$this->fechafundacion = $fechafundacion;
	}

	public function getImportemensual(){
		return $this->importemensual;
	}

	public function setImportemensual($importemensual){
		$this->importemensual = $importemensual;
	}

}
?>
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
	private $activo;
	private $cuit;
	private $fechafundacion;
	private $importemensual;
	private $numusuario;
	private $prestaservicio;

	public function	__construct($idempresa,$denominacion,$web,$idrubro,$detactividad,$cantempleados,$idcategoria,$fechainicioce,
	$activo,$cuit,$fechafundacion,$importemensual,$numusuario,$prestaservicio) {
	
		$this->idempresa = $idempresa;
		$this->denominacion = $denominacion;
		$this->web = $web;
		$this->idrubro = $idrubro;
		$this->detactividad = $detactividad;
		$this->cantempleados = $cantempleados;
		$this->idcategoria = $idcategoria;
		$this->fechainicioce = $fechainicioce;
		$this->activo = $activo;
		$this->cuit = $cuit;
		$this->fechafundacion = $fechafundacion;
		$this->importemensual = $importemensual;
		$this->numusuario = $numusuario;
		$this->prestaservicio = $prestaservicio;

	}

	public function getPrestaservicio(){
		return $this->prestaservicio;
	}

	public function setPrestaservicio($prestaservicio){
		$this->prestaservicio = $prestaservicio;
	}
	
	public function getNumusuario(){
		return $this->numusuario;
	}

	public function setNumusuario($numusuario){
		$this->numusuario = $numusuario;
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
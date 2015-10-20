<?php

class abonado {
	//Atributos
	private $numabonado;
	private $importe;
	private $fechadeultimopago;
	private $activo;
	
	public function	__construct($numabonado,$importe,$fechadeultimopago,$activo) {
	
		$this->numabonado = $numabonado;
		$this->importe = $importe;
		$this->fechadeultimopago = $fechadeultimopago;
		$this->activo = $activo;
		
	}

	public function getNumabonado(){
		return $this->numabonado;
	}

	public function setNumabonado($numabonado){
		$this->numabonado = $numabonado;
	}

	public function getImporte(){
		return $this->importe;
	}

	public function setImporte($importe){
		$this->importe = $importe;
	}

	public function getFechadeultimopago(){
		return $this->fechadeultimopago;
	}

	public function setFechadeultimopago($fechadeultimopago){
		$this->fechadeultimopago = $fechadeultimopago;
	}

	public function getActivo(){
		return $this->activo;
	}

	public function setActivo($activo){
		$this->activo = $activo;
	}

	
}

?>
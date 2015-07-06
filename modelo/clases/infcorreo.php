<?php


class infcorreo {
	//Atributos
	private $id;
	private $cantContactos;
	private $cantEmpresas;
	private $arrayEmpresas;
	private $fecha;
	


	public function	__construct($id,$cantContactos,$cantEmpresas,$arrayEmpresas,$fecha) {
	
		$this->id = $id;
		$this->cantContactos = $cantContactos;
		$this->cantEmpresas = $cantEmpresas;
		$this->arrayEmpresas = $arrayEmpresas;
		$this->fecha = $fecha;

	}

	public function getId(){
		return $this->id;
	}

	public function setId($id){
		$this->id = $id;
	}

	public function getCantContactos(){
		return $this->cantContactos;
	}

	public function setCantContactos($cantContactos){
		$this->cantContactos = $cantContactos;
	}

	public function getCantEmpresas(){
		return $this->cantEmpresas;
	}

	public function setCantEmpresas($cantEmpresas){
		$this->cantEmpresas = $cantEmpresas;
	}

	public function getArrayEmpresas(){
		return $this->arrayEmpresas;
	}

	public function setArrayEmpresas($arrayEmpresas){
		$this->arrayEmpresas = $arrayEmpresas;
	}

	public function getFecha(){
		return $this->fecha;
	}

	public function setFecha($fecha){
		$this->fecha = $fecha;
	}

}

?>
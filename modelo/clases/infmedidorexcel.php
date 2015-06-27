<?php

class infmedidorexcel {
	//Atributos
	private $id;
	private $informe;
	private $actualizados;
	private $totalregistros;
	private $cantinsertados;

	public function	__construct($id,$informe,$actualizados,$totalregistros,$cantinsertados) {
	
		$this->id = $id;
		$this->informe = $informe;
		$this->actualizados = $actualizados;
		$this->totalregistros = $totalregistros;
		$this->cantinsertados = $cantinsertados;
		
	}

	public function getId(){
		return $this->id;
	}

	public function setId($id){
		$this->id = $id;
	}

	public function getInforme(){
		return $this->informe;
	}

	public function setInforme($informe){
		$this->informe = $informe;
	}

	public function getActualizados(){
		return $this->actualizados;
	}

	public function setActualizados($actualizados){
		$this->actualizados = $actualizados;
	}

	public function getTotalregistros(){
		return $this->totalregistros;
	}

	public function setTotalregistros($totalregistros){
		$this->totalregistros = $totalregistros;
	}

	public function getCantinsertados(){
		return $this->cantinsertados;
	}

	public function setCantinsertados($cantinsertados){
		$this->cantinsertados = $cantinsertados;
	}
	
}

?>
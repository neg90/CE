<?php


class infmedidorexcel {
	//Atributos
	private $id;
	private $fallados;
	private $actualizados;
	private $totalregistros;
	private $fecha;
	private $medidorInsertado;
	private $registroNoInsertado;
	private $medidorActualizado;
	private $empresaActualizada;
	private $relacionInsertada;
	private $medidorSinEmpresaInsertado;
	private $medidorSinEmpresaActualizado;


	public function	__construct($id,$fallados,$actualizados,$totalregistros,$fecha,$medidorInsertado,$registroNoInsertado,
	$medidorActualizado,$empresaActualizada,$relacionInsertada,$medidorSinEmpresaInsertado,$medidorSinEmpresaActualizado) {
	
		$this->id = $id;
		$this->fallados = $fallados;
		$this->actualizados = $actualizados;
		$this->totalregistros = $totalregistros;
		$this->fecha = $fecha;
		$this->medidorInsertado = $medidorInsertado;
		$this->registroNoInsertado = $registroNoInsertado;
		$this->medidorActualizado = $medidorActualizado;
		$this->empresaActualizada = $empresaActualizada;
		$this->relacionInsertada = $relacionInsertada;
		$this->medidorSinEmpresaInsertado = $medidorSinEmpresaInsertado;
		$this->medidorSinEmpresaActualizado = $medidorSinEmpresaActualizado;


	}
	public function getId(){
		return $this->id;
	}

	public function setId($id){
		$this->id = $id;
	}

	public function getFallados(){
		return $this->fallados;
	}

	public function setFallados($fallados){
		$this->fallados = $fallados;
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

	public function getFecha(){
		return $this->fecha;
	}

	public function setFecha($fecha){
		$this->fecha = $fecha;
	}

	public function getMedidorInsertado(){
		return $this->medidorInsertado;
	}

	public function setMedidorInsertado($medidorInsertado){
		$this->medidorInsertado = $medidorInsertado;
	}

	public function getRegistroNoInsertado(){
		return $this->registroNoInsertado;
	}

	public function setRegistroNoInsertado($registroNoInsertado){
		$this->registroNoInsertado = $registroNoInsertado;
	}

	public function getMedidorActualizado(){
		return $this->medidorActualizado;
	}

	public function setMedidorActualizado($medidorActualizado){
		$this->medidorActualizado = $medidorActualizado;
	}

	public function getEmpresaActualizada(){
		return $this->empresaActualizada;
	}

	public function setEmpresaActualizada($empresaActualizada){
		$this->empresaActualizada = $empresaActualizada;
	}

	public function getRelacionInsertada(){
		return $this->relacionInsertada;
	}

	public function setRelacionInsertada($relacionInsertada){
		$this->relacionInsertada = $relacionInsertada;
	}

	public function getMedidorSinEmpresaInsertado(){
		return $this->medidorSinEmpresaInsertado;
	}

	public function setMedidorSinEmpresaInsertado($medidorSinEmpresaInsertado){
		$this->medidorSinEmpresaInsertado = $medidorSinEmpresaInsertado;
	}

	public function getMedidorSinEmpresaActualizado(){
		return $this->medidorSinEmpresaActualizado;
	}

	public function setMedidorSinEmpresaActualizado($medidorSinEmpresaActualizado){
		$this->medidorSinEmpresaActualizado = $medidorSinEmpresaActualizado;
	}
}

?>
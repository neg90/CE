<?php


class infcorreo {
	//Atributos
	private $id;
	private $cantContactos;
	private $cantEmpresas;
	private $arrayEmpresas;
	private $asunto;
	private $adjunto;
	private $mensaje;
	private $fecha;
	


	public function	__construct($id,$cantContactos,$cantEmpresas,$arrayEmpresas,$fecha,$asunto,$adjunto,$mensaje) {
	
		$this->id = $id;
		$this->cantContactos = $cantContactos;
		$this->cantEmpresas = $cantEmpresas;
		$this->arrayEmpresas = $arrayEmpresas;
		$this->fecha = $fecha;
		$this->asunto = $asunto;
		$this->adjunto = $adjunto;
		$this->mensaje = $mensaje;

	}

	public function getMensaje(){
		return $this->mensaje;
	}

	public function setMensaje($mensaje){
		$this->mensaje = $mensaje;
	}

	public function getAsunto(){
		return $this->asunto;
	}

	public function setAsunto($asunto){
		$this->asunto = $asunto;
	}

	public function getAdjunto(){
		return $this->adjunto;
	}

	public function setAdjunto($adjunto){
		$this->adjunto = $adjunto;
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
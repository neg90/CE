<?php

class permisos {
	//	C-Create 
	//	R->Read
	//	U->Update
	//	d->Delete
	private $id;
	private $csocio;
	private $rsocio;
	private $usocio;
	private $dsocio;
	private $cmedidor;
	private $rmedidor;
	private $umedidor;
	private $dmedidor;
	private $cci; 		//Tabla comercio/Industria
	private $rci;
	private $uci;
	private $dci;
	private $cusuario;
	private $rusuario;
	private $uusuario;
	private $dusuario;
	private $crol;
	private $rrol;
	private $urol;
	private $drol;
	
	

	public function	__construct ($id,$csocio,$rsocio,$usocio,$dsocio,$cmedidor,$rmedidor,$umedidor,$dmedidor,$cci,$rci,$uci,$dci,
	$cusuario,$rusuario,$uusuario,$dusuario,$crol,$rrol,$urol,$drol){
		
		$this->id = $id;
		$this->csocio = $csocio;
		$this->rsocio = $rsocio;
		$this->usocio= $usocio;
		$this->dsocio = $dsocio;
		$this->cmedidor = $cmedidor;
		$this->rmedidor = $rmedidor;
		$this->umedidor = $umedidor;
		$this->dmedidor = $dmedidor;
		$this->cci = $cci;
		$this->rci = $rci;
		$this->uci = $uci;
		$this->dci = $dci;
		$this->cusuario = $cusuario;
		$this->rusuario = $rusuario;
		$this->uusuario = $uusuario;
		$this->dusuario = $dusuario;
		$this->crol = $crol;
		$this->rrol = $rrol;
		$this->urol = $urol;
		$this->drol = $drol;

	
	}

	public function getId(){
		return $this->id;
	}

	public function setId($id){
		$this->id = $id;
	}

	public function getCsocio(){
		return $this->csocio;
	}

	public function setCsocio($csocio){
		$this->csocio = $csocio;
	}

	public function getRsocio(){
		return $this->rsocio;
	}

	public function setRsocio($rsocio){
		$this->rsocio = $rsocio;
	}

	public function getUsocio(){
		return $this->usocio;
	}

	public function setUsocio($usocio){
		$this->usocio = $usocio;
	}

	public function getDsocio(){
		return $this->dsocio;
	}

	public function setDsocio($dsocio){
		$this->dsocio = $dsocio;
	}

	public function getCmedidor(){
		return $this->cmedidor;
	}

	public function setCmedidor($cmedidor){
		$this->cmedidor = $cmedidor;
	}

	public function getRmedidor(){
		return $this->rmedidor;
	}

	public function setRmedidor($rmedidor){
		$this->rmedidor = $rmedidor;
	}

	public function getUmedidor(){
		return $this->umedidor;
	}

	public function setUmedidor($umedidor){
		$this->umedidor = $umedidor;
	}

	public function getDmedidor(){
		return $this->dmedidor;
	}

	public function setDmedidor($dmedidor){
		$this->dmedidor = $dmedidor;
	}

	public function getCci(){
		return $this->cci;
	}

	public function setCci($cci){
		$this->cci = $cci;
	}

	public function getRci(){
		return $this->rci;
	}

	public function setRci($rci){
		$this->rci = $rci;
	}

	public function getUci(){
		return $this->uci;
	}

	public function setUci($uci){
		$this->uci = $uci;
	}

	public function getDci(){
		return $this->dci;
	}

	public function setDci($dci){
		$this->dci = $dci;
	}

	public function getCusuario(){
		return $this->cusuario;
	}

	public function setCusuario($cusuario){
		$this->cusuario = $cusuario;
	}

	public function getRusuario(){
		return $this->rusuario;
	}

	public function setRusuario($rusuario){
		$this->rusuario = $rusuario;
	}

	public function getUusuario(){
		return $this->uusuario;
	}

	public function setUusuario($uusuario){
		$this->uusuario = $uusuario;
	}

	public function getDusuario(){
		return $this->dusuario;
	}

	public function setDusuario($dusuario){
		$this->dusuario = $dusuario;
	}

	public function getCrol(){
		return $this->crol;
	}

	public function setCrol($crol){
		$this->crol = $crol;
	}

	public function getRrol(){
		return $this->rrol;
	}

	public function setRrol($rrol){
		$this->rrol = $rrol;
	}

	public function getUrol(){
		return $this->urol;
	}

	public function setUrol($urol){
		$this->urol = $urol;
	}

	public function getDrol(){
		return $this->drol;
	}

	public function setDrol($drol){
		$this->drol = $drol;
	}

	
}
?>
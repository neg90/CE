<?php
require('../modelo/clases/fpdf.php');
require_once '../modelo/PDO/PDOcategoria.php';
require_once '../modelo/PDO/PDOrubro.php';

class PDF extends FPDF
{

function Header()
{
    // Logo
    $this->Image('../img/logo.png',10,2,30);
    // Arial bold 15
    $this->SetFont('Arial','B',25);
    // Move to the right
    $this->Cell(35);
    // Title
    $this->Cell(30,10,$_SESSION['tituloPDF'],0,0,'L');
    // Line break
    $this->Ln(20);
}

function Footer()
{
    // 1,5 cm del fin de la página
    $this->SetY(-15);
    // La I es de italic, tamaño 8
    $this->SetFont('Arial','I',8);
    // Print centered page number
    $this->Cell(0,10,utf8_decode('Página ').$this->PageNo(),0,0,'R');
}

function TablaUsuarios($header, $data, $roles)
{
	// Colors, line width and bold font
	$this->SetFillColor(120,120,120);
	$this->SetTextColor(255);
	$this->SetDrawColor(200,200,200);
	$this->SetLineWidth(0);
	$this->SetFont('','B');
	// Header
	$w = array(50, 50, 50, 80, 40);
	for($i=0;$i<count($header);$i++)
		$this->Cell($w[$i],7,$header[$i],1,0,'L',true);
	$this->Ln();
	// Color and font restoration
	$this->SetFillColor(235,235,235);
	$this->SetTextColor(100,100,100);
	$this->SetFont('');
	// Data
	$fill = false;
	foreach($data as $row)
	{
		$this->Cell($w[0],6,utf8_decode($row['nombre']),'LR',0,'L',$fill);
		$this->Cell($w[1],6,utf8_decode($row['apellido']),'LR',0,'L',$fill);
		$this->Cell($w[2],6,$row['username'],'LR',0,'L',$fill);
		$this->Cell($w[3],6,$row['correo'],'LR',0,'L',$fill);
		for ($i=0; $i<count($roles);$i++){
				if ($row['idrol'] == $roles[$i]->idrol)
					$this->Cell($w[4],6,$roles[$i]->nombre,'LR',0,'L',$fill);
		}
		//$this->Cell($w[3],6,number_format($row[3]),'LR',0,'R',$fill);
		$this->Ln();
		$fill = !$fill;
	}
	// Closing line
	$this->Cell(array_sum($w),0,'','T');
}

function TablaContacto($header, $data)
{
	// Colors, line width and bold font
	$this->SetFillColor(120,120,120);
	$this->SetTextColor(255);
	$this->SetDrawColor(200,200,200);
	$this->SetLineWidth(0);
	$this->SetFont('','B');
	// Header
	$w = array(35, 35, 35, 50, 50, 60, 15);
	for($i=0;$i<count($header);$i++)
		$this->Cell($w[$i],7,$header[$i],1,0,'L',true);
	$this->Ln();
	// Color and font restoration
	$this->SetFillColor(235,235,235);
	$this->SetTextColor(100,100,100);
	$this->SetFont('');
	// Data
	$fill = false;
	foreach($data as $row)
	{
		$this->Cell($w[0],6,utf8_decode($row['nombre']),'LR',0,'L',$fill);
		$this->Cell($w[1],6,utf8_decode($row['apellido']),'LR',0,'L',$fill);
		$this->Cell($w[2],6,$row['tipodocumento'] . ' ' . $row['documento'],'LR',0,'L',$fill);
		$this->Cell($w[3],6,$row['telefono'],'LR',0,'L',$fill);
		$this->Cell($w[4],6,utf8_decode($row['domicilio']),'LR',0,'L',$fill);
		$this->Cell($w[5],6,$row['correo'],'LR',0,'L',$fill);
		if ($row['asociadosm'] == 1) $asociadosm='Si'; else $asociadosm='No';		
		$this->Cell($w[6],6,$asociadosm,'LR',0,'L',$fill);
		//$this->Cell($w[3],6,number_format($row[3]),'LR',0,'R',$fill);
		$this->Ln();
		$fill = !$fill;
	}
	// Closing line
	$this->Cell(array_sum($w),0,'','T');
}

function TablaMedidor($header, $data)
{
	// Colors, line width and bold font
	$this->SetFillColor(120,120,120);
	$this->SetTextColor(255);
	$this->SetDrawColor(200,200,200);
	$this->SetLineWidth(0);
	$this->SetFont('','B');
	// Header
	$w = array(60, 45, 50, 30, 40, 45);
	for($i=0;$i<count($header);$i++)
		$this->Cell($w[$i],7,$header[$i],1,0,'L',true);
	$this->Ln();
	// Color and font restoration
	$this->SetFillColor(235,235,235);
	$this->SetTextColor(100,100,100);
	$this->SetFont('');
	// Data
	$fill = false;
	foreach($data as $row)
	{
		$this->Cell($w[0],6,utf8_decode($row['nomyap']),'LR',0,'L',$fill);
		$this->Cell($w[1],6,$row['telefono'],'LR',0,'L',$fill);
		$this->Cell($w[2],6,utf8_decode($row['domicilio']),'LR',0,'L',$fill);
		$this->Cell($w[3],6,$row['importepago'],'LR',0,'L',$fill);
		$this->Cell($w[4],6,$row['numusuario'],'LR',0,'L',$fill);
		$this->Cell($w[5],6,$row['numsuministro'],'LR',0,'L',$fill);
		//$this->Cell($w[3],6,number_format($row[3]),'LR',0,'R',$fill);
		$this->Ln();
		$fill = !$fill;
	}
	// Closing line
	$this->Cell(array_sum($w),0,'','T');
}

function TablaEmpresa($idempresa, $rubro, $categoria,$contactos,$medidores,
				 $telefonos, $correos,$domicilios,$abonados)
{
	$empresa= PDOEmpresa::buscarEmpresa($idempresa);

	$categorias = PDOcategoria::listar();
	$rubros = PDOrubro::listar();
	$correos = PDOcorreoempresa::buscarCorreos($empresa->getIdempresa());
	$domicilios = PDOdomicilioempresa::buscarDomicilios($empresa->getIdempresa());
	$telefonos = PDOtelefonoempresa::buscarTelefonos($empresa->getIdempresa());

	// Colors, line width and bold font
	$this->SetFillColor(120,120,120);
	$this->SetTextColor(255);
	$this->SetDrawColor(200,200,200);
	$this->SetLineWidth(0);
	$this->SetFont('','B');


	$this->SetFillColor(235,235,235);
	$this->SetTextColor(0,0,0);
	$this->SetFont('');

	$fill = true;

	$this->SetFont('','B',16);
			$this->Cell(0,20,utf8_decode('Datos Generales '),0,1,'C');

	$this->SetFont('','B',13);	
	$this->Cell(0,8,utf8_decode('Nº de Socio : '),0,1,'L',$fill);
	$this->SetFont('');
	$this->Cell(0,8,$empresa->getIdempresa(),0,1,'L');

	$this->SetFont('','B');	
	$this->Cell(0,8,'Cantidad de empleados: ',0,1,'L',$fill);
	$this->SetFont('');
	$this->Cell(0,8,$empresa->getCantempleados(),0,1,'L');

	$this->SetFont('','B');	
	$this->Cell(0,8,'Importe mensual:',0,1,'L',$fill);
	$this->SetFont('');
	$this->Cell(0,8,'$'.$empresa->getImportemensual(),0,1,'L');

	$this->SetFont('','B');	
	$this->Cell(0,8,'Web: ',0,1,'L',$fill);
	$this->SetFont('');
	$this->Cell(0,8,$empresa->getWeb(),0,1,'L');

	$this->SetFont('','B');	
	$this->Cell(0,8,'CUIT: ',0,1,'L',$fill);
	$this->SetFont('');
	$this->Cell(0,8,$empresa->getCuit(),0,1,'L');

	$this->SetFont('','B');	
	$this->Cell(0,8,'Fecha de inicio en C.E.: ',0,1,'L',$fill);
	$this->SetFont('');
	$fechaInicioCE = new DateTime($empresa->getFechainicioce());
	$this->Cell(0,8,$fechaInicioCE->format('d/m/Y'),0,1,'L');

	$this->SetFont('','B');	
	$this->Cell(0,8,utf8_decode('Categoría: '),0,1,'L',$fill);
	$this->SetFont('');
	foreach ($categorias as $c){
		if ($c->id ==$empresa->getIdcategoria()){
			$this->Cell(0,8,$c->descripcion,0,1,'L');
		}
	}
	
	$this->SetFont('','B');	
	$this->Cell(0,8,utf8_decode('Rubro: '),0,1,'L',$fill);
	$this->SetFont('');
	foreach ($rubros as $r){
		if ($r->id ==$empresa->getIdrubro()){
			$this->Cell(0,8,$r->descripcion,0,1,'L');
		}
	}

	$this->SetFont('','B');	
	$this->Cell(0,8,'Detalle de actividad: ',0,1,'L',$fill);
	$this->SetFont('');
	$this->SetFillColor(255,255,255);
	$this->MultiCell(0,8,utf8_decode($empresa->getDetactividad()),0,1,'J',$fill);
	$this->SetFillColor(235,235,235);

	$this->SetFont('','B');	
	$this->Cell(0,8,'Fecha de inicio de actividades: ',0,1,'L',$fill);
	$this->SetFont('');
	$fechaFund = new DateTime($empresa->getFechafundacion());
	$this->Cell(0,8,$fechaFund->format('d/m/Y'),0,1,'L');

	$this->SetFont('','B');	
	$this->Cell(0,8,'Domicilios: ',0,1,'L',$fill);
	$this->SetFont('');
		if ($domicilios != null)
		{
			foreach ($domicilios as $domicilio){
					$this->Cell(0,8,utf8_decode(html_entity_decode($domicilio['domicilio'])).' - '.utf8_decode(html_entity_decode($domicilio['descripcion'])),0,1,'L');
				}
		}
		else $this->Cell(0,8,utf8_decode('No hay domicilios asociados.'),0,1,'L');

	$this->SetFont('','B');	
	$this->Cell(0,8,utf8_decode('Teléfonos: '),0,1,'L',$fill);
	$this->SetFont('');
		if ($telefonos != null){
				foreach ($telefonos as $telefono){
					$this->Cell(0,8,utf8_decode(html_entity_decode($telefono['telefono'])).' - '.utf8_decode(html_entity_decode($telefono['descripcion'])),0,1,'L');
				}	
		}
		else $this->Cell(0,8,utf8_decode('No hay teléfonos asociados.'),0,1,'L');

	$this->SetFont('','B');	
	$this->Cell(0,8,utf8_decode('Emails: '),0,1,'L',$fill);
	$this->SetFont('');
		if ($correos != null){
				foreach ($correos as $correo){
					$this->Cell(0,8,utf8_decode(html_entity_decode($correo->correo)).' - '.utf8_decode(html_entity_decode($correo->descripcion)),0,1,'L');
				}
		}
		else $this->Cell(0,8,utf8_decode('No hay correos asociados.'),0,1,'L');


	$this->AddPage('P','A4');
	$abonadoempresa=PDOabonadoempresa::buscarAbonadosRelacionados($empresa->getIdempresa());
	$medidorempresa=PDOmedidorempresa::buscarMedidorRelacionados($empresa->getIdempresa());
	if ($abonadoempresa != null)
		{	$abonado=PDOabonado::buscarAbonado($abonadoempresa->numabonado);
			$this->SetFont('','B',16);
			$this->Cell(0,20,utf8_decode('Datos Abonado '),0,1,'C');
			//$numabonado,$importe,$fechadeultimopago,$activo
			$this->SetFont('','B',13);
			$this->Cell(0,8,utf8_decode('Número de Abonado: '),0,1,'L',$fill);
			$this->SetFont('');
			$this->Cell(0,8,$abonado->getNumabonado(),0,1,'L');

			$this->SetFont('','B');
			$this->Cell(0,8,utf8_decode('Importe: '),0,1,'L',$fill);
			$this->SetFont('');
			$this->Cell(0,8,'$'.$abonado->getImporte(),0,1,'L');

			$this->SetFont('','B');
			$fechaUltPago= new DateTime($abonado->getFechadeultimopago());
			$this->Cell(0,8,utf8_decode('Fecha de último pago: '),0,1,'L',$fill);
			$this->SetFont('');
			$this->Cell(0,8,$fechaUltPago->format('d/m/Y'),0,1,'L');
		}
	elseif ($medidorempresa !=null)
		{	$medidor=PDOmedidor::medidorPorID($medidorempresa->idmedidor);
			$this->SetFont('','B',16);
			$this->Cell(0,20,utf8_decode('Datos Medidor: '),0,1,'L');
			//$nomyap,$telefono,$domicilio,$importepago,$numusuario,$numsuministro,$activo,$fechadeultimopago
			$this->SetFont('','B',13);
			$this->Cell(0,8,utf8_decode('Nombre y Apellido: '),0,1,'L',$fill);
			$this->SetFont('');
			$this->Cell(0,8,$medidor->nomyap,0,1,'L');

			$this->SetFont('','B');
			$this->Cell(0,8,utf8_decode('Importe de pago: '),0,1,'L',$fill);
			$this->SetFont('');
			$this->Cell(0,8,'$'.$medidor->importepago,0,1,'L');

			$this->SetFont('','B');
			$this->Cell(0,8,utf8_decode('Número de Usuario: '),0,1,'L',$fill);
			$this->SetFont('');
			$this->Cell(0,8,$medidor->numusuario,0,1,'L');

			$this->SetFont('','B');
			$this->Cell(0,8,utf8_decode('Número de Suministro: '),0,1,'L',$fill);
			$this->SetFont('');
			$this->Cell(0,8,$medidor->numsuministro,0,1,'L');

			$this->SetFont('','B');
			$fechaUltPago= new DateTime($medidor->fechadeultimopago);
			$this->Cell(0,8,utf8_decode('Fecha de último pago: '),0,1,'L',$fill);
			$this->SetFont('');
			$this->Cell(0,8,$fechaUltPago->format('d/m/Y'),0,1,'L');

		}
}

function TablaListadoEmpresas($header,$datos)
{

	$categorias = PDOcategoria::listar();
	$rubros = PDOrubro::listar();

	// Colors, line width and bold font
	$this->SetFillColor(120,120,120);
	$this->SetTextColor(255);
	$this->SetDrawColor(200,200,200);
	$this->SetLineWidth(0);
	$this->SetFont('','B');
	// Header
	$w = array(80, 45, 30, 30, 45, 45);
	for($i=0;$i<count($header);$i++)
		$this->Cell($w[$i],7,$header[$i],1,0,'L',true);
	$this->Ln();
	// Color and font restoration
	$this->SetFillColor(235,235,235);
	$this->SetTextColor(100,100,100);
	$this->SetFont('');
	// Data
	$fill = false;
	foreach($datos as $data){
		//$this->Cell($w[0],6,utf8_decode($row['nombre']),'LR',0,'L',$fill);
		$this->Cell($w[0],6,utf8_decode($data['denominacion']),'LR',0,'L',$fill);
		$this->Cell($w[1],6,$data['cuit'],'LR',0,'C',$fill);

		foreach ($categorias as $c){
			if ($c->id ==$data['idcategoria'])
				$this->Cell($w[2],6,utf8_decode($c->descripcion),'LR',0,'C',$fill);
		}
		
		foreach ($rubros as $r){
			if ($r->id ==$data['idrubro'])
				$this->Cell($w[3],6,utf8_decode($r->descripcion),'LR',0,'C',$fill);
		}

		$this->Cell($w[4],6,'$'.$data['importemensual'],'LR',0,'C',$fill);
		$this->Cell($w[5],6,$data['cantempleados'],'LR',0,'C',$fill);
		
		$this->Ln();
		$fill = !$fill;
	}
	// Closing line
	$this->Cell(array_sum($w),0,'','T');
}

}
?>
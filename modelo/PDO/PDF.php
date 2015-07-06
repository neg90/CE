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

function TablaEmpresa($data)
{
	$data = $data[0];
	$categorias = PDOcategoria::listar();
	$rubros = PDOrubro::listar();
	$correos = PDOcorreoempresa::buscarCorreos($data['idempresa']);
	$domicilios = PDOdomicilioempresa::buscarDomicilios($data['idempresa']);
	$telefonos = PDOtelefonoempresa::buscarTelefonos($data['idempresa']);

	// Colors, line width and bold font
	$this->SetFillColor(120,120,120);
	$this->SetTextColor(255);
	$this->SetDrawColor(200,200,200);
	$this->SetLineWidth(0);
	$this->SetFont('','B');
	// Header
	/*$w = array(60, 45, 50, 30, 40, 45);
	for($i=0;$i<count($header);$i++)
		$this->Cell($w[$i],7,$header[$i],1,0,'L',true);
	$this->Ln();*/
	// Color and font restoration
	$this->SetFillColor(235,235,235);
	$this->SetTextColor(0,0,0);
	$this->SetFont('');
	// Data
	$fill = true;
	$this->Cell(0,8,utf8_decode('Nº de Socio : '),0,1,'L',$fill);
	$this->Cell(0,8,$data['idempresa'],0,1,'L');
	$this->Cell(0,8,'Cantidad de empleados: ',0,1,'L',$fill);
	$this->Cell(0,8,$data['cantempleados'],0,1,'L');
	$this->Cell(0,8,'Importe mensual: $',0,1,'L',$fill);
	$this->Cell(0,8,$data['importemensual'],0,1,'L');
	$this->Cell(0,8,'Web: ',0,1,'L',$fill);
	$this->Cell(0,8,$data['web'],0,1,'L');
	$this->Cell(0,8,'CUIT: ',0,1,'L',$fill);
	$this->Cell(0,8,$data['cuit'],0,1,'L');
	$this->Cell(0,8,'Fecha de inicio en C.E.: ',0,1,'L',$fill);
	$this->Cell(0,8,$data['fechainicioce'],0,1,'L');
	$this->Cell(0,8,utf8_decode('Categoría: '),0,1,'L',$fill);
	foreach ($categorias as $c){
		if ($c->id ==$data['idcategoria']){
			$this->Cell(0,8,$c->descripcion,0,1,'L');
		}
	}
	
	$this->Cell(0,8,utf8_decode('Rubro: '),0,1,'L',$fill);
	foreach ($rubros as $r){
		if ($r->id ==$data['idrubro']){
			$this->Cell(0,8,$r->descripcion,0,1,'L');
		}
	}
	$this->Cell(0,8,'Detalle de actividad: ',0,1,'L',$fill);
	$this->MultiCell(0,8,utf8_decode($data['detactividad']),0,1,'J');
	$this->Cell(0,8,'Fecha de inicio de actividades: ',0,1,'L',$fill);
	$this->Cell(0,8,$data['fechafundacion'],0,1,'L');
	$this->Cell(0,8,'Domicilios: ',0,1,'L',$fill);
		foreach ($domicilios as $domicilio){
			$this->Cell(0,8,utf8_decode(html_entity_decode($domicilio['domicilio'])).' - '.utf8_decode(html_entity_decode($domicilio['descripcion'])),0,1,'L');
		}

	$this->Cell(0,8,utf8_decode('Teléfonos: '),0,1,'L',$fill);
		foreach ($telefonos as $telefono){
			$this->Cell(0,8,utf8_decode(html_entity_decode($telefono['telefono'])).' - '.utf8_decode(html_entity_decode($telefono['descripcion'])),0,1,'L');
		}	

	$this->Cell(0,8,utf8_decode('Emails: '),0,1,'L',$fill);
		foreach ($correos as $correo){
			$this->Cell(0,8,utf8_decode(html_entity_decode($correo->correo)).' - '.utf8_decode(html_entity_decode($correo->descripcion)),0,1,'L');
		}

	//$this->Cell(0,10,'Nº de Usuario: '.$data['numusuario'],0,1,'L');
	/* foreach($data as $row)
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
	}*/
	// Closing line
//	$this->Cell(array_sum($w),0,'','T');
}

/*function TablaEmpresa($data)
{
	$data = $data[0];
	$categorias = PDOcategoria::listar();
	$rubros = PDOrubro::listar();
	$correos = PDOcorreoempresa::buscarCorreos($data['idempresa']);
	$domicilios = PDOdomicilioempresa::buscarDomicilios($data['idempresa']);
	$telefonos = PDOtelefonoempresa::buscarTelefonos($data['idempresa']);

	// Colors, line width and bold font
	$this->SetFillColor(120,120,120);
	$this->SetTextColor(255);
	$this->SetDrawColor(200,200,200);
	$this->SetLineWidth(0);
	$this->SetFont('','B');
	
	// Color and font restoration
	$this->SetFillColor(235,235,235);
	$this->SetTextColor(0,0,0);
	$this->SetFont('');
	// Data
	$fill = true;
	$this->Cell(0,8,utf8_decode('Nº de Socio : '),0,1,'L',$fill);
	$this->Cell(0,8,$data['idempresa'],0,1,'L');
	$this->Cell(0,8,'Cantidad de empleados: ',0,1,'L',$fill);
	$this->Cell(0,8,$data['cantempleados'],0,1,'L');
	$this->Cell(0,8,'Importe mensual: $',0,1,'L',$fill);
	$this->Cell(0,8,$data['importemensual'],0,1,'L');
	$this->Cell(0,8,'Web: ',0,1,'L',$fill);
	$this->Cell(0,8,$data['web'],0,1,'L');
	$this->Cell(0,8,'CUIT: ',0,1,'L',$fill);
	$this->Cell(0,8,$data['cuit'],0,1,'L');
	$this->Cell(0,8,'Fecha de inicio en C.E.: ',0,1,'L',$fill);
	$this->Cell(0,8,$data['fechainicioce'],0,1,'L');
	$this->Cell(0,8,utf8_decode('Categoría: '),0,1,'L',$fill);
	foreach ($categorias as $c){
		if ($c->id ==$data['idcategoria']){
			$this->Cell(0,8,$c->descripcion,0,1,'L');
		}
	}
	
	$this->Cell(0,8,utf8_decode('Rubro: '),0,1,'L',$fill);
	foreach ($rubros as $r){
		if ($r->id ==$data['idrubro']){
			$this->Cell(0,8,$r->descripcion,0,1,'L');
		}
	}
	$this->Cell(0,8,'Detalle de actividad: ',0,1,'L',$fill);
	$this->MultiCell(0,8,utf8_decode($data['detactividad']),0,1,'J');
	$this->Cell(0,8,'Fecha de inicio de actividades: ',0,1,'L',$fill);
	$this->Cell(0,8,$data['fechafundacion'],0,1,'L');
	$this->Cell(0,8,'Domicilios: ',0,1,'L',$fill);
		foreach ($domicilios as $domicilio){
			$this->Cell(0,8,utf8_decode(html_entity_decode($domicilio['domicilio'])).' - '.utf8_decode(html_entity_decode($domicilio['descripcion'])),0,1,'L');
		}

	$this->Cell(0,8,utf8_decode('Teléfonos: '),0,1,'L',$fill);
		foreach ($telefonos as $telefono){
			$this->Cell(0,8,utf8_decode(html_entity_decode($telefono['telefono'])).' - '.utf8_decode(html_entity_decode($telefono['descripcion'])),0,1,'L');
		}	

	$this->Cell(0,8,utf8_decode('Emails: '),0,1,'L',$fill);
		foreach ($correos as $correo){
			$this->Cell(0,8,utf8_decode(html_entity_decode($correo->correo)).' - '.utf8_decode(html_entity_decode($correo->descripcion)),0,1,'L');
		}
} */

}
?>
<?php
require('../modelo/clases/fpdf.php');

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
		$this->Cell($w[0],6,$row['nombre'],'LR',0,'L',$fill);
		$this->Cell($w[1],6,$row['apellido'],'LR',0,'L',$fill);
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
		$this->Cell($w[0],6,$row['nombre'],'LR',0,'L',$fill);
		$this->Cell($w[1],6,$row['apellido'],'LR',0,'L',$fill);
		$this->Cell($w[2],6,$row['tipodocumento'] . ' ' . $row['documento'],'LR',0,'L',$fill);
		$this->Cell($w[3],6,$row['telefono'],'LR',0,'L',$fill);
		$this->Cell($w[4],6,$row['domicilio'],'LR',0,'L',$fill);
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
		$this->Cell($w[0],6,$row['nomyap'],'LR',0,'L',$fill);
		$this->Cell($w[1],6,$row['telefono'],'LR',0,'L',$fill);
		$this->Cell($w[2],6,$row['domicilio'],'LR',0,'L',$fill);
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

}
?>
<?php

//Recoger la vista


require_once'template.php';
ob_start();

$html = $template;


$html2pdf->writeHTML($html);
$html2pdf->output('pdf_generado.pdf');
ob_end_flush();
?>
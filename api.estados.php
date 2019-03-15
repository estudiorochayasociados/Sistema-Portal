<?php
header('Content-Type: application/json');
require_once "Config/Autoload.php";
Config\Autoload::runSitio();
$estado = new Clases\Estados();

$indice = isset($_GET['indice']) ? $_GET['indice'] : '';

$estado->set("indice",$indice);
$estadoArray = $estado->leer();
echo json_encode($estadoArray, JSON_PRETTY_PRINT);

?>
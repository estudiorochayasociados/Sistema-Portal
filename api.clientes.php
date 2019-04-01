<?php
header('Content-Type: application/json');
require_once "Config/Autoload.php";
Config\Autoload::runSitio();
$cliente = new Clases\Clientes();

$usuario = isset($_GET['usuario']) ? $_GET['usuario'] : '';
$lote = isset($_GET['lote']) ? $_GET['lote'] : '';
$accion = isset($_GET['accion']) ? $_GET['accion'] : '';

switch ($accion) {
    case 'leer':
        $cliente->set("dni", $usuario);
        $clienteArray = $cliente->leer();
        echo json_encode($clienteArray, JSON_PRETTY_PRINT);
        break;
    case 'lotes':
        $cliente->set("dni", $usuario);
        $clienteArray = $cliente->compararLotes();
        echo json_encode($clienteArray, JSON_PRETTY_PRINT);
        break;
    case 'asociarDatos':
        $cliente->set("dni", $usuario);
        $clienteArray = $cliente->asociarDatos();
        echo json_encode($clienteArray, JSON_PRETTY_PRINT);
        break;
    case 'leerTodos':
        $cliente->set("dni", $usuario);
        $clienteArray = $cliente->leerTodos();
        echo json_encode($clienteArray, JSON_PRETTY_PRINT);
        break;
}

?>
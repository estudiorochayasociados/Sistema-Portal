<?php
header('Content-Type: application/json');
require_once "Config/Autoload.php";
Config\Autoload::runSitio();
$eventos = new Clases\Eventos();

$tramite = isset($_GET['tramite']) ? $_GET['tramite'] : '';
$accion = isset($_GET['accion']) ? $_GET['accion'] : 'leer';

switch ($accion) {
    case 'agregar':
        $eventos->set("tramite", $_POST["tramite"]);
        $eventos->set("observacion", $_POST["observacion"]);
        $eventos->set("lote", $_POST["lote"]);
        $eventos->set("start", $_POST["start"]);
        $eventos->set("end", $_POST["end"]);
        $eventos->set("usuario", $_POST["usuario"]);
        $eventos->set("estado", $_POST["estado"]);
        $eventosArray = $eventos->agregar();
        echo json_encode($eventosArray, JSON_PRETTY_PRINT);
        break;
    case 'modificar':
        $eventos->set("id", $_POST["id"]);
        $eventos->set("observacion", $_POST["observacion"]);
        $eventos->set("lote", $_POST["lote"]);
        $eventos->set("start", $_POST["start"]);
        $eventos->set("end", $_POST["end"]);
        $eventos->set("usuario", $_POST["usuario"]);
        $eventos->set("estado", $_POST["estado"]);
        $eventosArray = $eventos->modificar();
        echo json_encode($eventosArray, JSON_PRETTY_PRINT);
        break;
    case 'eliminar':
        $eventos->set("id", $_POST["id"]);
        $eventosArray = $eventos->eliminar();
        echo json_encode($eventosArray, JSON_PRETTY_PRINT);
        break;
    case 'leerUnico':
        $eventos->set("tramite", $tramite);
        $eventosArray = $eventos->leerUnico();
        echo json_encode($eventosArray, JSON_PRETTY_PRINT);
        break;
    default:
        $eventosArray = $eventos->leer();
        echo json_encode($eventosArray, JSON_PRETTY_PRINT);
        break;
}

?>
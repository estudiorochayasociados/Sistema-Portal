<?php
require_once "Config/Autoload.php";
Config\Autoload::runSitio();

$jsonDatos = file_get_contents(URL . "/api.eventos.php?accion=recordatorios");
$recordatoriosDatos = json_decode($jsonDatos, true);

foreach ($recordatoriosDatos as $item) {
    $date = new DateTime($item['start']);
    $fecha = $date->format('d-m');
    $hora = $date->format('H:i');

    $jsonDatos = file_get_contents(URL . "/api.clientes.php?usuario=" . $item['usuario'] . "&accion=leer");
    $clienteDatos = json_decode($jsonDatos, true);
    $numero = $clienteDatos['telefono'];

    if ($item['estado'] == 1) {
        $sms = "Portal%20del%20Sol%20te%20recuerda%20que%20mañana%20" . $fecha . "%20debes%20presentarte%20en%20Escribania%20Bruno%20a%20la%20hora%20" . $hora . "%20con%20la%20documentación%20requerida.";
        file_get_contents("https://api.elasticemail.com/v2/sms/send?apikey=71243cdf-2783-4ead-9619-ad35a3a3c9bf&to=%2b549" . $numero . "&body=" . $sms);
    } elseif ($item['estado'] == 2) {
        $sms = "Portal%20del%20Sol%20te%20recuerda%20que%20mañana%20" . $fecha . "%20debes%20presentarte%20en%20Escribania%20Bruno%20a%20la%20hora%20" . $hora . "%20a%20firmar%20tu%20escritura.";
        file_get_contents("https://api.elasticemail.com/v2/sms/send?apikey=71243cdf-2783-4ead-9619-ad35a3a3c9bf&to=%2b549" . $numero . "&body=" . $sms);
    }
}

?>
<?php
require_once "Config/Autoload.php";
Config\Autoload::runSitio();
$funciones = new Clases\PublicFunction();
$acceso = new Clases\Acceso();
$cliente = new Clases\Clientes();

$dni = $_SESSION["dni"];
$cliente->set("dni", $dni);

$jsonDatos = file_get_contents(URL . "/api.clientes.php?usuario=" . $dni . "&accion=leer");
$clienteDatos = json_decode($jsonDatos, true);

$jsonLotes = file_get_contents(URL . "/api.clientes.php?usuario=" . $dni . "&accion=lotes");
$clienteLotes = json_decode($jsonLotes, true);

?>
    <html>
    <head>
        <title>Lotes</title>
        <?php include("assets/inc/header.inc.php"); ?>
    </head>
    <body>

    <div class="container mt-4">
        <div class="row">
            <div class="col-sm-4 offset-sm-4"><!-- Acceso Clientes -->
                <div class="card">
                    <div class="card-header">
                        Seleccione los lotes a escriturar
                    </div>
                    <div class="card-body">
                        <form method="post">
                            <div class="row">
                                <div class="form-group col-sm-12">
                                    <?php foreach ($clienteLotes as $item) { ?>
                                        <input type="checkbox" name="lotes[]" value="<?= $item['lote'] ?>">
                                        <?= $item['lote'] ?>
                                        <br>
                                    <?php } ?>
                                </div>
                            </div>
                            <button type="submit" name="escriturar" class="btn btn-primary">Escriturar</button>
                        </form>
                    </div>
                </div>
            </div>
        </div>
        <div id="error"></div>
    </div>

    </body>
    </html>
<?php
if (isset($_POST["escriturar"])) {

    $clienteDatosString = '';
    foreach ($_POST["lotes"] as $item) {
        $clienteDatosString .= $item.',';
    }
    $clienteDatosString = substr($clienteDatosString,0,-1);

    $clienteDatos["lote"] = $clienteDatosString;

    $json = json_encode($clienteDatos);
    echo "<script>localStorage.setItem('iDat', '" . $json . "');</script>";
    $funciones->headerMove('calendario_cliente.php');

}
?>
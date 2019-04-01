<?php
require_once "Config/Autoload.php";
Config\Autoload::runSitio();
$funciones = new Clases\PublicFunction();

$dni = $_SESSION["dni"];

$jsonDatos = file_get_contents(URL . "/api.clientes.php?usuario=" . $dni . "&accion=leerTodos");
$clienteDatos = json_decode($jsonDatos, true);

$jsonLotes = file_get_contents(URL . "/api.clientes.php?usuario=" . $dni . "&accion=lotes");
$clienteLotes = json_decode($jsonLotes, true);

?>
<html>
<head>
    <title>Lotes</title>
    <?php include("assets/inc/header.inc.php"); ?>
</head>
<body class="bkg">

<div class="container mt-4">
    <div class="row">
        <div class="col-sm-6 offset-sm-3"><!-- Acceso Clientes -->
            <div class="card">
                <div class="card-header">
                    Seleccioná los lotes que quieras escriturar
                </div>
                <div class="card-body">

                    <?php
                    if (isset($_POST["escriturar"])) {

                        if (empty($_POST["lotes"])) {
                            echo '<div class="alert alert-warning">Debe seleccionar al menos un lote</div>';
                        } else {
                            $clienteDatosString = '';
                            foreach ($_POST["lotes"] as $item) {
                                $clienteDatosString .= $item . ',';
                            }
                            $clienteDatosString = substr($clienteDatosString, 0, -1);

                            $clienteDatos[0]["lote"] = $clienteDatosString;

                            $json = json_encode($clienteDatos[0]);
                            echo "<script>localStorage.setItem('iDat', '" . $json . "');</script>";

                           $funciones->headerMove('calendario_cliente.php');
                        }
                    }
                    ?>

                    <form method="post">
                        <div class="row">
                            <div class="form-group col-sm-12">
                                <?php for ($i = 0; $i < count($clienteLotes); $i++) {
                                    $manzana = '';
                                    $proyecto = '';
                                    if ($clienteLotes[$i]['lote'] == $clienteDatos[$i]['lote']) {
                                        $manzana = $clienteDatos[$i]['manzana'];
                                        $proyecto = $clienteDatos[$i]['proyecto'];
                                    }
                                    ?>
                                    <input type="checkbox" name="lotes[]" value="<?= $clienteLotes[$i]['lote'] ?>">
                                    Lote: <?= $clienteLotes[$i]['lote'] ?> | Manzana: <?= $manzana ?> | Proyecto: <?= $proyecto ?>
                                    <br>
                                <?php } ?>
                            </div>
                        </div>
                        <button type="submit" name="escriturar" class="btn btn-block btn-primary">Comenzar trámite</button>
                    </form>
                </div>
            </div>
        </div>
    </div>
    <div id="error"></div>
</div>

</body>
</html>
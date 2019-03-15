<?php
require_once "Config/Autoload.php";
Config\Autoload::runSitio();
$funciones = new Clases\PublicFunction();
$acceso = new Clases\Acceso();
$estado = new Clases\Estados();
unset($_SESSION["usuario"]);
?>
    <html>
    <head>
        <title>Acceso Clientes</title>
        <?php include("assets/inc/header.inc.php"); ?>
    </head>
    <body>

    <div class="container mt-4">
        <div class="row">
            <div class="col-sm-4 offset-sm-4"><!-- Acceso Clientes -->
                <div class="card">
                    <div class="card-header">
                        Acceso Clientes
                    </div>
                    <div class="card-body">
                        <form method="post">
                            <div class="row">
                                <div class="form-group col-sm-12">
                                    <label for="dni" class="sr-only">DNI</label><i>Ingrese su DNI sin puntos</i>
                                    <input type="text" class="form-control" id="dni" name="dni" placeholder="DNI" required>
                                </div>
                            </div>
                            <button type="submit" name="clientes" class="btn btn-primary">Acceder</button>
                        </form>
                    </div>
                </div>
            </div>
        </div>

        <div class="row mt-3"><!-- Información del cliente -->
            <div class="col-md-12">
                <div class="collapse" id="collapseCliente">
                    <div class="card">
                        <div class="card-header" id="titulo">
                        </div>
                        <div class="card-body" id="contenido">
                            <div id="indices">
                                <div class="d-flex alert" style="display: none;">
                                    <div class="col-md-4"><b>Motivo</b></div>
                                    <div class="col-md-4 text-center"><b>Observación</b></div>
                                    <div class="col-md-4 text-right"><b>Fecha</b></div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div id="error"></div>
    </div>

    </body>
    </html>
<?php
echo "<script>localStorage.removeItem('iDat');</script>";
if (isset($_POST["clientes"])) {
    $dni = $funciones->antihack_mysqli(isset($_POST["dni"])) ? $funciones->antihack_mysqli($_POST["dni"]) : false;
    if ($dni == false) {
        echo "<script>$('#error').append('<div class=\"d-flex alert alert-danger\">El &nbsp;<b>DNI</b>&nbsp; no puede estar en blanco.</div>');</script>";
    }else{
        $acceso->set("dni", $dni);
        $accesoRespuesta = $acceso->accesoClientes();

        if (is_array($accesoRespuesta)) {
            $clienteDatos = $acceso->asociarDatos();
            echo "<script>$('#titulo').append('<h5>" . $clienteDatos['titulares'] . " (" . $clienteDatos['dni'] . ")</h5>');</script>";
            echo "<script>$('#indices').css('display','block');</script>";
            foreach ($accesoRespuesta as $evento) {
                $estado->set("indice", $evento["estado"]);
                $estadoData = $estado->leer();
                $fecha = $evento['start'];
                echo "<script>fechaOrdenada = moment('" . $fecha . "', 'YYYY-MM-DD hh:mm:ss').format('DD-MM-YYYY H:mm:ss');</script>";
                echo "<script>$('#contenido').append('<div class=\"d-flex alert alert-primary\"><div class=\"col-md-4\">" . $estadoData['datos']['nombre'] . "</div><div class=\"col-md-4 text-center\">" . $evento['observacion'] . "</div><div class=\"col-md-4 text-right\">'+fechaOrdenada+'</div></div>');</script>";
            }
            echo "<script>$('.collapse').collapse();</script>";
        } elseif ($accesoRespuesta === true) {
            $_SESSION["usuario"] = 1;
            $_SESSION["dni"] = $dni;
            $funciones->headerMove('clientes_lotes.php');
        } elseif ($accesoRespuesta === false) {
            echo "<script>$('#error').append('<div class=\"d-flex alert alert-danger\">El &nbsp;<b>DNI</b>&nbsp; ingresado no pertenece a un cliente válido.</div>');</script>";
        }
    }
}
?>
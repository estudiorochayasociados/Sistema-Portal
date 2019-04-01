<?php
require_once "Config/Autoload.php";
Config\Autoload::runSitio();
$funciones = new Clases\PublicFunction();
$acceso = new Clases\Acceso();
$cliente = new Clases\Clientes();
$estado = new Clases\Estados();
unset($_SESSION["usuario"]);
?>
<html>
<head>
    <title>Acceso Clientes</title>
    <?php include("assets/inc/header.inc.php"); ?>
</head>
<body class="bkg">
<div class="container mt-4">
    <div class="container h-100" id="login">
        <div class="row">
            <div class="col-md-8 d-none d-md-block d-lg-block">
                <div class="d-flex h-100">
                    <div class="user_card2 text-center" style="padding:30px 40px">
                        <h5 class="text-uppercase"><b>¡En Portal del Sol escriturar es muy simple!</b></h5>
                        <p class="text-uppercase">
                            Realizá tu escritura en tan solo 5 pasos<br/>
                            <span style="font-size:14px;">1) Solicitá tu turno.<br/></span>
                            <span style="font-size:14px;">2) Asistir a escribanía co documentación requerida.<br/></span>
                            <span style="font-size:14px;">3) Firma de escritura.<br/></span>
                        </p>
                        <h5 class="text-uppercase"><b> ¡Listo...tu escritura ya está lista!</b></h5>
                        <a href="" class="mt-4 btn btn-info">Mirá el paso a paso para iniciar tu trámite.</a>
                    </div>
                </div>
            </div>
            <div class="col-md-4">
                <div class="d-flex justify-content-center h-100">
                    <div class="user_card">
                        <div class="d-flex justify-content-center">
                            <div class="brand_logo_container">
                                <img src="<?= URL ?>/assets/img/logo.png" class="brand_logo" alt="Logo">
                            </div>
                            <br/><br/>
                            <center style="margin-top:50px">
                                <h5 style="text-alig:center;font-size:18px;color:#fff;text-transform:uppercase !important">Iniciá tu trámite de escrituración</h5>
                                <hr/>
                            </center>
                        </div>
                        <div class="d-flex justify-content-center form_container">
                            <form method="post">
                                <div id="error"></div>
                                <div class="row">
                                    <div class="form-group col-sm-12 text-center">
                                        <h5 style="font-size:18px;color:#fff;text-transform:uppercase !important">Ingresá tu DNI</h5>
                                        <label for="dni" class="sr-only">DNI</label>
                                        <input type="number" class="form-control" id="dni" name="dni" placeholder="DNI" onkeydown="noPuntoComa( event )" required>
                                    </div>
                                </div>
                                <button type="submit" name="clientes" class="btn login_btn">¡Iniciar mi trámite!</button>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="row mt-3"><!-- Información del cliente -->
        <div class="col-md-12">
            <div class="collapse" id="collapseCliente">
                <div class="card">
                    <div class="card-header">
                        <div class="row">
                            <div class="col-md-8" id="titulo">
                            </div>
                            <div class="col-md-4 text-right" id="escriturar">
                            </div>
                        </div>
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
                    <a href="clientes.php" class="btn btn-info btn-block mt-4 mb-4">Cerrar Sesión</a>
                </div>
            </div>
        </div>
    </div>
</div>

</body>
</html>
<?php
echo "<script>localStorage.removeItem('iDat');</script>";
if (isset($_POST["clientes"])) {
    $dni = $funciones->antihack_mysqli(isset($_POST["dni"])) ? $funciones->antihack_mysqli($_POST["dni"]) : false;
    $dni = str_replace(".", "", $dni);
    if ($dni == false) {
        echo "<script>$('#error').append('<div class=\"d-flex alert alert-danger\">El &nbsp;<b>DNI</b>&nbsp; no puede estar en blanco.</div>');</script>";
    } else {
        $acceso->set("dni", $dni);
        $cliente->set("usuario", $dni);
        $accesoRespuesta = $acceso->accesoClientes();

        if (is_array($accesoRespuesta)) {

            $jsonLotes = file_get_contents(URL . "/api.clientes.php?usuario=" . $dni . "&accion=lotes");
            $clienteLotes = json_decode($jsonLotes, true);

            $jsonDatos = file_get_contents(URL . "/api.clientes.php?usuario=" . $dni . "&accion=asociarDatos");
            $clienteDatos = json_decode($jsonDatos, true);

            echo "<script>$('#titulo').append('<h5> HOLA " . mb_strtoupper($clienteDatos['titulares']) . " DNI:" . $clienteDatos['dni'] . "</h5>');</script>";
            echo "<script>$('#indices').css('display','block');</script>";
            if (!empty($clienteLotes)) {
                $_SESSION["usuario"] = 1;
                $_SESSION["dni"] = $dni;
                echo "<script>$('#escriturar').append('<a href=\"clientes_lotes.php\" class=\"btn btn-info\">ESCRITURAR OTRO LOTE</a>');</script>";
            }
            $tramite = '';
            echo "<script>$('#login').hide()</script>";
            foreach ($accesoRespuesta as $evento) {
                $lotes = $evento["lote"];
                if ($tramite != $evento["tramite"]) {
                    $tramite = $evento["tramite"];
                    echo "<script>$('#contenido').append('<hr><h5>TRÁMITE #" . $tramite . "</h5>');</script>";
                    echo "<script>$('#contenido').append('<div class=\"d-flex alert alert-warning\"><div class=\"col-md-12\"><b>LOTE/S:</b> " . $lotes . "</div></div>');</script>";
                }
                $estado->set("indice", $evento["estado"]);
                $estadoData = $estado->leer();
                $fecha = $evento['start'];
                echo "<script>fechaOrdenada = moment('" . $fecha . "', 'YYYY-MM-DD hh:mm:ss').format('DD-MM-YYYY H:mm:ss');</script>";
                echo "<script>$('#contenido').append('<div class=\"d-flex alert alert-primary\"><div class=\"col-md-4\"> Hola " . $estadoData['datos']['nombre'] . "</div><div class=\"col-md-4 text-center\">" . $evento['observacion'] . "</div><div class=\"col-md-4 text-right\">'+fechaOrdenada+'</div></div>');</script>";
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

<script>
    function noPuntoComa(event) {

        var e = event || window.event;
        var key = e.keyCode || e.which;

        if (key === 110 || key === 190 || key === 188) {

            e.preventDefault();
        }
    }
</script>
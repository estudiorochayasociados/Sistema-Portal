<?php
require_once "Config/Autoload.php";
Config\Autoload::runSitio();
$funciones = new Clases\PublicFunction();
if ($_SESSION["usuario"] != 1) {
    $funciones->headerMove('index.php');
}
?>
<html>
<head>
    <title>Calendario</title>
    <?php include("assets/inc/header.inc.php"); ?>
    <!-- Full Calendar -->
    <link rel="stylesheet" href="assets/css/fullcalendar.min.css">
    <script src="assets/js/fullcalendar.min.js"></script>
    <script src="assets/js/es.js"></script>
</head>
<body class="bkg ">
<div class="container mt-5 mb-5 pt-20 pb-20" style="background:rgba(255,255,255,.9);border-radius: 20px">
    <div class="row ">
        <!-- Mensaje de turno creado -->
        <div id="turno" class="col-md-12 mt-3 text-left" style="display: none;">
            <div class="row">
                <div class="col-md-12">
                    <h4 class="text-uppercase">¡Perfecto, ya tenés tu turno!</h4>
                    <hr/>
                </div>
                <div class="col-md-3">
                    <img src="assets/img/logo.png" width="100%"/>
                </div>
                <div class="col-md-9">
                    <p>
                        Ahora asistí a <b>Escribanía Bruno</b> (Av. del Libertador Sur 170), el día citado para comenzar tu proceso de escrituración. No te olvides de llevar la documentación según tu situación.
                    <ul style="font-size:14px;">
                        <li><b>¿SOS SOLTERO/A?:</b> DNI.</li>
                        <li><b>¿SOS CASADO/A?:</b> DNI y nombre completo del cónyuge.</li>
                        <li><b>¿SOS CASADO/A CON RÉGIMEN DE SEPARACIÓN DE BIENES?:</b> copia de escritura de opción de Régimen Patrimonial Matrimonial y copia de Partida de Matrimonio con nota marginal de opción del Régimen.</li>
                        <li><b>¿SOS DIVORCIADO/A?:</b> DNI y copia de sentencia de divorcio.</li>
                        <li><b>¿SOS VIUDO/A?:</b> DNI y nombre completo del cónyuge fallecido.</li>
                        <li><b>¿COMPRÁS Y CONSTITUÍS USUFRUCTO?:</b> DNI comprador, DNI usufructuario.</li>
                    </ul>
                    </p>
                    <a href="imprimir.php" target="_blank" class="btn btn-info">Imprimir turno</a><br/><br/><br/>
                    <form>
                    </form>
                </div>
            </div>
        </div>
        <!-- Calendario -->
        <div id="calendario" class="col-md-8">
            <h4>Seleccioná el día de tu turno</h4>
            <hr/>
            <div id="calendarioWeb"></div>
        </div>
        <!-- Card Agregar -->
        <div id="card" class="col-md-4" style="display: none;">
            <div class="card">
                <div class="card-header">
                    <div class="card-title" id="titulo"></div>
                </div>
                <div class="card-body">
                    <input class="form-control" type="hidden" id="txtObservacion" name="txtObservacion" value="Sin observación">
                    <input class="form-control" type="hidden" id="txtEstado" name="txtEstado" value="1">
                    <b>DNI:</b><br>
                    <input style="margin-bottom: 10px" class="form-control" type="text" id="txtDni" name="txtDni" disabled>
                    <b>Titular/es:</b><br>
                    <input style="margin-bottom: 10px" class="form-control" type="text" id="txtTitulares" name="txtTitulares" disabled>
                    <b>Manzana:</b><br>
                    <input style="margin-bottom: 10px" class="form-control" type="text" id="txtManzana" name="txtManzana" disabled>
                    <b>Lote/s:</b><br>
                    <input style="margin-bottom: 10px" class="form-control" type="text" id="txtLote" name="txtLote" disabled>
                    <b>Horario del turno:</b><br>
                    <div class="row">
                        <div class="clearfix"></div>
                        <div class="col-md-6" id="seccionStart">
                            <span style="font-size: 14px">desde:</span><br>
                            <select class="form-control" id="txtStart" name="txtStart">
                                <option selected disabled>Seleccionar</option>
                            </select>
                        </div>
                        <div class="col-md-6" id="seccionEnd">
                            <span style="font-size: 14px">hasta:</span><br>
                            <select disabled class="form-control" id="txtEnd" name="txtEnd">
                            </select>
                        </div>
                    </div>
                    <i style="color:#ffab44;font-size: 12px">* los turnos son de 30 minutos</i>
                    <div id="confirmar"></div>
                </div>
                <div class="card-footer">
                    <button type="button" class="btn btn-block btn-success" data-dismiss="modal" id="btnAgregar">¡SOLICITAR TURNO!</button>
                </div>
            </div>
        </div>
        <!-- Card Inicial -->
        <div id="card-inicial" class="col-md-4">
            <div class="card">
                <div class="card-header">
                    <div class="card-title" id="titulo"><h5>Turnos</h5></div>
                </div>
                <div class="card-body">
                    <div class="alert alert-info"><h6>Selecciona el día que más cómodo te quede y sacá tu turno.</h6></div>
                </div>
            </div>
        </div>
    </div>
    <div class="row">
        <div class="clearfix"></div>
        <br>
        <div class="col-md-12" id="logout">
            <br><a href="clientes.php" class="btn btn-info col-sm-12 col-md-2">Cerrar Sesión</a>
        </div>
    </div>
</div>

<script src="assets/js/clienteCal.js"></script>

</body>
</html>
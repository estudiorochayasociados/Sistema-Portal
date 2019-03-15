<?php
require_once "Config/Autoload.php";
Config\Autoload::runSitio();
$funciones = new Clases\PublicFunction();
if($_SESSION["usuario"] != 1){
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
<body>
<div class="container mt-5 mb-5">
    <div class="row">
        <!-- Mensaje de turno creado -->
        <div id="turno" class="col-md-12 alert alert-info mt-3 text-center" style="display: none;">
            <h4>¡Sacaste tu turno exitosamente!</h4>
            <p>Podés consultar tu turno en todo momento con tu DNI</p>
            <a href="index.php" class="btn btn-info">Consultar</a>
        </div>
        <!-- Calendario -->
        <div id="calendario" class="col-md-8">
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
                    <span>DNI:</span><br>
                    <input class="form-control" type="text" id="txtDni" name="txtDni" disabled>
                    <span>Titular/es:</span><br>
                    <input class="form-control" type="text" id="txtTitulares" name="txtTitulares" disabled>
                    <span>Manzana:</span><br>
                    <input class="form-control" type="text" id="txtManzana" name="txtManzana" disabled>
                    <span>Lote:</span><br>
                    <input class="form-control" type="text" id="txtLote" name="txtLote" disabled>
                    <span>Horario:</span><br>
                    <div class="seccionStart"></div>
                    <div class="seccionEnd"></div>
                    <div id="confirmar"></div>
                </div>
                <div class="card-footer">
                    <button type="button" class="btn btn-success" data-dismiss="modal" id="btnAgregar">Sacar Turno</button>
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
        <div class="clearfix"></div><br>
        <div class="col-md-12">
            <br><a href="index.php" class="btn btn-info col-sm-12 col-md-2">Cerrar Sesión</a>
        </div>
    </div>
</div>

<script src="assets/js/clienteCal.js"></script>

</body>
</html>
<?php
require_once "Config/Autoload.php";
Config\Autoload::runSitio();
$funciones = new Clases\PublicFunction();
if($_SESSION["usuario"] != 2){
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
        <!-- Calendario -->
        <div id="calendario" class="col-md-8">
            <div id="calendarioWeb"></div>
        </div>
        <!-- Card Agregar, Modificar, Eliminar -->
        <div id="card" class="col-md-4" style="display: none;">
            <div class="card">
                <div class="card-header">
                    <div class="card-title" id="titulo"></div>
                </div>
                <div class="card-body">
                    <div id="historial"></div>
                    <input class="form-control" type="hidden" id="txtId" name="txtId" value="">
                    <span>DNI:</span><br>
                    <div id="seccionDniDia" class="row" style="display: none;">
                        <div class="col-md-8">
                            <input class="form-control" type="text" id="txtDni" name="txtDni" placeholder="DNI del cliente">
                        </div>
                        <div class="col-md-4">
                            <button onclick="buscarCliente()" id="buscarDni" class="btn btn-info">Buscar</button>
                        </div>
                    </div>
                    <div id="seccionDniEvento" style="display: none;">
                        <input class="form-control" type="text" id="txtDni" name="txtDni" placeholder="DNI del cliente" disabled>
                    </div>
                    <div id="seccionTitulares">
                        <span>Titular/es:</span><br>
                        <input class="form-control" type="text" id="txtTitulares" name="txtTitulares" disabled>
                    </div>
                    <div id="seccionManzana">
                        <span>Manzana:</span><br>
                        <input class="form-control" type="text" id="txtManzana" name="txtManzana" disabled>
                    </div>
                    <div id="seccionLote">
                        <span>Lote:</span><br>
                        <input class="form-control" type="text" id="txtLote" name="txtLote" disabled>
                    </div>
                    <div id="seccionEstadoDia">
                        <span>Estado:</span><br>
                        <select class="form-control" id="txtEstado" name="txtEstado">
                            <option selected disabled>Seleccionar estado</option>
                            <option value="1">Citación previa</option>
                            <option value="2">Informe pedido</option>
                            <option value="3">Informe recibido</option>
                            <option value="4">Escritura firmada</option>
                            <option value="5">Escritura para retirar inscripta en escribanía</option>
                        </select>
                    </div>
                    <div id="seccionEstadoEvento">
                        <span>Estado:</span><br>
                        <input class="form-control" type="text" id="txtEstado" name="txtEstado" disabled>
                    </div>
                    <div id="seccionObservacion">
                        <span>Observación:</span><br>
                        <textarea class="form-control" id="txtObservacion" name="txtObservacion" disabled>Sin observación</textarea>
                    </div>
                    <span>Horario:</span><br>
                    <div class="seccionStart"></div>
                    <div class="seccionEnd"></div>
                    <div id="confirmar"></div>
                </div>
                <div id="agregar" class="card-footer">
                    <button type="button" class="btn btn-success" data-dismiss="modal" id="btnAgregar">Agregar</button>
                    <button type="button" class="btn btn-danger" data-dismiss="modal" id="btnEliminar">Eliminar</button>
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

<script src="assets/js/adminCal.js"></script>

</body>
</html>
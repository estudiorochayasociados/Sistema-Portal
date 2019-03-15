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
        <title>Acceso Interno</title>
        <?php include("assets/inc/header.inc.php"); ?>
    </head>
    <body>

    <div class="container mt-4">
        <div class="row">
            <div class="col-sm-6 offset-sm-3"><!-- Acceso Escribanos -->
                <div class="card">
                    <div class="card-header">
                        Acceso Interno
                    </div>
                    <div class="card-body">
                        <form method="post" class="form-group">
                            <div class="row">
                                <div class="form-group col-sm-6 mb-2">
                                    <label for="usuario" class="sr-only">Usuario</label>
                                    <input type="text" class="form-control" id="usuario" name="usuario" placeholder="Usuario" required>
                                </div>
                                <div class="form-group col-sm-6 mb-2">
                                    <label for="password" class="sr-only">Contraseña</label>
                                    <input type="password" class="form-control" id="password" name="password" placeholder="Contraseña" required>
                                </div>
                            </div>
                            <button type="submit" name="escribanos" class="btn btn-primary mb-2">Acceder</button>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <div class="container mt-4">
        <div class="row">
            <div class="col-sm-6 offset-sm-3" id="error"></div>
        </div>
    </div>

    </body>
    </html>
<?php
if (isset($_POST["escribanos"])) {
    $usuario = $funciones->antihack_mysqli(isset($_POST["usuario"])) ? $funciones->antihack_mysqli($_POST["usuario"]) : false;
    $password = $funciones->antihack_mysqli(isset($_POST["password"])) ? $funciones->antihack_mysqli($_POST["password"]) : false;
    if ($usuario == false || $password == false) {
        echo "<script>$('#error').append('<div class=\"d-flex alert alert-danger\">Datos incorrectos.</div>');</script>";
    } else {
        $password = hash('sha256', $password . SALT);
        $acceso->set("usuario", $usuario);
        $acceso->set("password", $password);
        $accesoRespuesta = $acceso->accesoEscribanos();

        if ($accesoRespuesta) {
            $_SESSION["usuario"] = 2;
            $funciones->headerMove('calendario_admin.php');
        } else {
            echo "<script>$('#error').append('<div class=\"d-flex alert alert-danger\">Datos incorrectos.</div>');</script>";
        }
    }
}
?>
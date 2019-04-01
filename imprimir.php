<!DOCTYPE html>
<html lang="en">
<head>
    <?php include("assets/inc/header.inc.php"); ?>
</head>
<body>

<table class="table table-striped">
    <thead>
    <tr>
        <th id="tramite" scope="col"></th>
    </tr>
    </thead>
    <tbody>
    <tr>
        <th id="nombreDni" scope="row"></th>
    </tr>
    <tr>
        <th id="loteManzanaProyecto" scope="row"></th>
    </tr>
    <tr>
        <th id="horario" scope="row"></th>
    </tr>
    </tbody>
</table>

<script>
    imprimirDatos = JSON.parse(localStorage.getItem('imprimir'));

    $('#tramite').append('Trámite #'+imprimirDatos.tramite);
    $('#nombreDni').append(imprimirDatos.nombre);
    $('#nombreDni').append(' ('+imprimirDatos.usuario+')');
    $('#loteManzanaProyecto').append('Lote/s: '+imprimirDatos.lote+'<br>');
    $('#loteManzanaProyecto').append('Manzana: '+imprimirDatos.manzana+'<br>');
    $('#loteManzanaProyecto').append('Proyecto: '+imprimirDatos.proyecto);

    var fecha = moment(imprimirDatos.start, 'YYYY-MM-DD H:mm').format('DD-MM H:mm');
    $('#horario').append(fecha);

    window.print();
</script>

</body>
</html>
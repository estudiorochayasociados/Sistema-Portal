$(document).ready(function () {
    //alert("The current date of the calendar is " + $('#calendarioWeb').fullCalendar('getDate').format('YYYY-MM-DD'));
    $('#calendarioWeb').fullCalendar({
        header:
            {
                left: 'title',
                center: '',
                right: 'today prev,next'
            },
        timeFormat: 'H(:mm)',
        defaultView: 'month',
        validRange: {
            start: '2019-02-01',
            end: '2019-06-30'
        },
        weekends: false,
        //Acciones que ocurren al dar click a un día
        dayClick: function (date, jsEvent, view) {
            $('#txtId').val(null);
            $('#titulo').html("<h5>" + date.format('DD-MM-YYYY') + "</h5>");
            $('#seccionDniDia').css('display', 'flex');
            $('#seccionDniEvento').css('display', 'none');
            $('#seccionEstadoDia').css('display', 'block');
            $('#seccionEstadoEvento').css('display', 'none');
            $('#seccionTitulares').css('display', 'none');
            $('#seccionManzana').css('display', 'none');
            $('#seccionLote').css('display', 'none');
            $('#btnAgregar').css('display', 'block');
            $('#btnEliminar').css('display', 'none');

            $('#txtEstado option:first').remove();
            $('#txtEstado').prepend('<option selected disabled>Seleccionar estado</option>');
            $('#seccionDniDia, #txtDni').val(null);
            $('#txtObservacion').prop('disabled',false);

            agregarHorarios(date.format('DD-MM-YYYY'));

            $('#confirmar').removeClass();
            $('#confirmar').empty();
            $('#historial').removeClass();
            $('#historial').empty();

            //primer click
            $('#card-inicial').remove();
            $('#card').css('display', 'block');
        },
        //Carga los eventos de la base de datos
        events: 'http://192.168.0.22/SistemaPortal/api.eventos.php',
        //Acciones que ocurren al dar click a un evento
        eventClick: function (calEvent, jsEvent, view) {
            $('#txtId').val(calEvent.id);
            $('#titulo').html("<h5>Trámite #" + calEvent.tramite + "</h5>");
            $('#seccionDniDia').css('display', 'none');
            $('#seccionDniEvento').css('display', 'block');
            $('#seccionEstadoDia').css('display', 'none');
            $('#seccionEstadoEvento').css('display', 'block');
            $('#btnAgregar').css('display', 'none');
            $('#btnEliminar').css('display', 'block');

            $('#seccionDniEvento,#txtDni').val(calEvent.usuario);
            $('#txtLote').val(calEvent.lote);
            $('#txtObservacion').prop('disabled',true);
            $('#txtObservacion').val(calEvent.observacion);

            obtenerCliente(calEvent.usuario,calEvent.tramite);

            agregarEstado(calEvent.estado, 'evento');

            var fechaStart = calEvent.start.format('DD-MM-YYYY H:mm');
            var fechaEnd = calEvent.end.format('DD-MM-YYYY H:mm');

            agregarFechaEvento(fechaStart, fechaEnd);

            $('#confirmar').removeClass();
            $('#confirmar').empty();
            $('#historial').removeClass();
            $('#historial').empty();

            //primer click
            $('#card-inicial').remove();
            $('#card').css('display', 'block');
        },
        editable: true,
    });

})

$('#btnAgregar').click(function () {
    recolectarDatos();
    confirmar();
    $('#ejecutar').click(function () {
        enviarInformacion('agregar', nuevoEvento);
        $('#confirmar').addClass('alert alert-success');
        $('#confirmar').html('¡Turno agregado correctamente!<br>');
    });
    $('#cancelar').click(function () {
        $('#confirmar').removeClass('alert alert-info');
        $('#confirmar').empty();
    })
});

$('#btnEliminar').click(function () {
    recolectarDatos();
    confirmar();
    $('#ejecutar').click(function () {
        enviarInformacion('eliminar', nuevoEvento);
        $('#confirmar').addClass('alert alert-success');
        $('#confirmar').html('¡Turno eliminado!<br>');
    });
    $('#cancelar').click(function () {
        $('#confirmar').removeClass('alert alert-info');
        $('#confirmar').empty();
    })
});

//Recolecto los datos del modal para poder agregar/modificar/eliminar
function recolectarDatos() {
    nuevoEvento = {
        id: $('#txtId').val(),
        observacion: $('#txtObservacion').val(),
        lote: $('#txtLote').val(),
        start: $('#txtStart').val(),
        end: $('#txtEnd').val(),
        usuario: $('#txtDni').val(),
        estado: $('#txtEstado').val()
    };
}

function confirmar() {
    $('#confirmar').addClass('alert alert-warning');
    if ($('#txtDni').val()) {
        if ($('#seccionEstadoDia #txtEstado').val() || $('#seccionEstadoEvento #txtEstado').val()) {
            if ($('#txtStart').val()) {
                $('#confirmar').removeClass();
                $('#confirmar').addClass('alert alert-info');
                $('#confirmar').html('¿Confirma ésta acción?<br><br>');
                $('#confirmar').append('<input class="btn btn-success col-md-5" type="button" id="ejecutar" value="Si">');
                $('#confirmar').append('<input class="btn btn-danger col-md-5 offset-md-2" type="button" id="cancelar" value="No">');
            } else {
                $('#confirmar').html('Necesitás ingresar un horario para el turno.');
            }
        } else {
            $('#confirmar').html('Necesitás ingresar un estado para el turno.');
        }
    } else {
        $('#confirmar').html('Necesitás ingresar un dni para el turno.');
    }

}

//Envío la información recolectada a api.eventos.php por POST
function enviarInformacion(accion, objEvento, modal) {
    $.ajax({
        type: 'POST',
        url: 'api.eventos.php?accion=' + accion,
        data: objEvento,
        success: function (msg) {
            if (msg) {
                $('#calendarioWeb').fullCalendar('refetchEvents');
                if (!modal) {
                    $('#modalEventos').modal('toggle');
                }
            }
        },
        error: function () {
            alert('Hay un error');
        }
    });
}

//Filtro los horarios que están disponibles del día y los agrego al modal
function agregarHorarios(fechaDelDiaSinHora) {
    $('.seccionStart').empty();
    $('.seccionEnd').empty();
    var horariosOriginales = ["08:30", "09:00", "09:30", "10:00", "10:30", "11:00", "11:30", "15:30", "16:00", "16:30", "17:00", "17:30", "18:00", "18:30"];

    $.getJSON("api.eventos.php?accion=leer", function (data) {
        $.each(data, function (index, value) {
            var fechaEventoDia = (value.start).split(" ")[0];
            fechaEventoDia = moment(fechaEventoDia).format('DD-MM-YYYY');
            var fechaEventoHora = (value.start).split(" ")[1];
            if (fechaDelDiaSinHora == fechaEventoDia) {
                var indice = jQuery.inArray(fechaEventoHora, horariosOriginales);
                horariosOriginales.splice(indice, 1);
            }
        });
        for (let i = 0; i < horariosOriginales.length; i++) {
            $('.seccionStart').append('<label><input type="radio" id="txtStartTemp' + i + '" name="txtStartTemp" value=""><b> ' + horariosOriginales[i] + '</b>&nbsp;</label>');
            $('#txtStartTemp' + i).click(function () {
                definirStartEnd(fechaDelDiaSinHora + " " + horariosOriginales[i]);
            });
        }
    });
}

//Agrego un input hidden (es el que recojo para enviar por POST) con la fecha elegida en el radio
function definirStartEnd(fechaStart) {
    $('#txtStart').remove();
    $('.seccionEnd').empty();

    var fechaInvertidaStart = moment(fechaStart, 'DD-MM-YYYY H:mm').format('YYYY-MM-DD H:mm');
    $('.seccionStart').append('<input type="hidden" id="txtStart" name="txtStart" value="' + fechaInvertidaStart + '">');

    var fechaInvertidaEnd = moment(fechaStart, 'DD-MM-YYYY H:mm').add(30, 'minutes').format('YYYY-MM-DD H:mm');
    var HoraEnd = moment(fechaStart, 'DD-MM-YYYY H:mm').add(30, 'minutes').format('H:mm');

    $('.seccionEnd').append('<span>Fin de turno (30 min.):</span><br><span id="txtEndMuestra"><b>' + HoraEnd + '</b></span>');
    $('.seccionEnd').append('<input type="hidden" id="txtEnd" name="txtEnd" value="' + fechaInvertidaEnd + '">');
}

//Agrego la fecha del evento al modal
function agregarFechaEvento(fechaStart, fechaEnd) {
    $('.seccionStart').empty();
    $('.seccionEnd').empty();

    var fechaStartInvertida = moment(fechaStart, 'DD-MM-YYYY H:mm').format('YYYY-MM-DD H:mm');
    var fechaEndInvertida = moment(fechaEnd, 'DD-MM-YYYY H:mm').format('YYYY-MM-DD H:mm');

    $('.seccionStart').append('<label><input type="radio" id="txtStart" name="txtStart" value="' + fechaStartInvertida + '" checked> ' + fechaStart + '&nbsp;</label>');
    $('.seccionEnd').append('<label><input type="radio" id="txtEnd" name="txtEnd" value="' + fechaEndInvertida + '" checked> ' + fechaEnd + '&nbsp;</label>');
}

//Obtengo los datos del nnte por dni como parametro
function obtenerCliente(usuario,tramite) {
    $.getJSON("api.clientes.php?usuario=" + usuario + "&accion=leer", function (datos) {
        $('#seccionTitulares').css('display', 'block');
        $('#seccionManzana').css('display', 'block');
        $('#seccionLote').css('display', 'block');
        $('#txtTitulares').val(datos.titulares);
        $('#txtManzana').val(datos.manzana);
    });
    $.getJSON("api.eventos.php?tramite=" + tramite + "&accion=leerUnico", function (datos) {

    });
}

//Boton buscar por dni: busco si el cliente existe y lo muestro
function buscarCliente() {
    $('#historial').empty();
    $('#historial').addClass('alert alert-info');
    $.getJSON("api.eventos.php?accion=leer", function (data) {
        obtenerCliente($('#txtDni').val());
        var senal = 0;
        $.each(data, function (key, valor) {
            if ($('#txtDni').val() == valor.usuario) {
                senal = 1;
                $('#historial').append('<b>' + valor.start + '</b><br><span id="historial' + key + '"></span>');
                agregarEstado(valor.estado, 'historial', 'historial' + key);
            }
        });
        if (senal == 1) {
            $('#historial').prepend('<h6>Historial de turnos<hr></h6>');
        } else {
            $('#historial').append('<h6>Aún no ha sacado ningún turno.</h6>');
        }
    });
}

//Agrego el estado cuando clickeo el evento
function agregarEstado(estado, modo, id) {
    $.getJSON("api.estados.php?indice=" + estado, function (datos) {
        switch (modo) {
            case 'dia':
                $('#seccionEstadoDia, #txtEstado').val(datos.datos.nombre);
                break;
            case 'evento':
                $('#seccionEstadoEvento, #txtEstado').val(datos.datos.nombre);
                break;
            case 'historial':
                $('#' + id).append(datos.datos.nombre + '<br>');
                break;
        }
    });
}
accesoDatos = JSON.parse(localStorage.getItem('iDat'));
console.log(accesoDatos);
$(document).ready(function () {
    $('#calendarioWeb').fullCalendar({
        header:
            {
                left: 'title',
                center: '',
                right: 'today prev,next'
            },
        timeFormat: 'H(:mm)',
        defaultView: 'month',
        validRange: function (nowDate) {
            return {
                start: nowDate,
                end: '2019-06-30'
            };
        },
        weekends: false,
        //Acciones que ocurren al dar click a un día
        dayClick: function (date, jsEvent, view) {
            $('#titulo').html("<h5>Citación Previa (" + date.format('DD-MM-YYYY') + ")</h5>");
            $('#txtDni').val(accesoDatos.dni);
            $('#txtTitulares').val(accesoDatos.titulares);
            $('#txtManzana').val(accesoDatos.manzana);
            $('#txtLote').val(accesoDatos.lote);
            agregarHorarios(date.format('DD-MM-YYYY'));
            $('#confirmar').removeClass('alert alert-info');
            $('#confirmar').empty();

            //primer click
            $('#card-inicial').remove();
            $('#card').css('display', 'block');
        }
    });
})

$('#btnAgregar').click(function () {
    recolectarDatos();
    confirmar();
    $('#ejecutar').click(function () {
        enviarInformacion('agregar', nuevoEvento);
        $('#calendario').empty();
        $('#card').empty();
        $('#turno').css('display', 'block');
    });
    $('#cancelar').click(function () {
        $('#confirmar').removeClass('alert alert-info');
        $('#confirmar').empty();
    })
});

//Recolecto los datos del modal para poder agregar
function recolectarDatos() {
    nuevoEvento = {
        tramite: Math.floor((Math.random() * (90000000-11000000))+11000000),
        observacion: $('#txtObservacion').val(),
        lote: $('#txtLote').val(),
        start: $('#txtStart').val(),
        end: $('#txtEnd').val(),
        usuario: $('#txtDni').val(),
        estado: $('#txtEstado').val()
    };
}

function confirmar() {
    if ($('#txtStart').val() != undefined) {
        $('#confirmar').addClass('alert alert-info');
        $('#confirmar').html('¿Confirma este horario?<br><br>');
        $('#confirmar').append('<input class="btn btn-success col-md-5" type="button" id="ejecutar" value="Si">');
        $('#confirmar').append('<input class="btn btn-danger col-md-5 offset-md-2" type="button" id="cancelar" value="No">');
    } else {
        $('#confirmar').addClass('alert alert-warning');
        $('#confirmar').html('Necesitás seleccionar un horario para tu turno.');
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
    var HoraEnd = moment(fechaStart, 'DD-MM-YYYY hh:mm:ss').add(30, 'minutes').format('hh:mm:ss');

    $('.seccionEnd').append('<span>Fin de turno (30 min.):</span><br><span id="txtEndMuestra"><b>' + HoraEnd + '</b></span>');
    $('.seccionEnd').append('<input type="hidden" id="txtEnd" name="txtEnd" value="' + fechaInvertidaEnd + '">');
}
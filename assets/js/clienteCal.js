accesoDatos = JSON.parse(localStorage.getItem('iDat'));
tramiteNuevo = Math.floor((Math.random() * (90000000 - 11000000)) + 11000000);
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
            $('#titulo').html("<h5>Día de la reunión: " + date.format('DD/MM') + "</h5>");
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

    if ($('#txtStart').val() != undefined) {

        swal({
            title: '¿Confirmar turno?',
            type: 'info',
            buttons: {
                cancel: "No",
                catch: {
                    text: "Si",
                    value: "catch",
                },
            },
        })
            .then((value) => {
                switch (value) {
                    case "catch":
                        enviarInformacion('agregar', nuevoEvento);
                        $('#calendario').hide();
                        $('#card').hide();
                        $('#logout').hide();
                        $('#turno').css("display", "block");

                        recolectarDatos();

                        accesoDatos = localStorage.setItem('imprimir', JSON.stringify(nuevoEvento));

                        swal("¡Excelente!", "¡Turno agregado correctamente!", "success");
                        break;
                    default:
                        break;
                }
            });
    } else {
        swal("Necesitás seleccionar un horario para tu turno.");
    }
});

//Recolecto los datos del modal para poder agregar
function recolectarDatos() {
    nuevoEvento = {
        tramite: tramiteNuevo,
        observacion: $('#txtObservacion').val(),
        lote: $('#txtLote').val(),
        manzana: $('#txtManzana').val(),
        start: $('#txtStart').val(),
        end: $('#txtEnd').val(),
        usuario: $('#txtDni').val(),
        estado: $('#txtEstado').val(),
        nombre: $('#txtTitulares').val(),
        proyecto: accesoDatos.proyecto
    };
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
                if (accion == "agregar") {
                    var fecha = moment(objEvento.start, 'YYYY-MM-DD H:mm').format('DD-MM');
                    var hora = moment(objEvento.start, 'YYYY-MM-DD H:mm').format('H:mm');
                    enviarSMS(accesoDatos.telefono, "Portal del Sol te informa que se registró con éxito tu proceso de inicio de escrituración, con expediente n° " + objEvento.tramite);
                }
            }
        },
        error: function () {
            alert('Hay un error');
        }
    });
}

//Envío sms
function enviarSMS(numero, mensaje) {
    $.ajax({
        type: 'GET',
        url: 'https://api.elasticemail.com/v2/sms/send?apikey=71243cdf-2783-4ead-9619-ad35a3a3c9bf&to=%2b549' + numero + '&body=' + mensaje,
        success: function (msg) {
            // alert('Enviado!');
        },
        error: function () {
            // alert('Hay un error');
        }
    });
}

//Filtro los horarios que están disponibles del día y los agrego al modal
function agregarHorarios(fechaDelDiaSinHora) {
    $('#txtStart').empty();
    $('#txtEnd').empty();
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
        var fechaDelDiaSinHoraInvertida = moment(fechaDelDiaSinHora, 'DD-MM-YYYY').format('YYYY-MM-DD');
        for (let i = 0; i < horariosOriginales.length; i++) {
            $('#txtStart').append($('<option>', {
                value: fechaDelDiaSinHoraInvertida + " " + horariosOriginales[i],
                text: horariosOriginales[i]
            }));
            definirStartEnd($('#txtStart').val());
            $('#txtStart').on("change", function () {
                definirStartEnd($('#txtStart').val());
            });

        }
    });
}

//Agrego un input hidden (es el que recojo para enviar por POST) con la fecha elegida en el radio
function definirStartEnd(fechaStart) {
    $('#txtEnd').empty();

    var fechaEnd = moment(fechaStart, 'YYYY-MM-DD H:mm').add(30, 'minutes').format('YYYY-MM-DD H:mm');
    var HoraEnd = moment(fechaStart, 'YYYY-MM-DD H:mm').add(30, 'minutes').format('H:mm');

    $('#txtEnd').append($('<option>', {
        value: fechaEnd,
        text: HoraEnd
    }));
}
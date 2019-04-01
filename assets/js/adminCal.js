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
            $('#txtTramite').prop('disabled', false);
            $('#seccionTitulares').css('display', 'none');
            $('#seccionManzana').css('display', 'none');
            $('#seccionLote').css('display', 'none');
            $('#seccionTramite').css('display', 'block');
            $('#btnAgregar').css('display', 'block');
            $('#btnEliminar').css('display', 'none');
            $('#btnModificar').css('display', 'none');

            $('#txtEstado option:first').remove();
            $('#txtEstado').prepend('<option selected disabled>Seleccionar estado</option>');
            $('#seccionDniDia, #txtDni').val(null);
            $('#txtObservacion').prop('disabled', false);

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
            $('#txtTramite').prop('disabled', true);
            $('#btnAgregar').css('display', 'none');
            $('#btnEliminar').css('display', 'block');
            $('#btnModificar').css('display', 'block');

            $('#seccionLote').empty();
            $('#seccionLote').append('<span>Lotes:</span><br>');
            $('#seccionLote').append('<input class="form-control" type="text" id="txtLote" name="txtLote" disabled>');

            $('#seccionDniEvento,#txtDni').val(calEvent.usuario);
            $('#txtLote').val(calEvent.lote);
            $('#txtTramite').empty();
            $('#txtTramite').append($('<option>', {
                value: calEvent.tramite,
                text: calEvent.tramite
            }));

            $('#txtObservacion').val(calEvent.observacion);

            obtenerCliente(calEvent.usuario, calEvent.tramite);
            agregarEstado(calEvent.estado, 'evento');

            var fechaStart = calEvent.start.format('DD-MM-YYYY H:mm');
            var fechaEnd = calEvent.end.format('DD-MM-YYYY H:mm');

            var moment = $('#calendarioWeb').fullCalendar('getDate');
            var calDate = moment.format('DD-MM-YYYY');
            agregarFechaEvento(fechaStart, fechaEnd, calDate);

            $('#confirmar').removeClass();
            $('#confirmar').empty();
            $('#historial').removeClass();
            $('#historial').empty();

            //primer click
            $('#card-inicial').remove();
            $('#card').css('display', 'block');
        },
        editable: true,
        eventDrop: function (calEvent) {
            $('#txtId').val(calEvent.id);
            $('#txtObservacion').val(calEvent.observacion);
            $('#txtLote').val(calEvent.lote);
            $('#txtDni').val(calEvent.usuario);
            $('#txtEstado').val(calEvent.estado);

            $('#txtTramite').append($('<option>', {
                value: calEvent.tramite,
                selected: true
            }));

            var fechaHoraStart = calEvent.start.format().split("T");
            var fechaHoraEnd = calEvent.end.format().split("T");
            $('#txtStart').append($('<option>', {
                value: fechaHoraStart[0] + " " + fechaHoraStart[1],
                selected: true
            }));
            $('#txtEnd').append($('<option>', {
                value: fechaHoraEnd[0] + " " + fechaHoraEnd[1],
                selected: true
            }));

            recolectarDatos();
            enviarInformacion('modificar', nuevoEvento);
        }
    });

})

$('#btnAgregar').click(function () {
    recolectarDatos();
    if ($('#txtDni').val()) {
        if ($('#txtTramite').val()) {
            if ($('#txtLote').val()) {
                if ($('#seccionEstadoDia #txtEstado').val()) {
                    if ($('#txtStart').val() && $('#txtEnd').val()) {
                        swal("¿Confirma que quiere agregar el turno?", {
                            buttons: {
                                cancel: "Cancelar",
                                catch: {
                                    text: "Agregar",
                                    value: "catch",
                                },
                            },
                        })
                            .then((value) => {
                                switch (value) {
                                    case "catch":
                                        enviarInformacion('agregar', nuevoEvento);
                                        swal("¡Excelente!", "¡Turno agregado correctamente!", "success");
                                        break;
                                    default:
                                        break;
                                }
                            });
                    } else {
                        swal("Necesitás ingresar un horario para el turno.");
                    }
                } else {
                    swal("Necesitás ingresar un estado para el turno.");
                }
            } else {
                swal("Necesitás seleccionar al menos un lote para el turno.");
            }
        } else {
            swal("Necesitás seleccionar un trámite para el turno.");
        }
    } else {
        swal("Necesitás ingresar un dni para el turno.");
    }

});

$('#btnModificar').click(function () {
    recolectarDatos('modificar');
    if ($('#txtObservacion').val().length > 6) {
        swal("¿Confirma que quiere modificar el turno?", {
            buttons: {
                cancel: "Cancelar",
                catch: {
                    text: "Modificar",
                    value: "catch",
                },
            },
        })
            .then((value) => {
                switch (value) {
                    case "catch":
                        enviarInformacion('modificar', nuevoEvento);
                        swal("¡Excelente!", "¡Turno modificado correctamente!", "success");
                        break;
                    default:
                        break;
                }
            });
    } else {
        swal("Necesitás ingresar una observación.");
    }
});

$('#btnEliminar').click(function () {
    recolectarDatos('eliminar');
    swal("¿Confirma que quiere eliminar el turno?", {
        buttons: {
            cancel: "Cancelar",
            catch: {
                text: "Eliminar",
                value: "catch",
            },
        },
    })
        .then((value) => {
            switch (value) {
                case "catch":
                    enviarInformacion('eliminar', nuevoEvento);
                    swal("¡Turno eliminado!", "", "success");
                    break;
                default:
                    break;
            }
        });
});

//Recolecto los datos del modal para poder agregar/modificar/eliminar
function recolectarDatos(accion='agregar') {
    if(accion != 'agregar'){
        var estado = $('#seccionEstadoEvento #txtEstado').val();
    }else{
        var estado = $('#seccionEstadoDia #txtEstado').val();
    }
    nuevoEvento = {
        id: $('#txtId').val(),
        tramite: $('#txtTramite').val(),
        observacion: $('#txtObservacion').val(),
        lote: $('#txtLote').val(),
        start: $('#txtStart').val(),
        end: $('#txtEnd').val(),
        usuario: $('#txtDni').val(),
        estado: estado,
        telefono: $('#txtTelefono').val()
    };
    obtenerEstado(estado);//agrego estado con nombre
}

function obtenerEstado(indice) {
    $.getJSON("api.estados.php?indice=" + indice, function (datos) {
        $('#txtEstadoSMS').val(datos.nombre);
    });
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
                    if (objEvento.estado == 1) {
                        var fecha = moment(objEvento.start, 'YYYY-MM-DD H:mm').format('DD-MM');
                        var hora = moment(objEvento.start, 'YYYY-MM-DD H:mm').format('H:mm');
                        console.log(objEvento.telefono);
                        console.log(objEvento.tramite);
                        console.log($('#txtEstadoSMS').val());
                        console.log(fecha);
                        console.log(hora);
                        console.log(objEvento.observacion);
                        enviarSMS($('#txtTelefono').val(), "Tu tramite n° " + $('#txtTramite').val() + " con el motivo: " + $('#txtEstadoSMS').val() + " ya tiene fecha para el dia " + fecha + " a la hora " + hora + ". Observación: " + $('#txtObservacion').val());
                    }
                    if (objEvento.estado == 3) {
                        var fecha = moment(objEvento.start, 'YYYY-MM-DD H:mm').format('DD-MM');
                        var hora = moment(objEvento.start, 'YYYY-MM-DD H:mm').format('H:mm');
                        console.log(objEvento.telefono);
                        console.log(objEvento.tramite);
                        console.log($('#txtEstadoSMS').val());
                        console.log(fecha);
                        console.log(hora);
                        console.log(objEvento.observacion);
                        enviarSMS($('#txtTelefono').val(), "Tu tramite n° " + $('#txtTramite').val() + " con el motivo: " + $('#txtEstadoSMS').val() + " ya tiene fecha para el dia " + fecha + " a la hora " + hora + ". Observación: " + $('#txtObservacion').val());
                    }
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
            //alert('Enviado!');
        },
        error: function () {
            //alert('Hay un error');
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

//Agrego la fecha del evento al modal
function agregarFechaEvento(fechaStart, fechaEnd, fechaDelDiaSinHora) {
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

        var fechaInvertidaStart = moment(fechaStart, 'DD-MM-YYYY H:mm').format('YYYY-MM-DD H:mm');
        var HoraStart = moment(fechaStart, 'DD-MM-YYYY H:mm').format('H:mm');

        var fechaInvertidaEnd = moment(fechaEnd, 'DD-MM-YYYY H:mm').format('YYYY-MM-DD H:mm');
        var HoraEnd = moment(fechaEnd, 'DD-MM-YYYY H:mm').format('H:mm');

        $('#txtStart').append($('<option>', {
            value: fechaInvertidaStart,
            text: HoraStart
        }));
        $('#txtEnd').append($('<option>', {
            value: fechaInvertidaEnd,
            text: HoraEnd
        }));
        for (let i = 0; i < horariosOriginales.length; i++) {
            var fechaDelDiaSinHoraInvertida = moment(fechaStart, 'DD-MM-YYYY').format('YYYY-MM-DD');
            $('#txtStart').append($('<option>', {
                value: fechaDelDiaSinHoraInvertida + " " + horariosOriginales[i],
                text: horariosOriginales[i]
            }));
            $('#txtStart').on("change", function () {
                definirStartEnd($('#txtStart').val());
            });

        }
    });
}

//Obtengo los datos del cliente por dni como parametro
function obtenerCliente(usuario) {
    $.getJSON("api.clientes.php?usuario=" + usuario + "&accion=leer", function (datos) {
        $('#seccionTitulares').css('display', 'block');
        $('#seccionManzana').css('display', 'block');
        $('#seccionLote').css('display', 'block');
        $('#txtTitulares').val(datos.titulares);
        $('#txtManzana').val(datos.manzana);
        $('#txtTelefono').val(datos.telefono);
    });
}

//Obtengo los datos del evento por tramite como parametro
function obtenerEvento(tramite) {
    $.getJSON("api.eventos.php?tramite=" + tramite + "&accion=leerUnico", function (datos) {
        $('#seccionLote').empty();
        $('#seccionLote').append('<span>Lotes:</span><br>');
        $('#seccionLote').append('<input class="form-control" type="text" id="txtLote" name="txtLote" disabled>');
        $('#txtLote').val(datos.lote);
    });
}

//Obtengo los lotes por dni como parametro
function obtenerLotes(usuario) {
    $.getJSON("api.clientes.php?usuario=" + usuario + "&accion=lotes", function (datos) {
        if (datos.length > 0) {
            $('#seccionLote').empty();
            $('#seccionLote').append('<span>Lotes:</span><br>');
            $.each(datos, function (i, item) {
                $('#seccionLote').append('<input type="checkbox" name="txtLote[]" value="' + item.lote + '"> ' + item.lote + '<br>');
            });
            $('#seccionLote').append('<input type="hidden" id="txtLote" value="">');
        } else {
            if ($('#txtTramite option:last-child').text() == "Nuevo Trámite") {
                $('#txtTramite option:last-child').remove();
            }
        }
    });
}

//Compruebo la existencia de los lotes por dni como parametro y borro Nuevo tramite si no hay mas lotes
function comprobarLotes(usuario) {
    $.getJSON("api.clientes.php?usuario=" + usuario + "&accion=lotes", function (datos) {
        if (datos.length == 0) {
            if ($('#txtTramite option:last-child').text() == "Nuevo Trámite") {
                $('#txtTramite option:last-child').remove();
            }
        }
    });
}

$('#seccionLote').click(function () {
    var stringLote = '';
    if ($('input[name=txtLote\\[\\]]')[0] != undefined) {
        $.each($('input[name=txtLote\\[\\]]'), function (key, valor) {
            if (valor.checked == true) {
                if (stringLote == '') {
                    stringLote = valor.value;
                } else {
                    stringLote = stringLote + "," + valor.value;
                }
            }
        });
        $('#txtLote').val(stringLote);
    }
});

//Boton buscar por dni: busco si el cliente existe y lo muestro
function buscarCliente() {
    $('#historial').empty();
    $('#txtTramite').empty();
    $('#historial').addClass('alert alert-info');
    obtenerCliente($('#txtDni').val()); //obtengo el dni ingresado
    $.getJSON("api.eventos.php?accion=leer", function (data) { //obtengo todos los eventos

        var senal = 0; //señal que marca si existe o no un evento de con este dni
        var tramites = new Array();
        $.each(data, function (key, valor) {
            if ($('#txtDni').val() == valor.usuario) { //comparo cuando si el dni ingresado es igual al de un evento
                senal = 1; //si al menos existe un evento la señal es 1
                var indice = jQuery.inArray(valor.tramite, tramites); //compruebo si ya esta agregado el tramite al select
                if (indice == -1) {//si no existe lo agrego
                    tramites.push(valor.tramite); //almaceno los tramites relacionados al dni
                }
                $.each(data, function (key, valor) { //recorro la lista completa de eventos
                    if ($('#txtTramite').val() == valor.tramite) {//comparo el tramite del evento con el tramite elegido
                        $('#historial').append('<b>' + valor.start + '</b><br><span id="historial' + key + '"></span>');
                        agregarEstado(valor.estado, 'historial', 'historial' + key); //agrego el estado correspondiente al tramite
                    }
                });
            }
        });
        if (senal == 1) { //si existe al menos 1 evento del usuario
            $('#historial').prepend('<h6>Seleccionar trámite</h6>');

            $.each(tramites, function (i, item) { //recorro el array de tramites y los listo en el select
                $('#txtTramite').append($('<option>', {
                    value: item,
                    text: item
                }));
            });

            $('#txtTramite').prepend($('<option>', {
                value: "",
                text: "Seleccionar Trámite",
                disabled: true,
                selected: true
            }));
            var nuevoTramite = Math.floor((Math.random() * (90000000 - 11000000)) + 11000000);
            $('#txtTramite').append($('<option>', {
                value: nuevoTramite,
                text: "Nuevo Trámite"
            }));
            comprobarLotes($('#txtDni').val());//compruebo si existen lotes disponibles, sino borro el nuevo tramite
            $('#seccionLote').empty();
        } else { //si no existen eventos del usuario
            $('#historial').append('<h6>Aún no ha sacado ningún turno.</h6>');
            var nuevoTramite = Math.floor((Math.random() * (90000000 - 11000000)) + 11000000);
            $('#txtTramite').append($('<option>', { //agrego el nuevo numero de tramite
                value: nuevoTramite,
                text: nuevoTramite
            }));
            obtenerLotes($('#txtDni').val());//obtengo todos los lotes del usuario
        }
    });
}

function cambiarTramite() {
    $.getJSON("api.eventos.php?accion=leer", function (data) { //obtengo todos los eventos
        var tramiteActual = $('#txtTramite').val();
        var ultimoTramite = $('#txtTramite option:last-child').val();
        var op = "si";
        if ($('#txtTramite option:last-child').text() == "Nuevo Trámite" && tramiteActual == ultimoTramite) {
            op = "si";
        } else {
            op = "no";
        }
        if (op == "si") {
            $('#historial').empty();
            $('#historial').prepend('<h6>Nuevo trámite<hr></h6>');
            obtenerLotes($('#txtDni').val());//obtengo todos los lotes del usuario
        } else {
            obtenerEvento(tramiteActual); //obtengo el evento que muestra los lotes
            $('#historial').empty();
            $('#historial').prepend('<h6>Historial de turnos<hr></h6>');

            $.each(data, function (key, valor) { //recorro la lista completa de eventos
                if ($('#txtTramite').val() == valor.tramite) {//comparo el tramite del evento con el tramite elegido
                    $('#historial').append('<b>' + valor.start + '</b><br><span id="historial' + key + '"></span>');
                    agregarEstado(valor.estado, 'historial', 'historial' + key); //agrego el estado correspondiente al tramite
                }
            });
        }
    });
}

//Agrego el estado cuando clickeo el evento
function agregarEstado(estado, modo, id) {
    $.getJSON("api.estados.php?indice=" + estado, function (datos) {
        switch (modo) {
            case 'dia':
                $('#seccionEstadoDia #txtEstado').append($('<option>', {
                    value: datos.indice,
                    text: datos.nombre,
                    selected: true,
                }));
                break;
            case 'evento':
                $('#seccionEstadoEvento #txtEstado').empty();
                $('#seccionEstadoEvento #txtEstado').append($('<option>', {
                    value: datos.indice,
                    text: datos.nombre,
                    selected: true,
                }));
                break;
            case 'historial':
                $('#' + id).append(datos.nombre + '<br>');
                break;
        }
    });
}
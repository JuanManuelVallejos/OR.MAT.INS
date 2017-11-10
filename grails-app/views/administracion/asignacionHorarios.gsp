<html>
<head>
    <g:set var="seFinalizoPlazo" value="${true}" scope="request"/>
    <g:set var="finalizoAsignacion" value="${false}" scope="request"/>
    <link rel="stylesheet" href="${resource(dir: 'css', file: 'asignacion.css')}" type="text/css">
    <tooltip:resources stylesheet="myTooltipStyles"/>
    <meta name="layout" content="main">
    <g:javascript src="jquery-drdr.js" />
    <g:javascript src="jqueryui-drdr.js" />
    <script>
        $( function() {
            $("i[id^='dragg']").draggable({
                revert: 'invalid',
                drag: function(event, ui){
                    var idHTMLTarjeta = ui.helper.context.id;
                    var idTarjeta = parseInt(idHTMLTarjeta.split('dragg')[1]);
                    var URL='${createLink(controller: 'administracion', action: 'setTarjetaActual')}';
                    $.ajax({
                        url: URL,
                        type: 'POST',
                        contentType: 'application/json; charset=utf-8',
                        data: JSON.stringify({ idTarjeta:  idTarjeta}),
                        cache: false,
                        async: true,
                        success:[
                            function(data) {
                            }
                        ]
                })},
                stop: function (event, ui) {
                    var idHTMLSplitDrop = ui.helper.context.parentElement.id.split('dropp');
                    var dia = idHTMLSplitDrop[1];
                    var hora = idHTMLSplitDrop[2];
                    var idTarjeta = this.id.split('dragg')[1];
                    if(dia != "Container")
                        $('#alertaDocenteEnHorario').css('display','none');
                    else
                        $('#alertaDocenteEnHorario').css('display','');
                }
            });
            $("ul[id^='dropp']").droppable({
                drop: function (event, ui) {
                    $(ui.draggable).css('position', 'absolute').appendTo(this);
                    var leftInPixels = $(this).offset().left -132;
                    var idHTMLMateriaPorDocente = ui.draggable[0].id;
                    var idTarjeta = parseInt(idHTMLMateriaPorDocente.split('dragg')[1]);
                    var URL='${createLink(controller: 'administracion', action: 'reiniciarTarjeta')}';
                    $('#'+idHTMLMateriaPorDocente).css({
                        position: 'absolute',
                        left: leftInPixels
                    });
                    $.ajax({
                        url: URL,
                        type: 'POST',
                        contentType: 'application/json; charset=utf-8',
                        data: JSON.stringify({ idTarjeta:  idTarjeta}),
                        cache: false,
                        async: true,
                        success:[
                            function(data) {
                            }
                        ]
                    })
                }
            });
            $("td[id^='dropp']").droppable({
                classes: {
                    "ui-droppable-active": "ui-state-active",
                    "ui-droppable-hover": "ui-state-hover"
                },
                drop: function( event, ui ) {
                    var idDroppable = this;
                    var dia = this.id.split('dropp')[1];
                    var hora = parseInt(this.id.split('dropp')[2]);
                    $(ui.draggable).css('position', 'absolute').appendTo(this);
                    var idHTMLMateriaPorDocente = ui.draggable[0].id;
                    var idTarjeta = parseInt(idHTMLMateriaPorDocente.split('dragg')[1]);
                    var URL='${createLink(controller: 'administracion', action: 'setDroppableValue')}';
                    $.ajax({
                        url: URL,
                        type: 'POST',
                        contentType: 'application/json; charset=utf-8',
                        data: JSON.stringify({ idTarjeta:  idTarjeta, dia: dia, hora: hora }),
                        cache: false,
                        async: true,
                        success:[
                            function(data) {
                                mantenerTamañoContenedor();
                                $('#alertaDocenteEnHorario').css('display','none');
                                if($("."+idHTMLMateriaPorDocente).length == 0) {
                                    var widthInPixels = document.getElementById(idDroppable.id).clientWidth;
                                    var heightInPixels = document.getElementById(idDroppable.id).clientHeight;
                                    $('#'+idHTMLMateriaPorDocente).css({
                                        width: widthInPixels - 37,
                                        height: heightInPixels
                                    });
                                    $('#'+idHTMLMateriaPorDocente).addClass(idHTMLMateriaPorDocente);
                                }
                                var leftInPixels = $(idDroppable).offset().left - 270;
                                var pos = $(idDroppable).position();
                                $('#'+idHTMLMateriaPorDocente).css({
                                    position: 'absolute',
                                    top: pos.top,
                                    left: leftInPixels
                                });
                            }
                        ]
                    })
                },
                accept: function() {
                    var URL='${createLink(controller: 'administracion', action: 'docentePuedeEnHorario')}';
                    var dia = this.id.split('dropp')[1];
                    var hora = parseInt(this.id.split('dropp')[2]);
                    var puedeDocenteEnHoraYDia = true;
                    $.ajax({
                        url: URL,
                        type: 'POST',
                        contentType: 'application/json; charset=utf-8',
                        data: JSON.stringify({dia: dia, hora: hora}),
                        cache: false,
                        async: false,
                        success: [
                            function(data) {
                                puedeDocenteEnHoraYDia = data.result
                            }
                        ]
                    });
                    if(puedeDocenteEnHoraYDia){
                        return $('#'+this.id +' > i').length < 1;
                    }else{
                        return false;
                    }
                }
            });
        });
        function mantenerTamañoContenedor(){
            var widthInPixels = document.getElementById('droppContainer').clientWidth;
            var heightInPixels = document.getElementById('droppContainer').clientHeight;
            $('#droppContainer').css({
                height: heightInPixels,
                width: widthInPixels
            });
        }
        function puedeFinalizar(){
            var retorno = false;
            var URL='${createLink(controller: 'administracion', action: 'getPuedeFinalizarForJS')}';
            $.ajax({
                url: URL,
                type: 'POST',
                contentType: 'application/json; charset=utf-8',
                cache: false,
                async: false,
                success:[
                    function(data) {
                        retorno = (data.result == 'true');
                        if(!retorno){
                            $('#errorGrillaIncompleta').css('display','');
                        }
                    }
                ]
            });
            return retorno;
        }
    </script>
</head>
    <body>
        <div class="row">
            <div class="col-md-12">
                <h2>Asignación de horarios de <b> ${divisionInstance.curso.nombre} ${divisionInstance.division} </b> </h2>
            </div>
        </div>
        <br />
        <br />
        <div class="panel panel-success">
            <div class="panel-heading">
                <h2 class="panel-title">Asignacion manual</h2>
            </div>
            <div class="panel-body" align="center">
                <div class="row">
                    <div class="col-md-2">
                        <ul id="droppContainer" style="background-color: #d6e9c6; border-radius: 15px" class="list-group">
                            <g:each in="${tarjetas}" var="tarjeta">
                                <br />
                                    <i id="dragg${tarjeta.id}" class="btn btn-success ui-widget-header" style="z-index: 1; width: 97%; height: 10%; border-radius: 10px; background-color: #5cb85c" onmouseover="tooltip.show('${tarjeta.disponibilidad}');" onmouseout="tooltip.hide();">
                                        <span style="font-size: 100%"><b>${tarjeta.materia.nombre}</b></span><br/>
                                        <!-- <g:each in="${tarjeta.disponibilidad.split('_')}" var="hora">
                                            <span style="font-size: 50%">${hora}</span><br style="margin-top: 1%"/>
                                        </g:each> -->
                                        <span style="font-size: 100%">${tarjeta.docente.apellido}</span><br/>
                                    </i>
                            </g:each>
                        </ul>
                    </div>
                    <div class="col-md-10">
                        <div class="row">
                            <table class="table table-responsive">
                                <thead>
                                <tr>
                                    <td><h3>Lunes</h3></td>
                                    <td><h3>Martes</h3></td>
                                    <td><h3>Miercoles</h3></td>
                                    <td><h3>Jueves</h3></td>
                                    <td><h3>Viernes</h3></td>
                                </tr>
                                </thead>
                                <tbody>
                                <g:each in="${divisionInstance.primerHora .. divisionInstance.ultimaHora}" var="i">
                                    <tr>
                                    <g:each in="${["LUNES", "MARTES", "MIERCOLES", "JUEVES", "VIERNES"]}" var="dia">
                                        <td id="dropp${dia}dropp${i}" class="col-md-2" style="background-color: #d6e9c6">
                                            <p>${i}</p>
                                            <g:if test="${tarjetasAsignadas != null}">
                                                <g:each in="${tarjetasAsignadas}" var="tarjetaAsignada">
                                                    <g:if test="${tarjetaAsignada.hora == i && tarjetaAsignada.dia.toString() == dia}">
                                                        <i id="dragg${tarjetaAsignada.id}" class="btn btn-success ui-widget-header">
                                                            <p><b>${tarjetaAsignada.materia.nombre}</b></p>
                                                            <p>${tarjetaAsignada.docente.apellido}</p>
                                                        </i>
                                                    </g:if>
                                                </g:each>
                                            </g:if>
                                        </td>
                                    </g:each>
                                    </tr>
                                </g:each>
                                </tbody>
                            </table>
                        </div>
                        <br />
                        <div id="alertaDocenteEnHorario" style="display: none">
                            <div class="alert alert-warning" role="alert">
                                <p id="msgAlerta" style="font-size: 100%">El docente ya tiene una materia asignada para ese horario.</p>
                            </div>
                            <br />
                        </div>
                        <div id="errorGrillaIncompleta" style="display: none">
                            <div class="alert alert-warning" role="alert">
                                <p id="msgErrorMateria" style="font-size: 100%">Sólo se podrá finalizar la asignación si la grilla de horarios está completa</p>
                            </div>
                            <br />
                        </div>
                        <div class="row">
                            <div class="col-md-6 col-md-offset-3">
                                <div class="panel panel-success">
                                    <div class="panel-heading">
                                        <h2 class="panel-title">Finalizar asignacion</h2>
                                    </div>
                                    <div class="panel-body">
                                        <g:form controller="administracion" action="finalizarAsignacionDivision" onsubmit="return puedeFinalizar()">
                                            <g:hiddenField name="divisionID" value="${divisionInstance.id}" />
                                            <g:submitButton name="Finalizar" class="btn btn-success"/>
                                        </g:form>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </body>
</html>
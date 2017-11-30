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
                revert: function(is_valid_drop){
                    if(!is_valid_drop){
                        $('#alertaDocenteEnHorario').css('display','');
                        return true;
                    }else{
                        $('#alertaDocenteEnHorario').css('display','none');
                    }
                },
                connectToSortable: "#sortable",
                start: function (event, ui) {
                    var idHTMLTarjeta = ui.helper.context.id;
                    var idTarjeta = parseInt(idHTMLTarjeta.split('dragg')[1]);
                    var URL='${createLink(controller: 'administracion', action: 'setTarjetaActual')}';
                    setTarjeta(idTarjeta, URL);
                    $(ui.helper).addClass('ui-helper').css('width','130px');
                    $(ui.helper).addClass('ui-helper').css('height','50px');
                }
            });

            $("ul[id^='dropp']").droppable({
                drop: function (event, ui) {
                    var idPadre = ui.draggable.context.parentElement.id;
                    var topPosition;
                    if(idPadre != "droppContainer"){
                        var listItems = $('#'+this.id +' > i');
                        var listPosition = getListTopPositions(listItems);
                        var size = listItems.length;
                        var definitivo = size;
                        for(var i = 0; i < size; i++){
                            var item = i;
                            if(!numIsInList(item*50,listPosition)){
                                definitivo = item;
                            }
                        }
                        topPosition = definitivo * 50;
                    }else{
                        topPosition = $(ui.draggable).position().top;
                    }
                    $(this).append(ui.draggable);
                    var leftInPixels = $(this).position().left;
                    var idHTMLMateriaPorDocente = ui.draggable[0].id;
                    $('#'+idHTMLMateriaPorDocente).css({
                        position: 'absolute',
                        left: leftInPixels,
                        top: topPosition
                    });
                    var idTarjeta = parseInt(idHTMLMateriaPorDocente.split('dragg')[1]);
                    var URL='${createLink(controller: 'administracion', action: 'reiniciarTarjeta')}';
                    if(idPadre != "droppContainer")
                        setTarjeta(idTarjeta, URL);
                },
                accept: function(event) {
                    return event.context.parentElement.id != "droppContainer";
                }
            });

            $("td[id^='dropp']").droppable({
                classes: {
                    "ui-droppable-active": "ui-state-active",
                    "ui-droppable-hover": "ui-state-hover"
                },
                drop: function( event, ui ) {
                    $(this).append(ui.draggable);
                    var idHTMLMateriaPorDocente = ui.draggable[0].id;
                    var leftInPixels = $(this).offset().left - 270;
                    var pos = $(this).position();
                    $('#'+idHTMLMateriaPorDocente).css({
                        position: 'absolute',
                        top: pos.top,
                        left: leftInPixels
                    });
                    var dia = this.id.split('dropp')[1];
                    var hora = parseInt(this.id.split('dropp')[2]);
                    var idTarjeta = parseInt(idHTMLMateriaPorDocente.split('dragg')[1]);
                    setDropabbleValue(idTarjeta,dia,hora);
                },
                accept: function() {
                    var dia = this.id.split('dropp')[1];
                    var hora = parseInt(this.id.split('dropp')[2]);
                    if(docentePuedeEnHora(dia,hora)){
                        return $('#'+this.id +' > i').length < 1;
                    }else{
                        return false;
                    }
                }
            });
        });

        function setTarjeta(idTarjeta, URL){
            $.ajax({
                url: URL,
                type: 'POST',
                contentType: 'application/json; charset=utf-8',
                data: JSON.stringify({ idTarjeta:  idTarjeta}),
                cache: false,
                async: true
            })
        }
        function docentePuedeEnHora(dia, hora){
            var puedeDocenteEnHoraYDia = true;
            var idDivision = $('#hdnDivision').val();
            var URL='${createLink(controller: 'administracion', action: 'docentePuedeEnHorario')}';
            $.ajax({
                url: URL,
                type: 'POST',
                contentType: 'application/json; charset=utf-8',
                data: JSON.stringify({divisionID: idDivision, dia: dia, hora: hora}),
                cache: false,
                async: false,
                success: [
                    function(data) {
                        puedeDocenteEnHoraYDia = data.result
                    }
                ]
            });
            return puedeDocenteEnHoraYDia;
        }
        function setDropabbleValue(idTarjeta,dia,hora){
            var URL='${createLink(controller: 'administracion', action: 'setDroppableValue')}';
            $.ajax({
                url: URL,
                type: 'POST',
                contentType: 'application/json; charset=utf-8',
                data: JSON.stringify({idTarjeta: idTarjeta, dia: dia, hora: hora}),
                cache: false,
                async: true
            });
        }
        function getListTopPositions(list){
            var listReturn = []
            for(var it = 0; it<list.length; it++){
                listReturn[it] = $(list[it]).position().top;
            }
            return listReturn;
        }
        function numIsInList(num, list){
            for(i = 0; i<list.length; i++){
                if(list[i] == num)
                    return true;
            }
            return false;
        }
    </script>
</head>
    <body>
    <g:hiddenField name="hdnDivision" value="${divisionInstance.id}" />
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
                        <ul id="droppContainer" style="background-color: #d6e9c6; border-radius: 15px; height: ${(tarjetas.size()+tarjetasAsignadas.size())*50}px" class="list-group">
                            <g:each in="${tarjetas}" var="tarjeta">
                                <i id="dragg${tarjeta.id}" class="btn btn-success ui-widget-header" style="z-index: 1; width: 130px; height: 50px; border-radius: 10px; background-color: #5cb85c" onmouseover="tooltip.show('${tarjeta.disponibilidad}');" onmouseout="tooltip.hide();">
                                    <span style="font-size: 100%"><b>${tarjeta.materia.nombre}</b></span><br/>
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
                                        <td id="dropp${dia}dropp${i}" class="col-md-2" style="height: 50px;background-color: #d6e9c6">
                                            <b>${i}</b>
                                            <g:each in="${tarjetasAsignadas}" var="tarjetaAsignada">
                                                <g:if test="${tarjetaAsignada.hora == i && tarjetaAsignada.dia.toString() == dia}">
                                                    <i id="dragg${tarjetaAsignada.id}" class="btn btn-success ui-widget-header" style="z-index: 1; width: 130px; height: 50px; border-radius: 10px; background-color: #5cb85c" onmouseover="tooltip.show('${tarjetaAsignada.disponibilidad}');" onmouseout="tooltip.hide();">
                                                        <span style="font-size: 100%"><b>${tarjetaAsignada.materia.nombre}</b></span><br/>
                                                        <span style="font-size: 100%">${tarjetaAsignada.docente.apellido}</span><br/>
                                                    </i>
                                                </g:if>
                                            </g:each>
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
                                <p id="msgAlerta" style="font-size: 100%">El movimiento es inválido o el docente ya tiene una materia asignada para ese horario.</p>
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
                                        <h2 class="panel-title">Guardar asignaciones</h2>
                                    </div>
                                    <div class="panel-body">
                                        <g:form controller="administracion" action="guardarAsignacionesDivision">
                                            <g:hiddenField name="divisionID" value="${divisionInstance.id}" />
                                            <g:submitButton name="Guardar" class="btn btn-success"/>
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
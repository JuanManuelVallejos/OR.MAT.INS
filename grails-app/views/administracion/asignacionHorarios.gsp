<html>
    <head>
        <meta name="layout" content="main">
        <g:javascript src="jquery-drdr.js" />
        <g:javascript src="jqueryui-drdr.js" />
        <script>

            $( function() {
                $("i[id^='dragg']").draggable({
                    revert: 'invalid'
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
                        return $('#'+this.id +' > i').length < 1;
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
                                <i id="dragg${tarjeta.id}" class="btn btn-success ui-widget-header" style="z-index: 1; width: 97%; height: 10%; border-radius: 10px; background-color: #5cb85c">
                                    <p style="font-size: 100%"><b>${tarjeta.materia.nombre}</b></p>
                                    <p style="font-size: 100%">${tarjeta.docente.apellido}</p>
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
                                            <td id="droppLUNESdropp${i}" class="col-md-2" style="background-color: #d6e9c6">
                                                <p>${i}</p>
                                            </td>
                                            <td  id="droppMARTESdropp${i}" class="col-md-2" style="background-color: #d6e9c6 ">
                                                <p>${i}</p>
                                            </td>
                                            <td id="droppMIERCOLESdropp${i}" class="col-md-2" style="background-color: #d6e9c6">
                                                <p>${i}</p>
                                            </td>
                                            <td id="droppJUEVESdropp${i}" class="col-md-2" style="background-color: #d6e9c6">
                                                <p>${i}</p>
                                            </td>
                                            <td id="droppVIERNESdropp${i}" class="col-md-2" width="100" height="100" style="background-color: #d6e9c6">
                                                <p>${i}</p>
                                            </td>
                                        </tr>
                                    </g:each>
                                </tbody>
                            </table>
                        </div>
                        <br />
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
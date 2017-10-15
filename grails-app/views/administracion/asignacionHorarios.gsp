<html>
    <head>
        <meta name="layout" content="main">
        <g:javascript src="jquery-drdr.js" />
        <g:javascript src="jqueryui-drdr.js" />
        <style>
            .intro {
                background-color: blue;
                width:100 ;
            }
        </style>
        <script>
            $( function() {
                $("i[id^='draggable']").draggable({ revert: "invalid"});
                $("td[id^='droppable']").droppable({
                    classes: {
                        "ui-droppable-active": "ui-state-active",
                        "ui-droppable-hover": "ui-state-hover"
                    },
                    drop: function( event, ui ) {
                        var idDroppable = this;
                        var idHTMLMateriaPorDocente = ui.draggable[0].id;
                        var idMateriaPorDocente = parseInt(idHTMLMateriaPorDocente.split('draggable')[1]);
                        var URL='${createLink(controller: 'administracion', action: 'setDroppableValue')}';
                        $.ajax({
                            url: URL,
                            type: 'POST',
                            contentType: 'application/json; charset=utf-8',
                            data: JSON.stringify({ idMatXDoc:  idMateriaPorDocente }),
                            cache: false,
                            async: true,
                            success:[
                                function(data) {
                                    var pos = $(idDroppable).position();

                                    // .outerWidth() takes into account border and padding.
                                    var width = $(idDroppable).outerWidth();
                                    var height = $(idDroppable).outerHeight();
                                    $('#'+idHTMLMateriaPorDocente).css({
                                        position: "absolute",
                                        top: (pos.top+(height*0.1)) + "px",
                                        left: (pos.left + (width*1.05)) + "px"
                                    });
                                    $(idDroppable).html(data.result);
                                }
                            ],
                            error:[
                                function(data) { }
                            ]
                        })
                    }
                });
            } );
        </script>
    </head>
    <body>
        <div class="row">
            <div class="col-md-12">
                <h2>${divisionInstance.curso.nombre} ${divisionInstance.division}</h2>
            </div>
        </div>
        <br /><br />
        <div class="row">
            <div class="col-md-2">
                <ul id="droppableContainer" class="list-group">
                    <g:each in="${tarjetas}" var="tarjeta">
                        <i id="draggable${tarjeta.idMateriaPorDocente}draggable${tarjeta.id}" width="100" height="100" class="btn btn-success ui-widget-header" style="z-index: 1">
                            <p style="font-size: 100%">${tarjeta.docente.apellido} - ${tarjeta.materia.nombre}</p>
                        </i>
                    </g:each>
                </ul>
            </div>
            <div class="col-md-10">
                <table class="table table-responsive">
                    <thead>
                        <tr>
                            <td>LUNES</td>
                            <td>MARTES</td>
                            <td>MIERCOLES</td>
                            <td>JUEVES</td>
                            <td>VIERNES</td>
                        </tr>
                    </thead>
                    <tbody>
                        <g:each in="${divisionInstance.primerHora .. divisionInstance.ultimaHora}" var="i">
                            <tr>
                                <td id="droppableLu${i}" width="100" height="100" class="ui-widget-header">
                                    <p>${i}</p>
                                </td>
                                <td id="droppableMa${i}" width="100" height="100" class="ui-widget-header">
                                    <p>${i}</p>
                                </td>
                                <td id="droppableMi${i}" width="100" height="100" class="ui-widget-header">
                                    <p>${i}</p>
                                </td>
                                <td id="droppableJu${i}" width="100" height="100" class="ui-widget-header">
                                    <p>${i}</p>
                                </td>
                                <td id="droppableVi${i}" width="100" height="100" class="ui-widget-header">
                                    <p>${i}</p>
                                </td>
                            </tr>
                        </g:each>
                    </tbody>
                </table>
            </div>
        </div>
    </body>
</html>
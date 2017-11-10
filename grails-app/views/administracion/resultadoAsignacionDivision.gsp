<html>
    <head>
        <g:set var="seFinalizoPlazo" value="${true}" scope="request"/>
        <g:set var="finalizoAsignacion" value="${true}" scope="request"/>
        <meta name="layout" content="main" />
    </head>
    <body>
        <div class="row">
            <div class="col-md-12">
                <h2>Resultado de la asignación <b> ${divisionInstance.curso.nombre} ${divisionInstance.division} </b> </h2>
            </div>
        </div>
        <br /><br />
        <div class="panel panel-success">
            <div class="panel-heading">
                <h2 class="panel-title">Resultado</h2>
            </div>
            <tr class="panel-body">
                <table class="table table-responsive">
                    <tr style="background-color: transparent">
                        <th style="text-align: center"><h3>Lunes</h3></th>
                        <th style="text-align: center"><h3>Martes</h3></th>
                        <th style="text-align: center"><h3>Miercoles</h3></th>
                        <th style="text-align: center"><h3>Jueves</h3></th>
                        <th style="text-align: center"><h3>Viernes</h3></th>
                    </tr>
                    <g:each in="${divisionInstance.primerHora .. divisionInstance.ultimaHora}" var="hora">
                        <tr >
                            <g:each in="${["LUNES", "MARTES", "MIERCOLES", "JUEVES", "VIERNES"]}" var="dia">
                                <g:each in="${divisionInstance.asignaciones}" var="asignacion">
                                    <g:if test="${asignacion.hora == hora && asignacion.dia.toString() == dia}">
                                        <td style="border: 1px; background-color: #dff0d8;">
                                            <div class="row">
                                                <div class="col-md-2">
                                                    <p><b style="color: green">${hora}</b></p>
                                                </div>
                                                <div class="col-md-10">
                                                    <p><b>${asignacion.materia.nombre}</b></p>
                                                    <b><p>${asignacion.docente.apellido}</p></b>
                                                </div>
                                            </div>
                                        </td>
                                    </g:if>
                                </g:each>
                            </g:each>
                        </tr>
                    </g:each>
                </table>
            </div>
        </div>
    </body>
</html>
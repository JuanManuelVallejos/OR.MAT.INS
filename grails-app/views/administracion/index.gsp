<html>
    <head>
        <g:set var="seFinalizoPlazo" value="${finalizoPlazo}" scope="request"/>
        <g:set var="finalizoAsignacion" value="${finalizoAsignaciones}" scope="request"/>
        <meta name="layout" content="main"/>
    </head>
    <body>
        <div class="row">
            <h2>Administrar Datos del Sistema</h2>
        </div>
        <br />
        <g:if test="${divisionesSinCubrir}">
            <div class="alert alert-danger" role="alert">
                <p style="font-size: 100%">No puede finalizar el plazo de ingreso de datos.Las siguientes divisiones estan incompletas:</p>
                <ul>
                    <g:each in="${divisionesSinCubrir}" var="division">
                        <li>
                            <g:link controller="curso" action="show" id="${division.curso.id}" style="color:red">Curso: ${division.curso.nombre} - Division: ${division.division}</g:link>
                        </li>
                    </g:each>
                </ul>
            </div>
            <br />
        </g:if>
        <g:if test="${divisionesSinAsignar}">
            <div class="alert alert-danger" role="alert">
                <p style="font-size: 100%">No puede finalizar el plazo asignación.Las siguientes divisiones estan incompletas:</p>
                <ul>
                    <g:each in="${divisionesSinAsignar}" var="division">
                        <li>
                            <g:link controller="administracion" action="asignacionHorarios" id="${division.id}" style="color:red">Curso: ${division.curso.nombre} - Division: ${division.division}</g:link>
                        </li>
                    </g:each>
                </ul>
            </div>
            <br />
        </g:if>
        <g:if test="${!finalizoPlazo}">
            <div class="row">
                <div class="col-md-6">
                    <div class="panel panel-success">
                        <div class="panel-heading">
                            <h2 class="panel-title">Finalizar ingreso de datos</h2>
                        </div>
                        <div class="panel-body" align="center">
                            <g:uploadForm controller="administracion" action="finalizarPlazo">
                                <g:submitButton name="Finalizar Plazo" class="btn btn-danger" />
                            </g:uploadForm>
                        </div>
                    </div>
                </div>
            </div>
        </g:if>
        <g:else>
            <g:if test="${!finalizoAsignaciones}">
                <div class="row">
                    <div class="col-md-6">
                        <div class="panel panel-success">
                            <div class="panel-heading">
                                <h2 class="panel-title">Extender ingreso de datos</h2>
                            </div>
                            <div class="panel-body" align="center">
                                <g:uploadForm controller="administracion" action="extenderPlazo">
                                    <g:submitButton name="Extender Plazo" class="btn btn-success" />
                                </g:uploadForm>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="col-md-6">
                        <div class="panel panel-success">
                            <div class="panel-heading">
                                <h2 class="panel-title">Finalizar asignaciones</h2>
                            </div>
                            <div class="panel-body" align="center">
                                <g:uploadForm controller="administracion" action="finalizarAsignaciones">
                                    <g:submitButton name="Finalizar Asignacion" class="btn btn-danger" />
                                </g:uploadForm>
                            </div>
                        </div>
                    </div>
                </div>
            </g:if>
            <g:else>
                <div class="row">
                    <div class="col-md-6">
                        <div class="panel panel-success">
                            <div class="panel-heading">
                                <h2 class="panel-title">Extender asignaciones</h2>
                            </div>
                            <div class="panel-body" align="center">
                                <g:uploadForm controller="administracion" action="extenderAsignacion">
                                    <g:submitButton name="Extender Asignacion" class="btn btn-success" />
                                </g:uploadForm>
                            </div>
                        </div>
                    </div>
                </div>
            </g:else>
        </g:else>
    </body>
</html>
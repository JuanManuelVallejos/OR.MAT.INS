<%@ page contentType="text/html;charset=UTF-8" %>
<html>
    <head>
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
                    <li>Curso: ${division.curso.nombre} - Division: ${division.division}</li>
                </g:each>
            </ul>
        </div>
        <br />
    </g:if>
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
    </body>
</html>
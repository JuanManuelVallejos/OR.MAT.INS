<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <g:set var="seFinalizoPlazo" value="${true}" scope="request"/>
    <meta name="layout" content="main" />
</head>

<body>
    <div class="row">
        <h2>Asignación de horarios por División</h2>
    </div>
    <br/>
    <div class="row">
        <div class="col col-md-6">
            <div class="panel panel-success">
                <div class="panel-heading">
                    <h2 class="panel-title">Seleccione división</h2>
                </div>
                <div class="panel-body">
                    <g:each in="${cursos}" var="curso">
                        <h3>${curso.nombre}</h3>
                        <ul>
                            <g:each in="${curso.divisiones}" var="division">
                                <li>
                                    <g:link id="${division.id}" action="asignacionHorarios"  style="color: green">${division.division}</g:link>
                                </li>
                            </g:each>
                        </ul>
                    </g:each>
                </div>
            </div>
        </div>
    </div>
</body>
</html>
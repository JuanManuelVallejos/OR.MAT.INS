<!DOCTYPE HTML>
<html>
<head>
    <style>
        .tarjetaAsignacion{
            width: 100%;
            height: 100%;
            color: #00b3ee;
            background-color: #2aabd2;
        }
        .celdaAsignacion {
            width: 10%;
            height: 200px;
            display: table-cell;
            padding-top: 100%;
            background-color: #d6e9c7;
        }
    </style>
    <script>
        function allowDrop(ev) {
            ev.preventDefault();
        }

        function drag(ev) {
            ev.dataTransfer.setData("text", ev.target.id);
        }

        function drop(ev) {
            ev.preventDefault();
            $(ui.draggable).appendTo(this);
            //var data = ev.dataTransfer.getData("text");
            //ev.target.appendChild(document.getElementById(data));
        }
    </script>
    <meta name="layout" content="main" />
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
                <ul ondrop="drop(event)" ondragover="allowDrop(event)" class="list-group">
                    <g:each in="${tarjetasSinAsignar}" var="tarjetaSinAsignar">
                        <br />
                        <i draggable="true" ondragstart="drag(event)" class="tarjetaAsignacion">
                            <p><b>${tarjetaSinAsignar.materia.nombre}</b></p>
                            <p>${tarjetaSinAsignar.docente.apellido}</p>
                        </i>
                    </g:each>
                </ul>
            </div>
            <div class="col-md-10">
                <div class="row">
                    <table class="table table-bordered">
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
                                    <td class="celdaAsignacion">
                                        <div ondrop="drop(event)" ondragover="allowDrop(event)">
                                            <p>${i}</p>
                                            <g:if test="${tarjetasAsignadas != null}">
                                                <g:each in="${tarjetasAsignadas}" var="tarjetaAsignada">
                                                    <g:if test="${tarjetaAsignada.hora == i && tarjetaAsignada.dia.toString() == dia}">
                                                        <i draggable="true" ondragstart="drag(event)">
                                                            <p><b>${tarjetaAsignada.materia.nombre}</b></p>
                                                            <p>${tarjetaAsignada.docente.apellido}</p>
                                                        </i>
                                                    </g:if>
                                                </g:each>
                                            </g:if>
                                        </div>
                                    </td>
                                </g:each>
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
                    <div class="col-md-6">
                        <div class="panel panel-default">
                            <div class="panel-heading">
                                <h2 class="panel-title">Guardado parcial</h2>
                            </div>
                            <div class="panel-body">
                                <g:form controller="administracion" action="guardarAsignacionDivision">
                                    <g:hiddenField name="divisionID" value="${divisionInstance.id}" />
                                    <g:submitButton name="Guardar" class="btn btn-default"/>
                                </g:form>
                            </div>
                        </div>
                        <div class="col-md-6">
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
</div>

</body>
</html>
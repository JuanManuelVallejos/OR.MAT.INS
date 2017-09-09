
<%@ page import="aulas.Division" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<r:require modules="bootstrap"/>
	</head>
	<body>
	<div class="row">
		<div class="col-md-12">
			<h2> Division ${divisionInstance.division} </h2>
		</div>
	</div>
    <div class="panel panel-primary">
        <div class="panel-heading">
            <h2 class="panel-title">Agregar Materia</h2>
        </div>
        <div class="panel-body" align="center">
            <g:uploadForm name="upMatDoc" controller="materiaPorDocente" action="save">
                <table class="table table-striped">
                    <thead>
                    <tr>
                        <th>Materia</th>
                        <th>Horas a cubrir</th>
                        <th>Docente</th>
                    </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <td>
                                <g:select class="btn btn-default dropdown-toggle" name="materiaId" from="${materias}" noSelection="${['null':'Seleccione una materia']}" optionKey="id" optionValue="nombre"></g:select>
                            </td>
                            <td>
                                <g:textField name="horas" required="required" typeof="Integer"></g:textField>
                            </td>
                            <td>
                                <g:select class="btn btn-default dropdown-toggle" name="docenteId" from="${docentes}" noSelection="${['null':'Seleccione un docente']}" optionKey="id" optionValue="apellido" ></g:select>
                            </td>
                        </tr>
                    </tbody>
                </table>
                <g:hiddenField name="divisionId" value="${divisionInstance.id}"></g:hiddenField>
                <g:submitButton class="btn btn-primary" name="save" value="Agregar Materia"></g:submitButton>
            </g:uploadForm>
        </div>
    </div>
    <br/>

    <br/>
	<div class="panel panel-primary">
		<div class="panel-heading">
			<h2 class="panel-title">Materias por docente</h2>
		</div>
		<div class="panel-body" align="center">
            <table class="table table-striped">
                <thead>
                    <tr>
                        <th>Materia</th>
                        <th>Horas a cubrir</th>
                        <th>Docente</th>
                    </tr>
                </thead>
                <tbody>
                    <g:each in="${divisionInstance.materiasPorDocente}" var="materiaPorDocente">
                        <tr>
                            <td>
                                ${materiaPorDocente.materia.nombre}
                            </td>
                            <td>
                                ${materiaPorDocente.horasACubrir}
                            </td>
                            <td>
                                ${materiaPorDocente.docente.apellido}
                            </td>
                        </tr>
                    </g:each>
                </tbody>
            </table>
		</div>
	</div>
	</body>
</html>

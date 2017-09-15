
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
                    <g:render id="tablaAdicionMatXDocente"
                              template="/materiaPorDocente/tabla"
                              model="[materias: materias,
                                      division: divisionInstance,
                                      docentes: docentes,
                                      modoAdicion: true]"/>
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
                <g:render id="tablaMatXDocente" template="/materiaPorDocente/tabla"
                          model="[materias: materias,
                                  division: divisionInstance,
                                  docentes: docentes ,
                                  modoAdicion: false]" />
            </div>
        </div>
	</body>
</html>

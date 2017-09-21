<html>
<head>
	<meta name="layout" content="main"/>
	<r:require modules="bootstrap"/>
</head>
<body>
	<div class="row">
		<div class="col-md-12">
		    <h2> Informacion de ${cursoInstance.nombre} </h2>
	    </div>
    </div>
<br/>
<br/>
<div class="row">
    <div class="col-md-8">
        <div class="panel panel-success">
            <div class="panel panel-heading">Agregar division</div>
            <div class="panel-body">
                <g:uploadForm action="addDivision">
                    <g:render template="/division/form"></g:render>
                    <g:hiddenField name="cursoId" value="${cursoInstance.id}" />
                    <g:submitButton class="btn btn-success" name="save" value="Agregar nueva división" />
                </g:uploadForm>
            </div>
        </div>
    </div>
</div>
<br />
<div class="row">
    <div class="col-md-12">
        <div id="divisionesAccordion" data-children=".item">
            <ul class="list-group">
                <g:each in="${divisionesOrdenadas}" var="division">
                    <li class="list-group-item list-group-item-success">
                        <div class="item">
                            <a data-toggle="collapse" data-parent="divisionesAccordion" href="#${division.id}" aria-expanded="false" aria-controls="${division.id}">
                                <div class="row">
                                    <div class="col col-md-10">
                                        <h3>Division ${division.division}</h3>
                                    </div>
                            </a>
                                    <div class="col col-md-2">
                                        <br />
                                        <g:uploadForm name="deleteForm" controller="division" action="eliminar">
                                            <g:hiddenField name="divisionID" value="${division.id}"></g:hiddenField>
                                            <button type="submit" class="btn btn-sm btn-danger" onclick="return confirm('Esta acción eliminará el curso entero, incluido los datos que se cagaron en el. ¿Estas seguro?')">
                                                <span class="glyphicon glyphicon-trash" title="Eliminar"></span>
                                            </button>
                                        </g:uploadForm>
                                    </div>
                                </div>

                            <div id="${division.id}" class="collapse" role="tabpanel">
                                <g:render template="/division/dataDivision" model="[divisionInstance: division, materias:materias, docentes: docentes, idDivision: division.id]"></g:render>
                            </div>
                        </div>
                    </li>
                </g:each>
            </ul>
        </div>
    </div>
</div>
</body>
</html>
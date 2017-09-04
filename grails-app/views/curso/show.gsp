<html>
<head>
	<meta name="layout" content="main"/>
	<r:require modules="bootstrap"/>
</head>
<body>
<div class="row">
	<class="col-md-12">
		<h2> Informacion de ${cursoInstance.nombre} </h2>
	</div>
</div>
<br/>
<div class="row">
	<div class="col-md-12">
		<table class="table">
			<thead>
			<tr>
				<td>Division</td>
			</tr>
			</thead>
			<tbody>
			<g:each in="${cursoInstance.divisiones}" var="division">
				<tr>
					<td>
						<label id="nombre">
							<g:link controller="division" action="show" id="${division.id}" >
								${division.division}
							</g:link>
						</label>
					</td>
				</tr>
			</g:each>
			</tbody>
		</table>
	</div>
	<br/>
	<div class="row">
		<div class="col-md-6">
			<div class="panel panel-default">
				<div class="panel panel-heading">Agregar division</div>
				<div class="panel-body">
                    <g:uploadForm action="addDivision">
                        <g:textField id="inputDivision" name="nombreDivision" placeholder="Nombre de division" required="required"></g:textField>
                        <g:hiddenField name="cursoId" value="${cursoInstance.id}" />
                        <g:submitButton class="btn btn-primary" name="save" value="Agregar nueva división" />
                    </g:uploadForm>
				</div>
			</div>
		</div>
	</div>
</div>
</body>
</html>
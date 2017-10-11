<html>
	<head>
		<meta name="layout" content="main"/>
        <r:script>
            function callEliminar(materiaID, docenteID){
                var URL='${createLink(controller: 'docente', action: 'eliminarMateria')}';
                $.ajax({
                    url: URL,
                    type: 'POST',
                    contentType: 'application/json; charset=utf-8',
                    data: JSON.stringify({ materiaId:  materiaID, docenteId: docenteID }),
                    cache: false,
                    async: true,
                    success:[
                        function(data) {
                            $('#tablaMaterias').html(data);
                        }
                    ],
                    error:[
                        function(data) {  }
                    ]
                })
            }
        </r:script>
		<r:require modules="bootstrap"/>
	</head>
	<body>
		<div class="row">
			<div class="col-md-12">
				<h2> Datos del docente </h2>
			</div>
		</div>
		<br/>
		<div class="row">
			<div class="col-md-5">
				<g:render template="form" model="[docenteInstance: docenteInstance, modoEdicion:false]"></g:render>
			</div>
			<div class="col-md-7">
				<g:render template="formProfesional" model="[docenteInstance: docenteInstance, materias: materias, materiasAsignadas: materiasDeDocente, materiasCount:materiasCount]"></g:render>
			</div>
		</div>
		<div class="row">
			<div class="col-md-12">
                <div class="panel panel-success">
                    <div class="panel-heading">
                        <h2 class="panel-title">Documentación respaldatoria</h2>
                    </div>
                    <div class="panel-body">
                        <div class="panel panel-default">
                            <div class="panel-heading">
                                <h2 class="panel-title">Títulos</h2>
                            </div>
                            <div class="panel-body">
                                <g:uploadForm action="upload" method="post" enctype="multipart/form-data">
                                    <fieldset class="form">
                                        <input type="file" name="file" />
                                    </fieldset>
                                    <br />
                                    <fieldset class="button">
                                        <g:submitButton name="upload" class="btn btn-success" value="Upload"/>
                                    </fieldset>
                                </g:uploadForm>
                                <br />
                                <div class="panel-body">
                                    <table class="table table-striped">
                                        <thead>
                                        <tr>
                                            <th>Documento</th>
                                            <th>Acciones</th>
                                        </tr>
                                        </thead>
                                        <tbody>
                                            <g:form controller="docente">
                                                <g:each in="${documentInstanceList}" status="i" var="documentInstance">
                                                    <g:hiddenField name="documentId" value="${documentInstance.id}" />
                                                    <tr class="${(i % 2) == 0 ? 'even':'odd'}">
                                                        <th>
                                                            <g:link action="downloadFile" id="${documentInstance.id}" style="color:green">${documentInstance.fileName}</g:link>
                                                        </th>
                                                        <th>
                                                            <g:actionSubmit action="deleteFile" class="btn btn-danger" value="Eliminar" ></g:actionSubmit>
                                                        </th>
                                                    </tr>
                                                </g:each>
                                            </g:form>
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
			</div>
		</div>
	</body>
</html>
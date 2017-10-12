<html>
	<head>
		<meta name="layout" content="main"/>
        <r:script>
            function callEliminar(materiaID,materiaVal , docenteID){
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
                            var optionAppendable = "<option value="+materiaID+">"+materiaVal+"</option>";
                            $('#selectMateria').append(optionAppendable);
                            $('#tablaMaterias').html(data);
                        }
                    ],
                    error:[
                        function(data) {  }
                    ]
                })
            }
            function callAgregar(docenteID){
                var materiaID = $('#selectMateria').val();
                if(validateAgregar(materiaID)){
                    var URL='${createLink(controller: 'docente', action: 'agregarMateria')}';
                    $.ajax({
                        url: URL,
                        type: 'POST',
                        contentType: 'application/json; charset=utf-8',
                        data: JSON.stringify({ materiaId:  materiaID, docenteId: docenteID }),
                        cache: false,
                        async: true,
                        success:[
                            function(data) {
                                var query = "#selectMateria option[value='"+materiaID+"']";
                                $(query).remove();
                                $('#tablaMaterias').html(data);
                            }
                        ],
                        error:[
                            function(data) {  }
                        ]
                    })
                }
            }

            function validateAgregar(materiaID){
                if(materiaID == "null"){
                    $('#errorMateriaNoIngresada').css("display","");
                    return false;
                }
                else{
                    $('#errorMateriaNoIngresada').css("display","none");
                    return true;
                }
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
                <g:render template="documentacion" model="[documentInstanceList: documentInstanceList]" />
			</div>
		</div>
	</body>
</html>
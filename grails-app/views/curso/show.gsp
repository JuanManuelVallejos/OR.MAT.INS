<html>
<head>
	<meta name="layout" content="main"/>
    <r:script>
        function injectDocentes(idSelectDocentes, idSelectMateria){
            $('#'+idSelectDocentes+' option').remove();
            var valorMateria = $('#'+idSelectMateria).val();
            if(valorMateria != "null"){
                var URL='${createLink(controller: 'materiaPorDocente', action: 'filterDocentePorMateria')}';
                $.ajax({
                    url: URL,
                    type: 'POST',
                    contentType: 'application/json; charset=utf-8',
                    data: JSON.stringify({ materiaId:  valorMateria }),
                    cache: false,
                    async: true,
                    success:[
                        function(data) {
                            $('#'+idSelectDocentes).append(data.results);
                        }
                    ],
                    error:[
                        function(data) {  }
                    ]
                })
            }
            else{
                $('#'+idSelectDocentes).append('<option value="null">Seleccione una materia</option>');
            }
        }
        function validateSelects(idDivision) {
            var valorMateria = $('#selectMaterias'+idDivision).val();
            var valorDocente = $('#selectDocentes'+idDivision).val();
            if(valorMateria != "null" && valorDocente != "null"){
                $('#errorAgregarMateriaDocente'+idDivision).css("display","none");
                return true;
            }
            else{
                $('#errorAgregarMateriaDocente'+idDivision).css("display","");
                return false;
            }
        }
    </r:script>
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
                <g:formRemote name="addDivision" url="[controller:'curso', action:'addDivision']" update="allDivisiones">
                    <g:render template="/division/form"></g:render>
                    <g:hiddenField name="cursoId" value="${cursoInstance.id}" />
                    <g:submitButton class="btn btn-success" name="save" value="Agregar nueva división" />
                </g:formRemote>
            </div>
        </div>
    </div>
</div>
<br />
<div class="row">
    <div class="col-md-12">
        <div id="allDivisiones">
            <g:render template="/division/allDivisiones" model="[divisionesOrdenadas: divisionesOrdenadas, materias: materias, docentes: docentes]" />
        </div>
    </div>
</div>
</body>
</html>
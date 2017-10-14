<html>
<head>
	<meta name="layout" content="main"/>
    <r:script>
        function eliminarMateriaPorDocente(divisionId,materiaPorDocenteId){
            if(confirm('Esta acción eliminará la materia seleccionada. ¿Estas seguro?')){
                var URL='${createLink(controller: 'materiaPorDocente', action: 'deleteMateriaPorDocente')}';
                $.ajax({
                    url: URL,
                    type: 'POST',
                    contentType: 'application/json; charset=utf-8',
                    data: JSON.stringify({ divisionId:  divisionId, materiaPorDocenteId: materiaPorDocenteId}),
                    cache: false,
                    async: true,
                    success:[
                        function(data) {
                            $('#'+divisionId).html(data);
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

        function getHorasAAsignarCubiertas(divisionID) {
          var retorno;
          $.ajax({
              url: '${createLink(controller: 'division', action: 'getHorasAAsignarCubiertas')}',
              type: 'POST',
              contentType: 'application/json; charset=utf-8',
              data: JSON.stringify({ divisionID:  divisionID}),
              cache: false,
              async: false,
              success:[
                    function(data) {
                        retorno = data.result;
                    }
                ],
                error:[
                    function(data) { alert(data) }
                ]
            })
            return retorno;
        }

        function getTotalHorasAsignacion(divisionID) {
            var retorno;
            $.ajax({
              url: '${createLink(controller: 'division', action: 'getTotalHorasAsignacion')}',
              type: 'POST',
              contentType: 'application/json; charset=utf-8',
              data: JSON.stringify({ divisionID:  divisionID}),
              cache: false,
              async: false,
              success:[
                    function(data) {
                        retorno = data.result;
                    }
                ],
                error:[
                    function(data) { alert(data) }
                ]
            })
            return retorno;
        }

        function validateMateriaPorDocenteNuevo(idDivision) {
            var valorMateria = $('#selectMaterias'+idDivision).val();
            var valorDocente = $('#selectDocentes'+idDivision).val();
            var cantidadHorasAAdicionar = parseInt($('#horas'+idDivision).val());

            var horasAAsignarCubiertas = parseInt(getHorasAAsignarCubiertas(idDivision));
            var totalHorasAsignacion = parseInt(getTotalHorasAsignacion(idDivision));
            var sobrepasaHoras = horasAAsignarCubiertas + cantidadHorasAAdicionar > totalHorasAsignacion;

            if(valorMateria == "null" && valorDocente == "null"){
                $('#msgErrorMateria'+idDivision).text('Debe seleccionar materia y docente');
                $('#errorAgregarMateriaDocente'+idDivision).css("display","");
                return false;
            }
            if(sobrepasaHoras){
                console.log("sobrepasa");
                $('#msgErrorMateria'+idDivision).text('No puede asignar esta cantidad de horas ya que sobrepasa la cantidad de horas semanales.');
                $('#errorAgregarMateriaDocente'+idDivision).css("display","");
                return false;
            }
            $('#errorAgregarMateriaDocente'+idDivision).css("display","none");
            return true;
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
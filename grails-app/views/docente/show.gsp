<html>
    <head>
        <meta name="layout" content="main"/>
        <r:script>
            $('#formNotSubmit').submit(function () {
                return false;
            });
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
                if(validateAgregarMateria(materiaID)){
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

            function addDisponibilidad(docenteID){
                var dia = $('#selectDia').val();
                var horaInicio = $('#horaInicial').val();
                var horaFinal = $('#horaFinal').val();
                if(validateAgregarDia(dia) && validateHoras(horaInicio, horaFinal)){
                    var URL='${createLink(controller: 'docente', action: 'agregarDisponibilidad')}';
                    $.ajax({
                        url: URL,
                        type: 'POST',
                        contentType: 'application/json; charset=utf-8',
                        data: JSON.stringify({docenteID: docenteID,
                         diaSemana:  dia, horaInicio: horaInicio, horaFinal: horaFinal}),
                        cache: false,
                        async: true,
                        success:[
                            function(data) {
                                $('#disponibilidad').html(data);
                            }
                        ],
                        error:[
                            function(data) {  }
                        ]
                    })
                }
            }

            function eliminarDisponibilidad(disponibilidadID, docenteID){
                var URL='${createLink(controller: 'docente', action: 'eliminarDisponibilidad')}';
                $.ajax({
                    url: URL,
                    type: 'POST',
                    contentType: 'application/json; charset=utf-8',
                    data: JSON.stringify({disponibilidadID: disponibilidadID, docenteID: docenteID}),
                    cache: false,
                    async: true,
                    success:[
                        function(data) {
                            $('#disponibilidad').html(data);
                        }
                    ],
                    error:[
                        function(data) {  }
                    ]
                })
            }

            function validateAgregarMateria(materiaID){
                return validateElement(materiaID, 'errorMateriaNoIngresada', 'msgErrorMateria', 'Debe seleccionar una materia');
            }

            function validateAgregarDia(dia){
                return validateElement(dia, 'errorDiaNoIngresado', 'msgErrorDias', 'Debe seleccionar el día');
            }

            function validateHoras(horaInicial, horaFinal){
                var divError = 'errorDiaNoIngresado';
                var msg = 'msgErrorDias';
                if(horaInicial < 0 || horaInicial > 24){
                    validateElement("null",divError,msg, 'La hora inicial debe estar entre 0 y 24');
                    return false;
                }
                if(horaFinal < 0 || horaFinal > 24){
                    validateElement("null",divError,msg, 'La hora final debe estar entre 0 y 24');
                    return false;
                }
                if(horaInicial >= horaFinal){
                    validateElement("null",divError,msg, 'El horario inicial no puede ser mayor o igual que el horario final');
                    return false;
                }
                return true;
            }

            function validateElement(element, msgdiv, msgLbl, msg){
                if(element == "null"){
                    $('#'+msgdiv).css("display","");
                    $('#'+msgLbl).text(msg);
                    return false;
                }
                else{
                    $('#'+msgdiv).css("display","none");
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
        <div class="row">
            <div class="col-md-12">
                <div id="disponibilidad">
                    <g:render template="disponibilidad" model="[docenteInstance: docenteInstance]" />
                </div>
            </div>
        </div>
    </body>
</html>
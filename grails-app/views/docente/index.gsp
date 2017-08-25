<%@ page import="aulas.Docente" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<r:require module="jquery"></r:require>
        <r:script>
            $("#inputNombre").keyup(
                function(){
                    var URL='${createLink(controller: 'docente', action: 'buscarDocentePorNombre')}';
                    $.ajax({
                        url: URL,
                        type: 'POST',
                        contentType: 'application/json; charset=utf-8',
                        data: JSON.stringify({ nombre:  $('#inputNombre').val() }),
                        cache: false,
                        async: true,
                        success:[
                            function(data) {
                                $("#tablaDocentes").html(data);
                            }
                        ],
                        error:[
                            function(data) { }
                        ]
                    })
                }
            );
        </r:script>
        <r:require modules="bootstrap"/>
	</head>
	<body>
		<div class="row">
			<div class="col-md-12">
				<h2> Docentes registrados </h2>
			</div>
		</div>
		<div class="row">
			<div class="col-md-12">
                <div id="tablaDocentes">
                    <g:render id="temp" template="tabla" model="[docentes: docenteList]"></g:render>
                </div>
                <label value="Buscar por nombre"/>
                <g:textField id="inputNombre" name="nombre" placeholder="Nombre" value="${docente?.nombre}"></g:textField>
			</div>
		</div>
	</body>
</html>
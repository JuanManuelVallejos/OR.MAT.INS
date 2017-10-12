<div class="row">
    <div class="col-md-12" align="center">
        <div class="panel panel-success">
            <div class="panel-heading">
                <h2 class="panel-title">Información profesional</h2>
            </div>
            <div class="panel-body">
                <div id="errorMateriaNoIngresada" style="display: none">
                    <div class="alert alert-danger" role="alert">
                        <p style="font-size: 100%">Debe seleccionar una materia</p>
                    </div>
                </div>
                <div class="panel panel-default">
                    <div class="panel-heading">
                        <h2 class="panel-title">Ingresar Materia que dicto</h2>
                    </div>
                    <div class="panel-body">
                        <div class="row">
                            <div class="col-md-4">
                                <g:select id="selectMateria" class="selectpicker show-menu-arrow" name="materiaId" from="${materias}" noSelection="${['null':'Seleccione una materia']}" optionKey="id" optionValue="nombre" />
                            </div>
                            <div class="col-md-8">
                                <g:submitButton class="btn btn-success" name="save" value="Agregar" onclick="javascript:callAgregar(${docenteInstance.id})" />
                            </div>
                        </div>
                        <div id="tablaMaterias" class="row">
                            <g:render template="materiasDocente" model="[docenteInstance: docenteInstance, materiasDeDocente: materiasDeDocente]"></g:render>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
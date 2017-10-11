<div class="row">
    <div class="col-md-12" align="center">
        <div class="panel panel-success">
            <div class="panel-heading">
                <h2 class="panel-title">Información profesional</h2>
            </div>
            <div class="panel-body">
                <div class="panel panel-default">
                    <div class="panel-heading">
                        <h2 class="panel-title">Ingresar Materia que dicto</h2>
                    </div>
                    <div class="panel-body">
                        <g:formRemote name="agregarMateria" url="[controller: 'docente', action:'agregarMateria']" update="tablaMaterias">
                            <g:hiddenField name="docenteId" value="${docenteInstance.id}"></g:hiddenField>
                            <div class="row">
                                <div class="col-md-4">
                                    <g:select class="btn btn-default dropdown-toggle" name="materiaId" from="${materias}" noSelection="${['null':'Seleccione una materia']}" optionKey="id" optionValue="nombre" ></g:select>
                                </div>
                                <div class="col-md-8">
                                    <g:submitButton class="btn btn-success" name="save" value="Agregar" />
                                </div>
                            </div>
                        </g:formRemote>
                        <div id="tablaMaterias" class="row">
                            <g:render template="materiasDocente" model="[docenteInstance: docenteInstance, materiasDeDocente: materiasDeDocente]"></g:render>
                        </div>
                    </div>
                </div>
                <div >

                </div>
            </div>
        </div>
    </div>
</div>
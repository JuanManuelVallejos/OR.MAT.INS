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
                        <g:uploadForm action="agregarMateria">
                            <g:hiddenField name="docenteId" value="${docenteInstance.id}"></g:hiddenField>
                            <div class="row">
                                <div class="col-md-4">
                                    <g:select class="btn btn-default dropdown-toggle" name="materiaId" from="${materias}" noSelection="${['null':'Seleccione una materia']}" optionKey="id" optionValue="nombre" ></g:select>
                                </div>
                                <div class="col-md-8">
                                    <g:submitButton class="btn btn-success" name="save" value="Agregar" />
                                </div>
                            </div>
                        </g:uploadForm>
                        <div class="row">
                            <div class="panel-body">
                                <table class="table table-striped">
                                    <thead>
                                    <tr>
                                        <th>Nombre</th>
                                        <th>Acciones</th>
                                    </tr>
                                    </thead>
                                    <tbody>
                                        <g:uploadForm action="eliminarMateria">
                                            <g:hiddenField name="docenteAEliminarId" value="${docenteInstance.id}"></g:hiddenField>
                                            <g:each in="${materiasAsignadas}" var="materiaAsignada">
                                                <g:hiddenField name="materiaAEliminarId" value="${materiaAsignada.id}"></g:hiddenField>
                                                <tr>
                                                    <th>
                                                        ${materiaAsignada.nombre}
                                                    </th>
                                                    <th>
                                                        <g:submitButton class="btn btn-danger" name="delete" value="Eliminar" />
                                                    </th>
                                                </tr>
                                            </g:each>
                                        </g:uploadForm>
                                    </tr>
                                    </tbody>
                                </table>
                                <div class="paginate">
                                    <g:paginate total="${personTotal ?: materiasAsignadas.count}"
                                                controller="docente" action="show"
                                                max="${max ?: 6}" offset="${offset ?: 0}" />
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div >

                </div>
            </div>
        </div>
    </div>
</div>
<br />
<div class="panel panel-success">
    <div class="panel-heading">
        <h2 class="panel-title">Agregar Materia</h2>
    </div>
    <div class="panel-body" align="center">
        <g:formRemote name="upMatDoc" url="[controller: 'materiaPorDocente', action:'save']" update="update${divisionInstance.id}">
            <g:render id="tablaAdicionMatXDocente"
                      template="/materiaPorDocente/tabla"
                      model="[materias: materias,
                              division: divisionInstance,
                              docentes: docentes,
                              modoAdicion: true]"/>
            <g:hiddenField name="divisionId" value="${divisionInstance.id}"></g:hiddenField>
            <g:submitButton class="btn btn-success" name="save" value="Agregar Materia" />
        </g:formRemote>
    </div>
</div>
<br/>
<br/>
<div class="panel panel-success">
    <div class="panel-heading">
        <h2 class="panel-title">Materias por docente</h2>
    </div>
    <div class="panel-body" align="center">
        <g:formRemote name="deleteRegistro" url="[controller: 'materiaPorDocente', action:'deleteMateriaPorDocente']" update="${divisionInstance.id}">
            <div id="update${divisionInstance.id}">
                <g:render id="tablaMatXDocente" template="/materiaPorDocente/tabla"
                      model="[materias: materias,
                              division: divisionInstance,
                              docentes: docentes ,
                              modoAdicion: false]" />
            </div>
        </g:formRemote>
    </div>
</div>

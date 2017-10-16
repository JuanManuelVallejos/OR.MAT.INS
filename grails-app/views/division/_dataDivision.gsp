<br />
<g:if test="${!finalizoPlazo}">
    <div class="panel panel-success">
        <div class="panel-heading">
            <h2 class="panel-title">Agregar Materia</h2>
        </div>
        <div class="panel-body" align="center">
            <div id="errorAgregarMateriaDocente${divisionInstance.id}" style="display: none">
                <div class="alert alert-danger" role="alert">
                    <p id="msgErrorMateria${divisionInstance.id}" style="font-size: 100%">Debe seleccionar una materia</p>
                </div>
            </div>
            <g:formRemote name="upMatDoc" url="[controller: 'materiaPorDocente', action:'save']" update="update${divisionInstance.id}">
                <g:render id="tablaAdicionMatXDocente"
                          template="/materiaPorDocente/tabla"
                          model="[materias: materias,
                                  division: divisionInstance,
                                  docentes: docentes,
                                  modoAdicion: true]"/>
                <g:hiddenField name="divisionId" value="${divisionInstance.id}"></g:hiddenField>
                <g:submitButton class="btn btn-success" name="save" value="Agregar Materia" onclick="javascript:return validateMateriaPorDocenteNuevo(${divisionInstance.id})"/>
            </g:formRemote>
        </div>
    </div>
<br/>
<br/>
</g:if>
<div class="panel panel-success">
    <div class="panel-heading">
        <h2 class="panel-title">Materias por docente</h2>
    </div>
    <div class="panel-body" align="center">
        <div id="update${divisionInstance.id}">
            <g:render id="tablaMatXDocente" template="/materiaPorDocente/tabla"
                  model="[materias: materias,
                          division: divisionInstance,
                          docentes: docentes ,
                          modoAdicion: false,
                          finalizoPlazo: finalizoPlazo]" />
        </div>
    </div>
</div>

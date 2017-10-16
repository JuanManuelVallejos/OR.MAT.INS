<table class="table table-striped">
    <g:if test="${!modoAdicion}">
        <g:if test="${!division.seCubrieronHorasAAsignar}">
            <div class="panel panel-danger">
                <div class="panel-heading">
                    <h2 class="panel-title">Horas a cubrir</h2>
                </div>
                <div class="panel-body" style="color: red" align="center">
        </g:if>
        <g:else>
            <div class="panel panel-success">
                <div class="panel-heading">
                    <h2 class="panel-title">Horas a cubrir</h2>
                </div>
                <div class="panel-body" align="center">
        </g:else>
                    <div class="row">
                        <div class="col-md-4">
                            Horas totales a cubrir: ${division.totalHorasAsignacion}
                        </div>
                        <div class="col-md-4">
                            Horas cubiertas: ${division.horasAAsignarCubiertas}
                        </div>
                        <div class="col-md-4">
                            Horas restantes a cubrir: ${division.horasAAsignarSinCubrir}
                        </div>
                    </div>
                </div>
            </div>
    </g:if>
    <thead>
    <tr>
        <th>Materia</th>
        <th>Horas a cubrir</th>
        <g:if test="${modoAdicion}" >
            <th>Docentes que pueden dictar Materia</th>
        </g:if>
        <g:else >
            <th>Docentes</th>
            <g:if test="${!finalizoPlazo}">
                <th>Acciones</th>
            </g:if>
        </g:else>
    </tr>
    </thead>
    <tbody>
        <g:if test="${modoAdicion}" >
            <g:render template="/materiaPorDocente/filaAdicionMateriaPorDocente" model="[materias: materias, docentes: docentes, errors: errors, divisionId: division.id]" />
        </g:if>
        <g:else>
            <g:each in="${division.materiasPorDocente}" var="materiaHorasDocente">
                <g:render template="/materiaPorDocente/filaMateriaPorDocente" model="[materiaPorDocente:materiaHorasDocente, division: division, finalizoPlazo: finalizoPlazo]"/>
            </g:each>
        </g:else>
    </tbody>
</table>
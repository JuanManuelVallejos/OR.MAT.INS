<table class="table table-striped">
    <thead>
    <tr>
        <th>Materia</th>
        <th>Horas a cubrir</th>
        <g:if test="${modoAdicion}" >
            <th>Docentes que pueden dictar Materia</th>
        </g:if>
        <g:else >
            <th>Docentes</th>
            <th>Acciones</th>
        </g:else>
    </tr>
    </thead>
    <tbody>
        <g:if test="${modoAdicion}" >
            <g:render template="/materiaPorDocente/filaAdicionMateriaPorDocente" model="[materias: materias, docentes: docentes, errors: errors, divisionId: division.id]" />
        </g:if>
        <g:else>
            <g:each in="${division.materiasPorDocente}" var="materiaHorasDocente">
                <g:render template="/materiaPorDocente/filaMateriaPorDocente" model="[materiaPorDocente:materiaHorasDocente, division: division]"/>
            </g:each>
        </g:else>
    </tbody>
</table>
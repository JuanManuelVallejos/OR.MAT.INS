<table class="table table-striped">
    <thead>
    <tr>
        <th>Materia</th>
        <th>Horas a cubrir</th>
        <th>Docente</th>
        <g:if test="${!modoAdicion}" >
            <th>Acciones</th>
        </g:if>
    </tr>
    </thead>
    <tbody>
        <g:if test="${modoAdicion}" >
            <g:render template="/materiaPorDocente/filaAdicionMateriaPorDocente" model="[materias: materias, docentes: docentes]" />
        </g:if>
        <g:else>
            <g:each in="${division.materiasPorDocente}" var="materiaHorasDocente">
                <g:render template="/materiaPorDocente/filaMateriaPorDocente" model="[materiaPorDocente:materiaHorasDocente, division: division]"/>
            </g:each>
        </g:else>
    </tbody>
</table>
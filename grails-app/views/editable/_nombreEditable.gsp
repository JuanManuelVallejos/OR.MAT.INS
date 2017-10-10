

<tr>
    <td>
        <g:if test="${instanciaEdicion?.id == instancia?.id}">
            <g:textField id="textBox${instancia?.id}" name="nombreEditado" value="${instancia?.nombre}" maxlength="50 "></g:textField>
        </g:if>
        <g:else>
            <label id="nombre">
                <g:link action="${accionLink}" id="${instancia?.id}" style="color:green">${instancia?.nombre}</g:link>
            </label>
        </g:else>
    </td>
    <g:if test="${instanciaEdicion?.id == instancia?.id}">
        <td style="align-content: right">
            <div class="row">
                <g:submitButton id="grabar${instancia?.id}" class="btn btn-success" name="Grabar" value="Grabar" onclick="setHiddens(${instancia?.id},${instancia?.id})"/>
                <g:submitButton class="btn btn-default" onsubmit="break" name="Cancelar" />
            </div>
        </td>
    </g:if>
    <g:else>
        <td style="align-content: left">
            <g:submitButton class="btn btn-default" name="Edit" value="Editar" onclick="setHiddens(${instancia?.id},${instanciaEdicion})"></g:submitButton>
        </td>
    </g:else>
</tr>
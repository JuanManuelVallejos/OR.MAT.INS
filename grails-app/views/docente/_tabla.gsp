<%@ page import="aulas.Docente" %>
<table class="table">
    <thead>
    <tr>
        <td>Nombre</td>
        <td>Apellido</td>
        <td>Email</td>
        <td>Teléfono</td>
        <td>Dirección</td>
        <td>Edad</td>
        <td>DNI</td>
    </tr>
    </thead>
    <tbody>
    <g:each in="${docentes}" var="docente">
        <g:render template="filaDocente" model="[docente:docente]"/>
    </g:each>
    </tbody>
</table>
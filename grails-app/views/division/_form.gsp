<%@ page import="aulas.Division" %>



<div class="fieldcontain ${hasErrors(bean: divisionInstance, field: 'division', 'error')} required">
	<label for="division">
		<g:message code="division.division.label" default="Division" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="division" required="" value="${divisionInstance?.division}"/>

</div>


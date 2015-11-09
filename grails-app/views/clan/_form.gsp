<%@ page import="masquerade.Clan" %>



<div class="fieldcontain ${hasErrors(bean: clanInstance, field: 'clan', 'error')} ">
	<label for="clan">
		<g:message code="clan.clan.label" default="Clan" />
		
	</label>
	<g:textField name="clan" value="${clanInstance?.clan}"/>

</div>


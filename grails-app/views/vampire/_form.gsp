<%@ page import="masquerade.Vampire" %>



<div class="fieldcontain ${hasErrors(bean: vampireInstance, field: 'clan', 'error')} ">
	<label for="clan">
		<g:message code="vampire.clan.label" default="Clan" />
		
	</label>
	<g:select id="clan" name="clan.id" from="${masquerade.Clan.list()}" optionKey="id" value="${vampireInstance?.clan?.id}" class="many-to-one" noSelection="['null': '']"/>

</div>

<div class="fieldcontain ${hasErrors(bean: vampireInstance, field: 'name', 'error')} ">
	<label for="name">
		<g:message code="vampire.name.label" default="Name" />
		
	</label>
	<g:textField name="name" value="${vampireInstance?.name}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: vampireInstance, field: 'forename', 'error')} ">
	<label for="forename">
		<g:message code="vampire.forename.label" default="Forename" />
		
	</label>
	<g:textField name="forename" value="${vampireInstance?.forename}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: vampireInstance, field: 'surname', 'error')} ">
	<label for="surname">
		<g:message code="vampire.surname.label" default="Surname" />
		
	</label>
	<g:textField name="surname" value="${vampireInstance?.surname}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: vampireInstance, field: 'owedFrom', 'error')} ">
	<label for="owedFrom">
		<g:message code="vampire.owedFrom.label" default="Owed From" />
		
	</label>
	
<ul class="one-to-many">
<g:each in="${vampireInstance?.owedFrom?}" var="o">
    <li><g:link controller="boon" action="show" id="${o.id}">${o?.encodeAsHTML()}</g:link></li>
</g:each>
<li class="add">
<g:link controller="boon" action="create" params="['vampire.id': vampireInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'boon.label', default: 'Boon')])}</g:link>
</li>
</ul>


</div>

<div class="fieldcontain ${hasErrors(bean: vampireInstance, field: 'owedTo', 'error')} ">
	<label for="owedTo">
		<g:message code="vampire.owedTo.label" default="Owed To" />
		
	</label>
	
<ul class="one-to-many">
<g:each in="${vampireInstance?.owedTo?}" var="o">
    <li><g:link controller="boon" action="show" id="${o.id}">${o?.encodeAsHTML()}</g:link></li>
</g:each>
<li class="add">
<g:link controller="boon" action="create" params="['vampire.id': vampireInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'boon.label', default: 'Boon')])}</g:link>
</li>
</ul>


</div>

<div class="fieldcontain ${hasErrors(bean: vampireInstance, field: 'title', 'error')} ">
	<label for="title">
		<g:message code="vampire.title.label" default="Title" />
		
	</label>
	<g:textField name="title" value="${vampireInstance?.title}"/>

</div>


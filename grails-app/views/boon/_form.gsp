<%@ page import="masquerade.Boon" %>


<div class="fieldcontain ${hasErrors(bean: boonInstance, field: 'vampire', 'error')} ">
	<label for="vampire">
		<g:message code="boon.vampire.label" default="Vampire" />
		
	</label>
	<g:select id="vampire" name="vampire.id" from="${masquerade.Vampire.list()}" optionKey="id" value="${boonInstance?.vampire?.id}" class="many-to-one" noSelection="['null': '']"/>

</div>


<div class="fieldcontain ${hasErrors(bean: boonInstance, field: 'category', 'error')} ">
	<label for="category">
		<g:message code="boon.category.label" default="Category" />
		
	</label>
	<g:select id="category" name="category.id" from="${masquerade.Category.list()}" optionKey="id" value="${boonInstance?.category?.id}" class="many-to-one" noSelection="['null': '']"/>

</div>


<div class="fieldcontain ${hasErrors(bean: boonInstance, field: 'hidden', 'error')} ">
	<label for="hidden">
		<g:message code="boon.hidden.label" default="Hidden" />
		
	</label>
	<g:checkBox name="hidden" value="${boonInstance?.hidden}" />

</div>

<div class="fieldcontain ${hasErrors(bean: boonInstance, field: 'owedTo', 'error')} ">
	<label for="owedTo">
		<g:message code="boon.owedTo.label" default="Owed To" />
		
	</label>
	<g:select id="owedTo" name="owedTo.id" from="${masquerade.Vampire.list()}" optionKey="id" value="${boonInstance?.owedTo?.id}" class="many-to-one" noSelection="['null': '']"/>

</div>



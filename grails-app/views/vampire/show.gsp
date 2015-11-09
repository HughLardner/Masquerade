
<%@ page import="masquerade.Vampire" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'vampire.label', default: 'Vampire')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-vampire" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="index"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-vampire" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list vampire">
			
				<g:if test="${vampireInstance?.clan}">
				<li class="fieldcontain">
					<span id="clan-label" class="property-label"><g:message code="vampire.clan.label" default="Clan" /></span>
					
						<span class="property-value" aria-labelledby="clan-label"><g:link controller="clan" action="show" id="${vampireInstance?.clan?.id}">${vampireInstance?.clan?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${vampireInstance?.name}">
				<li class="fieldcontain">
					<span id="name-label" class="property-label"><g:message code="vampire.name.label" default="Name" /></span>
					
						<span class="property-value" aria-labelledby="name-label"><g:fieldValue bean="${vampireInstance}" field="name"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${vampireInstance?.owedFrom}">
				<li class="fieldcontain">
					<span id="owedFrom-label" class="property-label"><g:message code="vampire.owedFrom.label" default="Owed From" /></span>
					
						<g:each in="${vampireInstance.owedFrom}" var="o">
						<span class="property-value" aria-labelledby="owedFrom-label"><g:link controller="boon" action="show" id="${o.id}">${o?.encodeAsHTML()}</g:link></span>
						</g:each>
					
				</li>
				</g:if>
			
				<g:if test="${vampireInstance?.owedTo}">
				<li class="fieldcontain">
					<span id="owedTo-label" class="property-label"><g:message code="vampire.owedTo.label" default="Owed To" /></span>
					
						<g:each in="${vampireInstance.owedTo}" var="o">
						<span class="property-value" aria-labelledby="owedTo-label"><g:link controller="boon" action="show" id="${o.id}">${o?.encodeAsHTML()}</g:link></span>
						</g:each>
					
				</li>
				</g:if>
			
				<g:if test="${vampireInstance?.title}">
				<li class="fieldcontain">
					<span id="title-label" class="property-label"><g:message code="vampire.title.label" default="Title" /></span>
					
						<span class="property-value" aria-labelledby="title-label"><g:fieldValue bean="${vampireInstance}" field="title"/></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form url="[resource:vampireInstance, action:'delete']" method="DELETE">
				<fieldset class="buttons">
					<g:link class="edit" action="edit" resource="${vampireInstance}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>

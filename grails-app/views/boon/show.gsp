
<%@ page import="masquerade.Boon" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'boon.label', default: 'Boon')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-boon" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="index"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-boon" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list boon">
			
				<g:if test="${boonInstance?.category}">
				<li class="fieldcontain">
					<span id="category-label" class="property-label"><g:message code="boon.category.label" default="Category" /></span>
					
						<span class="property-value" aria-labelledby="category-label"><g:link controller="category" action="show" id="${boonInstance?.category?.id}">${boonInstance?.category?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${boonInstance?.dateCreated}">
				<li class="fieldcontain">
					<span id="dateCreated-label" class="property-label"><g:message code="boon.dateCreated.label" default="Date Created" /></span>
					
						<span class="property-value" aria-labelledby="dateCreated-label"><g:formatDate date="${boonInstance?.dateCreated}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${boonInstance?.hidden}">
				<li class="fieldcontain">
					<span id="hidden-label" class="property-label"><g:message code="boon.hidden.label" default="Hidden" /></span>
					
						<span class="property-value" aria-labelledby="hidden-label"><g:formatBoolean boolean="${boonInstance?.hidden}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${boonInstance?.owedTo}">
				<li class="fieldcontain">
					<span id="owedTo-label" class="property-label"><g:message code="boon.owedTo.label" default="Owed To" /></span>
					
						<span class="property-value" aria-labelledby="owedTo-label"><g:link controller="vampire" action="show" id="${boonInstance?.owedTo?.id}">${boonInstance?.owedTo?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${boonInstance?.vampire}">
				<li class="fieldcontain">
					<span id="vampire-label" class="property-label"><g:message code="boon.vampire.label" default="Vampire" /></span>
					
						<span class="property-value" aria-labelledby="vampire-label"><g:link controller="vampire" action="show" id="${boonInstance?.vampire?.id}">${boonInstance?.vampire?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form url="[resource:boonInstance, action:'delete']" method="DELETE">
				<fieldset class="buttons">
					<g:link class="edit" action="edit" resource="${boonInstance}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>

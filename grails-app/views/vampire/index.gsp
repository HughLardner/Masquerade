
<%@ page import="masquerade.Vampire" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'vampire.label', default: 'Vampire')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-vampire" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-vampire" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
				<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
			<thead>
					<tr>
					
						<th><g:message code="vampire.clan.label" default="Clan" /></th>
					
						<g:sortableColumn property="name" title="${message(code: 'vampire.name.label', default: 'Name')}" />
					
						<g:sortableColumn property="title" title="${message(code: 'vampire.title.label', default: 'Title')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${vampireInstanceList}" status="i" var="vampireInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${vampireInstance.id}">${fieldValue(bean: vampireInstance, field: "clan")}</g:link></td>
					
						<td>${fieldValue(bean: vampireInstance, field: "name")}</td>
					
						<td>${fieldValue(bean: vampireInstance, field: "title")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${vampireInstanceCount ?: 0}" />
			</div>
		</div>
	</body>
</html>

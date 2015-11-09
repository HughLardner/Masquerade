
<%@ page import="masquerade.Boon"%>
<!DOCTYPE html>
<html>
<head>
<meta name="layout" content="main">
<g:set var="entityName"
	value="${message(code: 'boon.label', default: 'Boon')}" />
<title><g:message code="default.list.label" args="[entityName]" /></title>
</head>
<body>
	<a href="#list-boon" class="skip" tabindex="-1"><g:message
			code="default.link.skip.label" default="Skip to content&hellip;" /></a>
	<div class="nav" role="navigation">
		<ul>
			<li><a class="home" href="${createLink(uri: '/')}"><g:message
						code="default.home.label" /></a></li>
			<li><g:link class="create" action="create">
					<g:message code="default.new.label" args="[entityName]" />
				</g:link></li>
		</ul>
	</div>
	<div id="list-boon" class="content scaffold-list" role="main">
		<h1>
			<g:message code="default.list.label" args="[entityName]" />
		</h1>
		<g:if test="${flash.message}">
			<div class="message" role="status">
				${flash.message}
			</div>
		</g:if>
		<table>
			<thead>
				<tr>
					<g:sortableColumn property="vampire"
						title="${message(code: 'boon.Debtor.label', default: 'Debtor')}" />

					<g:sortableColumn property="category"
						title="${message(code: 'boon.category.label', default: 'Category')}" />

					<g:sortableColumn property="owedTo"
						title="${message(code: 'boon.owedTo.label', default: 'Owed To')}" />

					<g:sortableColumn property="dateCreated"
						title="${message(code: 'boon.dateCreated.label', default: 'Date Created')}" />

					<g:sortableColumn property="hidden"
						title="${message(code: 'boon.hidden.label', default: 'Hidden')}" />



				</tr>
			</thead>
			<tbody>
				<g:each in="${boonInstanceList}" status="i" var="boonInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">

						<td><g:link action="show" id="${boonInstance.id}">
								${fieldValue(bean: boonInstance, field: "vampire")}
							</g:link></td>

						<td><g:link action="show" id="${boonInstance.id}">
								${fieldValue(bean: boonInstance, field: "category")}
							</g:link></td>

						<td>
							${fieldValue(bean: boonInstance, field: "owedTo")}
						</td>

						<td><g:formatDate date="${boonInstance.dateCreated}" /></td>

						<td><g:formatBoolean boolean="${boonInstance.hidden}" /></td>



					</tr>
				</g:each>
			</tbody>
		</table>
		<div class="pagination">
			<g:paginate total="${boonInstanceCount ?: 0}" />
		</div>
	</div>
</body>
</html>

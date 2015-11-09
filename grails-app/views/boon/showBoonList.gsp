<%@ page import="masquerade.Boon"%>
<!DOCTYPE html>
<html>
<style>
table {
	border-collapse: collapse;
	width: 90%;
}

table, th, td {
	border: 1px solid black;
}

td {
	padding: 2px;
}
</style>
<head>

<g:set var="entityName"
	value="${message(code: 'boon.label', default: 'Boon')}" />
<title><g:message code="default.show.label" args="[entityName]" /></title>
</head>
<body>

	Boon List
	<hr>
	<br>

	<g:each in="${boonList}" var="vampire">
		<g:link action="showBoonForVampire" id="${vampire.getKey().id}">
			${vampire.getKey()}
		</g:link>
		<g:set var="owed" value="${vampire.getValue().getAt('owed')}" />
		<g:set var="owes" value="${vampire.getValue().getAt('owes')}" />

		<table>
			<tr>
				<td>Owed to ${vampire.getKey()}</td>
				<td>Trivial</td>
				<td>Minor</td>
				<td>Major</td>
				<td>Blood</td>
				<td>Life</td>
			</tr>
			<g:each in="${owed}" var="boonSet">
				<g:set var="vamp" value="${boonSet.keySet()[0]}" />
				<g:set var="boon" value="${boonSet.get(vamp)}" />

				<tr>
					<td>
						${vamp}
					</td>
					<td>
						${boon.get('Trivial') }
					</td>
					<td>
						${boon.get('Minor') }
					</td>
					<td>
						${boon.get('Major') }
					</td>
					<td>
						${boon.get('Blood') }
					</td>
					<td>
						${boon.get('Life') }
					</td>

				</tr>
			</g:each>
		</table>
		<br>
		<table>
			<tr>
				<td>
					${vampire.getKey()}'s Debts
				</td>
				<td>Trivial</td>
				<td>Minor</td>
				<td>Major</td>
				<td>Blood</td>
				<td>Life</td>
			</tr>
			<g:each in="${owes}" var="boonSet">
				<g:set var="vamp" value="${boonSet.keySet()[0]}" />
				<g:set var="boon" value="${boonSet.get(vamp)}" />

				<tr>
					<td>
						${vamp}
					</td>
					<td>
						${boon.get('Trivial') }
					</td>
					<td>
						${boon.get('Minor') }
					</td>
					<td>
						${boon.get('Major') }
					</td>
					<td>
						${boon.get('Blood') }
					</td>
					<td>
						${boon.get('Life') }
					</td>

				</tr>
			</g:each>
		</table>
		<p style="page-break-after: always;"></p>

	</g:each>

</body>
</html>

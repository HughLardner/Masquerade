<%@ page import="masquerade.Boon"%>
<!DOCTYPE html>
<html>
<style>
body {
	font: 12.5px cursive, serif;
}
</style>
<head>

<g:set var="entityName"
	value="${message(code: 'boon.label', default: 'Boon')}" />
<title><g:message code="default.show.label" args="[entityName]" /></title>
</head>
<body>
	<g:each in="${boons.keySet()}" var="vampire">
		<h1>
			${vampire}
		</h1>
		<g:each in="${boons.get(vampire)}" var="boon">
			${boon}<br>
		</g:each>
		<p style="page-break-after: always;"></p>
	</g:each>

</body>
</html>


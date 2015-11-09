<%@ page import="masquerade.Category" %>



<div class="fieldcontain ${hasErrors(bean: categoryInstance, field: 'category', 'error')} ">
	<label for="category">
		<g:message code="category.category.label" default="Category" />
		
	</label>
	<g:textField name="category" value="${categoryInstance?.category}"/>

</div>


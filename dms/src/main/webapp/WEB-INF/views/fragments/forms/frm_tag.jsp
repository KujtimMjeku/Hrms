<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:choose>
	<c:when test="${edit eq true}">
		<spring:url value="/tag/update/${tag.id}" var="submitUrl"></spring:url>
		<spring:url value="Update" var="submitText"/>
	</c:when>
	<c:otherwise>
		<spring:url value="/tag/create/" var="submitUrl"></spring:url>
		<spring:url value="Create" var="submitText"/>
	</c:otherwise>
</c:choose>
<form:form id="frm-tag" modelAttribute="tag" action="${submitUrl}" method="Post">
	
		<div class="form-group">
		<label for="tagName" class="col-sm-3 control-label">Tag</label>
			<form:input  cssClass="form-control" id="tagName"
				placeholder="Tag name" path="tag" />
		</div>
		<input type="submit" id="btn-tag-submit" class="btn btn-primary" value="${submitText}">
</form:form>
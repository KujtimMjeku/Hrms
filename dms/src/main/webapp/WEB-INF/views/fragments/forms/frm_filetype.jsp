<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:choose>
	<c:when test="${edit eq true}">
		<spring:url value="/filetype/update/${filetype.id}" var="submitUrl"></spring:url>
		<spring:url value="Update" var="submitText"/>
	</c:when>
	<c:otherwise>
		<spring:url value="/filetype/create/" var="submitUrl"></spring:url>
		<spring:url value="Create" var="submitText"/>
	</c:otherwise>
</c:choose>
<form:form id="frm-tag" modelAttribute="filetype" action="${submitUrl}" method="Post">
	
		<div class="form-group">
		<label for="file-type" class="col-sm-3 control-label">Type</label>
			<form:input  cssClass="form-control" id="file-type"
				placeholder="Type" path="type" />
		</div>
		<div class="form-group">
		<label for="file-extensions" class="col-sm-3 control-label">Type</label>
			<form:input  cssClass="form-control" id="file-extensions"
				placeholder="Extensions" path="extensions" />
		</div>
		<input type="submit" id="btn-tag-submit" class="btn btn-primary" value="${submitText}">
</form:form>
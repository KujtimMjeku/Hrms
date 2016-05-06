<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:choose>
	<c:when test="${edit eq true}">
		<spring:url value="/directory/update/?dir=${dir_id}" var="submitUrl"/>
		<spring:url value="Rename" var="submitText"/>
	</c:when>
	<c:otherwise>
		<spring:url value="/directory/create/?dir=${dir_id}" var="submitUrl"/>
		<spring:url value="Create" var="submitText"/>
	</c:otherwise>
</c:choose>
<form:form action="${submitUrl}" method="post">
	<div class="form-group">
		<label for="directoryName">Directory name</label> 
		<input
			type="text" class="form-control" id="directoryName" name="dirname" value="${dir_name }"
			placeholder="Folder name">
		</div>
		<input
			type="submit" value="${submitText}" class="btn btn-default">
			
</form:form>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<spring:url value="/directory/create/?dir=${dir_id}" var="submitUrl"/>
<form:form action="${submitUrl}" method="post">
	<div class="form-group">
		<label for="directoryName">Directory name</label> 
		<input
			type="text" class="form-control" id="directoryName" name="dirname"
			placeholder="Folder name">
		</div>
		<input
			type="submit" value="Create" class="btn btn-default">
</form:form>

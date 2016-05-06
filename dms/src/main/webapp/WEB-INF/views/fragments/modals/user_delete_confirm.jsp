<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<jsp:include page="../modals/confirm_delete.jsp">
	<jsp:param value="confirm_modal-user" name="id" />
	<jsp:param value="Are you sure you want to delete this user" name="message" />
	<jsp:param value="No, keep it" name="no" />
	<jsp:param value="Yes, delete id" name="yes"/>
</jsp:include>
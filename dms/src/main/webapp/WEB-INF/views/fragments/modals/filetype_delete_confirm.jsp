<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<jsp:include page="../modals/confirm_delete.jsp">
	<jsp:param value="confirm_modal_filetype" name="id" />
	<jsp:param value="Are you sure you want to delete this file type" name="message" />
	<jsp:param value="No, keep it" name="no" />
	<jsp:param value="Yes, delete it" name="yes"/>
</jsp:include>
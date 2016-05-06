<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<div class="document-container-w">
	<div class="box" id="document-container">
		<div class="box-header with-border">
			<h3 class="box-title">Users</h3>
		</div>
		<div class="box-body">
			<div class="col-xs-4">
				<a id="create_btn"
					href='<spring:url value="/user/new/"></spring:url>'
					class="btn bg-navy margin" style="padding: 3px 10px 3px 10px">Create
					user</a>
			</div>
			<div class="col-xs-8">
				<spring:url value="/document/search/" var="searchUrl"></spring:url>
				<form:form id="search-frm" action="${searchUrl}">
					<div class="input-group"
						style="margin-top: 3px; max-width: 600px; float: right; margin-right: 11px">
						<input type="text" id="input-doc-search" class="form-control">
						<span class="input-group-addon"
							style="background-color: #3c8dbc; color: white; border: 1px solid #3c8dbc"><i
							class="fa fa-search"></i></span>
					</div>
				</form:form>
			</div>
			<table class="table table-componed">
				<tr>
					<th>Username</th>
					<th>Name</th>
					<th>Sure name</th>
					<th>Email</th>
					<th>Role</th>
					<th style="text-align: right; padding-right: 55px">Action</th>
				</tr>
				<c:forEach items="${user}" var="usr">
					<tr id="${usr.username}" class='clickable-row'>
						<td>${usr.username}</td>
						<td>${usr.name}</td>
						<td>${usr.surename}</td>
						<td>${usr.email}</td>
						<td><c:forEach items="${usr.groups}" var="group"><span class="label label-primary">${group.name}</span></c:forEach></td>
						<td style="text-align: right; padding-right: 30px"><a
							id="user-edit"
							href='<spring:url value="/user/edit/${usr.username}"></spring:url>'
							class="btn btn-default"><i class="fa fa-pencil"></i></a> <a
							id="user-delete"
							href='<spring:url value="/user/delete/${usr.username}?${_csrf.parameterName}=${_csrf.token}"></spring:url>'
							class="btn btn-default"><i class="fa fa-trash"></i></a></td>
					</tr>
					</tr>
				</c:forEach>
			</table>
			<div class="box-footer clearfix">
				<ul class="pagination pagination-sm no-margin pull-right">
					<li><a href="#">«</a></li>
					<li><a href="#">1</a></li>
					<li><a href="#">2</a></li>
					<li><a href="#">3</a></li>
					<li><a href="#">»</a></li>
				</ul>
			</div>
		</div>
	</div>
</div>
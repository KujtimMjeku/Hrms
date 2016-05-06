<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<div class="row document-container-w">

	<div class="col-md-7">
		<div class="box" id="document-container">
			<div class="box-header with-border">
				<h3 class="box-title">Document Tags</h3>
			</div>
			<div class="box-body">
				<div class="col-xs-4">
					<a id="create_filetype"
						href='<spring:url value="/filetype/new/"></spring:url>'
						class="btn bg-navy margin" style="padding: 3px 10px 3px 10px">New</a>
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
						<th></th>
						<th>Type</th>
						<th>Extensionsr</th>
						<th style="text-align: right; padding-right: 55px">Action</th>
					</tr>
					<c:forEach items="${filetypes}" var="filetype">
						<tr id="${filetype.id}" class='clickable-row'>
							<td>${filetype.id}</td>
							<td>${filetype.type}</td>
							<td><c:forEach items="${filetype.extensions}" var="ext">${ext}; </c:forEach></td>
							<td style="text-align: right; padding-right: 30px"><a id="filetype-edit" href='<spring:url value="/filetype/edit/${filetype.id}"></spring:url>'
								class="btn btn-default"><i class="fa fa-pencil"></i></a> <a id="filetype-delete" href='<spring:url value="/filetypes/delete/${filetype.id}"></spring:url>'
								class="btn btn-default"><i class="fa fa-trash"></i></a></td>
						</tr>
						</tr>
					</c:forEach>
				</table>
			</div>
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
	<div class="col-md-5">
		<div class="box" id="document-container">
			<div class="box-header with-border">
				<h3 class="box-title">File Types</h3>
			</div>
			<div class="box-body">
				<div class="col-xs-4">
					<a id="create_tag"
						href='<spring:url value="/tag/new/"></spring:url>'
						class="btn bg-navy margin" style="padding: 3px 10px 3px 10px">New</a>
				</div>
				<div class="col-xs-8">
					<spring:url value="/document/search/" var="searchUrl"></spring:url>
					<form:form id="search-frm" action="${searchUrl}">
						<div class="input-group"
							style="margin-top: 3px; float: right; width: 200px;">
							<input type="text" class="form-control"> <span
								class="input-group-addon"
								style="background-color: #3c8dbc; color: white; border: 1px solid #3c8dbc"><i
								class="fa fa-search"></i></span>
						</div>
					</form:form>
				</div>
				<table class="table table-componed">
					<tr>
						<th></th>
						<th>Tag</th>
						<th style="text-align: right; padding-right: 55px">Action</th>
					</tr>
					<c:forEach items="${tags}" var="tag">
						<tr id="${tag.id}" class='clickable-row'>
							<td>${tag.id}</td>
							<td>${tag.tag}</td>
							<td style="text-align: right; padding-right: 30px"><a id="tag-edit" href='<spring:url value="/tag/edit/${tag.id}"></spring:url>'
								class="btn btn-default"><i class="fa fa-pencil"></i></a> <a id="tag-delete" href='<spring:url value="/tag/delete/${tag.id}"></spring:url>'
								class="btn btn-default"><i class="fa fa-trash"></i></a></td>
						</tr>
					</c:forEach>
				</table>
			</div>
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
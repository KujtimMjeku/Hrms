<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<div class="box-body">
	<ol class="breadcrumb" style="margin-bottom: 5px;">
		<c:forEach items="${parentDirs}" var="pdirectory">
			<li><a id="modal-breadcrub"
				href='<spring:url value="/directory/move/?dir=${pdirectory.id}&modal=1"></spring:url>'
				type="button">${pdirectory.name}</a></li>
		</c:forEach>
		<li class="active">${directory.name}</li>
	</ol>

	<a data-toggle="tooltip" title="New folder"
		style="margin-left: 20px; margin-top: 4px; font-size: 1.6em; color: rgb(119, 119, 119)"
		id="create_dir_move" href=""><i class="fa fa-folder"></i><i
		style="font-size: 0.4em; color: white; margin-left: -11px; position: absolute; margin-top: 8px"
		class="fa fa-plus"></i></a>
	<div class="create-directory-move" style="display: inline-block;">
		<div class="input-group" style="padding: 5px 13px 5px 13px">
			<spring:url value="/directory/create/?dir=${directory.id}&modal=1" var="submitUrl" />
			<form:form id="move-frm-modal" method="post" action="${submitUrl}">
				<input type="text" class="form-control" placeholder="Directory name" name="dirname">
			</form:form>
			<span class="input-group-addon"><i data-toggle="tooltip"
				title="Create folder" class="fa fa-check"></i></span>


		</div>
	</div>

	<div class="box-body">
		<table id="move-folder-table" class="table table-componed"
			style="color: #777">
			<tr style="background-color: #f4f4f4">
				<th style="width: 40px"></th>
				<th>Name</th>
				<th>Owner</th>
				<th style="width: 100px">Size</th>
			</tr>
			<c:forEach items="${directory.children}" var="subdirectory">
				<tr id="${subdirectory.id}" class='clickable-row-modal'
					data-href='<spring:url value="/directory/move/?dir=${subdirectory.id}&modal=1"></spring:url>'>
					<td style="vertical-align: middle; text-align: center;"><i
						style="font-size: 1.3em" class="fa fa-folder"></i></td>
					<td><p style="display: inline-block; margin-bottom: 0;">${subdirectory.name}</p></td>
					<td>Kujtim</td>
					<td>--</td>
				</tr>
			</c:forEach>
		</table>
		
	</div>
	<!-- /.box-body -->
	<div class="box-footer">
					<spring:url value="/directory/move/" var="subUrl"></spring:url>
					<form:form id="move-frmm-modal" method="post" action="${subUrl}">
					
					</form:form>
                    <a href="" id="move-btn-modal" type="submit" style="cursor: default;" class="btn btn-primary disabled">Move to</a>
           </div>

</div>
<!-- /.box-body -->
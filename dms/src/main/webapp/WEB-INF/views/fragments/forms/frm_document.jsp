<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<form:form modelAttribute="document" action="" method="Post" enctype="multipart/form-data"
	cssClass="form-horizontal">
	<div class="form-group">
		<label for="documentName" class="col-sm-2 control-label">Name</label>
		<div class="col-sm-10">
			<form:input disabled="true" cssClass="form-control" id="documentName"
				placeholder="Document name" path="name" />
		</div>

	</div>
	<div class="form-group">
		<label for="documentTitle" class="col-sm-2 control-label">Document
			title</label>
		<div class="col-sm-10">
			<form:input cssClass="form-control" id="documentTitle"
				placeholder="Document title" path="title" />
		</div>
	</div>
	<div class="form-group">
		<label for="documentDescription" class="col-sm-2 control-label">Document
			descritpion</label>
		<div class="col-sm-10">
			<form:textarea cssClass="form-control" id="documentDescription"
				placeholder="Document description" path="description" />
		</div>
	</div>
	<div class="form-group">
		<label for="documentType" class="col-sm-2 control-label">Document
			type</label>
		<div class="col-sm-10">

			<form:select cssStyle="width:100%" cssClass="form-control select2" path="doc_type.id" id="documentType">
				<form:options items="${docs}" itemValue="id"
					itemLabel="documentType" />
			</form:select>
		</div>
	</div>
	<div class="form-group">
		<label for="documentTags" class="col-sm-2 control-label">Document
			type</label>
		<div class="col-sm-10">
			<form:select multiple="true" cssStyle="width:100%" cssClass="form-control select2" path="tags" id="documentTags">
				 <form:options items="${tags}" itemValue="id" itemLabel="tag"/>
			</form:select>
		</div>
	</div>
	
	
	<div class="form-group">
		<label for="documentReleaseDate" class="col-sm-2 control-label">Release
			date</label>
		<div class="col-sm-10">
		
			<form:input cssClass="form-control" id="documentReleaseDate" 
				path="relaseDate" />
		</div>

	</div>
	<div class="form-group">
		<label for="imediateRelease" class="col-sm-2 control-label">Imediate release</label>
		<div class="col-sm-10">	
			<form:checkbox  id="imediateRelease" 
				path="imediatlyReleaseDocument" />
		</div>

	</div>
	
	<div class="form-group">
		<label for="file" class="col-sm-2 control-label">File</label>
		<div class="col-sm-10">	
			<input id="file" name="file" type="file"></input>
		</div>

	</div>
	
	
	
	
	
	<div class="col-sm-offset-2 col-sm-10">
		<button type="submit" class="btn btn-primary">Submit</button>
	</div>
</form:form>
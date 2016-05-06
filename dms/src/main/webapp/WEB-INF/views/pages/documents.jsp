<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<jsp:include page="../fragments/commons/head.jsp" />
<jsp:include page="../fragments/headers/main_header.jsp" />
<jsp:include page="../fragments/navigations/main_menu.jsp" />

<div class="content-wrapper">
	<!-- Content Header (Page header) -->
	<section class="content-header">
		<h1>
			Blank page <small>it all starts here</small>
		</h1>
		<ol class="breadcrumb">
			<li><a href="#"><i class="fa fa-dashboard"></i> Home</a></li>
			<li><a href="#">Examples</a></li>
			<li class="active">Blank page</li>
		</ol>
	</section>

	<!-- Main content -->
	<section class="content">

		<!-- Default box -->
		<div class="box">
			<div class="box-header with-border">
				<h3 class="box-title">Directories</h3>
			</div>
			<div class="box-body">
				<c:if test="${move_sussess }">
					<div class="alert alert-success alert-dismissible" role="alert">
						<button type="button" class="close" data-dismiss="alert"
							aria-label="Close">
							<span aria-hidden="true">&times;</span>
						</button>
						<spring:message code="directory.folder.move.success"></spring:message>
					</div>
				</c:if>
				<div class="row">
					<div class="col-xs-4">
						<a id="create_document"
							href='<spring:url value="/document/new/"></spring:url>'
							class="btn bg-navy margin">Create Document</a>
					</div>
					<div class="col-xs-8">
						<spring:url value="/document/search/" var="searchUrl"></spring:url>
						<form:form id="search-frm" action="${searchUrl}">
							<div class="input-group search-input-box"
								style="margin-top: 10px; max-width: 600px; float: right; margin-right: 11px">
								<input type="text" id="input-doc-search" class="form-control"
									style="border-right: 0"> <span id="adwance-search"
									class="input-group-addon"
									style="border-left: 0; padding-left: 8px; padding-right: 8px; cursor: pointer"><i
									class="fa fa-caret-down"></i></span> <span class="input-group-addon"
									style="background-color: #3c8dbc; color: white; border: 1px solid #3c8dbc"><i
									class="fa fa-search"></i></span>
							</div>
						</form:form >
						<div id="advance-search-frm"
							style="display: none; width: 600px; min-width: 200px; padding: 10px; position: absolute; z-index: 3; border: 1px solid #d2d6de; border-top: none; background-color: #fff">
							<spring:url value="/document/asearch/" var="asearchUrl"></spring:url>
							<form:form class="form-horizontal" modelAttribute="sdocument" action="${asearchUrl}" method="GET">
								<div class="form-group">
									<label for="sName" class="col-sm-3 control-label">Name</label>
									<div class="col-sm-9">
										<form:input class="form-control" id="sName" path="name"
											placeholder="Name" />
									</div>
								</div>
								<div class="form-group">
									<label for="inputEmail" class="col-sm-3 control-label">Title</label>
									<div class="col-sm-9">
										<form:input path="title" class="form-control" id="sTitle"
											placeholder="Title" />
									</div>
								</div>
								<div class="form-group">
									<label for="sdocumentType" class="col-sm-3 control-label">File
										type</label>
									<div class="col-sm-9">
										<form:select class="form-control select2" id="sdocumentType" style="width :100%" path="fileType" >
										 <form:options items="${filetypes}" itemLabel="type" itemValue="id"/>
								
										</form:select>
									</div>
								</div>
								
								<div class="form-group">
									<label for="sdocumentType" class="col-sm-3 control-label">Document
										type</label>
									<div class="col-sm-9">
										<form:select class="form-control select2" id="sdocumentType" style="width :100%" path="documentType" >
										 <form:options items="${docs}" itemLabel="documentType" itemValue="id"/>
								
										</form:select>
									</div>
								</div>
								<div class="form-group">
									<label for="inputExperience" class="col-sm-3 control-label">Document
										tags</label>
									<div class="col-sm-9">
										<form:select class="form-control select2" id="sdocumentTags" style="width :100%" path="tags" >
											 <form:options items="${tags}" itemLabel="tag" itemValue="id"/>		
										</form:select>
									</div>
								</div>
								<div class="form-group">
									<label for="inputSkills" class="col-sm-3 control-label">Release
										date</label>
									<div class="col-sm-9">
										<form:input type="text" class="form-control pull-right active" path="date"
											id="release-date" placeholder="Released date" />
									</div>
								</div>

								<div class="form-group">
									<div class="col-sm-offset-3 col-sm-9">
										<button type="submit" class="btn btn-primary">Search</button>
									</div>
								</div>
							</form:form>

						</div>
					</div>

				</div>


				<jsp:include page="../fragments/tables/tbl_documents.jsp">
					<jsp:param value="${documents}" name="documents" />
				</jsp:include>
				<!-- /.box-body -->

			</div>
			<!-- /.box-body -->
			<div class="box-footer">Footer</div>
			<!-- /.box-footer-->
		</div>
		<!-- /.box -->
		<ul class="dropdown-menu context-menu" role="menu"
			style="font-size: 1.2em">
			<li><a id="context-move-in" href=""><i
					class="fa fa-folder-open"></i>Open folder</a></li>
			<li><input type="hidden" id="parent-id" value=""><a
				id="context-move-to" href=""><i class="fa fa-folder"></i><i
					style="font-size: 0.4em; color: white; margin-left: -18px; position: absolute; margin-top: 9px"
					class="fa fa-arrow-right"></i> Move to</a></li>
			<li><a id="context-rename" href=''><i
					class="fa fa-pencil-square-o"></i>Rename</a></li>
			<li><a id="context-delete" href=""><i class="fa fa-trash-o"></i>Delete</a>
			</li>
			<li><a href="#"><i class="fa fa-share-alt"></i>Share</a></li>
			<li class="divider"></li>
			<li><a href="#"><i class="fa fa-info-circle"></i>View
					details</a></li>
		</ul>

	</section>
	<!-- /.content -->
</div>

<!-- /.content-wrapper -->
<jsp:include page="../fragments/modals/doc_delete_confirm.jsp" />
<jsp:include page="../fragments/footers/footer.jsp" />
<jsp:include page="../fragments/sidebars/controll_sidebar.jsp" />
<jsp:include page="../fragments/commons/footer.jsp" />
<script type="text/javascript">
	$(document)
			.ready(
					function() {
						$('#release-date').daterangepicker();
						$(window).resize(function() {
							width = $(".search-input-box").width()
							$("#advance-search-frm").width(width - 22);
						});
						$(document).on("click", "#adwance-search", function(e) {

							//var imput=$("#input-doc-search").offset(); 

							$("#advance-search-frm").css({
								right : "26px",
								top : "44px"
							});

							$("#advance-search-frm").toggle();
						});

						$(document).on(
								"submit",
								"#search-frm",
								function(e) {
									e.preventDefault();
									var url = $(this).attr("action");
									var query = $("#input-doc-search").val();
									$.ajax({
										url : url + "?q=" + query,
										method : "GET",
										success : function(result) {
											$("#document-container")
													.replaceWith(result);
										}
									});

								})
								
								$(document).on(
								"submit",
								"#sdocument",
								function(e) {
									e.preventDefault();
									var url = $(this).attr("action");
									var query = $("#input-doc-search").val();
									$.ajax({
										url : url + "?" + $("#sdocument").serialize(),
										method : "GET",
										success : function(result) {
											$("#document-container")
													.replaceWith(result);
										}
									});

								})

						$(document).on("click", "#context-delete", function(e) {
							e.preventDefault();
							var url = $(this).attr("href");
							jQuery('#confirm_modal').modal('show', {
								backdrop : 'static'
							});
							$("#btn-modal-delete").attr("href", url);

						})
						$(document).on(
								"click",
								"#btn-modal-delete",
								function(e) {
									e.preventDefault();
									var url = $(this).attr("href");
									$.ajax({
										url : url,
										method : "POST",
										success : function(result) {
											$("#document-container")
													.replaceWith(result);
											jQuery('#confirm_modal').modal(
													'hide');

										}
									});
								})

						$(document).on(
								"click",
								"#modal-breadcrub",
								function(e) {
									e.preventDefault();
									var url = $(this).attr("href");
									ajax_modal_call(url, "Get", "");
									jQuery('.modal-dialog')
											.find(".modal-title").text(
													"Move directory");
									$('#parent-id-modal').trigger('change');
								})

						$(document).on(
								"click",
								"#move-btn-modal",
								function(e) {
									e.preventDefault();
									$("#move-frmm-modal").append(
											$("#parent-id-modal"));
									$("#move-frmm-modal").append(
											$("#child-id-modal"));
									$("#move-frmm-modal").submit();
								})

						$(document).on(
								"dblclick",
								".clickable-row-modal",
								function(e) {
									e.preventDefault();
									var url = $(this).attr("data-href");
									ajax_modal_call(url, "Get", "");
									jQuery('.modal-dialog')
											.find(".modal-title").text(
													"Move directory");
									$('#parent-id-modal').trigger('change');
								})

						$('#parent-id-modal').on(
								"change paste keyup",
								function() {

									var id = $("#parent-id-modal").val();
									$("#move-folder-table").find("#" + id)
											.removeClass('clickable-row-modal')
											.css("color", "#d9d9d9");

								});
						$(document)
								.on(
										"submit",
										"#move-frm-modal",
										function(e) {
											e.preventDefault();
											var url = $(this).attr("action");
											$
													.ajax({
														url : url,
														method : "POST",
														data : $(
																'#move-frm-modal')
																.serialize(),
														success : function(
																result) {
															jQuery('.modal')
																	.modal(
																			'show',
																			{
																				backdrop : 'static'
																			});
															jQuery(
																	'.modal-dialog')
																	.find(
																			".modal-body")
																	.html(
																			result);
															$(
																	'#parent-id-modal')
																	.trigger(
																			'change');
															jQuery(
																	'.modal-dialog')
																	.find(
																			".modal-title")
																	.text(
																			"Move to");
															$(
																	".create-directory-move")
																	.hide();
															$(
																	".modal-close-btn")
																	.on(
																			'click',
																			function() {
																				$(
																						"#view_user_modal")
																						.modal(
																								'hide');
																			})
														}
													});
										})
						/* $("#context-delete").on(
								"click",
								function(e) {
									e.preventDefault();
									var url = $(this).attr("href");
									$("#context-delete-frm")
											.attr("action", url).submit();
								}) */

						$("body").on("click", function() {
							$(".context-menu").hide();
						});

						$("body").bind("contextmenu", function(e) {
							$(".context-menu").hide();
							console.log("body");
						});

						$(document)
								.on(
										"contextmenu",
										".clickable-row",
										function(e) {
											var rowhrf = $(this).attr(
													"data-href");
											var rowid = $(this).attr("id");
											var document_root = '<spring:url value="/document/"/>';
											var editUrl = document_root
													+ "edit/?dir=" + rowid;
											var deleteUrl = document_root
													+ rowid;
											var moveUrl = document_root
													+ "move/?dir=" + rowid;

											$(".clickable-row").css(
													"background-color", "")
											$(".clickable-row").css("color",
													"#777")
											$(this).css("background-color",
													"#55acee")
											$(this).css("color", "#fff");

											$(".context-menu").hide();
											console.log("table");
											e.preventDefault();
											$(".context-menu").css({
												top : e.pageY + "px",
												left : e.pageX + "px"
											});
											$(".context-menu").find(
													"#context-move-to").attr(
													"href", moveUrl);
											$(".context-menu").find(
													"#parent-id").attr("value",
													rowid);
											$(".context-menu").find(
													"#context-move-in").attr(
													"href", rowhrf);
											$(".context-menu").find(
													"#context-rename").attr(
													"href", editUrl);
											$(".context-menu").find(
													"#context-delete").attr(
													"href", deleteUrl);
											$(".context-menu").show();
											e.stopImmediatePropagation();
										});

						$(document).bind("click", function(event) {
							$(".custom-menu").hide();
						});

						$(document).on("click", ".clickable-row", function() {
							$(".clickable-row").css("background-color", "")
							$(".clickable-row").css("color", "#777")
							$(".clickable-row").removeClass("selected")
							$(this).css("background-color", "#55acee")
							$(this).css("color", "#fff");
							$(this).addClass("selected");
						});

						$(document)
								.on(
										"click",
										".clickable-row-modal",
										function() {
											$(".clickable-row-modal").css(
													"background-color", "")
											$(".clickable-row-modal").css(
													"color", "#777")
											$(".clickable-row-modal")
													.removeClass("selected")
											$(this).css("background-color",
													"#55acee")
											$(this).css("color", "#fff");
											$(this).addClass("selected");
											var id = $(this).attr("id");
											$("#move-btn-modal").removeClass(
													"disabled");
											$('.modal').find("#child-id-modal")
													.val(id);

										});

						$(".clickable-row").dblclick(function() {
							window.document.location = $(this).data("href");
						});

						$("#context-rename").on(
								"click",
								function(e) {
									e.preventDefault();
									var url = $(this).attr("href")
									ajax_modal_call(url, "Get", "");
									jQuery('.modal-dialog')
											.find(".modal-title").text(
													"Rename directory");
								})

						$(document).on(
								"click",
								"#context-move-to",
								function(e) {

									e.preventDefault();
									var url = $(this).attr("href")
									var id = $(".context-menu").find(
											"#parent-id").attr("value");

									ajax_modal_call(url, "Get", "");
									$('.modal').find("#parent-id-modal")
											.val(id).trigger('change');
									jQuery('.modal-dialog')
											.find(".modal-title").text(
													"Move to");
								})

						$(document).on("click", "#create_dir_move",
								function(e) {
									e.preventDefault();
									$(".create-directory-move").slideToggle()
								})

						$("#create_dir").on(
								"click",
								function(e) {

									e.preventDefault();
									var url = $(this).attr("href")
									ajax_modal_call(url, "Get", "");
									jQuery('.modal-dialog')
											.find(".modal-title").text(
													"Create directory");
								})
					})
	function ajax_modal_call(url, mehtod, data) {
		$.ajax({
			url : url,
			method : mehtod,
			success : function(result) {
				jQuery('.modal').modal('show', {
					backdrop : 'static'
				});
				jQuery('.modal-dialog').find(".modal-body").html(result);
				$('#parent-id-modal').trigger('change');
				$(".modal-close-btn").on('click', function() {
					$("#view_user_modal").modal('hide');
				})
				$(".create-directory-move").hide()

			}
		});
	}
</script>













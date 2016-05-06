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
				<ol class="breadcrumb" style="margin-bottom: 5px;">
					<c:forEach items="${parentDirs}" var="pdirectory">
						<li><a
							href='<spring:url value="/directory/?dir=${pdirectory.id}"></spring:url>'
							type="button">${pdirectory.name}</a></li>
					</c:forEach>
					<li class="active">${directory.name}</li>
				</ol>
				<c:if test="${move_sussess }">
					<div class="alert alert-success alert-dismissible" role="alert">
						<button type="button" class="close" data-dismiss="alert"
							aria-label="Close">
							<span aria-hidden="true">&times;</span>
						</button>
						<spring:message code="directory.folder.move.success"></spring:message>
					</div>
				</c:if>


				<a id="create_dir"
					href='<spring:url value="/directory/new/?dir=${directory.id}"></spring:url>'
					class="btn bg-navy margin">Create Directory</a>


				<div class="box-body">
					<table class="table table-componed" style="color: #777">
						<tr style="background-color: #f4f4f4">
							<th style="width: 40px"></th>
							<th>Name</th>
							<th>Owner</th>
							<th style="width: 100px">Size</th>
						</tr>
						<c:forEach items="${directory.children}" var="subdirectory">
							<tr id="${subdirectory.id}" class='clickable-row'
								data-href='<spring:url value="/directory/?dir=${subdirectory.id}"></spring:url>'>
								<td style="vertical-align: middle; text-align: center;"><i
									style="font-size: 1.3em" class="fa fa-folder"></i></td>
								<td><p style="display: inline-block; margin-bottom: 0;">${subdirectory.name}</p></td>
								<td>Kujtim</td>
								<td>--</td>
							</tr>
						</c:forEach>
						<c:forEach items="${directory.documents}" var="document">
							<tr id="${document.id}" class='clickable-row'
								data-href='<spring:url value="/directory/?dir=${document.id}"></spring:url>'>
								<td
									style="vertical-align: middle; text-align: center; padding: 4px"><i
									style="font-size: 1.2em; color: #e60000; background-color: white; border-radius: 16px; padding: 7px 9px 7px 8px;"
									class="fa fa-file-pdf-o"></i></td>
								<td><p style="display: inline-block; margin-bottom: 0;">${document.name}</p></td>
								<td>Kujtim</td>
								<td>--</td>
							</tr>
						</c:forEach>
					</table>
				</div>
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
			<li><form:form id="context-delete-frm" action="" method="POST">
				</form:form> <a id="context-delete" href=""><i class="fa fa-trash-o"></i>Delete</a>
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
<jsp:include page="../fragments/modals/create_modal.jsp" />
<jsp:include page="../fragments/footers/footer.jsp" />
<jsp:include page="../fragments/sidebars/controll_sidebar.jsp" />
<jsp:include page="../fragments/commons/footer.jsp" />
<script type="text/javascript">
	$(document)
			.ready(
					function() {

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
															$(".modal-close-btn").on('click',function() {
															$(
																						"#view_user_modal")
																						.modal(
																								'hide');
																			})
														}
													});
										})
						$("#context-delete").on(
								"click",
								function(e) {
									e.preventDefault();
									var url = $(this).attr("href");
									$("#context-delete-frm")
											.attr("action", url).submit();
								})

						$("body").on("click", function() {
							$(".context-menu").hide();
						});

						$("body").bind("contextmenu", function(e) {
							$(".context-menu").hide();
							console.log("body");
						});

						$(".clickable-row")
								.bind(
										"contextmenu",
										function(e) {
											var rowhrf = $(this).attr(
													"data-href");
											var rowid = $(this).attr("id");
											var directory_root = '<spring:url value="/directory/"/>';
											var editUrl = directory_root
													+ "edit/?dir=" + rowid;
											var deleteUrl = directory_root
													+ "delete/?dir=" + rowid;
											var moveUrl = directory_root
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













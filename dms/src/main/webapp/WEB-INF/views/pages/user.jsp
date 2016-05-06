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

		<jsp:include page="../fragments/tables/tbl_user.jsp">
			<jsp:param value="${user}" name="user" />
		</jsp:include>
		<!-- /.box -->

	</section>
	<!-- /.content -->
</div>
<!-- /.content-wrapper -->
<jsp:include page="../fragments/modals/create_modal.jsp" />
<jsp:include page="../fragments/modals/user_delete_confirm.jsp" />
<jsp:include page="../fragments/footers/footer.jsp" />
<jsp:include page="../fragments/sidebars/controll_sidebar.jsp" />
<jsp:include page="../fragments/commons/footer.jsp" />
<script type="text/javascript">
	$(document).ready(
			function() {
				$(document).on("click", "#user-delete", function(e) {
					var url = $(this).attr("href");
					e.preventDefault();
					jQuery("#confirm_modal-user").modal('show', {
						backdrop : 'static'
					});
					$("#btn-modal-delete").attr("href", url);
				});

				$(document).on(
						"click",
						"#user-edit",
						function(e) {
							var url = $(this).attr("href");
							e.preventDefault();

							$.ajax({
								url : url,
								method : "GET",
								success : function(result) {
									jQuery("#create_modal").modal('show', {
										backdrop : 'static'
									});
									jQuery('#create_modal').find(".modal-body")
											.html(result);
									jQuery('#create_modal')
											.find(".modal-title").html(
													"Update user");

								}
							});
						});

				$(document).on(
						"click",
						"#create_btn",
						function(e) {
							var url = $(this).attr("href");
							e.preventDefault();
							$.ajax({
								url : url,
								method : "GET",
								success : function(result) {
									jQuery("#create_modal").modal('show', {
										backdrop : 'static'
									});
									jQuery('#create_modal').find(".modal-body")
											.html(result);
									jQuery('#create_modal')
											.find(".modal-title").html(
													"Create user");

								}
							});
						});

				
				$(document).on("click", "#user-submit", function(e) {
					var url = $("#user_frm").attr("action");
					e.preventDefault();

					$.ajax({
						url : url,
						method : "POST",
						data : $("#user_frm").serialize(),
						success : function(result) {
							$(".document-container-w").replaceWith(result);
							jQuery('#create_modal').modal('hide');
						}
					});
				});

				$(document).on("click","#btn-modal-delete",function(e){
					var url=$(this).attr("href");
					e.preventDefault();
					
					$.ajax({
						url : url,
						method : "POST",
						success : function(result) {
							$(".document-container-w")
							.replaceWith(result);
							jQuery("#confirm_modal-user").modal('hide');
							
						}
					});
					});

			})
</script>

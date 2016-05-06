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

		<jsp:include page="../fragments/tables/tbl_filetypes.jsp">
			<jsp:param value="${filetypes}" name="filetypes" />
			<jsp:param value="${tags}" name="tags" />
		</jsp:include>
		<!-- /.box -->

	</section>
	<!-- /.content -->
</div>
<!-- /.content-wrapper -->

<jsp:include page="../fragments/modals/tag_delete_confirm.jsp" />
<jsp:include page="../fragments/modals/create_modal.jsp" />
<jsp:include page="../fragments/modals/filetype_delete_confirm.jsp" />
<jsp:include page="../fragments/footers/footer.jsp" />
<jsp:include page="../fragments/sidebars/controll_sidebar.jsp" />
<jsp:include page="../fragments/commons/footer.jsp" />
<script type="text/javascript">
	$(document).ready(function() {
		$(document).on("click","#tag-delete",function(e){
			var url=$(this).attr("href");
			e.preventDefault();
			jQuery("#confirm_modal_tag").modal('show', {
				backdrop : 'static'
			});
			$("#btn-modal-delete").attr("href", url);
			});

		$(document).on("click","#tag-edit",function(e){
			var url=$(this).attr("href");
			e.preventDefault();
		
			$.ajax({
				url : url,
				method : "GET",
				success : function(result) {
					jQuery("#create_modal").modal('show', {
						backdrop : 'static'
					});
					jQuery('#create_modal').find(".modal-body").html(result);
					jQuery('#create_modal').find(".modal-title").html("Update Tag");
					
				}
			});
		});
		
		$(document).on("click","#create_tag",function(e){
			var url=$(this).attr("href");
			e.preventDefault();
			$.ajax({
				url : url,
				method : "GET",
				success : function(result) {
					jQuery("#create_modal").modal('show', {
						backdrop : 'static'
					});
					jQuery('#create_modal').find(".modal-body").html(result);
					jQuery('#create_modal').find(".modal-title").html("Create Tag");
					
				}
			});
		});

		$(document).on("click","#create_filetype",function(e){
			var url=$(this).attr("href");
			e.preventDefault();
			$.ajax({
				url : url,
				method : "GET",
				success : function(result) {
					jQuery("#create_modal").modal('show', {
						backdrop : 'static'
					});
					jQuery('#create_modal').find(".modal-body").html(result);
					jQuery('#create_modal').find(".modal-title").html("Create Tag");
					
				}
			});
		});

		$(document).on("click","#btn-tag-submit",function(e){
			var url=$("#frm-tag").attr("action");
			e.preventDefault();
			
			$.ajax({
				url : url,
				method : "POST",
				data: $("#frm-tag").serialize(),
				success : function(result) {
					$(".document-container-w")
					.replaceWith(result);
					jQuery('#create_modal').modal('hide');
				}
			});
		});
	
		$(document).on("click","#filetype-delete",function(e){
			var url=$(this).attr("href");
			e.preventDefault();
			jQuery("#confirm_modal_filetype").modal('show', {
				backdrop : 'static'
			});
			$("#confirm_modal_filetype").find("#btn-modal-delete").attr("href", url);
			});

		$(document).on("click","#filetype-edit",function(e){
			var url=$(this).attr("href");
			e.preventDefault();
		
			$.ajax({
				url : url,
				method : "GET",
				success : function(result) {
					jQuery("#create_modal").modal('show', {
						backdrop : 'static'
					});
					jQuery('#create_modal').find(".modal-body").html(result);
					jQuery('#create_modal').find(".modal-title").html("Update file type");
					
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
					jQuery("#confirm_modal_tag").modal('hide');
					jQuery("#confirm_modal_filetype").modal('hide')
					
				}
			});
			});
			
	})
</script>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
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
				<h3 class="box-title">Title</h3>
				<div class="box-tools pull-right">
					<button class="btn btn-box-tool" data-widget="collapse"
						data-toggle="tooltip" title="Collapse">
						<i class="fa fa-minus"></i>
					</button>
					<button class="btn btn-box-tool" data-widget="remove"
						data-toggle="tooltip" title="Remove">
						<i class="fa fa-times"></i>
					</button>
				</div>
			</div>
			<div class="box-body">
			
				<jsp:include page="../fragments/forms/frm_document.jsp" />

			</div>
			<!-- /.box-body -->
			<div class="box-footer">Footer</div>
			<!-- /.box-footer-->
		</div>
		<!-- /.box -->

	</section>
	<!-- /.content -->
</div>
<!-- /.content-wrapper -->

<jsp:include page="../fragments/footers/footer.jsp" />
<jsp:include page="../fragments/sidebars/controll_sidebar.jsp" />
<jsp:include page="../fragments/commons/footer.jsp" />

<script type="text/javascript">
$(document).ready(function() {

	$('#documentTags').select2({
		tags: true
		})

	
	$(document).on("change","input[type=file]",function(){
			$("#documentName").val($(this).val().split('\\').pop());
		})
	$("#documentReleaseDate").datepicker({
		  changeMonth: true,
	      changeYear: true});
	if($("#documentReleaseDate").val()) 
	{
	 $("#documentReleaseDate").val(
				$.datepicker.formatDate('dd/mm/yy', new Date($(
						"#documentReleaseDate").val())));
	};
	//$("#documentReleaseDate").datapicker();

})
</script>








<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
				<h3 class="box-title">Directories</h3>
			</div>
			<div class="box-body">
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
                    <tr class='clickable-row' data-href='<spring:url value="/directory/?dir=${subdirectory.id}"></spring:url>'>
                      <td style="vertical-align: middle;text-align: center;">
                      <i style="font-size:1.3em" class="fa fa-folder-open"></td>
                      <td><p 
								style="display: inline-block; margin-bottom: 0;">${subdirectory.name}</p></td>
                      <td>
                        Kujtim
                      </td>
                      <td>
                      	--
                      </td>
                    </tr>
                   </c:forEach>
                  </table>
                </div><!-- /.box-body -->

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
<jsp:include page="../fragments/modals/create_modal.jsp" />
<jsp:include page="../fragments/footers/footer.jsp" />
<jsp:include page="../fragments/sidebars/controll_sidebar.jsp" />
<jsp:include page="../fragments/commons/footer.jsp" />
<script type="text/javascript">

	$(document).ready(function() {
		     $(".clickable-row").click(function() {
		    	$(".clickable-row").css("background-color","")
		    	$(".clickable-row").css("color","#777")
		        $(this).css("background-color","#55acee")
		        $(this).css("color","#fff");
		    }); 
		    $(".clickable-row").dblclick(function() {
		        window.document.location = $(this).data("href");
		    });
		
		
		
		$("#create_dir").on("click", function(e) {
			
			e.preventDefault();
			var url=$(this).attr("href")
			$.ajax({
				url : url,
				method : "GET",
				success : function(result) {
					jQuery('.modal').modal('show', {
						backdrop : 'static'
					});
					jQuery('.modal-dialog').find(".modal-body").html(result);
					jQuery('.modal-dialog').find(".modal-title").text("Create directory");
					$(".modal-close-btn").on('click', function() {
						$("#view_user_modal").modal('hide');
					})

				}
			});
		})

	})
</script>
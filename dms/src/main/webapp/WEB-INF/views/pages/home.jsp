<jsp:include page="../fragments/commons/head.jsp" />
<jsp:include page="../fragments/headers/main_header.jsp" />
<jsp:include page="../fragments/navigations/main_menu.jsp" />

 <div class="content-wrapper">
        <!-- Content Header (Page header) -->
        <section class="content-header">
          <h1>
            Blank page
            <small>it all starts here</small>
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
                <button class="btn btn-box-tool" data-widget="collapse" data-toggle="tooltip" title="Collapse"><i class="fa fa-minus"></i></button>
                <button class="btn btn-box-tool" data-widget="remove" data-toggle="tooltip" title="Remove"><i class="fa fa-times"></i></button>
              </div>
            </div>
            <div class="box-body">
              <a class="btn btn-app" style="text-align:left; width:100%;height: 46px; padding-top: 12px">
                    <i class="fa fa-folder-open"><p class="text-muted" style="display: inline-block; padding-left: 15px">Home directory</p></i>
              </a> 

	<div class="form-group">
		<label for="directoryName">Email address</label> 
		<input
			type="text" class="form-control" id="directoryName"
			placeholder="Folder name">
	</div>

              
            </div><!-- /.box-body -->
            <div class="box-footer">
              Footer
            </div><!-- /.box-footer-->
          </div><!-- /.box -->

        </section><!-- /.content -->
      </div><!-- /.content-wrapper -->
      
<jsp:include page="../fragments/footers/footer.jsp" />
<jsp:include page="../fragments/sidebars/controll_sidebar.jsp" />
<jsp:include page="../fragments/commons/footer.jsp" />
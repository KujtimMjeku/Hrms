<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<div class="modal" id="<%= request.getParameter("id") %>">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal"
					aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
				<h4 class="modal-title"></h4>
			</div>
			<div class="modal-body">
				<h4><%= request.getParameter("message") %></h4>
			</div>
			<div class="modal-footer">
                    <a type="button" class="btn btn-default pull-left" data-dismiss="modal"><%= request.getParameter("no") %></a>
                    <a type="button" id="btn-modal-delete" class="btn btn-danger"><%= request.getParameter("yes") %></a>
             </div>
		</div>
		<!-- /.modal-content -->
	</div>
	<!-- /.modal-dialog -->
</div>
<!-- /.modal -->
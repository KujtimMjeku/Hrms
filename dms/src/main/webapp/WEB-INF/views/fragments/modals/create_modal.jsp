<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<div class="modal" id="create_modal">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal"
					aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
				<h4 class="modal-title"><%= request.getParameter("title") %></h4>
			</div>
			<div class="modal-body">
				<p>One fine body&hellip;</p>
			</div>
		</div>
		<!-- /.modal-content -->
	</div>
	<input type="hidden" id="parent-id-modal" name="dir_p" value="">
	<input type="hidden" id="child-id-modal" name="dir" value="">
	<!-- /.modal-dialog -->
</div>
<!-- /.modal -->
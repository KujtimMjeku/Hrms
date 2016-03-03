<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<div class="row">
	<div class="col-sm-12">
		<div class="table-wrapper">
			<div class="table-header">
				<div class="row">
					<div class="col-sm-12">
						<span>
							<h3>Menage Car Types</h3>
						</span>
						<spring:url value="/car/add" var="addUrl" />
						<a href="${addUrl}" class="btn btn-primary">Add
							new</a>
					</div>
				</div>
			</div>
			<div class="table-action">
				<div class="row">
					<div class="col-sm-4">
						<select class="form-control per-page-select">
							<option>10</option>
							<option>20</option>
							<option>30</option>
						</select> <span>per page</span>
					</div>
					<div class="col-sm-8" style="text-align: right">
						<div class="btn-group btn-group-sm" role="group"
							aria-label="Default button group">
							<button type="button" class="btn btn-default">Excel</button>
							<button type="button" class="btn btn-default">PDF</button>
							<button type="button" class="btn btn-default">Print</button>
						</div>
						<span>Search: </span> <input class="form-control search-imput"
							type="text">
					</div>
				</div>
			</div>
			<div class="table-body">
				<div class="row">
					<div class="col-sm-12">
						<table class="table" tyle="color:black">
							<thead>
								<tr>
									<th></th>
									<th>Name</th>
									<th>Type</th>
									<th>Regjistration number</th>
									<th>Color</th>
									<th>Date manufacturing</th>
									<th>Base price per day</th>
									<th>image</th>
									<th></th>
								</tr>
							</thead>
							<c:forEach items="${cars}" var="car">
								<tr>
									<td>${car.id}</td>
									<td>${car.tblcarType.name}</td>
									<td>${car.tblcarType.type}</td>
									<td>${car.regjistration_Number}</td>
									<td>${car.color}</td>
									<td>${car.date_of_Manufacturing}</td>
									<td>${car.base_Price_Per_Day}</td>
									<td><img src="data:image/jpeg;base64,${foto[car.id]}"  width="30" height="30"></td>
									<td>
									<spring:url value="/car/edit/${car.id}" var="editUrl" />
										<a type="button"
											href="${editUrl}"
											class="btn btn-default edit_record">
											<i class="fa fa-pencil"></i>
										</a>
										<button type="button"
											onclick="confirm_modal('car/delete/${car.id}','car')"
											class="btn btn-default delete_record">
											<i class="fa fa-trash-o"></i>
										</button>
									</td>
								</tr>
							</c:forEach>
						</table>
					</div>
				</div>


			</div>
			<div class="table-footer1">
				<div class="row">
					<div class="col-sm-12">
						<span class="record-message">Showing 1 to ${records_count}
							of ${records_count} entries </span>
						<ul class="pagination">
							<li><a href="#" aria-label="Previous"> <span
									aria-hidden="true">&laquo;</span>
							</a></li>
							<c:forEach items="${pList}" var="page">
								<li><a href="#">${page}</a></li>
							</c:forEach>
							<li><a href="#" aria-label="Next"> <span
									aria-hidden="true">&raquo;</span>
							</a></li>
						</ul>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<c:if test="${edit eq true }">
	<spring:url value="/user/update/${user.username}" var="updateUrl" />
</c:if>
<c:if test="${edit eq false }">
	<spring:url value="/user/new/" var="updateUrl" />
</c:if>
<form:form modelAttribute="user" id="user_frm" action="${updateUrl}"
	method="post" cssClass="form-horizontal">
	<div class="form-group">
		<label for="user-username" class="control-label col-sm-2">Username</label>
		<div class="col-sm-10">
			<form:input id="user-username" cssClass="form-control "
				path="username" />
			<span id="username-error" class="help-block with-errors"></span>
		</div>
	</div>
	<div class="form-group">
		<label for="user-name" class="control-label col-sm-2">Emri</label>
		<div class="col-sm-10">
			<form:input id="user-name" cssClass="form-control " path="name" />
			<span id="name-error" class="help-block with-errors"></span>
		</div>
	</div>
	<div class="form-group">
		<label for="user-surename" class="control-label col-sm-2">Mbiemri</label>
		<div class="col-sm-10">
			<form:input id="user-surename" cssClass="form-control"
				path="surename" />
			<span id="surename-error" class="help-block with-errors"></span>
		</div>
	</div>
	<div class="form-group">
		<label for="user-email" class="control-label col-sm-2">Emaili</label>
		<div class="col-sm-10">
			<form:input id="user-email" cssClass="form-control" path="email" />
			<span id="email-error" class="help-block with-errors"></span>
		</div>
	</div>
	<div class="form-group">
		<label for="groups-name" class="control-label col-sm-2">Groups</label>
		<div class="col-sm-10">
			<form:select id="groups-name" class="form-control select2"
				multiple="false" cssStyle="width:100%" path="groups">
				<form:option label="" value="0" />
				<c:forEach items="${groups}" var="group">
					<c:choose>			
						<c:when test="${selected eq group.id }">
							<form:option selected="true" label="${group.name }" value="${group.id }" />
						</c:when>
						<c:otherwise>
							<form:option label="${group.name }" value="${group.id }" />
						</c:otherwise>		
					</c:choose>
				</c:forEach>


			</form:select>
			<span id="type-error" class="help-block with-errors"></span>
		</div>
	</div>

	<input type="submit" id="user-submit" class="btn btn-primary">
	<!--  -->
</form:form>

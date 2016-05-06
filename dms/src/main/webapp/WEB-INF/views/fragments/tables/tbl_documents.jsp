<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<div class="box-body table-responsive no-padding" id="document-container">
	<table class="table table-componed" style="color: #777">
		<tr style="background-color: #f4f4f4">
			<th style="width: 40px"></th>
			<th >Name</th>
			<th >Owner</th>
			<th>Last modified</th>
			<th style="width: 100px">Size</th>
		</tr>
		<c:forEach items="${documents}" var="document">
			<tr id="${document.id}" class='clickable-row'
				data-href='<spring:url value="/directory/?dir=${document.id}"></spring:url>'>
				<td style="vertical-align: middle; text-align: center; padding: 4px">

					<c:choose>
						<c:when test="${document.fileType.type eq 'Word'}">
							<i
								style="font-size: 1.2em; color: #0088cc; background-color: white; border-radius: 16px; padding: 7px 9px 7px 8px;"
								class="fa fa-file-word-o"></i>
						</c:when>
						<c:when test="${document.fileType.type eq 'Excel'}">
							<i
								style="font-size: 1.2em; color: #009933; background-color: white; border-radius: 16px; padding: 7px 9px 7px 8px;"
								class="fa fa-file-excel-o"></i>
						</c:when>
						<c:when test="${document.fileType.type eq 'Powerpoint'}">
							<i
								style="font-size: 1.2em; color: #e65c00; background-color: white; border-radius: 16px; padding: 7px 9px 7px 8px;"
								class="fa fa-file-powerpoint-o"></i>
						</c:when>
						<c:when test="${document.fileType.type eq 'Text'}">
							<i
								style="font-size: 1.2em; background-color: white; color:gray;	 border-radius: 16px; padding: 7px 9px 7px 8px;"
								class="fa fa-file-text-o"></i>
						</c:when>
						<c:when test="${document.fileType.type eq 'Image'}">
							<i
								style="font-size: 1.2em; color: #1a8cff; background-color: white; border-radius: 16px; padding: 7px 9px 7px 8px;"
								class="fa fa-file-photo-o"></i>
						</c:when>
						<c:when test="${document.fileType.type eq 'Pdf'}">
							<i
								style="font-size: 1.2em; color:  #cc2900; background-color: white; border-radius: 16px; padding: 7px 9px 7px 8px;"
								class="fa fa-file-pdf-o"></i>
						</c:when>
						<c:otherwise>
							<i
								style="font-size: 1.2em; color: gray; background-color: white; border-radius: 16px; padding: 7px 9px 7px 8px;"
								class="fa fa-file-o"></i>
						</c:otherwise>
					</c:choose>
				</td>
				<td><p style="display: inline-block; margin-bottom: 0;">${document.name}</p></td>
				<td style="padding-right: 30px">Kujtim</td>
				<td style="padding-right: 20px"><fmt:formatDate type="date" value="${document.updatedOn}" /></td>
				<td>${document.readableFileSize(document.size)}</td>
			</tr>
		</c:forEach>
	</table>
</div>
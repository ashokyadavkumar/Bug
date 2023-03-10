<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="s" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
 <%@include file="/WEB-INF/views/header.jsp" %>
</head>
<body>
<div class="custom-breadcrumbs">
  <div class="container">
		<ol class="breadcrumb">
			<!-- <li class="breadcrumb-item active"><a href="#">Home</a></li> -->
			<div class="col-12 col-sm-12 col-md-12 col-lg-5 col-xl-5 right-part">
				
			</div>
		</ol>
	</div>
</div>
<div>
		<div class="two-form-div">
			<div class="container">
				<div class="row">
					<div class="col-12 col-sm-12 col-md-12 col-lg-5 col-xl-5">
						<div class="login-fields">
							<div class="table-responsive">
							<%@include file="/WEB-INF/views/sideBarManuPl.jsp"%></div>
							</div>
					</div>
					<label class="text-success">${msg}</label>
					<div class="col-12 col-sm-12 col-md-12 col-lg-7 col-xl-7" style="border: 1px solid;background-color: #FFC0CB;margin-left: -16px;">
						<div class="login-content">
							<s:form class="create-account" action="postBug" id="search"
								name="search" method="post" ondrop="return false"
								accept-charset="UTF-8" autocomplete="off">
								<input type="hidden" name="${_csrf.parameterName}"
									value="${_csrf.token}" />
								<div class="row">
									<div class="col-12 col-sm-12 col-md-12 col-lg-12 col-xl-12" style="margin-top: 23%;text-align:center">
										<span style="font-size: 30px;font-weight: bold;color:#96358C">
										View Project</span>
									</div>
									<div
										class="col-12  col-sm-4 col-md-4 col-lg-4 col-xl-4 margin-10-bottom">
										<div class="col-12 col-sm-12 col-md-12 col-lg-12 col-xl-12 mt-3 pl-0 pr-0">
	<div >
					<table class="table tablalign table-bordered" id="example2" class="display" style="width:100%">
					<thead>
						<tr>
						<th>S.No.</th>
						<th>Project ID</th>
						<th>Project Name</th>
						<th>Project Start Date</th>
						<th>Status</th>
						</tr>
						</thead>
						<tbody>
							<c:forEach items="${projectList}" var="issue" varStatus="count">
							<tr>
								<td> ${count.count} </td>
								<td>${issue.id}</td>
								<td>${issue.projectName}</td>
								<td><fmt:formatDate value="${issue.projectStartDate}" pattern="dd/MM/yyyy"/></td>
								<td>${issue.status}</td>
								
								
							</tr>
							</c:forEach>
						</tbody>
						</table>
						</div>
 </div>
									</div>
								</div>

								
							</s:form>

						</div>
					</div>

				</div>
			</div>
		</div>

	</div>

	<%@include file="/WEB-INF/views/footer.jsp" %>
</body>
</html>
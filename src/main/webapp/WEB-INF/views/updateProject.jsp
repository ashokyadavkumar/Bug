<!doctype HTML>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="s" uri="http://www.springframework.org/tags/form"%>
<%@ page import="java.util.Date" %>
<html lang="en">
<head>
<link rel="shortcut icon" href="images/favicon.ico"
	type="image/vnd.microsoft.icon" />
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="${pageContext.request.contextPath}/styles/bootstrap.css"
	rel="stylesheet" type="text/css">
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/styles/easy-responsive-tabs.css " />
<link href="${pageContext.request.contextPath}/styles/class.css"
	rel="stylesheet" type="text/css">
<link href="${pageContext.request.contextPath}/styles/responsive.css"
	rel="stylesheet" type="text/css">
<link href="${pageContext.request.contextPath}/styles/datepicker.css"
	rel="stylesheet" type="text/css">
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/styles/fontawesome.css " />
<script type="application/javascript" src="js/jquery3.3.1.js"></script>

<%@include file="/WEB-INF/views/header.jsp"%>
<div class="custom-breadcrumbs">
	<div class="container">
		<ol class="breadcrumb">
			<li class="breadcrumb-item active"><a href="#">Home</a></li>
			<div class="col-12 col-sm-12 col-md-12 col-lg-5 col-xl-5 right-part">
				<ul class="btns float-right">
					<li>
						<form action="logout" method="post">
							<input type="hidden" name="${_csrf.parameterName}"
								value="${_csrf.token}" /> <input type="submit" value="Logout"
								class="logout-btn">
						</form>
					</li>
				</ul>
			</div>
		</ol>
	</div>
</div>
<script type="text/javascript">
	function addProject(form) {
		//alert("hello check")
		
		if ($('#userId').val() == "") {
			alert("Please enter Project id ")
			$('#userId').focus();
			return false;
		}
		
	}
</script>

</head>
<body>
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
					<div class="col-12 col-sm-12 col-md-12 col-lg-7 col-xl-7">
						<div class="login-content">
	
	<s:form class="create-account" action="updateProject" id="register2" name="register2" method="post"  ondrop="return false" accept-charset="UTF-8"  autocomplete="off">
			<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
	 <input type="hidden" name="userId" value="${project.id}" />
	<table style="width:100%">
	<tr>
	<td>Project Id</td>
	<td>${project.id}<tr>
	<tr>
	<td>Project Name</td>
	<td>${project.projectName}</td>
	<tr>
	<td>Client Name</td>
	<td>${project.clientName}</td>
	<tr>
	<tr>
	<td>Current Status</td>
	<td>${project.status}</td>
	<tr>
				<td><lable for="change status">change status</lable></td>
					<td><div class="form-group">
						<select class="form-control" name="status" id="status">
														<option value="0">--Select Status--</option>
														<option value="progress">Progress</option>
														<option value="pending">Pending</option>
														<option value="finished">Finished</option>
													</select>
					</div></td><tr>
	</table>
	<input type ="submit" class="bluebotton"  value ="update">
	</s:form>
	</div>
	</div>
	</div>
	</div>
	</div>
	</div>
	
</body>
</html>
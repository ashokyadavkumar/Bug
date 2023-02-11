<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
     <%@ taglib prefix="s" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<style>
table,th,td{
	border:1px solid black;
}
</style>
<body>
	<br><br>
	<h1>---------------------------------------</h1>
	
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
	
</body>
</html>
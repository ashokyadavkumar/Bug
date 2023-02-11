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
	
	<s:form class="create-account" action="updateUser" id="register2" name="register2" method="post"  ondrop="return false" accept-charset="UTF-8"  autocomplete="off">
			<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
	 <input type="hidden" name="userId" value="${bugUser.id}" />
	<table style="width:100%">
	<tr>
	<td>UserName</td>
	<td>
	<input type="text" class="form-control" id="userName" name="userName"
					value="${bugUser.userName}" data-ignorepaste="" autocomplete="off" />
	</td>
	<tr>
	<tr>
	<td>Password</td>
	<td><input type="password" class="form-control" id="userPassword" name="userPassword"
					value="${bugUser.userPassword}" data-ignorepaste="" autocomplete="off" /></td>
	<tr>
	<tr>
	<td>FirstName</td>
	<td><input type="text" class="form-control" id="firstName" name="firstName"
					value="${bugUser.firstName}" data-ignorepaste="" autocomplete="off" /></td>
	<tr>
	<tr>
	<td>Email</td>
	<td><input type="text" class="form-control" id="email" name="email"
					value="${bugUser.email}" data-ignorepaste="" autocomplete="off" /></td>
	<tr>
	<tr>
	<td>PhoneNumber</td>
	<td><input type="text" class="form-control" id="mobile" name="mobile" maxlength="10" value="${bugUser.mobile}" data-ignorepaste="" autocomplete="off"/></td>
	<tr>
	<tr>
	<td>designation</td>
	<td><input type="text" class="form-control" id="refUserRoleId"  value="${bugUser.refUserRoleId.roleName}" data-ignorepaste="" autocomplete="off"/></td>
	<tr>
	<tr>
	<td>Current Status</td>
	<td>${bugUser.status}</td>
	<tr>
	<tr>
				<td><lable for="change status">change status</lable></td>
					<td><div class="form-group">
						<select class="form-control" name="status" id="status">
							<option value="Enable">--Select Status--</option>
							<option value="Enable">Enable</option>
							<option value="Disable">Disable</option>
						</select>
					</div></td><tr>
	</table>
	<input type ="submit" class="bluebotton"  value ="update">
	</s:form>
	
</body>
</html>
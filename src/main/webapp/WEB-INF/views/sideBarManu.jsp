<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="s" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<div class="two-form-div1" style="padding-left:149px;padding-top:31px;font:initial;background-color: #FFFFE0;">
	<table>
		<tbody>
			<tr>
				<td><a href= "dashboardAdmin" class="forgot-pass float-left" style="color:#4343BB;font-size:17px;text-decoration-line: underline;font-weight: bold ">Home</a></td>
			</tr>
			<tr>
				<td><a href="createUser" class="forgot-pass float-left" style="color:#4343BB;font-size:17px;text-decoration-line: underline;font-weight: bold ">Create
						User</a></td>
			</tr>
			<tr>
				<td><a href="searchByEmail" class="forgot-pass float-left" style="color:#4343BB;font-size:17px;text-decoration-line: underline;font-weight: bold ">Search User By Email</a></td>
			</tr>
			<tr>
				<td><a href="searchById" class="forgot-pass float-left" style="color:#4343BB;font-size:17px;text-decoration-line: underline;font-weight: bold ">Search User By Id</a></td>
			</tr>
			<tr>
				<td><a href="searchByDesignation" class="forgot-pass float-left" style="color:#4343BB;font-size:17px;text-decoration-line: underline;font-weight: bold ">Search User By Designation</a></td>
			</tr>
			<tr>
				<td><a href="#users" onclick="showList('user')" style="color:#4343BB;font-size:17px;text-decoration-line: underline;font-weight: bold "
					class="forgot-pass float-left">Disable User</a></td>
			</tr>

			<tr>
				<td><a href="logout" class="forgot-pass float-left" style="color:#4D1489;font-size:17px;text-decoration-line: underline;font-weight: bold ">Logout</a></td>
			</tr>


		</tbody>
	</table>
</div>


</body>
</html>
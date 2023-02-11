<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="s" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<div class="two-form-div1">
	<table>
		<tbody>
			<tr>
				<td><a class="forgot-pass float-left"></a></td>
			</tr>
			<tr>
				<td><a href="createUser" class="forgot-pass float-left">Create
						User</a></td>
			</tr>
			<tr>
				<td><a href="searchByEmail" class="forgot-pass float-left">Search User By Email</a></td>
			</tr>
			<tr>
				<td><a href="searchById" class="forgot-pass float-left">Search User By Id</a></td>
			</tr>
			<tr>
				<td><a href="searchByDesignation" class="forgot-pass float-left">Search User By Designation</a></td>
			</tr>
			<tr>
				<td><a href="#users" onclick="showList('user')"
					class="forgot-pass float-left">Disable User</a></td>
			</tr>

			<tr>
				<td><a href="logout" class="forgot-pass float-left">Logout</a></td>
			</tr>


		</tbody>
	</table>
</div>


</body>
</html>
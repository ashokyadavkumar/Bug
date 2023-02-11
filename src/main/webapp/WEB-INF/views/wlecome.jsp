<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>

<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="s" uri="http://www.springframework.org/tags/form"%>

<!doctype HTML>
<html lang="en">

<body>
	<p class="text-success">
		<b>BUG Tracker</b>
	</p>
	<br />
	<h5>
		Welcome <label class="text-success">${bugUser.firstName}</label>
	</h5>
	<h5>
		Your role is <label class="text-success">${bugUserRoleName}</label>
	</h5>
</body>

</html>
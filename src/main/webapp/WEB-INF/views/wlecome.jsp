<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>

<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="s" uri="http://www.springframework.org/tags/form"%>

<!doctype HTML>
<html lang="en">
<style type="text/css"> 

<c:choose>
  <c:when test="${bugUserRoleName.equals('Tester')}">
#welcomeuser{
	border: 1px solid;
    height: 393px;
    margin-left: -5%;
    padding-top: 135px;
    background-color: #E0FFFF;
    } 
 </c:when>
 <c:when test="${bugUserRoleName.equals('admin')}">
#welcomeuser{
	border: 1px solid;
    height: 348px;
    margin-left: -5%;
    padding-top: 135px;
    background-color: #E0FFFF;
    } 
 </c:when>
  <c:when test="${bugUserRoleName.equals('Project Leader') || bugUserRoleName.equals('Module Leader') || bugUserRoleName.equals('Test Leader') || bugUserRoleName.equals('Developer')}">
#welcomeuser{
	border: 1px solid;
    height: 328px;
    margin-left: -5%;
    padding-top: 135px;
    background-color: #E0FFFF;
    } 
 </c:when>
 </c:choose>
</style>
 

<body>
<div id="welcomeuser" border: 1px solid;
    height: 393px;
    margin-left: -5%;
    padding-top: 135px;
    background-color: #E0FFFF;>
	<!-- <p class="text-success">
		<b>BUG Tracker</b>
	</p> -->
	<br />
	<div id="data">
	<h5 style="text-align:center;font-size:35px">
		Welcome <label class="text-success">${bugUser.firstName}</label>
	</h5>
	<h5 style="text-align:center;font-size:35px">
		Your role is <label class="text-success">${bugUserRoleName}</label>
	</h5>
	</div>
</body>
</div>

</html>
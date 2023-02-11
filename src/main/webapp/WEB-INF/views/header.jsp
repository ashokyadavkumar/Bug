<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>

<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="s" uri="http://www.springframework.org/tags/form"%>

<sec:authorize access="isAuthenticated()">
    <sec:authentication property="principal.roleid" var="roleid" />
</sec:authorize>
<!doctype HTML>
<html lang="en">
<head>
<link rel="shortcut icon" href="images/favicon.ico" type="image/vnd.microsoft.icon" />
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link href="${pageContext.request.contextPath}/styles/bootstrap.css" rel="stylesheet" type="text/css">
      <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/styles/easy-responsive-tabs.css " />
	<link href="${pageContext.request.contextPath}/styles/class.css" rel="stylesheet" type="text/css">
    <link href="${pageContext.request.contextPath}/styles/responsive.css" rel="stylesheet" type="text/css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/styles/date-picker19-08.css" type="text/css">
     <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/styles/font-awesome-new.css " />
    <script type="application/javascript" src="${pageContext.request.contextPath}/js/jquery3.3.1.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/bootbox.min.js"></script>
	<script type="text/javascript">
		window.history.forward();
		function noBack() {
			window.history.forward();
		}
	</script>
	
<style>
.center {
  text-align: center;
}
h2 {
  background-color: green;
  color: white;
}
</style>
</head>
<body onload="startTime();noBack();">
<body>
	<noscript>
		<meta http-equiv="refresh" content="1; url=jsError"/>
	</noscript>
	
	<header>
		<div >
	          <ul class="center">
	          <h2 style="background-color: #F0F8FF;"><span style="color:red;font-size:26px">Bug Tracking System</span></h2>
	           
	          </ul>
	    </div>
	    
	</header>
</body>
</html>
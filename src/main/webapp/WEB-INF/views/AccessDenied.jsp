<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
<head>
<meta charset="UTF-8">
<title>BUG - Access Denied</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="${pageContext.request.contextPath}/styles/bootstrap.css" rel="stylesheet" type="text/css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/styles/easy-responsive-tabs.css " />
<link href="${pageContext.request.contextPath}/styles/class.css" rel="stylesheet" type="text/css">
<link href="${pageContext.request.contextPath}/styles/responsive.css" rel="stylesheet" type="text/css">
</head>
<body>
<style>
.center {
  text-align: center;
}
h2 {
  background-color: green;
  color: white;
}
</style>
	<header>
	<div>
		<ul class="center">
			<h2>
				<span>Bug Tracking System</span>
			</h2>
		</ul>
		<div class="col-12 col-sm-12 col-md-12 col-lg-12 col-xl-12 right-part">
			<ul class="btns float-right">
				<li><a href="login" class="login-btn">Login</a></li>
			</ul>
		</div>
	</div>

	</header>

	<div class="container">
<div class="two-form-div">
<div class="iem-wrap access-denied-main">
	
	<div class="access-denied-div">
		<p>Access to the requested resource has been denied or session timeout</p>
		<a href="${pageContext.request.contextPath}">Home</a>
	</div>
</div>
</div>
</div>
<br>
</body>
<div class="clearfix"></div>
	<%@include file="/WEB-INF/views/footer.jsp" %>

</html>
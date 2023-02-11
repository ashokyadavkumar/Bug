<!doctype HTML>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="s" uri="http://www.springframework.org/tags/form"%>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="_csrf" content="${_csrf.token}" />
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
</head>
<body>
	<header>
		<div class="topheader">
			<div class="container">
				<ul class="tagline">
					<li class="ministry">Ministry of Commerce and Industry</li>
					<li>Government of India</li>
				</ul>
			</div>
		</div>
		<div class="clearfix"></div>
		<div class="container-fluid">
			<div class="row">
				<div class="mid-header">
					<div class="container">
						<div class="row">
							<div class="col-12 col-sm-6 col-md-7 col-lg-7 col-xl-7 left-part">
								<a href="">
									<figure>
										<img src="images/embelem.png" alt="embelem">
									</figure>
									<div class="hindi-txt">
									         <h3>m|ksx lao/kZu vkSj vkarfjd O;kikj foHkkx</h3>
									         <span class="hindi"></span>
									          <h2><span>Department for Promotion of Industry and Internal Trade</span></h2>
									          <span class="small-txt">G2b Portal</span>
									</div>
								</a>
							</div>
							<div
								class="col-12 col-sm-6 col-md-5 col-lg-5 col-xl-5 right-part">
								<ul class="btns float-right">
									<li><a href="login" class="login-btn">Login</a></li>
									<!-- <li><a href="registration" class="register-btn">Register</a></li> -->
								</ul>
							</div>
						</div>
					</div>
					<div class="naviarea">
						<div class="innernavi">
							<div class="container">
								<nav class="navbar navbar-expand-lg navbar-light bg-none">
									<a class="navbar-brand" href="#">Menu</a>
									<button class="navbar-toggler" type="button"
										data-toggle="collapse" data-target="#navbarSupportedContent"
										aria-controls="navbarSupportedContent" aria-expanded="false"
										aria-label="Toggle navigation">
										<span class="navbar-toggler-icon"></span>
									</button>
									<div class="collapse navbar-collapse"
										id="navbarSupportedContent">
										<ul class="navbar-nav float-right">
											<li class="nav-item active"><a class="nav-link"
												href="eFilingInstructions">e-Filing Instructions</a></li>
											<li class="nav-item"><a class="nav-link"
												href="usermanual">Online Help</a></li>
										</ul>
									</div>
								</nav>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</header>
	<div class="clearfix"></div>
	<div class="custom-breadcrumbs">
		<div class="container">
			<ol class="breadcrumb">
				<li class="breadcrumb-item"><a href="/lms">Home</a></li>
				<li class="breadcrumb-item active"><a href="login">Login</a></li>
			</ol>
		</div>
	</div>
	<div class="clearfix"></div>
	<div class="container">
		<div class="two-form-div">
		<div class="iem-wrap">
			<div class="container">
				<div class="register-div">
					<h1>Reset Password</h1>

					<div id="parentHorizontalTab">
						<div class="resp-tabs-container hor_1">
							<s:form theme="simple" 	 name="changePassword" id="changePassword" action="resetPasswordSubmit" method="post">
							<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
							<input type="hidden" name="enctype" value="${param.enctype}" />
							<%-- <c:set var="csrfName" value="${_csrf.parameterName}"></c:set>
							<c:set var="csrfVal" value="${_csrf.token}"></c:set> --%>
							
							<div class="row">
								<div class="col-12 col-sm-6 col-md-4 col-lg-4 col-xl-4">
									<label>New Password<sup>*</sup></label>
									<input type="password" size="22" name="newPassword" id="newPassword" class="form-control"/>
								</div>
								
								<div class="col-12 col-sm-6 col-md-4 col-lg-4 col-xl-4">
									<label>Re-Type New Password<sup>*</sup></label>
									<input type="password" size="22" name="reTypeNewPassword" id="reTypeNewPassword" class="form-control"/>
								</div>
								
								<div class="col-12 col-sm-12 col-md-12 col-lg-12 col-xl-12 mt-3 mb-3">
									<i>Note : Password should be between 8-16 alphanumeric characters &amp; must contain one upper case &amp; special character</i>
								</div>
								
								<div class="col-12 col-sm-12 col-md-12 col-lg-12 col-xl-12">
								<input type="submit" id="savebutton"  name="savebutton" value="Reset Password" class="bluebotton float-right" />
								<a href="${pageContext.request.contextPath}"><input type="button" id="cancelbutton" name="cancelbutton" value="Cancel" class="bluebotton float-right" /></a>
								</div>
								
							</div>
							
	<%-- <table border = "0">
		<tr><th colspan="7" class="mainheading">&nbsp;</th></tr>
		<tr>
			<td width="20%">New Password<span class="required">*</span></td>
			<td width="1%">:</td>
			<td width="28%"><input type="password" size="22" name="newPassword" id="newPassword"/></td>
			<td width="2%"></td>
			<td width="20%"></td>
			<td width="1%"></td>
			<td width="28%"></td>
		</tr>
		<tr>
			<td>Re-Type New Password<span class="required">*</span></td>
			<td>:</td>
			<td colspan="5"><input type="password" size="22" name="reTypeNewPassword" id="reTypeNewPassword"/></td>	
		</tr>
		<tr><td colspan="7"><span class="tooltip">Note : Password should be between 8-16 alphanumeric characters & must contain one upper case & special character</span></td></tr>
		<tr><td colspan="7"></td></tr>
		<tr><td colspan="7" align="right"><input type="submit" id="savebutton"  name="savebutton" value="Reset Password" class="bluebotton" />&nbsp;&nbsp;<a href="login"><input type="submit" id="cancelbutton" name="cancelbutton" value="Cancel" class="bluebotton" /></a></td></tr>
	</table> --%>
</s:form>
						</div>
					</div>
				</div>
			</div>
		</div>
		</div>
	</div>
	<div class="clearfix"></div>
	<script type="application/javascript" src="js/jquery3.3.1.js"></script>
	<script type="application/javascript" src="js/bootstrap.js"></script>
	<script src="js/easyResponsiveTabs.js"></script>

	
	<%@include file="/WEB-INF/views/footer.jsp"%>
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/sha.js"></script>
<%
String SALTCHARS = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ1234567890";
StringBuffer salt = new StringBuffer();
java.util.Random rnd = new java.util.Random();
while (salt.length() < 16) {
	int index = (int) (rnd.nextFloat() * SALTCHARS.length());
	salt.append(SALTCHARS.substring(index, index + 1));
}
String saltStr = salt.toString();
session.setAttribute("phash", saltStr);
String sessionid = request.getSession().getId();
response.setHeader("SET-COOKIE", "JSESSIONID=" + sessionid+ "; HttpOnly");
		%>
<script type="text/javascript">
	$(document).ready(function() {
    	$("input[name='savebutton']").click(function(){
    		var sPassword = $('#newPassword').val();
        	//alert($('#firstName').val()  + "hello");
      
        	if($('#newPassword').val()=="")
        		{
        			alert("New Password");	
        			return false;
        		}
        	else if(!validatePassowrd(sPassword))
			{
   				alert('Password should be between 8-16 alphanumeric characters & must contain one upper case & special character');
   				//e.preventDefault();
   				return false;
   			}
        	else if ($('#reTypeNewPassword').val()=="")
    		{
    			alert("Re Type New Password");	
    			return false;
    		}
        	 else if($('#newPassword').val()!=$('#reTypeNewPassword').val())
    		{
    			alert("Not Same");	
    			return false;
    		} 
        	
        	else
        		{
        		
        		var newPs = this.form.newPassword.value;
        		var NewPsRet = this.form.reTypeNewPassword.value;
        		//alert(ps);
        		//alert(newPs);
        		var salt = '<%=session.getAttribute("phash").toString()%>';
				
				
				//alert(saltedPs);
				var hashObj1 = new jsSHA("SHA-256","TEXT",{numRounds:parseInt(1,10)});
				hashObj1.update(newPs);
				var saltedNewPs = hashObj1.getHash("B64");
				
				var hashObj4 = new jsSHA("SHA-256","TEXT",{numRounds:parseInt(1,10)});
				hashObj4.update(NewPsRet);
				var saltedNewPsRet = hashObj4.getHash("B64");
				
				
				//alert(saltedNewPs);
				
				document.changePassword.newPassword.value = saltedNewPs;
				document.changePassword.reTypeNewPassword.value = saltedNewPsRet;
				//document.changePassword.method="post";
        		//document.changePassword.action="resetPasswordSubmit";
    			//document.changePassword.submit();
    			//return false;
    			return;
        		}
    	});
		
		
		 	
	});      
	
	/* 
	$(function() {
		("#changePassword").validate({
			$.validator.addMethod("pwcheck",
					function(value, element) {
				return /^[A-Za-z0-9\d=!\-@._*]+$/.test(value);
			}
		});
	}); */
		function validatePassowrd(sPassword){
			var filter = /^(?=.*\d)(?=.*[a-z])(?=.*[A-Z])(?=.*[^a-zA-Z0-9])(?!.*\s).{7,17}$/;
			if (filter.test(sPassword)) {
				return true;
				}
			else {
				return false;
			}
		}
</script>
</body>
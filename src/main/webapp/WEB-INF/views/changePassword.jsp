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
<div>
<div class="two-form-div">
		<div class="container">
			<div class="row">
			<div class="col-12 col-sm-12 col-md-12 col-lg-5 col-xl-5">
					<div class="login-fields">
						<div class="table-responsive">
							<c:if test="${(bugUserRoleCode=='01')}">
							<%@include file="/WEB-INF/views/sideBarManu.jsp"%>
							</c:if>
							<c:if test="${(bugUserRoleCode=='03')}">
							<%@include file="/WEB-INF/views/sideBarManuPl.jsp"%>
							</c:if>
							<c:if test="${(bugUserRoleCode=='04')}">
							<%@include file="/WEB-INF/views/sideBarManuAddmodule.jsp"%>
							</c:if>
							<c:if test="${(bugUserRoleCode=='05')}">
							<%@include file="/WEB-INF/views/sideBarManuTestLeader.jsp"%>
							</c:if>
							<c:if test="${(bugUserRoleCode=='06')}">
							<%@include file="/WEB-INF/views/sideBarManuDeveplor.jsp"%>
							</c:if>
							<c:if test="${(bugUserRoleCode=='07')}">
							<%@include file="/WEB-INF/views/sideBarManuTester.jsp"%>
							</c:if></div>
					</div>
				</div>
				<div class="col-12 col-sm-12 col-md-12 col-lg-7 col-xl-7">
					<div class="login-content" style="border: 1px solid; margin-left: -31px;background-color:#E0FFFF">
					<h1>Change Password</h1>
		
							<s:form theme="simple" 	 name="changePassword" id="changePassword" method="post">
								<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
								<input type="hidden" name="userId" value="${userId}" />
								<div class="user-profile">
								<div class="text-danger">${msg}</div>
									<div class="col-12 col-sm-4 col-md-4 col-lg-4 col-xl-4 p-0">
										<label>Existing Password<span class="required">*</span></label>
										<input type="password"  class="form-control" name="password" id="password" data-ignorepaste=""/>
									</div>
									<div class="col-12 col-sm-4 col-md-4 col-lg-4 col-xl-4 p-0">
										<label>New Password<span class="required">*</span></label>
										<input type="password"  class="form-control" name="newPassword" id="newPassword" maxlength="14" data-ignorepaste=""/>
									</div>
									<div class="col-12 col-sm-4 col-md-4 col-lg-4 col-xl-4 p-0">
										<label>Re-Type New Password<span class="required">*</span></label>
										<input type="password"  class="form-control" name="reTypeNewPassword" id="reTypeNewPassword" maxlength="14" data-ignorepaste=""/>
									</div>
									<div class="col-12 col-sm-4 col-md-4 col-lg-4 col-xl-4 p-0 form-group">
										 <span>Please note that the password should be between 8 and 14 characters and should contain at least one alphabet, one num- ber, one Capital
							letter, one Small letter and a special character (@,#,$,%,_,?,+,-,.)</span>
									</div>
									<div class="col-12 col-sm-12 col-md-12 form-group p-0 text-center">
										<input type="submit" id="savebutton"  name="savebutton" value="Change Password" class="bluebotton float-right" />
									<!-- <input type="submit" id="cancelbutton" name="cancelbutton" value="Cancel" class="bluebotton float-right" /> -->
									</div>
								</div>
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

	
		<%@include file="/WEB-INF/views/footer.jsp" %>
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
		$("input[name='cancelbutton']").click(function(){
			$('#password').val("");
			$('#newPassword').val("");
			$('#reTypeNewPassword').val("");
			return false;
		});
    	$("input[name='savebutton']").click(function(){
    		var sPassword = $('#newPassword').val();
        	//alert($('#firstName').val()  + "hello");
      if($('#password').val()=="")
        		{
        			alert("Existing Password");	
        			return false;
        		}
      else if($('#newPassword').val()=="")
        		{
        			alert("New Password");	
        			return false;
        		}
        	else if(!validatePassowrd(sPassword))
			{
   				alert('Password should be between 8-14 alphanumeric characters & must contain one upper,lower case & a special character');
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
        		var ps = this.form.password.value;
        		var newPs = this.form.newPassword.value;
        		var NewPsRet = this.form.reTypeNewPassword.value;
        		//alert(ps);
        		//alert(newPs);
        		var salt = '<%=session.getAttribute("phash").toString()%>';
				var hashObj = new jsSHA("SHA-256","TEXT",{numRounds:parseInt(1,10)});
				hashObj.update(ps);
				var saltedPs1 = hashObj.getHash("B64");
				
				var hashObjPs = new jsSHA("SHA-256","TEXT",{numRounds:parseInt(1,10)});
				hashObjPs.update(saltedPs1+salt);
				var saltedPs = hashObjPs.getHash("B64");
				
				//alert(saltedPs);
				var hashObj1 = new jsSHA("SHA-256","TEXT",{numRounds:parseInt(1,10)});
				hashObj1.update(newPs);
				var saltedNewPs = hashObj1.getHash("B64");
				
				var hashObj4 = new jsSHA("SHA-256","TEXT",{numRounds:parseInt(1,10)});
				hashObj4.update(NewPsRet);
				var saltedNewPsRet = hashObj4.getHash("B64");
				
				
				//alert(saltedNewPs);
				
				document.changePassword.password.value = saltedPs;
				document.changePassword.newPassword.value = saltedNewPs;
				document.changePassword.reTypeNewPassword.value = saltedNewPsRet;
				
        		document.changePassword.action="changePasswordSubmit";
    			document.changePassword.submit();
    			//return false;
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
<!doctype HTML>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
 <%@ taglib prefix="s" uri="http://www.springframework.org/tags/form"%>
 
 
<html lang="en">
<head>
<link rel="shortcut icon" href="images/favicon.ico" type="image/vnd.microsoft.icon" />
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link href="${pageContext.request.contextPath}/styles/bootstrap.css" rel="stylesheet" type="text/css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/styles/easy-responsive-tabs.css " />
	<link href="${pageContext.request.contextPath}/styles/class.css" rel="stylesheet" type="text/css">
    <link href="${pageContext.request.contextPath}/styles/responsive.css" rel="stylesheet" type="text/css">
    <link href="${pageContext.request.contextPath}/styles/datepicker.css" rel="stylesheet" type="text/css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/styles/fontawesome.css " />
    <script type="application/javascript" src="js/jquery3.3.1.js"></script>
    
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/sha.js"></script>
     <%@include file="/WEB-INF/views/header.jsp" %>
<div class="custom-breadcrumbs">
  <div class="container">
	</div>
</div>
<script type="text/javascript">
	function loginFunction1(form) {
		//alert("hello check")
		
		if ($('#userName').val() == "") {
			alert("Please enter user name ")
			$('#userName').focus();
			return false;
		}
		
		else if ($('#userPassword').val() == "") {
			alert("Please enter your password ")
			$('#userPassword').focus();
			return false;
		
		
        else{
        }
		
		
	}
</script>

</head>
<body>
   
   <div>
	<div class="two-form-div">
		<div class="container">
			<div class="row">
				<div class="col-12 col-sm-12 col-md-12 col-lg-5 col-xl-5">
					<div class="login-fields">
						<div class="table-responsive">
							<%@include file="/WEB-INF/views/sideBarManuTestLeader.jsp"%></div>
					</div>
				</div>
				<div class="col-12 col-sm-12 col-md-12 col-lg-7 col-xl-7">
					<div class="login-content" style="border: 1px solid; margin-left: -31px;background-color:#E0FFFF">
					<s:form class="create-account" action="assignModule" id="register2" name="register2" method="post"  ondrop="return false" accept-charset="UTF-8"  autocomplete="off">
			<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
	<div class="user-profile">
	<div class="mandatory" style="color: red">${msg}</div>
		<div
			class="col-12 col-sm-12 col-md-12 col-lg-12 col-xl-12 user-profile-form border-0" style="margin-left:30%">
			
				<div>
		                         <div class="col-12  col-sm-4 col-md-4 col-lg-4 col-xl-4 margin-10-bottom">
		                                <label style="margin-left:-69px">Module<sup>*</sup></label>
		                                <div class="form-group" style="margin-top: -13%;margin-left: 40%;">
											<select style="width:126px;height:20px;padding:0px;" class="form-control" name="moduleId" id="moduleId">
		          								<option value="0">--Select Here--</option>
				                        		<c:forEach var="item" items="${moduleList}">
				                        		<option value="${item.id}">${item.moduleName}</option>
				                        		</c:forEach>
		        					  		</select>
		                                </div>
		                            </div>  
		                            <div class="col-12  col-sm-4 col-md-4 col-lg-4 col-xl-4 margin-10-bottom">
		                                <label style="margin-left:-69px">Select Tester<sup>*</sup></label>
		                                <div class="form-group" style="margin-top: -13%;margin-left: 40%;">
											<select style="width:126px;height:20px;padding:0px;" class="form-control" name="userId" id="userId">
		          								<option value="0">--Select Here--</option>
				                        		<c:forEach var="item" items="${bugUserList}">
				                        		<option value="${item.id}">${item.firstName}</option>
				                        		</c:forEach>
		        					  		</select>
		                                </div>
		                            </div>
		                             <div class="col-12  col-sm-4 col-md-4 col-lg-4 col-xl-4 margin-10-bottom">
		                                <label style="margin-left:-69px">Select Status<sup>*</sup></label>
		                                <div class="form-group" style="margin-top: -13%;margin-left: 40%;">
											<select style="width:126px;height:20px;padding:0px;" class="form-control" name="status" id="status">
		          								<option value="0">--Select Status--</option>
				                        		<option value="Enable">Enable</option>
				                        		<option value="Disable">Disable</option>
		        					  		</select>
		                                </div>
		                            </div>
		                            <div class="second-tab-btn" style="margin-left:44%;margin-top:-28px;">
			<input type="submit" id="btnSubmited" class="bluebotton"  value="Assign Module" onclick="return loginFunction1(this.form);"/>
		</div>        
				</div>
			</div>
				 
	</div>
</s:form>


					
					</div>
				</div>
			
			</div>
		</div>
	</div>

</div>
   
        

<script type="application/javascript" src="js/jquery3.3.1.js"></script>
<script type="application/javascript" src="js/bootstrap.js"></script>
<script src="js/easyResponsiveTabs.js"></script>

 </body>

</html>
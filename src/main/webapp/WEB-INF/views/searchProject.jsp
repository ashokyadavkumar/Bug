<!doctype HTML>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="s" uri="http://www.springframework.org/tags/form"%>
<%@ page import="java.util.Date" %>
<html lang="en">
<head>
<link rel="shortcut icon" href="images/favicon.ico"
	type="image/vnd.microsoft.icon" />
<meta charset="UTF-8">
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

<%@include file="/WEB-INF/views/header.jsp"%>
<div class="custom-breadcrumbs">
	<div class="container">
		<ol class="breadcrumb">
			<li class="breadcrumb-item active"><a href="#">Home</a></li>
			<div class="col-12 col-sm-12 col-md-12 col-lg-5 col-xl-5 right-part">
				<ul class="btns float-right">
					<li>
						<form action="logout" method="post">
							<input type="hidden" name="${_csrf.parameterName}"
								value="${_csrf.token}" /> <input type="submit" value="Logout"
								class="logout-btn">
						</form>
					</li>
				</ul>
			</div>
		</ol>
	</div>
</div>
<script type="text/javascript">
	function addProject(form) {
		//alert("hello check")
		
		if ($('#userId').val() == "") {
			alert("Please enter Project id ")
			$('#userId').focus();
			return false;
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
								<%@include file="/WEB-INF/views/sideBarManuPl.jsp"%></div>
						</div>
					</div>
					<div class="col-12 col-sm-12 col-md-12 col-lg-7 col-xl-7">
						<div class="login-content">
							<s:form class="create-account" action="searchProject"
								id="register2" name="register2" method="post"
								ondrop="return false" accept-charset="UTF-8" autocomplete="off">
								<input type="hidden" name="${_csrf.parameterName}"
									value="${_csrf.token}" />
								<div class="user-profile">
									<div class="mandatory" style="color: red">${msg}</div>
									<div
										class="col-12 col-sm-12 col-md-12 col-lg-12 col-xl-12 user-profile-form border-0">
										<div class="row">
											<div class="col-12 col-sm-12 col-md-12 col-lg-12 col-xl-12">
												<h2>Search Project</h2>
											</div>
										</div>
										<div class="row">
											<div class="col-12  col-sm-4 col-md-4 col-lg-4 col-xl-4 margin-10-bottom">
												<label>Enter Project Id<sup>*</sup></label>
												<div class="form-group">
													<input type="text" class="form-control" id="userId"
														name="userId" value="${memRegList.projectName}"
														maxlength="20" data-ignorepaste="" autocomplete="off">
												</div>
											</div>
										</div>
									</div>
									<div class="second-tab-btn float-right">
										<input type="submit" id="btnSubmited" class="bluebotton"
											value="Search" onclick="return addProject(this.form);" />
									</div>
								</div>
							</s:form>

							<c:choose>
								<c:when test="${project!=null}">
								<%@include file="/WEB-INF/views/searchUserByEmail.jsp"%>
        
    							</c:when>
								<c:otherwise>
								
								</c:otherwise>
							</c:choose>

						</div>
					</div>

				</div>
			</div>
		</div>

	</div>



	<script type="application/javascript" src="js/jquery3.3.1.js"></script>
	<script type="application/javascript" src="js/bootstrap.js"></script>
	<script src="js/easyResponsiveTabs.js"></script>

	<!-- copy paste not allowed code -->
	<script>  
 function ignoreCutCopyPaste() {

	 $("[data-ignorepaste]").bind("copy paste", function (e) {
	             e.preventDefault(); //prevent the default behaviour 
	             alert("Please enter the value manually.");
	    	 	
	         });
	 	

	 };

	 ignoreCutCopyPaste();

</script>
	<script type="text/javascript">
 
$('body').on('keydown', '#userName', function(e) {
    console.log(this.value);
    if (e.which === 32 &&  e.target.selectionStart === 0) {    
      return false;
    }  
  });

</script>
</body>
</html>
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
		
		if ($('#projectName').val() == "") {
			alert("Please enter Project name ")
			$('#projectName').focus();
			return false;
		}
		
		else if ($('#clientName').val() == "") {
			alert("Please enter Client Name ")
			$('#clientName').focus();
			return false;
		}
		else if ($('#projectStartDate').val() == "") {
			alert("Please enter start date ")
			$('#projectStartDate').focus();
			return false;
		}
		else if ($('#status').val() == "") {
			alert("Please enter status ")
			$('#status').focus();
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
							<s:form class="create-account" action="saveProject"
								id="register2" name="register2" method="post"
								ondrop="return false" accept-charset="UTF-8" autocomplete="off">
								<input type="hidden" name="${_csrf.parameterName}"
									value="${_csrf.token}" />
								<input type="hidden" value="${userId}" name="userId">
								<div class="user-profile">
									<div class="mandatory" style="color: red">${msg}</div>
									<div
										class="col-12 col-sm-12 col-md-12 col-lg-12 col-xl-12 user-profile-form border-0">
										<div class="row">
											<div class="col-12 col-sm-12 col-md-12 col-lg-12 col-xl-12">
												<h2>Add Project</h2>
											</div>
										</div>
										<div class="row">
											<div class="col-12  col-sm-4 col-md-4 col-lg-4 col-xl-4 margin-10-bottom">
												<label>Project Name<sup>*</sup></label>
												<div class="form-group">
													<input type="text" class="form-control" id="projectName"
														name="projectName" value="${memRegList.projectName}"
														maxlength="20" data-ignorepaste="" autocomplete="off">
												</div>
											</div>
										</div>
										<div class="row">
											<div class="col-12  col-sm-4 col-md-4 col-lg-4 col-xl-4 margin-10-bottom">
												<label>Client Name<sup>*</sup></label>
												<div class="form-group">
													<input type="text" class="form-control" id="clientName"
														name="clientName" value="${memRegList.projectName}"
														maxlength="20" data-ignorepaste="" autocomplete="off">
												</div>
											</div>
										</div>
										<div class="row">
											<div class="col-12  col-sm-4 col-md-4 col-lg-4 col-xl-4 margin-10-bottom">
												<label>Project Start Date<sup>*</sup></label>
												<div id="challandatepicker" class="input-group date" data-date-format="dd/mm/yyyy">
									<input class="form-control" type="text" name="fromDate" id="fromDate" placeholder="Pick a Date" readonly="readonly"/>
									 <span class="input-group-addon custom-addon">
									 <i class="far fa-calendar-alt"></i></span>
								</div>
											</div>
										</div>
										<div class="row">
											<div class="col-12  col-sm-4 col-md-4 col-lg-4 col-xl-4 margin-10-bottom">
												<label>Select Status<sup>*</sup></label>
												<div class="form-group">
													<select class="form-control" name="status" id="status">
														<option value="0">--Select Status--</option>
														<option value="Enable">Enable</option>
														<option value="Disable">Disable</option>
													</select>
												</div>
											</div>
										</div>
									</div>
									<div class="second-tab-btn float-right">
										<input type="submit" id="btnSubmited" class="bluebotton"
											value="Add" onclick="return addProject(this.form);" />
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
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="s" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
 <%@include file="/WEB-INF/views/header.jsp" %>
</head>
<script type="text/javascript">
	function loginFunction1(form) {
		//alert("hello check")
		
		if ($('#email').val() == "") {
			alert("Please enter Email Id ")
			$('#email').focus();
			return false;
		}
	}
	</script>
<body>
<div class="custom-breadcrumbs">
  <div class="container">
		<ol class="breadcrumb">
			<!-- <li class="breadcrumb-item active"><a href="#">Home</a></li> -->
			<div class="col-12 col-sm-12 col-md-12 col-lg-5 col-xl-5 right-part">
				<%-- <ul class="btns float-right">
					<li>
						<form action="logout" method="post">
							<input type="hidden" name="${_csrf.parameterName}"
								value="${_csrf.token}" /> <input type="submit" value="Logout"
								class="logout-btn">
						</form>
					</li>
				</ul> --%>
			</div>
		</ol>
	</div>
</div>
	<div>
		<div class="two-form-div">
			<div class="container">
				<div class="row">
					<div class="col-12 col-sm-12 col-md-12 col-lg-5 col-xl-5">
						<div class="login-fields">
							<div class="table-responsive">
								<%@include file="/WEB-INF/views/showAllBugsideBarManu.jsp"%></div>
						</div>
					</div>
					<div class="col-12 col-sm-12 col-md-12 col-lg-7 col-xl-7" style="border: 1px solid;background-color: #FF9999;margin-left: -16px;">
						<div class="login-content">
							<s:form class="create-account" action="searchByEmail" id="search"
								name="search" method="post" ondrop="return false"
								accept-charset="UTF-8" autocomplete="off">
								<input type="hidden" name="${_csrf.parameterName}"
									value="${_csrf.token}" />
									<div class="mandatory" style="color: red">${msg}</div>


							</s:form>


						</div>
						<div style="margin-top:8%">
							<span style="margin-left:33%;color:#B5519A;font-weight:bold;font-size:26px">View BUG By ID</span>
								<table style="margin-top:7%;font-size:15px">
									<tr>
											<th style="color:white">Bug Id</th>
											<th style="color:white">BUG Name</th>
											<th style="color:white">Descriptor</th>
											<th style="color:white">Steps to Repro</th>
											<th style="color:white">severity</th>
											<th style="color:white">Status</th>
											<th style="color:white">Author</th>
											<th style="color:white">Date</th>
									</tr>
								</table>
					 </div>
					</div>
					

				</div>
				
			</div>
		</div>

	</div>

	<%@include file="/WEB-INF/views/footer.jsp" %>

</body>
</html>
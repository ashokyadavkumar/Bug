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
		
		if ($('#id').val() == "") {
			alert("Please enter  Id ")
			$('#id').focus();
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
								<%@include file="/WEB-INF/views/sideBarManu2.jsp"%></div>
						</div>
					</div>
					<div class="col-12 col-sm-12 col-md-12 col-lg-7 col-xl-7" style="border: 1px solid;background-color: #FF9999;margin-left: -16px;"> 
					<div id="data" style="margin-top:24%"> 
									<h5 style="text-align:center;font-size:35px">
										Welcome Srinivas<label class="text-success">${bugUser.firstName}</label>
									</h5>
									<h5 style="text-align:center;font-size:35px">
										Your role is Developer<label class="text-success">${bugUserRoleName}</label>
									</h5>
	</div>
											</div>

				</div>
			</div>
		</div>

	</div>

	<%@include file="/WEB-INF/views/footer.jsp" %>
</body>
</html>
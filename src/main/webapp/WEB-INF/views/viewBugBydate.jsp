<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="s" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
<head>

<meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>jQuery UI Datepicker - Default functionality</title>
  <link rel="stylesheet" href="//code.jquery.com/ui/1.13.2/themes/base/jquery-ui.css">
  <link rel="stylesheet" href="/resources/demos/style.css">
  <script src="https://code.jquery.com/jquery-3.6.0.js"></script>
  <script src="https://code.jquery.com/ui/1.13.2/jquery-ui.js"></script>
  <script>
  $( function() {
    $( "#datepicker" ).datepicker();
  } );
  </script>
</head>

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
								<%@include file="/WEB-INF/views/showAllBugsideBarManu.jsp"%></div>
						</div>
					</div>
					<div class="col-12 col-sm-12 col-md-12 col-lg-7 col-xl-7" style="border: 1px solid;background-color: #FFC0CB;margin-left: -16px;">
						<div class="login-content">
							<s:form class="create-account" action="searchById" id="search"
								name="search" method="post" ondrop="return false"
								accept-charset="UTF-8" autocomplete="off">
								<input type="hidden" name="${_csrf.parameterName}"
									value="${_csrf.token}" />
								<div class="row">
									<div class="col-12 col-sm-12 col-md-12 col-lg-12 col-xl-12" style="margin-top: 13%;margin-left: 29%;">
										<span style="font-size: 30px;font-weight: bold;color:#96358C">View BUG By Date</span>
									</div>
									<div
										class="col-12  col-sm-4 col-md-4 col-lg-4 col-xl-4 margin-10-bottom">
										<label style="margin-left: 49%;margin-top: 23%;"> BUG Date<sup>*</sup></label>
										<div class="form-group">
										<input style="margin-left:100%;margin-top:-13%"type="text" id="datepicker" class="form-control">
											<%-- <input style="margin-left: 108%; margin-top: -13%;"type="text" class="form-control" id="refUserRoleId" name="refUserRoleId"
								value="${bugUser.refUserRoleId.roleCode}" data-ignorepaste=""
								autocomplete="off" maxlength="256"> --%>
										</div>
									</div>
								</div>

								<div class="second-tab-btn float-right">
									<input style="margin-left: -144%;"type="submit" id="btnSubmited" class="bluebotton"
										value="View" onclick="return loginFunction1(this.form);" />
								</div>
							</s:form>

							<c:choose>
								<c:when test="${bugUser!=null}">
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

	<%@include file="/WEB-INF/views/footer.jsp" %>
</body>
</html>
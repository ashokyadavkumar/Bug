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
		
		if ($('#severity').val() == "") {
			alert("Please enter  severity ")
			$('#severity').focus();
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
								<c:if test="${(bugUserRoleCode=='06')}">
							<%@include file="/WEB-INF/views/sideBarManuDeveplor.jsp"%>
							</c:if>
							<c:if test="${(bugUserRoleCode=='07')}">
							<%@include file="/WEB-INF/views/sideBarManuTester.jsp"%>
							</c:if></div>
						</div>
					</div>
					<label class="text-success">${msg}</label>
					<div class="col-12 col-sm-12 col-md-12 col-lg-7 col-xl-7" style="border: 1px solid;background-color: #FFC0CB;margin-left: -16px;">
						<div class="login-content">
							<s:form class="create-account" action="bugById" id="search"
								name="bugByseverity" method="post" ondrop="return false"
								accept-charset="UTF-8" autocomplete="off">
								<input type="hidden" name="${_csrf.parameterName}"
									value="${_csrf.token}" />
								<div class="row">
									<div class="col-12 col-sm-12 col-md-12 col-lg-12 col-xl-12" style="margin-top: 23%;text-align:center">
										<span style="font-size: 30px;font-weight: bold;color:#96358C">View BUG By severity</span>
									</div>
									<div
					class="col-12  col-sm-4 col-md-4 col-lg-4 col-xl-4 margin-10-bottom">
					<label style="margin-left:-69px">Severity<sup>*</sup></label>
					<div class="form-group" style="margin-top: -13%;margin-left: 40%;">
					<select  class="form-control" name="severity" id="severity">
		          								<option value="0">--Select Here--</option>
				                        		<option value="Low">Low</option>
				                        		<option value="Hiegh">Hiegh</option>
		        					  		</select>						
					</div>
				</div>
								</div>

								<div class="second-tab-btn float-right">
									<input style="margin-left: -144%;"type="submit" id="btnSubmited" class="bluebotton"
										value="search" onclick="return loginFunction1(this.form);" />
								</div>
							</s:form>

						</div>
					</div>

				</div>
			</div>
		</div>

	</div>

	<%@include file="/WEB-INF/views/footer.jsp" %>
</body>
</html>
<%@ page language="java" contentType="text/html; 
charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="s" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<%@include file="/WEB-INF/views/header.jsp"%>
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
								<%@include file="/WEB-INF/views/sideBarManuAddmodule.jsp"%></div>
						</div>
					</div>
					<div class="col-12 col-sm-12 col-md-12 col-lg-7 col-xl-7"
						style="border: 1px solid; background-color: #E0FFFF; margin-left: -16px;">
						<div class="login-content">
							<s:form class="create-account" action="searchBugByModulePost"
								id="register2" name="register2" method="post"
								ondrop="return false" accept-charset="UTF-8" autocomplete="off">
								<input type="hidden" name="${_csrf.parameterName}"
									value="${_csrf.token}" />
								<div class="mandatory" style="color: red">${msg}</div>
								<div class="row">
									<div class="col-12 col-sm-12 col-md-12 col-lg-12 col-xl-12"
										style="margin-top: 7%; margin-left: 17%;">
										<span
											style="font-size: 30px; font-weight: bold; color: #96358C">Search
											Bug By Module ID</span>
									</div>
									<div
										class="col-12  col-sm-4 col-md-4 col-lg-4 col-xl-4 margin-10-bottom">
										<label style="margin-left: 49%; margin-top: 7%;">Enter
											Module Id<sup>*</sup>
										</label>
										<div class="form-group">
											<input type="text" class="form-control" id="userId"
														name="userId" value="${memRegList.projectName}"
														maxlength="20" data-ignorepaste="" autocomplete="off">
										</div>
									</div>
								</div>

								<div class="second-tab-btn float-right">
									<input style="margin-left: -144%;" type="submit"
										id="btnSubmited" class="bluebotton" value="search"
										onclick="return loginFunction1(this.form);" />
								</div>

							</s:form>

							<c:choose>
								<c:when test="${moduleList.size() >= 1}">
									<div style="margin-top: 8%">
										<span style="margin-left: 42%">VIEW BUG</span>
										<table style="margin-top: 2%">
											<tr>
												<th>Module Id</th>
												<th>BUG Id</th>
												<th>BUG Name</th>
												<th>Descriptor</th>
												<th>Steps to Repro</th>
												<th>severity</th>
												<th>Posted By</th>
												<th>Posted On</th>
												<th>Status</th>
											</tr>
											<c:forEach items="${moduleList}" var="user" varStatus="status"> 
									<tr>
									<td>${status.count}</td>
										<td>${user.projectId.id}</td>
										<td>${user.id}</td>
										<td>${user.status}</td>
										
									</tr>
								</c:forEach>
										</table>
									</div>
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

	<%@include file="/WEB-INF/views/footer.jsp"%>

</body>
</html>
<%@ taglib prefix="s" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<%@include file="/WEB-INF/views/header.jsp"%>
</head>
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
								<%@include file="/WEB-INF/views/sideBarManuTestLeader.jsp"%></div>
						</div>
					</div>
					<div class="col-12 col-sm-12 col-md-12 col-lg-7 col-xl-7"
						style="border: 1px solid; background-color: #E0FFFF; margin-left: -16px;">
						<div class="login-content">
									<div style="margin-top: 8%">
										<span style="margin-left: 42%">VIEW MODULE</span>
										<table class="table tablalign table-bordered" id="example2" class="display" style="width:100%">
											<tr>
												<th>Sr.</th>
												<th>Module Id</th>
												<th>Module Name</th>
												<th>ProjectName</th>
												<th>Status</th>
											</tr>
											<c:forEach items="${moduleList}" var="user" varStatus="status"> 
									<tr>
									<td>${status.count}</td>
										<td>${user.id}</td>
										<td>${user.moduleName}</td>
										<td>${user.projectId.projectName}</td>
										<td>${user.status}</td>
										
									</tr>
								</c:forEach>
										</table>
									</div>


						</div>

					</div>


				</div>

			</div>
		</div>

	</div>

	<%@include file="/WEB-INF/views/footer.jsp"%>

</body>
</html>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
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

	<div>
		<div class="two-form-div">
			<div class="container">
				<div class="row">
					<div class="col-12 col-sm-12 col-md-12 col-lg-5 col-xl-5">
						<div class="login-fields">
							<div class="table-responsive">
								<%@include file="/WEB-INF/views/sideBarManu.jsp"%></div>
						</div>
					</div>
					<div class="col-12 col-sm-12 col-md-12 col-lg-7 col-xl-7">
						<div class="login-content">
							<s:form class="create-account" action="searchByDesignation" id="search"
								name="search" method="post" ondrop="return false"
								accept-charset="UTF-8" autocomplete="off">
								<input type="hidden" name="${_csrf.parameterName}"
									value="${_csrf.token}" />
								<div class="mandatory" style="color: red">${msg}</div>
								<div class="row">
									<div class="col-12 col-sm-12 col-md-12 col-lg-12 col-xl-12">
										<h2>Find User by Designation</h2>
									</div>
									<div
										class="col-12  col-sm-4 col-md-4 col-lg-4 col-xl-4 margin-10-bottom">
										<label>Select the Designation of User<sup>*</sup></label>
										<div class="form-group">
											<select  class="form-control" name="refUserRoleId" id="refUserRoleId">
		          								<option value="0">--Select Here--</option>
		          								<option value="100">All</option>
				                        		<c:forEach var="item" items="${userRoleList}">
				                        		<option value="${item.id}">${item.roleName}</option>
				                        		
				                        		</c:forEach>
		        					  		</select>
		                                </div>
									</div>
								</div>

								<div class="second-tab-btn float-right">
									<input type="submit" id="btnSubmited" class="bluebotton"
										value="search" onclick="return loginFunction1(this.form);" />
								</div>
							</s:form>

 					<c:if test="${fn:length(bugUser) gt 0}">
					 <div class="col-12 col-sm-12 col-md-12 col-lg-12 col-xl-12 p-0">
        				
        				  <div class="table-responsive tabledesign">
               				 <table class="table table-bordered" id="mytable1">
		                      <thead>
		                        <tr>
		                          <th scope="col">S.No. </th>
		                          <th scope="col">User Id </th>
		                          <th scope="col">User Name </th>
		                          <th scope="col">First Name</th>
		                          <th scope="col">Last Name</th>
		                          <th scope="col">Email</th>
		                          <th scope="col">Phone</th>
		                          <th scope="col">Designation</th>
		                          <th scope="col">Status</th>
			                      </tr>
			                      </thead>
			                      <tbody>
			                      <c:forEach items="${bugUser}" var="user" varStatus="status"> 
									<tr>
									<td>${status.count}</td>
										<td>${user.refUserRoleId.roleCode}</td>
										<td>${user.userName}</td>
										<td>${user.firstName}</td>
										<td>${user.lastName}</td>
										<td>${user.email}</td>
										<td>${user.mobile}</td>
										<td>${user.refUserRoleId.roleName}</td>
										<td>${user.status}</td>
										
									</tr>
								</c:forEach>
			                      </tbody>
			                      </table>
			                      </div>
        				 
        				
                  	  </div>
                  	  </c:if>
						</div>
					</div>

				</div>
			</div>
		</div>

	</div>

	<%@include file="/WEB-INF/views/footer.jsp"%>

</body>
</html>

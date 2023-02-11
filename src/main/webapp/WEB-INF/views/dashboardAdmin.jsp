 <%@include file="/WEB-INF/views/header.jsp" %>
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
						<c:if test="${(bugUserRoleCode=='01')}">
							<%@include file="/WEB-INF/views/sideBarManu.jsp"%>
							</c:if>
							<c:if test="${(bugUserRoleCode=='03')}">
							<%@include file="/WEB-INF/views/sideBarManuPl.jsp"%>
							</c:if>
							</div>
					</div>
				</div>
				<div class="col-12 col-sm-12 col-md-12 col-lg-7 col-xl-7">
					<div class="login-content">
					<c:choose>
						<c:when test="${msg!=null}">
						<%@include file="/WEB-INF/views/wlecome2.jsp" %>
						</c:when>
						<c:otherwise>
						<div id="welcome">
					<%@include file="/WEB-INF/views/wlecome.jsp" %>
					</div>
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
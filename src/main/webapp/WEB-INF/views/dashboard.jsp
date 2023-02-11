 <%@include file="/WEB-INF/views/header.jsp" %>
<div class="custom-breadcrumbs">
  <div class="container">
    <ol class="breadcrumb">
      <li class="breadcrumb-item active"><a href="#">Home</a></li>
      <!-- <li class="breadcrumb-item active"><a href="/lms">Login</a></li> -->
    </ol>
  </div>
</div>
<div class="two-form-div">
        <div class="container"> 
            <div class="row">
                <div class="col-12 col-sm-12 col-md-12 col-lg-12 col-xl-12">
                    
                    <div class="inner-boxes">
                         <div class="row">   
                            
							<c:if test="${(lmUserRoleCode=='02') || (lmUserRoleCode=='01') || (lmUserRoleCode=='04')}">
	                            <div class="equal-width">
	                                <a href="registrationDashboard">
	                                    <div class="part-first equal-inner-div">
	                                    <label><i class="flaticon-signature icondashboard "></i></label>
	                                    <h2>New Registration</h2>
	                                    </div>
	                                </a>
	                            </div>
							</c:if>
							<c:if test="${(lmUserRoleCode=='03') || (lmUserRoleCode=='01') || (lmUserRoleCode=='04')}">
	                            <div class="equal-width ">
	                                <a href="amendmentDashboard">
	                                    <div class="part-second equal-inner-div">
	                                    <label><i class="flaticon-curriculum-vitae"></i></label>
	                                    <h2>Applications for Amendment<br/><br/></h2>
	                                    </div>
	                                </a>
	                            </div>
							</c:if>
                            <c:if test="${(lmUserRoleCode=='04')}">
	                            <div class="equal-width ">
	                                    <div class="part-second equal-inner-div">
	                                    <label><i class="flaticon-curriculum-vitae"></i></label>
	                                    <h2>Update Your IEM<br/><br/></h2>
	                                    </div>
	                                </a>
	                            </div>
							</c:if>
                        </div>
                     </div>
            	</div>
            </div>
		</div>
            
    </div>
	<%@include file="/WEB-INF/views/footer.jsp" %>
   </body>
   </html>
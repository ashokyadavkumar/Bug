<!doctype HTML>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="s" uri="http://www.springframework.org/tags/form"%>
<html lang="en">
<head>
<link rel="shortcut icon" href="images/favicon.ico" type="image/vnd.microsoft.icon" />
<meta charset="UTF-8">
<title>G2B Portal</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<META HTTP-EQUIV="CACHE-CONTROL" CONTENT="NO-CACHE">
<link href="${pageContext.request.contextPath}/styles/bootstrap.css" rel="stylesheet" type="text/css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/styles/easy-responsive-tabs.css " />
<link href="${pageContext.request.contextPath}/styles/class.css" rel="stylesheet" type="text/css">
<link href="${pageContext.request.contextPath}/styles/responsive.css" rel="stylesheet" type="text/css">
<link href="${pageContext.request.contextPath}/styles/font-awesome-new.css" rel="stylesheet" type="text/css">
<script type="text/javascript" src="${pageContext.request.contextPath}/js/sha.js"></script>

<%
	String SALTCHARS = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ1234567890";
	StringBuffer salt = new StringBuffer();
	java.util.Random rnd = new java.util.Random();
	while (salt.length() < 16) {
		int index = (int) (rnd.nextFloat() * SALTCHARS.length());
		salt.append(SALTCHARS.substring(index, index + 1));
	}
	String saltStr = salt.toString();
	session.setAttribute("phash", saltStr);
	String sessionid = request.getSession().getId();
	response.setHeader("SET-COOKIE", "JSESSIONID=" + sessionid+ "; HttpOnly");
%>
<!-----------------------encrypting of first Div Login password ------------->
<script type="text/javascript">
	function loginFunction1(form) {
		//alert("hello check")
		if ($('#userName').val() == "") {
			alert("Please enter user name.")
			$('#userName').focus();
			return false;
		}
		
		else if ($('#userPassword').val() == "") {
			alert("Please enter password.")
			$('#userPassword').focus();
			return false;
		}
		
		else if ($('#captchaResponse').val() == "") {
			alert("Please enter captcha.")
			$('#captchaResponse').focus();
			return false;
		}
	      
		else{
		var ps = form.userPassword.value;
		var saltStr='<%=session.getAttribute("phash").toString()%>';
		var hashObj = new jsSHA("SHA-256","TEXT",{numRounds:parseInt(1,10)});
		var encpsPlain = hashObj.update(ps);
		var encps = hashObj.getHash("B64");
		
		var hashObj1 = new jsSHA("SHA-256","TEXT",{numRounds:parseInt(1,10)});
		//alert(encps+saltStr+"abc")
		var passEncPlain = hashObj1.update(encps+saltStr);
		var passEnc = hashObj1.getHash("B64");
		//alert(passEnc+";=======")
		$("#userPassword").val(passEnc);
		document.loginup.userPassword.value = passEnc;
		$("#home").submit();
		return;
	}
}	
	
</script>

</head>
<body>
<%@include file="/WEB-INF/views/header.jsp" %>
	<noscript>
		<meta http-equiv="refresh" content="1; url=jsError"/>
	</noscript>
	
<div class="clearfix"></div>
<div class="container">

<div class="clearfix"></div>
<div class="two-form-div" style="background:#FFFFE0;border-top: 10px solid #00FF7F;border-bottom: 10px solid #00FF7F;border-left: 10px solid #00FF7F;border-right: 10px solid #00FF7F;">

<div class="container" style="margin-left:28%"> 
        
  <s:form class="create-account" action="${pageContext.request.contextPath}/j_spring_security_check" id="home" method="post"  ondrop="return false" accept-charset="UTF-8"  autocomplete="off" name="loginup">
           <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" /> 
        <div class="login-page col-12 col-sm-12 col-md-12 col-lg-12 col-xl-12">
			<div class="row">
			
				<div class="col-12 col-sm-12 col-md-12 col-lg-5 col-xl-5">
					<div class="login-fields">
						<h2>Login</h2>
						<div class="col-12 col-sm-12 col-md-12 col-lg-12 col-xl-12 fields-set">
							<label>User Name <sup>*</sup></label>
							<div class="form-group">
								<input type="text" class="form-control" name="userName" id="userName" maxlength="20" data-ignorepaste="">								
							</div>
						</div>
						
						<div class="col-12 col-sm-12 col-md-12 col-lg-12 col-xl-12 fields-set">
							<label>Password <sup>*</sup></label>
							<div class="form-group">
								<input type="password" class="form-control" name="userPassword" id="userPassword" maxlength="14" data-ignorepaste="">							
							</div>
							<!-- <marquee class="text-danger" scrolldelay="100">Due to under maintenance, site will be down from 12:00pm to 3:00pm on 22-March-2021.  </marquee> -->
						</div>
						<div class="form-group col-sm-12 nopadding">
										<div>
										<c:choose>
										<c:when test="${not empty SPRING_SECURITY_LAST_EXCEPTION.message}">
											<div class="text-danger">${SPRING_SECURITY_LAST_EXCEPTION.message}
											</div>
										</c:when>
										<c:otherwise>
										<%-- <c:when test="${not empty msg}">${msg}</c:when> --%>
										<div class="text-danger">${msg }</div>
											<%-- <div class="msg">${SPRING_SECURITY_LAST_EXCEPTION.message}
											</div> --%>
										</c:otherwise>
										</c:choose>
										</div>
										
							            <div class="col-sm-12 pl-0 mt-2 captcha-wrap">
							            	
							            	<div class="inarea" id="captchDiv">
							            	<!-- <img src="images/test.png" height="30" width="90" class="captchaimg" id="captchaImage"/><i class="fas fa-sync-alt" onclick="refreshCaptcha()" title="Refresh Captcha"></i> -->
							            	<input type="hidden" name="captchaResponse" id="captchaResponse" 
							            	value="ASXC" />
												<div class="col-sm-2 col-md-2 col-lg-2 col-xl-3 fields-set float-left">
							<input type="submit" value="submit" class="login-submit" onclick="return loginFunction1(this.form);"/>
							
						</div>	
						<!-- <a href="forgetPassword" class="forgot-pass float-left">Forgot Password ?</a> -->
						</div>
										
										</div>
								
									</div>
										
						
					</div>
				</div>
		   </div>
        </div>

    	</s:form>    
        
</div>
</div>
<div class="clearfix"></div>

<script type="application/javascript" src="js/jquery3.3.1.js"></script> 
<script type="application/javascript" src="js/bootstrap.js"></script> 
<script src="js/easyResponsiveTabs.js"></script> 
<script type="text/javascript">
    $(document).ready(function() {
        //Horizontal Tab
        $('#parentHorizontalTab').easyResponsiveTabs({
            type: 'default', //Types: default, vertical, accordion
            width: 'auto', //auto or any width like 600px
            fit: true, // 100% fit in a container
            tabidentify: 'hor_1', // The tab groups identifier
            activate: function(event) { // Callback function if tab is switched
                var $tab = $(this);
                var $info = $('#nested-tabInfo');
                var $name = $('span', $info);
                $name.text($tab.text());
                $info.show();
            }
        });
       
    });
    function refreshCaptcha(){
    	var div=$('#captchDiv').html();
    	$.ajax({
			  url:'refreshCaptcha',
			  success:function(refDistrictList){
				 $("#captchaImage").attr('src','images/test.png?_=' + Math.random());
			  },
			  error: function(a,b,c,d) {
		        	 /* alert("aaaa"+JSON.stringify(a));
		        	alert("bbbbb"+JSON.stringify(b));
		        	alert("ccccc"+JSON.stringify(c));
		        	alert("gggg"+JSON.stringify(d)); */ 
		       	 alert("Invalid State");
		       }
		   });
        }
        
    </script> 
<script>
	$(document).ready(function() {
		$('#myCarousel').carousel({
			interval:3000
		})
	});
	
</script>

<script type="text/javascript">
$("#userName").bind("keypress", function(event) { 
    var charCode = event.which;

    if(charCode == 8 || charCode == 0)
    {
    	
         return;
    }
    else
    {
    	
        var keyChar = String.fromCharCode(charCode); 
        return /[a-zA-Z0-9]/.test(keyChar); 
       
    }
});
</script>
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


</div>

</body>
<div class="clearfix"></div>
	<%@include file="/WEB-INF/views/footer.jsp" %>
</html>

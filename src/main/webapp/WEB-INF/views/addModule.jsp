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
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link href="${pageContext.request.contextPath}/styles/bootstrap.css" rel="stylesheet" type="text/css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/styles/easy-responsive-tabs.css " />
	<link href="${pageContext.request.contextPath}/styles/class.css" rel="stylesheet" type="text/css">
    <link href="${pageContext.request.contextPath}/styles/responsive.css" rel="stylesheet" type="text/css">
    <link href="${pageContext.request.contextPath}/styles/datepicker.css" rel="stylesheet" type="text/css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/styles/fontawesome.css " />
    <script type="application/javascript" src="js/jquery3.3.1.js"></script>
    
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/sha.js"></script>
     <%@include file="/WEB-INF/views/header.jsp" %>
<div class="custom-breadcrumbs">
  <div class="container">
		<%-- <ol class="breadcrumb">
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
		</ol> --%>
	</div>
</div>
<!-----------------------encrypting of first Div Login password ------------->
<script type="text/javascript">
	function loginFunction1(form) {
		//alert("hello check")
		var validatePassowrd = /^(?=.*\d)(?=.*[a-z])(?=.*[A-Z])(?=.*[^a-zA-Z0-9])(?!.*\s).{7,17}$/;
		
		if ($('#userName').val() == "") {
			alert("Please enter user name ")
			$('#userName').focus();
			return false;
		}
		
		else if ($('#userPassword').val() == "") {
			alert("Please enter your password ")
			$('#userPassword').focus();
			return false;
		}
				
		else if(!validatePassowrd.test($('#userPassword').val())){
			alert('Password should be between 8-14 alphanumeric characters & must contain atleast one upper,lower case & a special character');
			$('#userPassword').focus();
			return false;
		}
		
        else if ($('#userPasswrod1').val() == "") {
    		alert("Please re-enter user password ")
    		$('#userPasswrod1').focus();
    		return false;
    	}
		
        else if ($("#userPassword").val() != $("#userPasswrod1").val()) {
	         alert("Passwords do not match.");
	         return false;
	     }
		
		if ($('#refSecurityQuestionId').val() == 0) {
			alert("Please select any question.");
			$('#refSecurityQuestionId').focus();
			return false;
		}
                
        else if ($('#securityAnswer').val() == "") {
			alert("Please enter security answer ")
			$('#securityAnswer').focus();
			return false;
		}
		
        else{
        	
        	var ps = form.userPassword.value;
    		var hashObj = new jsSHA("SHA-256","TEXT",{numRounds:parseInt(1,10)});
    		var encpsPlain = hashObj.update(ps);
    		var encps = hashObj.getHash("B64");	
    		$("#userPassword").val(encps);
    		$("#userPasswrod1").val(encps);
    		return;
        }
		
		
	}
</script>

</head>
<body>
   
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
				<div class="col-12 col-sm-12 col-md-12 col-lg-7 col-xl-7">
					<div class="login-content" style="border: 1px solid; margin-left: -31px;background-color:white;height:100%">
					<s:form class="create-account" action="saveMemberCredentialDetails" id="register2" name="register2" method="post"  ondrop="return false" accept-charset="UTF-8"  autocomplete="off">
			<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
			<input type="hidden" value="${userId}" name="userId">
	<div class="user-profile" style="padding-top:10%">
	<div class="mandatory" style="color: red">${msg}</div>
		<div
			class="col-12 col-sm-12 col-md-12 col-lg-12 col-xl-12 user-profile-form border-0" style="margin-left:30%">
			<div>
		                        	<div>
		                            	<span style="margin-left:6%;font-weight: bold">Add Module</span>
		                            </div>
		                            <div class="col-12  col-sm-4 col-md-4 col-lg-4 col-xl-4 margin-10-bottom" style="margin-top:14px">
		                                <label style="margin-left:-69px">Module Name<sup>*</sup></label>
		                                <div class="form-group" style="margin-top: -13%;margin-left: 40%;">
		                                    <input style="height:20px;;width:115%; type="text" class="form-control"  id="firstName" name="firstName" value="${memRegList.firstName}" maxlength="50" data-ignorepaste="" autocomplete="off">
		                                </div>
		                            </div>
		                            <div class="col-12  col-sm-4 col-md-4 col-lg-4 col-xl-4 margin-10-bottom">
		                                <label style="margin-left:-69px">Project Name</label>
		                                <div class="form-group" style="margin-top: -13%;margin-left: 40%;">
		                                    <input style="height:20px;width:115%; type="text" class="form-control"  id="lastName" name="lastName" onkeypress="return onlyAlphabets(event,this);" onkeyup="nospaces(this);" value="${memRegList.lastName}" maxlength="50" data-ignorepaste="" autocomplete="off">
		                                </div>
		                            </div>
		               <div class="col-12  col-sm-4 col-md-4 col-lg-4 col-xl-4 margin-10-bottom">
		                                <label style="margin-left:-69px">Status<sup>*</sup></label>
		                                <div class="form-group" style="margin-top: -13%;margin-left: 40%;">
											<select style="width:126px;height:20px;padding:0px;" class="form-control" name="refUserRoleId" id="refUserRoleId">
		          								<option value="0">--Select Here--</option>
				                        		<c:forEach var="item" items="${userRoleList}">
				                        		<option value="${item.id}">${item.roleName}</option>
				                        		</c:forEach>
		        					  		</select>
		                                </div>
		                            </div>
								</div>
			
				
			</div>
				 <span style="visibility: hidden;
				 ">Please note that the password should be between 8 and 14 characters and should contain at least one alphabet,one number,one Capital
							letter,one Small letter and a special character(@,#,$,%,_,?,+,-,.)</span>
			<div class="second-tab-btn float-right" style="margin-top:-40px;width:52%">
			<input type="submit" id="btnSubmited" class="bluebotton"  value="Add" onclick="return loginFunction1(this.form);"/>
		</div>
	</div>
</s:form>


					
					</div>
				</div>
			
			</div>
		</div>
	</div>

</div>
   
        

<script type="application/javascript" src="js/jquery3.3.1.js"></script>
<script type="application/javascript" src="js/bootstrap.js"></script>
<script src="js/easyResponsiveTabs.js"></script>

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

<!-- Started code by kapil makhan -->
<script type="text/javascript">

var check = function() {
	  if (document.getElementById('userPassword').value ==
	    document.getElementById('userPasswrod1').value) {
	    document.getElementById('message').style.color = 'green';
	    document.getElementById('message').innerHTML = 'matching';
	  } else {
	    document.getElementById('message').style.color = 'red';
	    document.getElementById('message').innerHTML = 'not matching';
	  }
	}


/* starting space not allowed starting */
 
$('body').on('keydown', '#userName', function(e) {
    console.log(this.value);
    if (e.which === 32 &&  e.target.selectionStart === 0) {    
      return false;
    }  
  });
  
$('body').on('keydown', '#userPassword', function(e) {
    console.log(this.value);
    if (e.which === 32 &&  e.target.selectionStart === 0) {    
      return false;
    }  
  });
  
$('body').on('keydown', '#userPasswrod1', function(e) {
    console.log(this.value);
    if (e.which === 32 &&  e.target.selectionStart === 0) {    
      return false;
    }  
  });
  
$('body').on('keydown', '#securityAnswer', function(e) {
    console.log(this.value);
    if (e.which === 32 &&  e.target.selectionStart === 0) {    
      return false;
    }  
  });

</script>
<script type="text/javascript">
function PrevFormDataOnChange() {
        document.register2.action="previousRegister1";
		document.register2.method="post";
		document.register2.submit();
   };
   </script>
   
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
	
   </body>
   </html>

<%-- <%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<style>
table,th,td{
	border:1px solid black;
}
</style>
<body>
<form action="">
<h1>Bug Tracking System</h1><br>
<h2>Post Track</h2>
Module Id: <input type="text" id="userid" value= 1 ><br>
Bug Name: <textArea id ="bud name" name="bud name" rows="4" cols="25"> </textArea> <br>
Description: <textArea id ="bud name" name="bud name" rows="4" cols="25"> </textArea> <br>
Steps to Produce:<textArea id ="bud name" name="bud name" rows="4" cols="25"> </textArea> <br>
<lable for="Severity">Severity</lable>
	<select id ="Severity" name="Severity">
	<option>Low</option>
	<option>High</option>
	<option>Midium</option>
	</select><br>
<lable for="Status">Status</lable>
	<select id ="Status" name="Status">
	<option>New</option>
	<option>Done</option>
	<option>Progress</option>
	</select><br>
Author: <input type="text" id="userid" value= dinesh415 ><br>
Date:<input type ="date" id = "datd" id ="date"></br>
<input type="submit" value = "post Bug">
</form>

</body> --%>
</html>
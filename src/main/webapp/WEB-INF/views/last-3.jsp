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
	</div>
</div>
<script type="text/javascript">
	function loginFunction1(form) {
		//alert("hello check")
		
		if ($('#moduleId').val() == "") {
			alert("Please enter module Id ")
			$('#moduleId').focus();
			return false;
		}
		
		
        else if ($('#issueName').val() == "") {
    		alert("Please enter Bug Name ")
    		$('#issueName').focus();
    		return false;
    	}
		
        else if ($("#description").val() == "") {
	         alert("Please enter description.");
	         $('#description').focus();
	         return false;
	     }
		
		if ($('#stepstoreProduce').val() == 0) {
			alert("Please enter stepstoreProduce.");
			$('#stepstoreProduce').focus();
			return false;
		}
                
        else if ($('#severity').val() == "") {
			alert("Please select severity. ")
			$('#severity').focus();
			return false;
		}
        else if ($('#status').val() == "") {
			alert("Please select status. ")
			$('#status').focus();
			return false;
		}
		
        else{
        	
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
							<%@include file="/WEB-INF/views/sideBarManuTester.jsp"%></div>
					</div>
				</div>
				<div class="col-12 col-sm-12 col-md-12 col-lg-7 col-xl-7">
					<div class="login-content" style="border: 1px solid; margin-left: -31px;background-color:#FFC0CB">
					<s:form class="create-account" action="saveBug" id="register2" name="register2" method="post"  ondrop="return false" accept-charset="UTF-8"  autocomplete="off">
			<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
			<input type="hidden" value="${userId}" name="userId">
	<div class="user-profile">
	<div class="mandatory" style="color: red">${msg}</div>
		<div
			class="col-12 col-sm-12 col-md-12 col-lg-12 col-xl-12 user-profile-form border-0" style="margin-left:30%">
			<div>
		                        	<div>
		                            	<span style="margin-left:6%;font-weight: bold">Bug Post</span>
		                            </div>
		                            <div class="col-12  col-sm-4 col-md-4 col-lg-4 col-xl-4 margin-10-bottom" style="margin-top:14px">
		                                <label style="margin-left:-69px">Module Id<sup>*</sup></label>
		                                <div class="form-group" style="margin-top: -13%;margin-left: 40%;">
		                                    <input type="hidden" class="form-control"  id="moduleId" name="moduleId" value="${issueBean.moduleId}" maxlength="50" data-ignorepaste="" autocomplete="off">
		                                	<label>${issueBean.moduleId}</label>
		                                </div>
		                            </div>
		                            <div class="col-12  col-sm-4 col-md-4 col-lg-4 col-xl-4 margin-10-bottom" style="margin-top:14px">
		                                <label style="margin-left:-69px">Module Name<sup>*</sup></label>
		                                <div class="form-group" style="margin-top: -13%;margin-left: 40%;">
		                                    <input type="text" class="form-control"  id="moduleName" name="moduleName" value="${issueBean.moduleName}" maxlength="50" data-ignorepaste="" autocomplete="off">
		                                </div>
		                            </div>
		                            <div class="col-12  col-sm-4 col-md-4 col-lg-4 col-xl-4 margin-10-bottom" style="margin-top:14px">
		                                <label style="margin-left:-69px">Bug Name<sup>*</sup></label>
		                                <div class="form-group" style="margin-top: -13%;margin-left: 40%;">
		                                    <input type="text" class="form-control"  id="issueName" name="issueName" value="${issueBean.issueName}" maxlength="50" data-ignorepaste="" autocomplete="off">
		                                </div>
		                            </div>
		                            <div class="col-12  col-sm-4 col-md-4 col-lg-4 col-xl-4 margin-10-bottom">
		                                <label style="margin-left:-69px">Description</label>
		                                <div class="form-group" style="margin-top: -13%;margin-left: 40%;">
		                                <textarea rows="5" cols="152" name="description" id="description"  maxlength="2000"></textarea>
		                                   <%--  <input  type="textarea" class="form-control"  id="lastName" name="lastName" value="${memRegList.lastName}" maxlength="50" data-ignorepaste="" autocomplete="off"> --%>
		                                </div>
		                            </div>
		                            <div
						class="col-12  col-sm-4 col-md-4 col-lg-4 col-xl-4 margin-10-bottom">
						<label style="margin-left:-69px">Steps to Reproduce<sup>*</sup></label>
						<div class="form-group" style="margin-top: -13%;margin-left: 40%;">
						<textarea rows="5" cols="152" name="stepstoreProduce" id="stepstoreProduce"  maxlength="2000"></textarea>
							<%-- <input style="height:73px;width:115%; type="text" class="form-control" id="email" name="email"
								value="${memRegList.email}" data-ignorepaste=""
								autocomplete="off" maxlength="256"> --%>
						</div>
					</div>
								</div>
			<div>

				

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

				<div
					class="col-12  col-sm-4 col-md-4 col-lg-4 col-xl-4 margin-10-bottom">
					<label style="margin-left:-69px">Status<sup>*</sup></label>
					<div class="form-group" style="margin-top: -13%;margin-left: 40%;">
					<select  class="form-control" name="status" id="status">
		          								<option value="0">--Select Here--</option>
				                        		<option value="New">New</option>
				                        		<option value="Open">Open</option>
				                        		<option value="Close">Close</option>
		        					  		</select>
					</div>
				</div>
			</div>
				<div>
					 <div class="col-12  col-sm-4 col-md-4 col-lg-4 col-xl-4 margin-10-bottom">
		                                <label style="margin-left:-69px">Author<sup>*</sup></label>
		                                <div class="form-group" style="margin-top: -13%;margin-left: 40%;">
		                                    <label>${bugUser.firstName}</label>
		                                </div>
		                            </div>
		                        <%--  <div class="col-12  col-sm-4 col-md-4 col-lg-4 col-xl-4 margin-10-bottom">
		                                <label style="margin-left:-69px">Date<sup>*</sup></label>
		                                <div class="form-group" style="margin-top: -13%;margin-left: 40%;">
											
		                                </div>
		                            </div>   --%>
		                                   
				</div>
			</div>
				 <span style="visibility: hidden;
				 ">Please note that the password should be between 8 and 14 characters and should contain at least one alphabet,one number,one Capital
							letter,one Small letter and a special character(@,#,$,%,_,?,+,-,.)</span>
							
			<div class="second-tab-btn float-right" >
			<input type="submit" id="btnSubmited" class="bluebotton"  value="Post Bug" onclick="return loginFunction1(this.form);"/>
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
 <%@ page language="java" contentType="text/html; charset=UTF-8" import="com.example.stockspring.model.User" 
    pageEncoding="UTF-8"%>
 <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>  
  <%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
  <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>  
<!DOCTYPE html>
<html lang="en">
<head>

<title>Forgot Password</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">

<link rel="stylesheet"
href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">

<script
src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script
src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
<script
src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
<link rel="shortcut icon"
	href="http://www.brianshim.com/webtricks/wp-content/uploads/2012/11/stars_favicon.png"
	type="image/x-icon" />
<link rel="stylesheet" type="text/css" href="./css/addCompanyStyle.css">

<script src="./js/jquery-3.3.1.min.js"></script>
<script src="./js/jquery-migrate-1.4.1.min.js"></script>
<script src="./js/jquery-ui-1.10.3.custom.min.js"></script>
<script>
	function avail() {
		$.ajax({
			url : "checkEmailid",
			data : {
				email : $("#email1").val()
			},
			success : function(data) {
				var m = data;
				if (m == "Email not present") {
					alert ("Enter a valid email");
					$("#email1").val("");
				}
				if (m == "Email is present") {
					alert("Mail sent successfully! Check your mail to retrieve password");
				}
			},
			error : function() {
				alert("Error");
			}
		});
	}
</script>









</head>
<body style="background-image: linear-gradient(to right, white, cyan);">

<div class=" container login-container">
 <div class="row d-flex justify-content-center align-items-center">
  <div class="col-md-8 login-form-1 ">
   <h3 class="display-3">Forgot password</h3>
   <form:form action="/resPas" modelAttribute="resetPass" method="post" onsubmit="avail()">
   <c:if test="${loginStatus eq 0 }">
    <div class="alert alert-danger alert-dismissible">
     <a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
     <strong>Error!</strong> Invalid Email
    </div>
   </c:if>
            <br>Enter your email<br>
            <div class="form-group">
    <form:input type="email" path="email" class="form-control"
    required="required" id="email1"/>
   </div>
   <br>
   <div class="form-group">
    <input type="submit" class="btn btn-primary btn-lg" value="Send Email" />
   </div>
   <c:if test="${loginStatus eq 1 }">
    <div class="alert">
     <span class="closebtn"
      onclick="this.parentElement.style.display='none';">&times;</span>
     <strong>Your Password is: ${a}. Please Remember it for
      Future Login.</strong>
    </div>
   </c:if>
  </form:form>
 </div>
</div>
</div>
</body>
</html>

<%@ page language="java" contentType="text/html; charset=UTF-8" import="com.example.stockspring.model.User" 
    pageEncoding="UTF-8"%>
 <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>  
  <%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
  <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>  
<!DOCTYPE html>
<html lang="en">
<head>

<title>Reset Password</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">

<link rel="stylesheet"
href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
<link rel="stylesheet" type="text/css" href="importStockPageStyle.css" />
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

<!-- <script src="./js/jquery-3.3.1.min.js"></script>
<script src="./js/jquery-migrate-1.4.1.min.js"></script>
<script src="./js/jquery-ui-1.10.3.custom.min.js"></script> -->
<!-- <script type="text/javascript"> -->

	
<script>
function myFunction() {
	  var x = document.getElementById("password-field");
	  if (x.type === "password") {
	    x.type = "text";
	  } else {
	    x.type = "password";
	  }
	}
	
function confirm_alert(node){
	return confirm("Password updated successfully..")
}
	
	</script>

</head>
<body>
	
	 <%response.setHeader("Cache-Control","no-cache");
	response.setHeader("Cache-Control","no-store");
	response.setHeader("Pragma","no-cache");
	response.setDateHeader("Expires", 0);
%>


<% User user=(User)request.getAttribute("user"); %>

<c:if test="${sessionScope.user.id==null }">
<%response.sendRedirect("/login"); %>
</c:if>  




	
		<div class="container">
	<div class="row">
	<div class="col-md-3"></div>
	<div class="col-md-6">
	 <div id="login-box">
	<div class="card">
     <div class="card-body">
      <h3 class="card-title text-center" align="center">Reset Password
       </h3>
      <hr>
      <form:form method="POST" action="/resetpassword" modelAttribute="rp" class="form" role="form" autocomplete="off">
       <div class="form-group row">
        <label class="col-lg-5 col-form-label form-control-label">Email:</label>
        <div class="col-lg-7">
         <form:input class="form-control" type="email"
          path="email" placeholder="email" required="true" value="${sessionScope.user.email }" readonly="true"/>
        </div>
       </div>
       <div class="form-group row">
        <label class="col-lg-5 col-form-label form-control-label">Enter new password:</label>
        <div class="col-lg-7">
       <%--   <form:input class="form-control" type="password" path="password"
          placeholder="Password" required="true" id="password-field"/><br> --%>
          
          <form:input id="password-field" type="password" path="password" class="form-control" required="required" /><br>
          
           <input type="checkbox" onclick="myFunction()">Show Password
    
    
        </div>
       </div>
       
       
       <div class="form-group row">
									<!-- <label class="col-lg-4 col-form-label form-control-label"></label> -->
									<!--   <div class="col-lg-8"> -->
									<div class="col-lg-6">
										<input type="reset" class="btn btn-secondary" value="Reset"
											id="cancel">
									</div>
									<div class="col-lg-6">
										<input type="submit" class="btn btn-primary"
											value="Update" onclick="return confirm_alert(this);">
									</div>
									<!--  </div> -->
								</div>
      </form:form>
     </div>
     </div>
    </div>
    </div>
    <div class="col-md-3"></div>
    </div>
    </div>
    <div class="footer">
 <p>Copyright © 2019 Stock Exchange Chart-All Rights Reserved</p>
</div>


</body>
</html>
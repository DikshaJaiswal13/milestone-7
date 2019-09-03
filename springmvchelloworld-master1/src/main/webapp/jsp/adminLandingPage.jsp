
 <%@ page language="java" contentType="text/html; charset=UTF-8" import="com.example.stockspring.model.User"
    pageEncoding="UTF-8"%>
 <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>  
  <%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
  <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>  
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Admin Landing Page</title>

<meta name="viewport" content="width=device-width, initial-scale=1">

<link rel="stylesheet"
href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
<link rel="stylesheet" type="text/css" href="./css/adminLandingPageStyle.css" />
<script
src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script
src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
<script
src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
<link rel="shortcut icon"
	href="http://www.brianshim.com/webtricks/wp-content/uploads/2012/11/stars_favicon.png"
	type="image/x-icon" />
	
	<script type="text/javascript">
	function confirm_alert(node){
		return confirm("Are you sure you want to logout?")
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



	<div class="header">
		<nav class="navbar navbar-inverse">
		<div class="container-fluid" style="background: black">
			<div class="navbar-header">
				<!--  <img alt="logo" src="logo.png"> -->
			</div>
			<div class="navbar-header">
				<a class="navbar-brand" href="#" style="color: white"><b>&nbsp;Stock
						Exchange Chart</b></a>
			</div>
			<ul class="nav navbar-nav">
				<spring:url value="/importData" var="link1" htmlEscape="true" />
				<li><a href="${link1}">Import Data</a></li>
				<li class="dropdown"><a class="dropdown-toggle"
					data-toggle="dropdown" href="#">Manage Company<span
						class="caret"></span></a>
					<ul class="dropdown-menu">
						<spring:url value="/addCompany" var="link2" htmlEscape="true" />
						<li><a href="${link2 }" style="color: white;">Add Company</a></li>
						<spring:url value="/updateCompany" var="link3" htmlEscape="true" />
						<li><a href="${link3 }" style="color: white;">Update
								Company</a></li>
						<spring:url value="/companyList" var="link4" htmlEscape="true" />
						<li><a href="${link4}" style="color: white;">List of all
								Companies</a></li>
					</ul></li>
				<li class="dropdown"><a class="dropdown-toggle"
					data-toggle="dropdown" href="#">Manage Exchange<span
						class="caret"></span></a>
					<ul class="dropdown-menu">
						<spring:url value="/importStock" var="link5" htmlEscape="true" />
						<li><a href="${link5 }" style="color: lightblue;">Register
								New Stock Exchange</a></li>
						<spring:url value="/stockList" var="link6" htmlEscape="true" />
						<li><a href="${link6 }" style="color: white;">List Stock
								Exchange</a></li>
					</ul></li>
				<spring:url value="/ipoRegistration" var="link7" htmlEscape="true" />
				<li><a href="${link7 }">Update IPO details</a></li>
				
				<%-- <li><a style="color:#fff; float:right;">Welcome,<i> ${sessionScope.user.username }</i></a></li> --%>

			</ul>
			
			
			
			
			
			
			
			<div class="nav navbar-nav navbar-right" id="logout">
				<form action="/logout" method="get">
					<button type="submit" class="btn navbar-btn btn-default" onclick="return confirm_alert(this);">
					<span class="glyphicon glyphicon-log-out"></span> Logout</button>
					</form>
			</div>
		</div>
		</nav>
	</div>
	
	
	<div class="container-fluid"> <!-- style="margin-right:5%; margin-left:5%;"> -->
 <!-- Code starts from here -->
 <div class="space"></div>
 <div class="row">
 <div class="col-md-4">
 
 <div class="card">
 <div class="card-body">
  <img src="./images/profile1.jpg" alt="Avatar" style="width:100%; height:70%; border-radius:5px 5px 0px 0px;">
  
    <h4><b><%-- ${sessionScope.user.username } --%>${sessionScope.user.username }</b></h4><hr>
   <p class="style1"><%-- ${sessionScope.user.emailId } --%><a href="/resetpassword">Reset password</a></p><hr>
   
    <p class="style1"><%-- ${sessionScope.user.emailId } --%>${sessionScope.user.email }</p><hr>
    <p class="style1">${sessionScope.user.mobilenumber }</p>
  </div>
</div>
  
 </div>
 
  <div class="col-md-8"><div class="jumbotron">
 <h1>Welcome Admin...</h1><hr><br>
 <h5><p>The stock market refers to public markets that exist for
  issuing, buying and selling stocks that trade on a stock exchange or 
  over-the-counter. Stocks, also known as equities, represent fractional ownership in a 
  company, and the stock market is a place where investors can buy and sell ownership of such 
  investible assets. An efficiently functioning stock market is considered critical to economic 
  development,
  as it gives companies the ability to quickly access capital from the public.</p></h5>
  <br>
  <h5><p>The secondary purpose the stock market serves is 
  to give investors – those who purchase stocks – the opportunity to
   share in the profits of publicly-traded companies. Investors can profit from st
   ock buying in one of two ways. The other way investors can profit from buying stocks is by sellin
   g their stock for a profit if the stock price increases from their purchase price.</p></h5>
 <br>
 
  <h5><p>The secondary purpose the stock market serves is 
  to give investors – those who purchase stocks – the opportunity to
   share in the profits of publicly-traded companies. Investors can profit from st
   ock buying in one of two ways. The other way investors can profit from buying stocks is by sellin
   g their stock for a profit if the stock price increases from their purchase price.</p></h5><br>
 </div>
 </div>
 </div>
 
 
 
  
 <!-- Code ends here -->
</div>
<div class="footer">
 <p>Copyright © 2019 Stock Exchange Chart-All Rights Reserved</p>
</div>
	
</body>
</html>
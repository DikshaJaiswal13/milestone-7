 <%@ page language="java" contentType="text/html; charset=UTF-8" import="com.example.stockspring.model.User"
    pageEncoding="UTF-8"%>
 <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>  
  <%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
  <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>  
<!DOCTYPE html>
<html lang="en">
<head>
<title>IPO Registration</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">

<link rel="stylesheet"
href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
<link rel="stylesheet" type="text/css" href="IPOregistrationStyle.css" />
<script
src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script
src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
<script
src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
<link rel="shortcut icon"
	href="http://www.brianshim.com/webtricks/wp-content/uploads/2012/11/stars_favicon.png"
	type="image/x-icon" />
<link rel="stylesheet" type="text/css" href="./css/importStockPageStyle.css">
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





	<div class="container">
	<div class="row">
	<div class="col-md-3"></div>
	<div class="col-md-6">
	 <div id="login-box">
	<div class="card">
     <div class="card-body">
      <h3 class="card-title text-center" align="center">IPO Registration</h3>
      <hr>
      <form:form method="POST" action="/ipoRegistration" modelAttribute="c1" class="form" role="form" autocomplete="off">
       <div class="form-group row">
        <label class="col-lg-5 col-form-label form-control-label">Select Company Code:
         </label>
        <div class="col-lg-7">
        <form:select class="form-control" path="companyCode" id="companyCode" required="true">
                        <option value="" disabled selected style="display: none;">Select Company Code</option>
                        <c:forEach items="${companyList}" var="sl">
                        <form:option value="${sl.companyId}">${sl.companyId}-${sl.companyName}</form:option>
                        </c:forEach>
    					</form:select> 
    					<!--    <select
       class="form-control" id="Duration">
       <option>1</option>
       <option>2</option>
       <option>3</option>
       <option>4</option>
      </select>  -->
        </div>
       </div>
       <div class="form-group row">
        <label class="col-lg-5 col-form-label form-control-label">Select Stock Exchange Id:</label>
        <div class="col-lg-7">
         <form:select class="form-control" path="stockExchange" id="stockExchange" required="true">
                        <option value="" disabled selected style="display: none;">Select Stock Exchange Id</option>
                        <c:forEach items="${stockList}" var="sl">
                        <form:option value="${sl.stockExchangeId} ">${sl.stockExchangeId} -${sl.stockExchangeName } </form:option>
                        </c:forEach>
    					</form:select> 
    					
    					<!--  <select
       class="form-control" id="courses">
       <option selected disabled>Select Course</option>
       <option>Core Java</option>
       <option>Spring</option>
       <option>Angular</option>
       <option>Maven</option>
      </select> -->
        </div>
       </div>
       <div class="form-group row">
        <label class="col-lg-5 col-form-label form-control-label">Enter Price Per Share:
         </label>
        <div class="col-lg-7">
         <form:input class="form-control" type="number" step="0.1" path="pricePerShare"
          placeholder="Price Per Share" required="true"/>
        </div>
       </div>
       <div class="form-group row">
        <label class="col-lg-5 col-form-label form-control-label">Enter Total Number Of Share:</label>
        <div class="col-lg-7">
         <form:input class="form-control" type="number" path="noOfShares"
          placeholder="Number of Shares" value="Number of Shares" required="true"/>
        </div>
       </div>
       
        <div class="form-group row">
        <label class="col-lg-5 col-form-label form-control-label">Open Date Time:</label>
        <div class="col-lg-7">
         <form:input class="form-control" type="date" path="openDateTime"
          placeholder="Open Date Time" required="true"/>
        </div>
       </div>
       
        <div class="form-group row">
        <label class="col-lg-5 col-form-label form-control-label">Remarks:</label>
        <div class="col-lg-7">
         <form:input class="form-control" type="text" path="remarks"
          placeholder="Remarks" required="true"/>
        </div>
       </div>








								<div class="form-group row">
									<!-- <label class="col-lg-4 col-form-label form-control-label"></label> -->
									<!--   <div class="col-lg-8"> -->
									<div class="col-lg-6">
										<input type="reset" class="btn btn-secondary" value="Cancel"
											id="cancel">
									</div>
									<div class="col-lg-6">
										<input type="submit" class="btn btn-primary"
											value="Save Changes">
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
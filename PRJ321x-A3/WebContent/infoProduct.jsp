<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<link rel="stylesheet"
	href="https://use.fontawesome.com/releases/v5.7.0/css/all.css"
	integrity="sha384-lZN37f5QGtY3VHgisS14W3ExzMWZxybE1SJSEsQp9S+oqd12jhcu+A56Ebc1zFSJ"
	crossorigin="anonymous">
</head>
<body>
	<c:import url="header.jsp"></c:import>
	<c:set var="p" value="${product}"></c:set>
	<c:set var="price" value="${p.price}"></c:set>
	<div class="container">
		<div class="row">
			<div class="col-md-12 border-bottom mt-3">
				<h5 class="text-danger">${p.name}</h5>
			</div>
			<div class="col-md-5">
				<img class="img-fluid mt-4 mb-4" src="${p.src}">
			</div>
			<div class="col-md-7 mt-4 mb-4">
			<h5 class="text-danger">
				<fmt:setLocale value = "en_US"/>
         		<fmt:formatNumber pattern="###,###,###" maxFractionDigits="0" value = "${price * 1000000}" type = "currency"/>
         		<span> VND</span>
			</h5>
			<p>
				${p.description}
			</p>
			<a href="${pageContext.servletContext.contextPath}/cart?action=add&id=${p.id}" type="button" class="btn btn-warning">Add to cart</a> 
			</div>
		</div>
	</div>	
</body>
</html>
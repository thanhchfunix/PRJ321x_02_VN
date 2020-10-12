<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<div class="container mt-2">
		<div class="row">
			<c:forEach var="p" items="${product}">
				<div class="card-deck col-md-4">
					<a
						href="${pageContext.servletContext.contextPath}/detail?id=${p.id}"
						class="card mt-2 nav-link"> <img src="${p.src}"
						class="card-img-top mt-2" alt="${p.description}">
						<div class="card-body">
							<c:set var="type" value="${p.type}"></c:set>
							<h4 class="card-title text-secondary">${fn:toUpperCase(type)}</h4>
							<p class="card-text text-success">${p.name}</p>
							<p class="card-text text-danger">$${p.price}</p>
						</div>
					</a>
				</div>
			</c:forEach>
		</div>
	</div>
	
	<!--pagination-->
	<nav aria-label="..." class="d-flex justify-content-center mt-2">
		<ul class="pagination">
			<li class="page-item disabled"><a class="page-link" href="#"
				tabindex="-1" aria-disabled="true">Previous</a></li>
			<li class="page-item"><a class="page-link" href="#">1</a></li>
			<li class="page-item active" aria-current="page"><a
				class="page-link" href="#">2 <span class="sr-only">(current)</span></a>
			</li>
			<li class="page-item"><a class="page-link" href="#">3</a></li>
			<li class="page-item"><a class="page-link" href="#">Next</a></li>
		</ul>
	</nav>
</body>
</html>
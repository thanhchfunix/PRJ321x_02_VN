<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<title>Dashboard</title>
<!-- Required meta tags -->
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">

<!-- Bootstrap CSS -->
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
	integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
	crossorigin="anonymous">
<link href="<c:url value="/resources/css/admin.css" />" rel="stylesheet">
</head>
<body>
	<div class="container-fluid bg-dark h-100">
		<div class="row h-100">
			<div class="col-md-1 bg-dark sidebar">
				<nav
					class="navbar navbar-expand-sm navbar-dark d-flex flex-center flex-column">
					<a class="navbar-brand border-bottom text-warning ml-3" href="#">NP
						TEAM</a>
					<ul class="navbar-nav d-flex flex-column mt-1">
						<li class="nav-item active"><a class="nav-link" href="#">Dashboard</a>
						</li>
						<li class="nav-item"><a class="nav-link" href="#">Manager</a>
						</li>
					</ul>
				</nav>
			</div>
			<div class="col-md-11">
				<nav class="nav nav-top justify-content-end bg">
					<p class="text-danger mt-2">
						Welcome,
						${username}</p>
					<a class="nav-link" href="index.jsp"><i class="fa fa-th-large"></i></a> <a
						class="nav-link" href="#"><i class="fa fa-user"></i></a> <a
						class="nav-link" href="#">Log
						out</a>
				</nav>
				<div class="d-flex bg-dark h-50">
					<table class="table w-75 table-hover">
						<caption class="cap text-white ml-2 mr-2">
							<h4 class="ml-2">Members of the team</h4>
						</caption>
						<thead>
							<tr>
								<th scope="col">ID</th>
								<th scope="col">Name</th>
								<th scope="col">Student ID</th>
								<th scope="col">Class</th>
							</tr>
						</thead>
						<tbody>
							<tr>
								<th scope="row">FX01399</th>
								<td>Member 1</td>
								<td>Thanhch</td>
								<td>Funix-CC3</td>
							</tr>
						</tbody>
					</table>
				</div>
			</div>
		</div>
	</div>
	<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"
		integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo"
		crossorigin="anonymous"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"
		integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1"
		crossorigin="anonymous"></script>
	<script
		src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"
		integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM"
		crossorigin="anonymous"></script>
</body>
</html>
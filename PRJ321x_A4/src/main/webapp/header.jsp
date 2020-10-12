<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<%@page import="java.io.PrintWriter"%>
<div class="container-fluid">
	<div class="row">
		<div class="col-md-2">
			<h2>PRJ321x</h2>
			<h6>Welcome to my Website</h6>
		</div>
		<div class="col-md-10">
			<form class="input-group mt-3" action="" method="get">
				<div class="w-auto">
					<select name="type" class="custom-select">
						<option selected>Categories</option>
						<option value="Smart phone">Iphone</option>
						<option value="Laptop">Samsung</option>
						<option value="Accessories">LG</option>
					</select>
				</div>
				<input type="text" name="s" placeholder="What are you looking for?"
					class="form-control" aria-label="Text input with dropdown button">
				<div class="input-group-append">
					<button type="submit" class="btn btn-link text-warning">
						<i class="fa fa-search"></i>
					</button>
				</div>
			</form>
		</div>
	</div>
</div>
<div class="col-md-12 mt-2">
	<nav class="navbar navbar-expand-sm bg-dark navbar-dark">
		<!--left menu-->
		<ul class="navbar-nav mr-auto">
			<li class="nav-item"><a class="nav-link" href="#">Home</a></li>
			<li class="nav-item"><a class="nav-link" href="#">Product</a></li>
			<li class="nav-item"><a class="nav-link" href="#">About us</a></li>
		</ul>
		<!--right menu-->
		<ul class="navbar-nav ml-auto">
			<li class="nav-item"><a class="nav-link" href="login.html">Login</a></li>
			<li class="nav-item"><a class="nav-link" href="#">Register</a></li>
		</ul>
	</nav>
</div>
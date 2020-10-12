<%@page import="java.io.PrintWriter"%>
<div class="container-fluid">
	<div class="row">
		<div class="col-md-2">
			<h2>PRJ321x</h2>
			<h6>Welcome to my Website</h6>
		</div>
		<div class="col-md-10">
			<div class="input-group mt-3">
				<div class="w-auto">
					<select name="cars" class="custom-select">
						<option selected>Categories</option>
						<option value="Smart phone">Smart phone</option>
						<option value="Laptop">Laptop</option>
						<option value="Accessories">Accessories</option>
					</select>
				</div>
				<input type="search" placeholder="What are you looking for?"
					class="form-control" aria-label="Text input with dropdown button">
				<div class="input-group-append">
					<button type="submit" class="btn btn-link text-warning">
						<i class="fa fa-search"></i>
					</button>
				</div>
			</div>
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
			<%
				String name = (String) session.getAttribute("user");
				if (name == null) {
					name = "";
					out.write(
							"<li class='nav-item'><a class='nav-link' href='/PRJ321x_Project_2_thanhchfx01399/login.jsp'>");
					out.write("Login");
					out.write("</a></li>");
				} else {
					name = name.substring(0, name.indexOf("@"));
					out.write(
							"<li class='text-white nav-item'><a class='nav-link' href='/PRJ321x_Project_2_thanhchfx01399/admin/index.jsp'>");
					out.write("Hi," +name);
					out.write("</a></li>");
				}
			%>
		</ul>
	</nav>
</div>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<title>Login</title>
<!-- Required meta tags -->
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">

<!-- Bootstrap CSS -->
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
	integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
	crossorigin="anonymous">
<link
	href="https://fonts.googleapis.com/css2?family=Baloo+2:wght@700&display=swap"
	rel="stylesheet">
<link rel="stylesheet" href="css/login.css">
</head>
<body>
	<%
		String message = "";
		message = (String) session.getAttribute("error");
		if (message == null) {
			message = "";
		}

		// get data from cookie
		Cookie[] cookies = request.getCookies();
		String userName = "", password = "", rememberVal = "";
		if (cookies != null) {
			for (Cookie cookie : cookies) {
				if (cookie.getName().equals("cookuser")) {
					userName = cookie.getValue();
				}
				if (cookie.getName().equals("cookpass")) {
					password = cookie.getValue();
				}
				if (cookie.getName().equals("cookrem")) {
					rememberVal = cookie.getValue();
				}
			}
		}
	%>

	<div class="container-fluid h-100">
		<div class="wrapper h-100 container-fluid mt-3 mb-3 shadow">
			<div class="row h-100">
				<div
					class="col-md-6 left d-flex align-items-center justify-content-center">
					<form action="/PRJ321x_Project_2_thanhchfx01399/login"
						method="post" class="form-group text-center">
						<p class="text-warning text-center"><%=message%></p>
						<label for="Signin"><h2>Sign in</h2></label> <input type="email"
							class="form-control mb-3" name="username" id=""
							aria-describedby="helpId" placeholder="Your email"
							autocomplete="off" value="<%=userName%>" required> <input
							type="password" class="form-control" name="password" id=""
							aria-describedby="helpId" placeholder="Your password"
							autocomplete="off" value="<%=password%>" required> <label
							class="form-check-label mt-2"> <input
							class="form-check-input" type="checkbox" name="remember" id=""
							value="1"
							<%="1".equals(rememberVal.trim()) ? "checked=\"checked\"" : ""%> />
							Remember me
						</label>
						<h4 class="mt-2 p-2">Forgot your password?</h4>
						<input name="" id="" class="btn" type="submit" value="Login">
					</form>
				</div>
				<div
					class="col-md-6 right d-flex align-items-center justify-content-center">
					<div>
						<h2 class="text-center">Welcome Back!</h2>
						<h4 class="text-center">To keep connected with us</h4>
						<h4 class="text-center">please login with your personal</h4>
						<h4 class="text-center">info</h4>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>
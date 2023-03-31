<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page import="com.studyhub.entity.User"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.0/css/bootstrap.min.css"
	integrity="sha384-9gVQ4dYFwwWSjIDZnLEWnxCjeSWFphJiwGPXr1jddIhOegiu1FwO5qRGvFXOdJZ4"
	crossorigin="anonymous">

<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-eOJMYsd53ii+scO/bJGFsiCZc+5NDVN2yr8+0RDqr0Ql0h+rP48ckxlpbzKgwra6"
	crossorigin="anonymous" />
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<title>Semester I Syllabus</title>
<style>
.bg-primary{
background-color: #7bb1ff!important;
}
.rounded {
    border-radius: 12.25rem!important;
}
.card {
    position: relative;
    display: flex;
    flex-direction: column;
    min-width: 0;
    word-wrap: break-word;
    background-color: #fff;
    background-clip: border-box;
    border: 71px solid rgba(0,0,0,.125);
    border-radius: 0.25rem;
}
</style>
</head>
<body>
	<nav
		class="navbar navbar-expand-lg navbar-dark bg-dark primary-background">
		<div class="container-fluid">
			<a class="navbar-brand" href="home"><span class="fa fa-book"></span>
				Study Hub</a>
			<button class="navbar-toggler" type="button"
				data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent"
				aria-controls="navbarSupportedContent" aria-expanded="false"
				aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"></span>
			</button>
			<div class="collapse navbar-collapse" id="navbarSupportedContent">
				<ul class="navbar-nav me-auto mb-2 mb-lg-0">
					<li class="nav-item"><a class="nav-link active"
						aria-current="page" href="home">Home</a></li>

					<%
					if (session.getAttribute("user") != null) {
						User user = (User) session.getAttribute("user");
					%>

					<li class="nav-item"><a class="nav-link active " href="login"><span
							class="fa fa-user-circle"></span> Hello, <%=user.getFirstName()%></a></li>
								<li class="nav-item"><a class="nav-link active "
						aria-current="page" href="logout" id="logout"><span class="fa fa-sign-out"> </span> Logout</a></li>
							
					<%
					} else {
					%>
					<li class="nav-item"><a class="nav-link active " href="login"><span
							class="fa fa-user-circle"></span> Login</a></li>
					<li class="nav-item"><a class="nav-link active "
						href="register"><span class="fa fa-user-plus"></span> Sign up</a>
					</li>
					<%
					}
					%>



				</ul>
			</div>
		</div>
	</nav>
	<div class="container my-2" style="border: 2px solid green;">
		<div class="row bg-primary">
			<div class="col-9 offset-1 text-center" style="margin-left: 12.3333333333%;">
			<h3 style="margin-top: 20px;">BSC-IT Syllabus for ${param.course}</h3>
				<div class="card shadow rounded  my-4 mx-2">

					<table class="table table-striped table-dark">
						<thead>
							<tr>
								
								<th scope="col">Subject</th>
								<th scope="col">Download</th>
							</tr>
						</thead>
						<tbody>
						<c:forEach items="${syllabus}" var="syllabus">
								<tr>
								
								<td>${syllabus.getSubjects()}</td>
								<td><a class="text-info" href="${syllabus.getDownloadLink()}">Click Here For Download</a></td>
							</tr>
						</c:forEach>
						</tbody>
					</table>
				</div>
			</div>

		</div>

	</div>
	<script src="https://code.jquery.com/jquery-3.6.0.min.js"
		integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4="
		crossorigin="anonymous"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-A3rJD856KowSb7dwlZdYEkO39Gagi7vIsF0jrRAoQmDKKtQBHUuLZ9AsSv4jD4Xa"
		crossorigin="anonymous"></script>
	<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
	<script>
	$('#logout').onclick(function(){
		console.log("logogut")
	})
	
	</script>
</body>
</html>
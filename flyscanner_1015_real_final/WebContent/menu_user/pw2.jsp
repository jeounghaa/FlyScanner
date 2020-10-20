<%@page import="user.UserVO"%>
<%@page import="user.UserDAO"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css"
	integrity="sha384-JcKb8q3iqJ61gNV9KGb8thSsNjpSL0n8PARn9HuZOnIxN0hoP+VmmDGMN5t9UJ0Z"
	crossorigin="anonymous">
<!-- 1.id값 받아와야함. -->
<!-- 2.dao와 연동하여 결과 받아와야함. -->
<!-- 3.html로 만들어서 전송해야함. -->
<%
String pw = request.getParameter("pw");
String Uid = request.getParameter("Uid");
UserDAO dao = new UserDAO();
boolean result = dao.update(pw, Uid);
String check = "로그인실패";

if (result) {
	check = "로그인 성공";
}
System.out.print(result);
%>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<nav class="navbar navbar-expand-lg navbar-dark bg-dark static-top">
		<div class="container">
			<a class="navbar-brand" href="login.html"> <img
				src="http://placehold.it/150x50?text=Login" alt="">
			</a>
			<button class="navbar-toggler" type="button" data-toggle="collapse"
				data-target="#navbarResponsive" aria-controls="navbarResponsive"
				aria-expanded="false" aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"></span>
			</button>
			<div class="collapse navbar-collapse" id="navbarResponsive">
				<ul class="navbar-nav ml-auto">
					<li class="nav-item active"><a class="nav-link" href="../index2.jsp">메인
							<span class="sr-only">(current)</span>
					</a></li>
					<li class="nav-item"><a class="nav-link" href="../menu_user/id.html">ID찾기</a>
					</li>
					<li class="nav-item"><a class="nav-link" href="../menu_user/pw.html">PW찾기</a>
					</li>

				</ul>
			</div>
		</div>
	</nav>
	<div class="container">
		<div class="row">
			<div class="col-sm-10 col-md-10 col-lg-10 mx-5">
				<div class="card card-signin my-10">
					<div class="card-body">
						<h3 class="card-title text-center">정상적으로 수정완료 되었습니다</h3>
						<div class="col-sm-10 col-md-10 col-lg-9 mx-auto">
							<h1 class="card-title text-center">로그인 해주세요</h1>

						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>
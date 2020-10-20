<%@page import="user.UserVO"%>
<%@page import="user.UserDAO"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css"
	integrity="sha384-JcKb8q3iqJ61gNV9KGb8thSsNjpSL0n8PARn9HuZOnIxN0hoP+VmmDGMN5t9UJ0Z"
	crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
    <!-- 1.id값 받아와야함. -->
    <!-- 2.dao와 연동하여 결과 받아와야함. -->
    <!-- 3.html로 만들어서 전송해야함. -->
    <%
    	String Uid =request.getParameter("Email");
    	String phone =request.getParameter("phone");
        UserDAO dao = new UserDAO();
        int result = dao.one5(Uid, phone);
        System.out.println("나야나 "+Uid);
    %>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type='text/javascript'>

	$(function() {
		$("#btn").click(function() {
			uid = '<%= Uid%>'
			pw = $('#pw').val()
			pw1 = $('#pw1').val()
			
			if (pw == pw1) {
				location.href='../menu_user/pw2.jsp?Uid='+uid+'&pw='+pw
			}
			else {
				alert("비밀번호가 같지 않습니다.")
			}
		})
	});

</script>
</head>
<body>
	<nav class="navbar navbar-expand-lg navbar-dark bg-dark static-top">
		<div class="container">
			<a class="navbar-brand" href="../menu_user/login.html"> <img
				src="http://placehold.it/150x50?text=Login" alt="">
			</a>
			<button class="navbar-toggler" type="button" data-toggle="collapse"
				data-target="#navbarResponsive" aria-controls="navbarResponsive"
				aria-expanded="false" aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"></span>
			</button>
			<div class="collapse navbar-collapse" id="navbarResponsive">
				<ul class="navbar-nav ml-auto">
					<li class="nav-item active"><a class="nav-link" href="#">메인
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
		<div class="row" color="red">
			<div class="col-sm-10 col-md-10 col-lg-10 mx-auto">
				<div class="card card-signin my-5">
					<div class="card-body">
						<h3 class="card-title text-center">
							비밀번호변경
							</h3>
							<div class="col-sm-7 mx-auto">
								<input type="password" id="pw" name="pw" class="form-control"
									placeholder="Password" required> <label
									for="inputPassword">패스워드</label>
							</div>

							<div class="col-sm-7 mx-auto">
								<input type="password" id="pw1" name="pw1" class="form-control"
									placeholder="Password" required>
									<label for="inputPassword">패스워드 확인</label>
									<br>
							</div>
                               <div class="col-sm-7 mx-auto">
							<hr class="my-4">
							<button class="btn btn-lg btn-primary btn-block text-uppercase" id="btn">변경</button>
								</div>
					</div>
				</div>
			</div>
		</div>
	</div>
				
</body>
</html>
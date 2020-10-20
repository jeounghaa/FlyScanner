<%@page import="user.UserDAO"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%	
    String UID = request.getParameter("Email");
    String pw = request.getParameter("pw");
    UserDAO dao = new UserDAO();
	boolean result = dao.read(UID, pw);
	String check = "로그인실패";
	if(result){
		check = "로그인성공";
	}
	System.out.print(result);
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css"
	integrity="sha384-JcKb8q3iqJ61gNV9KGb8thSsNjpSL0n8PARn9HuZOnIxN0hoP+VmmDGMN5t9UJ0Z"
	crossorigin="anonymous">
<title>Insert title here</title>
</head>
<body>
	<div class="container">
		<div class="row" color="red">
			<div class="col-sm-9 col-md-7 col-lg-5 mx-auto">
				<div class="card card-signin my-5">
					<div class="card-body">
						<h2 class="card-title text-center">
							
							</h2>
								<div class="form-label-group">
									<h1>가입을 축하드립니다</h1>
							<a href="../menu_user/MyPage.jsp">마이페이지</a>
							<a href="../index2.jsp">메인</a>
					</div>
				</div>
			</div>
		</div>
	</div>
	
</body>
</html>
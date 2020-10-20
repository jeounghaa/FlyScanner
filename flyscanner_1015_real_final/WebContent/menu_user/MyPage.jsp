<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String uID = (String)session.getAttribute("uID");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" integrity="sha384-JcKb8q3iqJ61gNV9KGb8thSsNjpSL0n8PARn9HuZOnIxN0hoP+VmmDGMN5t9UJ0Z" crossorigin="anonymous">
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css"
	integrity="sha384-JcKb8q3iqJ61gNV9KGb8thSsNjpSL0n8PARn9HuZOnIxN0hoP+VmmDGMN5t9UJ0Z"
	crossorigin="anonymous">

<script src="http://netdna.bootstrapcdn.com/bootstrap/3.0.3/js/bootstrap.min.js"></script>
<script type='text/javascript' src='//code.jquery.com/jquery-1.8.3.js'></script>

<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.5.0/css/bootstrap-datepicker3.min.css">

<script type='text/javascript' src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.5.0/js/bootstrap-datepicker.min.js"></script>
<script src="/js/bootstrap-datepicker.kr.js" charset="UTF-8"></script>
<script type='text/javascript'></script>
</head>
<body>
<!-- Navigation -->
<nav class="navbar navbar-expand-lg navbar-light bg-light static-top mb-5 shadow">
  <div class="container">
    <a class="navbar-brand" href="#">마이페이지</a>
    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation">
          <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="navbarResponsive">
      <ul class="navbar-nav ml-auto">
        <li class="nav-item active">
          <a class="nav-link" href="../index2.jsp">메인
                <span class="sr-only">(current)</span>
          </a>
        </li>                                                                                       
      </ul>
    </div>
  </div>
</nav>

<!-- Page Content -->
<div class="container">
  <div class="card border-0 shadow my-5">
    <div class="card-body p-5">
    <br>
    <br>
      <h1 class="font-weight-light"><%=session.getAttribute("uID") %>님 안녕하세요</h1>
      <br>
      <br>
      <br>
      <br>
      <br>
      <br>
      	<div class="col-sm-10 col-md-10 col-lg-3 ">
      	<form action="../menu_user/Mypage3.jsp">
      <button class="btn btn-lg btn-primary btn-block text-uppercase"
									type="submit"  id="b1">회원수정</button> 
									</div></form>
     <br><form action="../menu_payment/mypay.jsp">
      	<div class="col-sm-10 col-md-10 col-lg-3 ">
      <button class="btn btn-lg btn-primary btn-block text-uppercase"
									type="submit" id="b1">결제내역</button>
									</div></form>
      <br>
 <div id="carouselExampleInterval" class="carousel slide" data-ride="carousel">
  <div class="carousel-inner">
    <div class="carousel-item active" data-interval="10000">
      <img src="../img/a.jpg" class="d-block w-100" alt="b.jpg">
    </div>
    <div class="carousel-item" data-interval="2000">
      <img src="../img/b.jpg" class="d-block w-100" alt="c.jpg">
    </div>
    <div class="carousel-item">
      <img src="../img/c.jpg" class="d-block w-100" alt="a.jpg">
    </div>
  </div>
  <a class="carousel-control-prev" href="#carouselExampleInterval" role="button" data-slide="prev">
    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
    <span class="sr-only">Previous</span>
  </a>
  <a class="carousel-control-next" href="#carouselExampleInterval" role="button" data-slide="next">
    <span class="carousel-control-next-icon" aria-hidden="true"></span>
    <span class="sr-only">Next</span>
  </a>
</div>
    </div>
  </div>
</div>
</body>
</html>
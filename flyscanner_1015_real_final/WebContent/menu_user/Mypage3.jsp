<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

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

<script
	src="http://netdna.bootstrapcdn.com/bootstrap/3.0.3/js/bootstrap.min.js"></script>

<script type='text/javascript' src='//code.jquery.com/jquery-1.8.3.js'></script>

<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.5.0/css/bootstrap-datepicker3.min.css">

<script type='text/javascript'
	src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.5.0/js/bootstrap-datepicker.min.js"></script>

<script type='text/javascript'>

$(function() {
	$("#b1").click(function() {
		pw = document.getElementById('pw').value
		$.ajax({
            
			url : "../menu_user/check7.jsp",
			
			data : {
				pw :$('#pw').val(),
			},
			success : function(result) {
		  if (result==1) {
			location.href='../menu_user/formal.jsp?pw='+pw
		}else{
			  alert("아이디를확인해주세요");
		}
	}
		})
		})
})

</script>
</head>
<body>
<!-- Navigation -->
<nav class="navbar navbar-expand-lg navbar-light bg-light static-top mb-5 shadow">
  <div class="container">
    <a class="navbar-brand" href="#">마이 페이지</a>
    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation">
          <span class="navbar-toggler-icon"></span>
        </button>
    <div class="collapse navbar-collapse" id="navbarResponsive">
      <ul class="navbar-nav ml-auto">
        <li class="nav-item active">
          <a class="nav-link" href="../index2.jsp">메인<span class="sr-only">(current)</span>
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
      <h1 class="font-weight-light"><%= session.getAttribute("uID") %>님 환영합니다</h1> 
      <br>
      <br>
      <br>
      <br>
      <br>
      <br>
      	<div class="col-sm-10 col-md-10 col-lg-3 ">
      	<div class="col-sm-12">
								<input type="password" id="pw" name="pw" class="form-control"
									placeholder="Password" required> <label
									for="inputPassword"></label>
							</div>
							<button id= b1>수정</button>
									</div>
     <br>
      	<div class="col-sm-10 col-md-10 col-lg-3 ">
      <a href="../menu_payment/mypay.jsp"><button class="btn btn-lg btn-primary btn-block text-uppercase"
									type="submit" id="b1" >결제내역</button></a>
									</div>
      <br>
 <div id="carouselExampleInterval" class="carousel slide" data-ride="carousel">
  <div class="carousel-inner">
    <div class="carousel-item active" data-interval="10000">
      <img src="../img/a.jpg" class="d-block w-100" alt="...">
    </div>
    <div class="carousel-item" data-interval="2000">
      <img src="../img/b.jpg" class="d-block w-100" alt="...">
    </div>
    <div class="carousel-item">
      <img src="../img/c.jpg" class="d-block w-100" alt="...">
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
      <div style="height: 700px"></div>
      <p class="lead mb-0">You've reached the end!</p>
    </div>
  </div>
</div>
</body>
</html>





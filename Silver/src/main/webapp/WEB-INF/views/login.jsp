<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>


	<title>Login</title>

	<!-- 인코딩 -->
	<meta charset="UTF-8">
	<meta  name="viewport" content="width-device-width, initial-scale=1, shrink-to-fit=no">

	<!-- Bootstrap CSS 추가 -->
	<link rel="stylesheet" href="resources/css/bootstrap.min.css">
	
	<!-- Custom CSS 추가 -->
	<link rel="stylesheet" href="resources/css/custom.css">
    <link rel="stylesheet" href="resources/css/signin.css"> 
	 <script src="resources/js/jquery.min.js"></script>
	<style>
      .bd-placeholder-img {
        font-size: 1.125rem;
        text-anchor: middle;
        -webkit-user-select: none;
        -moz-user-select: none;
        -ms-user-select: none;
        user-select: none;
      }

      @media (min-width: 768px) {
        .bd-placeholder-img-lg {
          font-size: 3.5rem;
        }
      }
    </style>
    <script>
$(function() {
	if('${message}'!='')
	alert('${message}');
});

</script>
</head>


<body>

	<!-- 메인 네비게이션 -->
	<header>
		<nav class="navbar navbar-expand-md navbar-dark fixed-top p-3" id="main-nav">
	 		<a class="navbar-brand mr-5 p-0" href="index"><img src="resources/image/silversurferLogo.png"></a>
	 		<!-- 오른쪽 상단 토글러 버튼 -->
			<button class="navbar-toggler pt-0" type="button" data-toggle="collapse" data-target="#navbarCollapse" aria-controls="navbarCollapse" aria-expanded="false" aria-label="Toggle navigation">
	      	<span class="navbar-toggler-icon"></span>
			</button>
			<!-- 네비게이션 상단 메뉴 -->
			<div class="collapse navbar-collapse justify-content-between" id="navbarCollapse">
				<ul class="navbar-nav">
					<li class="nav-item active" style="color: black;">
			  			<a class="nav-link text-light mr-3" href="institution"><strong>요양기관</strong><span class="sr-only">(current)</span></a>
			  		</li>
			  		<li class="nav-item">
			  			<a class="nav-link text-light mr-3" href="careersIndex"><strong>종사자</strong></a>
			  		</li>
			  		<li class="nav-item">
			  			<a class="nav-link text-light mr-3" href="inquiry"><strong>자주하는질문</strong></a>	
			  		</li>
			  	</ul>
				<!-- 로그인 안한 경우 -->
			  	<c:if test="${sessionScope.loginId==null}">
			  	<ul class="navbar-nav mt-2 mt-md-0">
			  		<li class="nav-item">
			  			<a class="nav-link text-light" href="login"><small>로그인</small></a>
			  		</li>
			  		<li class="nav-item">
			  			<a class="nav-link text-light" href="signup"><small>회원가입</small></a>
			  		</li>
			  	</ul>
			  	</c:if>
			  	<!-- 로그인 후(dropdown) : 마이페이지/로그아웃 -->
			  	<c:if test="${sessionScope.loginId!=null}">
				  	<ul class="navbar-nav mt-2 mt-md-0">
				  		<li class="nav-item">
				  			<a class="nav-link text-light" href="logout"><small>로그아웃</small></a>
				  		</li>
				  	</ul>
			  	</c:if>
			</div>  
		</nav>	
	</header>	

<hr class="my-1">

	<!-- 로그인 폼  -->
	<div class="div-signin text-center">
	<form class="form-signin" action="selectMember" method="post">
		<img class="mb-4" src="resources/image/login.svg" alt="" width="72" height="72"> 
		<h1 class="h3 mb-3 font-weight-normal">로그인</h1>
		<!-- 로그인선택 -->
		<div class="custom-control custom-radio custom-control-inline my-2">
		  <input class="custom-control-input" type="radio" id="customRadio1"  name="type" value="1" checked>
		  <label class="custom-control-label" for="customRadio1">일반사용자</label>
		</div>
		<div class="custom-control custom-radio custom-control-inline">
		  <input class="custom-control-input" type="radio" id="customRadio2" name="type" value="3">
		  <label class="custom-control-label" for="customRadio2">기관관리자</label>
		</div>

		<!-- 아이디&비밀번호 -->
		<label for="inputId" class="sr-only">아이디</label>
		<input type="text" id="inputEmail" name="userid" value="${member.userid}" class="form-control" placeholder="아이디를 입력하세요." required autofocus>
		<label for="inputPassword" class="sr-only">비밀번호</label>
		<input type="password" id="inputPassword" name="userpwd" value="${member.userpwd}" class="form-control" placeholder="비밀번호를 입력하세요." required>
		<div class="checkbox mb-3">
			
			<label>
				<input type="checkbox" value="remember-me"> 아이디를 저장하시겠습니까
			</label>
		</div>
		<button class="btn btn-lg btn-primary btn-block" type="submit">로그인</button>
		 <p class="mt-5 mb-3 text-muted">&copy; 실버서퍼 2019</p>
	</form>
	</div>
	<!-- jQuery javaScript 추가 -->
	<script src="resources/js/jquery.min.js"></script>
	
	<!-- Popper javaScript 추가 -->
	<script src="resources/js/popper.min.js"></script>
	
	<!-- Bootstrap javaScript 추가 -->
	<script src="resources/js/bootstrap.min.js"></script>

</body>
</html>
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
    
</head>


<body>

<!-- 네비게이션 바 -->
	<nav class="navbar navbar-expand-lg navbar-light bg-light">
 		<a class="navbar-brand" href="index"><img src="resources/image/box.svg"> 실버서퍼</a>
		<button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbar" aria-controls="navbar" aria-expanded="false">
	    <span class="navbar-toggler-icon"></span>
		</button>
		
		<div class="collapse navbar-collapse justify-content-between" id="navbar">
		  <!-- 왼쪽 자동 정렬 -->
		  	<div class="navbar-nav"> 
		  		<a class="nav-item nav-link active" href="institution">
		  			요양기관 <span class="sr-only">(current)</span> </a>
		  		<a class="nav-item nav-link" href="worker">
		  			종사자 </a>
		  		<a class="nav-item nav-link" href="inquiry">
		  			자주하는질문 </a>	
			</div>
		  <!-- 오른쪽 자동 정렬 -->
		  	<c:if test="${sessionScope.loginId==null}">
		  	<div class="navbar-nav mr-sm-2">
		  		<a class="nav-item nav-link" href="login">
		  			로그인 </a>
		  		<a class="nav-item nav-link" href="signup">
		  			회원가입 </a>
		  	</div>
		  	</c:if>
		  	
		  	<c:if test="${sessionScope.loginId!=null}">
		  	<div class="navbar-nav mr-sm-2">
		  		<p class="lead">${sessionScope.loginId}님 환영합니다.</p>
		  		<a class="nav-item nav-link" href="logout">
		  			로그아웃 </a>
		  	</div>
			</c:if>
		</div>  
	</nav>	

<hr class="my-1">

	<!-- 로그인 폼  -->
	<div class="div-signin text-center">
	<form class="form-signin" action="selectMember" method="post">
	
		
		<img class="mb-4" src="resources/image/login.svg" alt="" width="72" height="72"> 
		<h1 class="h3 mb-3 font-weight-normal">로그인</h1>
		<!-- 로그인선택 -->
		<div class="custom-control custom-radio custom-control-inline my-2">
		  <input class="custom-control-input" type="radio" id="customRadio1"  name="custom-radio1" value="option1">
		  <label class="custom-control-label" for="customRadio1">일반사용자</label>
		</div>
		<div class="custom-control custom-radio custom-control-inline">
		  <input class="custom-control-input" type="radio" id="customRadio2" name="custom-radio1" value="option2">
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
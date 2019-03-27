<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>


	<title>실버서퍼에 오신 것을 환영합니다.</title>
	
	<!-- 인코딩 -->
	<meta charset="UTF-8">
	<meta  name="viewport" content="width-device-width, initial-scale=1, shrink-to-fit=no">

	<!-- Bootstrap CSS 추가 -->
	<link rel="stylesheet" href="resources/css/bootstrap.min.css">
	
	<!-- Custom CSS 추가 -->
	<link rel="stylesheet" href="resources/css/custom.css">
	<link rel="stylesheet" href="resources/css/mypage.css">
	
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
		  		<a class="nav-item nav-link" href="searchDetail">
		  			검색상세페이지 </a>	
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
		  	<!-- 계정정보/어르신정보/쪽지함/로그아웃 -->
		  	<c:if test="${sessionScope.loginId!=null}">
		  	<div class="navbar-nav mr-sm-2">
		  		<a class="dropdown-item" href="logout">로그아웃 </a>
		  	</div>
			</c:if>
		</div>  
	</nav>	
	
	
	<!-- 1. 기본정보 탭  -->
	<div class="container" id="basic">
		<div class="pt-5 pb-3 border-bottom">
		<h4 class="text-secondary"><small>계정정보</small></h4>
		</div>
	
		<!-- 사이드바 -->
		<div class="col-md-4">
			<div class="card card-side">
			
			</div>
		</div>
<!-- 		<div class="card-group pt-3">
			사이드 메뉴
			<div class="col-md-4">
				<div class="pt-4 pb-1 border-bottom">
					<h6 class="text-secondary"><small>계정정보</small></h6>
				</div>
				사이드바
				<div class="list-group pt-5 border border-white">
					<a href="#" class="list-group-item list-group-item-action border-white">회원정보수정</a>
					<a href="#" class="list-group-item list-group-item-action border-white">어르신정보</a>
					<a href="#" class="list-group-item list-group-item-action border-white">쪽지함</a>
				</div> 
				
			</div> -->
			
			<!-- 내용 -->
			<div class="col-md-8">
          		<div class="pt-3 pb-1 border-bottom">
					<h4 class="text-secondary">회원정보수정</h4>
				</div>
				
				
			</div>
			
			
	</div>






	<!-- jQuery javaScript 추가 -->
	<script src="resources/js/jquery.min.js"></script>
	
	<!-- Popper javaScript 추가 -->
	<script src="resources/js/popper.min.js"></script>
	
	<!-- Bootstrap javaScript 추가 -->
	<script src="resources/js/bootstrap.min.js"></script>
	

</body>
</html>
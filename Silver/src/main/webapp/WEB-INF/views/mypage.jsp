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
	<link rel="stylesheet" href="<c:url value="/resources/css/custom.css"/>">
	<link rel="stylesheet" href="resources/css/mypage.css">
	
	<!-- jQuery javaScript 추가 -->
	<script src="resources/js/jquery.min.js"></script>
	
	<!-- Popper javaScript 추가 -->
	<script src="resources/js/popper.min.js"></script>
	
	<!-- Bootstrap javaScript 추가 -->
	<script src="resources/js/bootstrap.min.js"></script>
	
</head>
<body>
	<script>
	  $(function() {
		  $('#myTab li a').on('click',function() {
			var item = $(this).html();
			$("#inform-tabContent").html(item);
		 });
	  });
	</script>
	
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
	
	<div class="container">
		<!-- 1. 기본정보 탭  -->
		<div class="pt-5 pb-3 border-bottom">
			<div class="tab-content">
		      <h5 class="text-secondary" id="inform-tabContent">계정정보</h5>  
		    </div>
		</div>
	</div>
	
	<div class="container">
		<div class="row pt-5">
			<!-- 2. 사이드바 -->
			<div class="col-4">
			<ul class="nav flex-column nav-pills" id="myTab" role="tablist" aria-orientation="vertical">
			  <li class="nav-item border-bottom">
			    <a class="nav-link text-muted active" id="edit-account" data-toggle="pill" href="#tab-edit-account" role="tab" aria-controls="v-pills-home" aria-selected="true">계정정보</a>
			  </li>
			  <li class="nav-item border-bottom">
			    <a class="nav-link text-muted" id="input-elder" data-toggle="pill" href="#tab-input-elder" role="tab" aria-controls="v-pills-profile" aria-selected="false">어르신정보</a>
			  </li>
			  <li class="nav-item border-bottom">
			    <a class="nav-link text-muted" id="message-box" data-toggle="pill" href="#tab-message-box" role="tab" aria-controls="v-pills-messages" aria-selected="false">쪽지함</a>
			  </li>
			  <li class="nav-item border-bottom">
			    <a class="nav-link text-muted" id="resume-box" data-toggle="pill" href="#tab-resume-box" role="tab" aria-controls="v-pills-settings" aria-selected="false">이력서</a>
			  </li>
			</ul>
		  </div>
		  <!-- 3. 내용 -->
		  <div class="col-8">
		    <div class="tab-content" id="nav-tabContent">
		      <div class="tab-pane fade show active" id="tab-edit-account" role="tabpanel" aria-labelledby="edit-account">1</div>
		      <div class="tab-pane fade show active" id="tab-edit-account" role="tabpanel" aria-labelledby="edit-account">${member.userid}</div>
		      <div class="tab-pane fade" id="tab-input-elder" role="tabpanel" aria-labelledby="input-elder">2</div>
		      <div class="tab-pane fade" id="tab-message-box" role="tabpanel" aria-labelledby="message-box">3</div>
		      <div class="tab-pane fade" id="tab-resume-box" role="tabpanel" aria-labelledby="resume-box">4</div>
		    </div>
		  </div>
		</div>
	</div>
	
	




</body>
</html>
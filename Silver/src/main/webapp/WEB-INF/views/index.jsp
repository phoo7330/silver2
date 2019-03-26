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
		  		<a class="nav-item nav-link" href="searchDetail2">
		  			검색상세페이지2</a>	
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

	<!-- 점보트론 --> 
	<header class="mathead">
		<div class="jumbotron">			
			<div class="row mb-3">
			    <div class="col-md-7">
					<h1 class="display-4 my-5 mx-5">전국 요양기관 정보 </h1>
					<h2 class="display-5 mx-5">실버서퍼에서 확인하세요.</h2>
			    </div>  
				<div class="col-md-4">
					<div class="card border-light bg-light my-5">
						<div class="card-body">
							<p class="lead font-weight-normal my-4">원하시는 지역 혹은 기관을 <br> 검색해보세요.</p>
							
							<hr class="my-4">
							
					        <form class="form-inline" action="search"> 
					            <div class="form-row col-12">
									<div class="col-md-10 mb-5 mb-md-0">
										<input class="form-control h-110 w-100 mr-lg-1 " type="text" placeholder="지역 혹은 기관명 검색을 검색하세요.">
									</div>
									<div class="col-md-2">
										<button class="btn btn-block btn-lg btn-light btn-sm" type="submit"><img src="resources/image/search.svg" ></button>
									</div> 
					            </div>
					        </form>
						</div>
					</div>
				</div>	
				<div class="col-md-1">
				</div>
			</div>  
		</div>
	</header>


	<!-- jQuery javaScript 추가 -->
	<script src="resources/js/jquery.min.js"></script>
	
	<!-- Popper javaScript 추가 -->
	<script src="resources/js/popper.min.js"></script>
	
	<!-- Bootstrap javaScript 추가 -->
	<script src="resources/js/bootstrap.min.js"></script>
	

</body>
</html>
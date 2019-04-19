<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
	<title>SilverSurfer</title>
	
	<!-- 인코딩 -->
	<meta charset="UTF-8">
	<meta  name="viewport" content="width-device-width, initial-scale=1, shrink-to-fit=no">

	<!-- Bootstrap CSS 추가 -->
	<link rel="stylesheet" href="resources/css/bootstrap.min.css">
	
	<!-- Custom CSS 추가 -->
	<link rel="stylesheet" href="resources/css/custom.css">
	<!-- 제이쿼리 추가 -->
	<script src="resources/js/jquery.min.js"></script>

</head>
<script type="text/javascript">
$(function(){
		if('${message}'!=''){
			alert('${message}');
		};
});
</script>
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
			  			<a class="nav-link text-light mr-3" href="search"><strong>요양기관</strong><span class="sr-only">(current)</span></a>
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
			  		<li class="log">
			  			<div class="dropdown mr-5">
			  				<span class="welcome"><small>환영합니다</small></span>
			  					<a class="dropdown-toggle text-light" href="#" role="button" id="dropdownMenuLink" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
			  						<small>${sessionScope.loginId}님</small>
			  					</a>
				  			<div class="dropdown-menu" aria-labelledby="dropdownMenuLink">
				  				<a class="dropdown-item" href="mypage"><small>마이페이지</small></a>
				  				<a class="dropdown-item" href="logout"><small>로그아웃</small></a>
				  			</div>
			  			</div>
			  		</li>
				</ul>
			  	</c:if>
			</div>  
		</nav>	
	</header>
	<!-- 메인 캐러셀 -->
	<div id="mainCarousel" class="carousel slide carousel-fade justify-content-between pt-5 mt-3" data-ride="carousel">
	    <div class="carousel-inner" role="listbox">
			<div class="carousel-item active">
				<!--Mask color-->
				<div class="view">
		        	<img class="d-block w-100" src="resources/image/main01.png" alt="First slide">
		        	<div class="mask rgba-black-light"></div>
				</div>
				<div class="carousel-caption">
		        	<h3 class="h3-responsive text-dark">전국 요양 서비스</h3>
					<p class="text-dark">전국의 노인 요양 시설,<br>실버서퍼에서 찾아보세요.</p>
				</div>
			</div>
			<div class="carousel-item">
			<!--Mask color-->
				<div class="view">
					<img class="d-block w-100" src="resources/image/main02.png" alt="Second slide">
					<div class="mask rgba-black-strong"></div>
				</div>
				<div class="carousel-caption">
					<h3 class="h3-responsive text-dark">요양 종사자 마당</h3>
					<p class="text-dark">전국 요양기관 구인 구직,<br>실버서퍼에서 찾아보세요.</p>
				</div>
			</div>
			<!--Logo-->
		  <a class="carousel-control-prev w-50 active" href="adminlogin" role="button" data-slide="prev">
		    <span class="pb-2 pr-5"><img src="resources/image/carouselLogo.png"></span>
		  </a>
		</div>
	</div>

	<!-- 검색 네비게이션 -->
	<nav class="navbar border-top-0 p-3 m-0" id="search-nav">
		<div class="col-1"></div>
			<div class="col form-group mb-0">
				<form action="search">
					<div class="input-group md-form form-sm form-2">
					  <input class="form-control my-0 py-1 amber-border" type="text" placeholder="지역 혹은 기관명을 검색하세요." aria-label="Search">
				
					  <div class="input-group-append">
					  	<button class="btn btn-block btn-lg btn-light btn-sm" id="searchbtn" type="submit"><img src="resources/image/search.svg" ></button>
					   <!-- 
					    <span class="input-group-text amber lighten-3" id="basic-text1"><i class="fas fa-search text-grey"
					        aria-hidden="true"><img src="resources/image/search.svg"></i></span>
					  -->
					  </div>
					
					</div>
				</form>
			</div>
		<div class="col-1"></div>
	</nav>

<main role="main">


</main>



<!-- 
	기관 종류 설명
	<div class="container">
		<div class="card-deck col-md-12 row mt-5">
			카드01
	  		<div class="col-md-4 p-0 ">
				<div class="card">
					Card image
					<div class="view overlay">
						<img src="resources/image/card01.jpg" class="card-img-top" alt="photo">
						<div class="mask rgba-white-slight"></div>
					</div>
					Card content
					<div class="card-body text-center shadow-lg p-2 mb-3 rounded" style="background-color:#f8ae4c;">
					Title
			        <h4 class="card-title white-text">Title of the news</h4>
			        Text
			        <p class="card-text white-text">For</p>
			        <a href="#" class="btn btn-secondary btn-md waves-effect">Button</a>
					</div>
				</div>
			</div>
	 		카드02
	 		<div class="col-md-4 p-0">
				<div class="card border-white ">
					Card image
					<div class="view">
						<img src="resources/image/card02.jpg" class="card-img-top" alt="photo">
					</div>
					Card content
					<div class="card-body text-center shadow-lg p-2 mb-3 rounded" style="background-color:#d6dc3b;">
					Title
			        <h4 class="card-title white-text">Title of the news</h4>
			        Text
			        <p class="card-text white-text">For people in North Ayrshire (with illness, disability or frailty) who need support to live as well as possible</p>
			        <a href="#" class="btn btn-secondary btn-md waves-effect">Button</a>
					</div>
				</div>
			</div>
	 		카드03
	 		<div class="col-md-4 p-0">
				<div class="card border-white ">
					Card image
					<div class="view">
						<img src="resources/image/card03.jpg" class="card-img-top" alt="photo">
					</div>
					Card content
					<div class="card-body text-center shadow-lg p-2 mb-3 rounded" style="background-color:#4ac5e2;">
					Title
			        <h4 class="card-title white-text">Title of the news</h4>
			        Text
			        <p class="card-text white-text">For people in North Ayrshire (with illness, disability or frailty) who need support to live as well as possible</p>
			        <a href="#" class="btn btn-secondary btn-md waves-effect">Button</a>
					</div>
				</div>
			</div>
		</div>
	</div>	
-->
	
	<!-- 정리해야함 -->
	


	<!-- jQuery javaScript 추가 -->
	<script src="resources/js/jquery.min.js"></script>
	
	<!-- Popper javaScript 추가 -->
	<script src="resources/js/popper.min.js"></script>
	
	<!-- Bootstrap javaScript 추가 -->
	<script src="resources/js/bootstrap.min.js"></script>
	

</body>
</html>

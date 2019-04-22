<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>

	<title>SilverSurfer</title>
	
	<!-- Font Awesome -->
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.8.1/css/all.css">
	
	<!-- 인코딩 -->
	<meta charset="UTF-8">
	<meta  name="viewport" content="width-device-width, initial-scale=1, shrink-to-fit=no">

	<!-- Bootstrap CSS 추가 -->
	<link rel="stylesheet" href="resources/css/bootstrap.min.css">
	
	<!-- Custom CSS 추가 -->
	<link rel="stylesheet" href="resources/css/custom.css">
	<link rel="stylesheet" href="resources/css/index.css">
	
	<!-- 제이쿼리 추가 -->
	<script src="resources/js/jquery.min.js"></script>

	<!-- jQuery javaScript 추가 -->
	<script src="resources/js/jquery.min.js"></script>
	
	<!-- Popper javaScript 추가 -->
	<script src="resources/js/popper.min.js"></script>
	
	<!-- Bootstrap javaScript 추가 -->
	<script src="resources/js/bootstrap.min.js"></script>
	

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
	<div id="mainCarousel" class="carousel slide carousel-fade justify-content-between pt-5 mt-3 border-1" data-ride="carousel">
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
		  <a class="carousel-control-prev w-50 active" href="index" role="button" data-slide="prev">
		    <span class="pb-2 pr-5"><img src="resources/image/carouselLogo.png"></span>
		  </a>
		</div>
	</div>

	<nav class="navbar border-top-0 p-3 m-0" id="search-nav">
		<div class="col-1"></div>
			<div class="col form-group mb-0">
				<form action="search">
					<div class="input-group md-form form-sm form-2">
					  <input class="form-control my-0 py-1 amber-border" type="text" placeholder="지역 혹은 기관명을 검색하세요." aria-label="Search">
				
					  <div class="input-group-append">
					  	<button class="btn btn-block btn-lg btn-light btn-sm" id="searchbtn" type="submit"><img src="resources/image/search.svg"></button>
					  </div>
					
					</div>
				</form>
			</div>
		<div class="col-1"></div>
	</nav>

	<main role="main">
		<!-- Section -->
	<div class="col-md-12">
		<section class="text-center">
		  <h2 class="h1-responsive font-weight-bold text-center my-4">장기요양기관 종류</h2>
		  <p class="grey-text text-center w-responsive mx-auto mb-4">실버서퍼는 국민건강보험 평가를 통한 객관적인 요양 서비스 정보를 제공합니다. 안심하고 이용하세요.</p>
		  <!-- Grid row -->
		  <div class="row">
		    <!-- Grid column 1 -->
		    <div class="col-md-3 mb-4">
		      <!-- Card -->
		      <div class="card border-1 rounded-0" id="main-card1">
		        <!-- Card image -->
		        <div class="view view-cascade overlay">
		          <img src="" class="card-img-top">
		          <a>
		            <div class="mask rgba-white-slight"></div>
		          </a>
		        </div>
		        <!-- Card image -->
		        <div class="card-body text-center">
		          <h1 id="icon-size">
		            <i class="fas fa-user-md"></i>
		          </h1>
		          <h4 class="card-title m-4"><strong><a href="">요양병원</a></strong>
		          </h4>
		          <p class="card-text">요양환자 30인 이상을 수용할 수 있는 시설을 갖추고, 의료서비스 제공을 목적으로 개설된 의료기관입니다. 
		          </p>
		        </div>
		        <!-- Card content -->
		      </div>
		      <!-- Card -->
		    </div>
		    <!-- Grid column 1 end -->
		
		    <!-- Grid column 2 -->
		    <div class="col-md-3 mb-4">
		      <!-- Card -->
		      <div class="card border-1 rounded-0" id="main-card2">
		        <!-- Card image -->
		        <div class="view view-cascade overlay">
		          <img src="" class="card-img-top">
		          <a>
		            <div class="mask rgba-white-slight"></div>
		          </a>
		        </div>
		        <!-- Card image -->
		        <div class="card-body text-center">
		          <h1 id="icon-size">
		            <i class="fas fa-wheelchair"></i>
		          </h1>
		          <h4 class="card-title m-4"><strong><a href="">요양원</a></strong>
		          </h4>
		          <p class="card-text">병이나 기능장애·심신쇠약으로 자립해서 살기가 힘들고 간호를 받아야 하는 어르신들에게 의료보호와 복지서비스를 제공하는 통합적 시설입니다.
		          </p>
		        </div>
		        <!-- Card content -->
		      </div>
		      <!-- Card -->
		    </div>
		    <!-- Grid column 2 end -->
		    
		    <!-- Grid column 3 -->
		    <div class="col-md-3 mb-4">
		      <!-- Card -->
		      <div class="card border-1 rounded-0" id="main-card3">
		        <!-- Card image -->
		        <div class="view view-cascade overlay">
		          <img src="" class="card-img-top">
		          <a>
		            <div class="mask rgba-white-slight"></div>
		          </a>
		        </div>
		        <!-- Card image -->
		        <div class="card-body text-center">
		          <h1 id="icon-size">
		            <i class="fas fa-ambulance"></i>
		          </h1>
		          <h4 class="card-title m-4"><strong><a href="">방문시설</a></strong>
		          </h4>
		          <p class="card-text">재가장기요양기관으로 방문요양, 방문목욕, 방문간호, 주야간보호, 단기보호, 복지용구 등을 포함하는 시설입니다. 
		          </p>
		        </div>
		        <!-- Card content -->
		      </div>
		      <!-- Card -->
		    </div>
		    <!-- Grid column 3 end -->
		    
		    <!-- Grid column 4 -->
		    <div class="col-md-3 mb-4">
		      <!-- Card -->
		      <div class="card border-1 rounded-0" id="main-card4">
		        <!-- Card image -->
		        <div class="view view-cascade overlay">
		          <img src="" class="card-img-top">
		          <a>
		            <div class="mask rgba-white-slight"></div>
		          </a>
		        </div>
		        <!-- Card image -->
		        <div class="card-body text-center">
		          <h1 id="icon-size">
		            <i class="fas fa-hospital-alt"></i>
		          </h1>
		          <h4 class="card-title m-4"><strong><a href="">치매전담</a></strong>
		          </h4>
		          <p class="card-text">치매전담형 장기요양기관은 치매 어르신이 안정감을 느낄 수 있는 시설환경 제공, 전문인력 배치 및 치매 맞춤형 서비스를 제공합니다. 
		          </p>
		        </div>
		        <!-- Card content -->
		      </div>
		      <!-- Card -->
		    </div>
		    <!-- Grid column 4 end -->
		  </div>
		  <!-- Grid row -->
		</section>
		<!-- Section: Products v.1 -->
	</div>
	</main>

<div class="col-md-12 p-0">
	<div class="card border-0">
		<img src="resources/image/footer_bg.png" class="img-fluid" alt="Responsive image">
	</div>
</div>

<!-- Footer -->
<footer class="page-footer font-small">
     <!-- Copyright -->
     <div class="footer-copyright py-4 px-3 text-light">
       서울특별시 강남구 영동대로 513 4F <br/>
      Copyright (c) 2019 <span>Silver Surfer, Foundation for Smart Cloud IT Master</span> All Rights Reserved.
   </div>
</footer>

</body>
</html>

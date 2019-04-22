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
				<div class="carousel-caption pb-5">
		        	<h1 class="h3-responsive text-dark">전국 요양 서비스</h1>
					<p class="text-dark" id="p-caption">전국의 노인 요양 시설,<br>실버서퍼에서 찾아보세요.</p>
				</div>
			</div>
			<div class="carousel-item">
			<!--Mask color-->
				<div class="view">
					<img class="d-block w-100" src="resources/image/main02.png" alt="Second slide">
					<div class="mask rgba-black-strong"></div>
				</div>
				<div class="carousel-caption pb-5">
					<h1 class="h3-responsive text-dark">요양 종사자 마당</h1>
					<p class="text-dark" id="p-caption">전국 요양기관 구인 구직,<br>실버서퍼에서 찾아보세요.</p>
				</div>
			</div>
			<!--Logo-->
		  <a class="carousel-control-prev w-50 active" href="index" role="button" data-slide="prev">
		    <span class="pb-2 pr-5"><img src="resources/image/carouselLogo.png"></span>
		  </a>
		</div>
	</div>
	<!-- main -->
	<div role="main">
		<div class="container">
			<!-- headingOne -->
			<div class="accordion pt-5 pb-5" id="accordionExample">
			  <div class="card rounded-0">
			    <div class="card-header" id="heading1">
			      <h2 class="mb-0">
			        <button class="btn btn-link text-dark font-weight-bold" type="button" data-toggle="collapse" data-target="#collapse1" aria-expanded="true">
			          요양병원과 요양시설은 어떻게 다른가요?
			        </button>
			      </h2>
			    </div>
			    <!-- headingOne-collapseOne -->
			    <div id="collapse1" class="collapse show" aria-labelledby="heading1" data-parent="#accordionExample">
			      <div class="card-body">
			       요양병원은 치료목적으로 요양시설은 돌봄목적으로 운영되고 있습니다.<br>
			       요양병원은 의료법에 따라 노인성질환자, 만성질환자 등 장기입원이 필요한 환자를 대상으로 치료행위를 하며, 요양시설(장기요양기관)은 노인장기요양보험법에 따라 혼자서 일상생활을 수행하기 어려운 노인에게 신체활동 지원·간병 등의 돌봄서비스를 제공하고 있습니다.
			      </div>
			    </div>
			  </div>
			  <!-- headingTwo -->
			  <div class="card rounded-0">
			    <div class="card-header" id="heading2">
			      <h2 class="mb-0">
			        <button class="btn btn-link collapsed text-dark font-weight-bold" type="button" data-toggle="collapse" data-target="#collapse2" aria-expanded="false">
			          실버서퍼에 등록된 시설은 어떤 곳인가요?
			        </button>
			      </h2>
			    </div>
			    <!-- headingTwo-collapseTwo -->
			    <div id="collapse2" class="collapse" aria-labelledby="heading2" data-parent="#accordionExample">
			      <div class="card-body">
			       실버서퍼에는 전국의 요양병원, 요양시설(요양원), 재가시설(방문요양) 업체가 등록되어 있습니다.<br>
				   매 분기 기준으로 신규시설 및 폐업시설을 갱신하여, 최신의 정보를 제공해드리고자 노력하고 있습니다.
			      </div>
			    </div>
			  </div>
			  <!-- headingThree -->
			  <div class="card rounded-0">
			    <div class="card-header" id="heading3">
			      <h2 class="mb-0">
			        <button class="btn btn-link collapsed text-dark font-weight-bold" type="button" data-toggle="collapse" data-target="#collapse3" aria-expanded="false">
			          실버서퍼에서 표시하는 등급은 무엇인가요?
			        </button>
			      </h2>
			    </div>
			    <!-- headingThree-collapseThree -->
			    <div id="collapse3" class="collapse" aria-labelledby="heading3" data-parent="#accordionExample">
			      <div class="card-body">
			       요양병원의 경우 건강보험심사평가원의 객관적 평가결과를 표시하며,<br>
			       요양원, 방문요양시설 같은 장기요양기관의 경우 국민건강보험공단에서 실시한 평가결과를 표시합니다.
			      </div>
			    </div>
			  </div>
			  <!-- heading4 -->
			  <div class="card rounded-0">
			    <div class="card-header" id="heading4">
			      <h2 class="mb-0">
			        <button class="btn btn-link collapsed text-dark font-weight-bold" type="button" data-toggle="collapse" data-target="#collapse4" aria-expanded="false">
			          등급평가를 위한 심사는 어느정도 주기로 진행되나요?
			        </button>
			      </h2>
			    </div>
			    <!-- heading4-collapse4 -->
			    <div id="collapse4" class="collapse" aria-labelledby="heading4" data-parent="#accordionExample">
			      <div class="card-body">
			       요양병원의 경우 건강보험심사평가원에서 매년 실시하는 평가결과를 1~5등급으로 표시하며, 요양원(시설/방문)의 경우 국민건강보험공단에서 3년 단위 정기평가와 1~3년단위 수시평가의 결과를 A~E 등급으로 표시합니다.
			      </div>
			    </div>
			  </div>
			  <!-- heading5 -->
			  <div class="card rounded-0">
			    <div class="card-header" id="heading5">
			      <h2 class="mb-0">
			        <button class="btn btn-link collapsed text-dark font-weight-bold" type="button" data-toggle="collapse" data-target="#collapse5" aria-expanded="false">
			          각 시설에서 등급없음, 정보없음이 의미하는 것은 무엇인가요?
			        </button>
			      </h2>
			    </div>
			    <!-- heading5-collapse5 -->
			    <div id="collapse5" class="collapse" aria-labelledby="heading5" data-parent="#accordionExample">
			      <div class="card-body">
			       평가 예정일 기준 '수급자 3인 미만, 행정처분 및 휴업' 등의 사유로 요양기관 평가를 받지 않은 경우나, 시설을 신규로 설립 평가대상이 아닌 경우에 해당합니다. 평가 정보가 없다고하여, 꼭 안좋은 시설이라는 말은 아니랍니다. 평가 예정일 기준 '수급자 3인 미만, 행정처분 및 휴업' 등의 사유로 요양기관 평가를 받지 않은 경우나, 시설을 신규로 설립 평가대상이 아닌 경우에 해당합니다. 평가 정보가 없다고하여, 꼭 안좋은 시설이라는 말은 아니랍니다.
			      </div>
			    </div>
			  </div>
			  <!-- heading6 -->
			  <div class="card rounded-0">
			    <div class="card-header" id="heading6">
			      <h2 class="mb-0">
			        <button class="btn btn-link collapsed text-dark font-weight-bold" type="button" data-toggle="collapse" data-target="#collapse6" aria-expanded="false">
			          각 요양시설의 등급별 현황은 어떻게 되나요?
			        </button>
			      </h2>
			    </div>
			    <!-- heading6-collapse6 -->
			    <div id="collapse6" class="collapse" aria-labelledby="heading6" data-parent="#accordionExample">
			      <div class="card-body">
			       요양병원의 경우 전국 1500여개 시설 중 2017년 기준<br>
			       1등급 202 / 2등급 512 / 3등급 305 / 4등급 143 / 5등급 57 등급 외 320 곳이며<br>
			       장기요양기관의 2017년 수시평가의 경우<br>
			       A등급 22.8% / B등급 29.9% / C등급 21.6% / D등급 13.4% / E등급 12.3%으로 나뉩니다.
			      </div>
			    </div>
			  </div>
			</div>
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
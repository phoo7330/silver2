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
	<link rel="stylesheet" href="<c:url value="/resources/css/facility.css"/>">
	
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

	<!-- 메인 네비게이션 -->
	<header>
		<nav class="navbar navbar-expand-md navbar-dark fixed-top p-3" id="main-nav">
	 		<a class="navbar-brand mr-5 p-0" href="facilitymypage"><img src="resources/image/silversurferLogo.png"></a>
	 		<!-- 오른쪽 상단 토글러 버튼 -->
			<button class="navbar-toggler pt-0" type="button" data-toggle="collapse" data-target="#navbarCollapse" aria-controls="navbarCollapse" aria-expanded="false" aria-label="Toggle navigation">
	      	<span class="navbar-toggler-icon"></span>
			</button>
			<!-- 네비게이션 상단 메뉴 -->
			<div class="collapse navbar-collapse justify-content-between" id="navbarCollapse">
				<ul class="navbar-nav">
					<li class="nav-item active" style="color: black;">
			  			<a class="nav-link text-light mr-3" href="#"><strong>기관정보</strong><span class="sr-only">(current)</span></a>
			  		</li>
			  		<li class="nav-item">
			  			<a class="nav-link text-light mr-3" href="#"><strong>구인정보</strong></a>
			  		</li>
			  		<li class="nav-item">
			  			<a class="nav-link text-light mr-3" href="#"><strong>인재정보</strong></a>	
			  		</li>
			  		<li class="nav-item">
			  			<a class="nav-link text-light mr-3" href="#"><strong>메세지함</strong></a>	
			  		</li>
			  	</ul>
				<!-- 로그아웃 -->
				<ul class="navbar-nav mt-2 mt-md-0">
				  <li class="nav-item">
				  	<a class="nav-link text-light" href="index"><small>로그아웃</small></a>
				  </li>
				</ul>
			  
			</div>  
		</nav>	
	</header>
	
<!-- 상단 점보트론 -->
	<div class="jumbotron text-center hoverable p-0 mb-0">
	
	  <!-- Grid row -->
	  <div class="row container col-md-12 p-0 m-0">
	
	    <!-- col -->
	    <div class="col">
	    </div>
	    <div class="col-md-4 offset-md-1 m-5">
	      <!-- 이미지 미리보기 -->
	      <div class="view overlay">
	        <div class="view view-cascade overlay border">
	        </div>
	        <!-- 파일업로드 -->
			<form>
	          <div class="form-group mt-2">
	            <label for="uploadPicture"><strong>기관 사진 업로드</strong></label>
	            <input type="file" class="form-control-file" id="uploadPicture">
	          </div>
			</form>
	      </div>
	    </div>
	    
		<!-- col -->
	    <div class="col">
	    </div>
	    
	    <div class="col-md-4 text-md-left m-5">
	      <!-- Excerpt -->
	      <a href="#!" class="green-text">
	        <h6><i class="fas fa-desktop pr-1"></i> 요양병원</h6>
	        <h4>"grade" - 최우수 </h4>
	      </a>			
	      <h4 class="h4 mb-4">"silvername"</h4>
	      <p class="font-weight-normal">"areaa, areab, areac"</p>
	      <p class="font-weight-normal">"service"</p>
	      <a class="btn btn-info">정보 수정 요청</a>
	    </div>
	    <!-- col -->
		<div class="col">
	    </div>
	  </div>
	  <!-- Grid row -->	
	</div>

<!-- 하단 수정 메뉴 -->
<div class="main">
	<!-- Grid row -->
	<div class="row">
	
	  <!-- Grid column 1 -->
	  <div class="col-md-4 pr-0">
	
	    <!--Card Primary-->
	    <div class="card cardMenu">
	      <div class="card-body" id="column1">
	        <div class="row col-md-12">
	          <h5 class="col-md-9 font-weight-bold mb-4">기관정보</h5>
	        	<h5><a class="col-md-3 float-right" href="#"><strong>+</strong></a></h5>
	        </div>
			<!--Card Contents-->
	          <div class="row col-md-12">
	            <p class="col-md-5">설립정보</p>
	            <p class="col"><strong>"설립정보"</strong></p>
	          </div>
	          <div class="row col-md-12">
	            <p class="col-md-5">봉사활동</p>
	            <p class="col"><strong>"봉사활동"</strong></p>
	          </div>
	          <div class="row col-md-12">
	            <p class="col-md-5">간병형태</p>
	            <p class="col"><strong>"간병형태"</strong></p>
	          </div>
	          <div class="row col-md-12">
	            <p class="col-md-5">입지정보</p>
	            <p class="col"><strong>"입지정보"</strong></p>
	          </div>
	          <div class="row col-md-12">
	            <p class="col-md-5">종교활동</p>
	            <p class="col"><strong>"종교활동"</strong></p>
	          </div>
	          <div class="row col-md-12">
	            <p class="col-md-5">전화번호</p>
	            <p class="col"><strong>"전화번호"</strong></p>
	          </div>
	        <!-- card-body -->
	        </div>
	      <!-- Edit-button -->
	      <div class="card-footer border-0" id="column1">
	      	<button type="button" id="editbtn-3" class="btn btn-outline-secondary">수정</button>
	      </div>
	    <!-- cardMenu -->
	    </div>
	  <!-- col-md-5 p-0 -->
	  </div>
	  
	  <!-- Grid column 2 -->
	  <div class="col-md-4 pl-0 pr-0" >
	
	    <!--Card Primary-->
	    <div class="card cardMenu">
	      <div class="card-body" id="column2">
	        <div class="row col-md-12">
	          <h5 class="col-md-9 font-weight-bold mb-4">진료시간</h5>
	        	<h5><a class="col-md-3 float-right" href="#"><strong>+</strong></a></h5>
	        </div>
						<!--Card Contents-->
	          <div class="row col-md-12">
	            <p class="col-md-5">쉬는날</p>
	            <p class="col"><strong>"쉬는날"</strong></p>
	          </div>
	          <div class="row col-md-12">
	            <p class="col-md-5">점심시간</p>
	            <p class="col"><strong>"점심시간"</strong></p>
	          </div>
	          <div class="row col-md-12">
	            <p class="col-md-5">접수시간</p>
	            <p class="col"><strong>"접수시간"</strong></p>
	          </div>
	        <!-- card-body -->
	        </div>
	      <!-- Edit-button -->
	      <div class="card-footer border-0" id="column2">
	      	<button type="button" id="editbtn-2" class="btn btn-outline-secondary">수정</button>
	      </div>
	    <!-- cardMenu -->
	    </div>
	  <!-- col-md-5 p-0 -->
	  </div>
	
	  <!-- Grid column 3 -->
	  <div class="col-md-4 pl-0">
	
	    <!--Card Primary-->
	    <div class="card cardMenu">
	      <div class="card-body" id="column3">
	        <div class="row col-md-12">
	          <h5 class="col-md-9 font-weight-bold mb-4">시설정보</h5>
	        	<h5><a class="col-md-3 float-right" href="#"><strong>+</strong></a></h5>
	        </div>
				<!--Card Contents-->
	          <div class="row col-md-12">
	            <p class="col-md-5">물리치료</p>
	            <p class="col"><strong>"물리치료"</strong></p>
	          </div>
	          <div class="row col-md-12">
	            <p class="col-md-5">상급병상</p>
	            <p class="col"><strong>"상급병상"</strong></p>
	          </div>
	          <div class="row col-md-12">
	            <p class="col-md-5">일반병상</p>
	            <p class="col"><strong>"일반병상"</strong></p>
	          </div>
	        <!-- card-body -->
	        </div>
	      <!-- Edit-button -->
	      <div class="card-footer border-0" id="column3">
	      	<button type="button" id="editbtn-3" class="btn btn-outline-secondary">수정</button>
	      </div>
	    <!-- cardMenu -->
	    </div>
	  <!-- col-md-5 p-0 -->
	  </div>
	  
	<!-- row -->
	</div>
</div>


<!-- 
	<nav class="navbar border-top-0 p-3 m-0" id="search-nav">
		<div class="col-1"></div>
			<div class="col form-group mb-0">
				<div class="tab-content">
					<h4 class="m-0" id="inform-tabContent">기본정보</h4>  
		    	</div> 
			</div>
		<div class="col-1"></div>
	</nav>
 -->

<!-- 			
			<div class="col-4">
			<ul class="nav flex-column nav-pillsy" id="myTab" role="tablist" aria-orientation="vertical">
			  <li class="nav-item border-bottom">
			    <a class="nav-link text-muted active" id="edit-information" data-toggle="pill" href="#tab-edit-information" role="tab" aria-controls="v-pills-home" aria-selected="true">  
			    기본정보</a>
			  </li>
			  <li class="nav-item border-bottom">
			    <a class="nav-link text-muted" id="input-elder" data-toggle="pill" href="#tab-input-elder" role="tab" aria-controls="v-pills-profile" aria-selected="false">  
			    진료시간</a>
			  </li>
			  <li class="nav-item border-bottom">
			    <a class="nav-link text-muted" id="message-box" data-toggle="pill" href="#tab-message-box" role="tab" aria-controls="v-pills-messages" aria-selected="false">  
			    시설정보</a>
			  </li>
			  <li class="nav-item border-bottom">
			    <a class="nav-link text-muted" id="resume-box" data-toggle="pill" href="#tab-resume-box" role="tab" aria-controls="v-pills-settings" aria-selected="false">  
			    게시판</a>
			  </li>
			</ul>
		  </div>
 -->		  


</body>
</html>
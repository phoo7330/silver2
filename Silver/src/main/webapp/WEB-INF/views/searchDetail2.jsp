<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>

	<title>실버서퍼-기관검색</title>
	
	<!-- 인코딩 -->
	<meta charset="UTF-8">
	<meta  name="viewport" content="width-device-width, initial-scale=1, shrink-to-fit=no">
	<script type="text/javascript" src="https://openapi.map.naver.com/openapi/v3/maps.js?ncpClientId=ynuycabqm2"></script>
	<script type="text/javascript" src="resources/src/MarkerClustering.js"></script>
    
	<!-- Bootstrap CSS 추가 -->
	<link rel="stylesheet" href="resources/css/bootstrap.min.css">
	
	<!-- Custom CSS 추가 -->
	<link rel="stylesheet" href="resources/css/custom.css">
	<link rel="stylesheet" href="resources/css/search.css">

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
	
	<!-- 왼쪽/기관정보 -->
	<div class="position-relative overflow-hidden p-1 p-md-1 m-md-1 bg-white">
		<div class="row mb-1">
		<div class="col-md-1">
		</div>
    		<div class="col-md-4" id="ilist">
	    		<div class="col p-4 d-flex flex-column position-static">
		    		<strong class="d-inline-block md-2 my-3 text-danger"><img src="resources/image/plussquare.svg">"siltype"</strong>
		    		<h2 class="mb-0">"item.silvername"</h2>
					<div class="mb-1 text-musted">"item.areaa+item.areab+item.areac"</div>
		    		<p class="text-light bg-dark" style="width: 6rem;">"item.service"</p>
				</div>
			</div>
		<div class="col-md-2">
		</div>
		<!-- 오른쪽/등급 -->
			<div class="col-md-4">
				<div class="card-deck p-4 d-flex flex-column position-static text-center" >
					<div class="card mb-1 shadow-sm card border-info" id="card-all">
						<div class="card-header">
							<h4 class="my-4 font-weight-normal">"item.grade"</h4>
						</div>
						<div class="card-body">
					        <h4 class="card-title pricing-card-title">최우수기관</h4>
						</div>
					</div>
				</div>
			</div>
			<div class="col-md-1">
			</div>
		</div>
	</div>

	<!-- 하단 네비게이션 바 -->
	
	<nav class="nav-scroller py-1 mb-2 sticky-top bg-light border-bottom" id="nav-under">
		<div class="container">
			<div class="nav"> 
		  		<a class="nav-item nav-link text-secondary active" href="#basic">
		  			<strong>상세정보</strong> <span class="sr-only">(current)</span> </a>
		  		<a class="nav-item nav-link text-secondary" href="#picandmap">
		  			<strong>사진/주소</strong> </a>
		  		<a class="nav-item nav-link text-secondary" href="#board">
		  			<strong>게시판</strong> </a>	
			</div>
		</div>
	</nav>
	
	<!--  
   public class Details {
   private int detail_seq;
   private int seach_seq;
   private int detail_number; // 기관일련번호 /1 
   private String establishment; // 설립일 / 1 
   private String approval; // 승인일 / 1 
   private String address; // 주소 / 4 
   private String house_number; // 연락처 / 1 
   private String parkinglot; // 주차시설
	-->
	
	<!-- 1. 기본정보 탭  -->
	<div class="container" id="basic">
		<div class="d-flex justify-content-between flex-wrap flex-md-nowrap align-items-center pt-3 pb-2 mb-3 border-bottom">
		<h4 class="n1 text-secondary"><small>기본정보</small></h4>
		</div>
		<!-- 내용 -->
		<div class="card-deck col-md-12">
			<!-- 기관일련번호 -->
			
				<div class="card-deck p-1 d-flex flex-column position-static text-center" >
					<div class="card mb-1 shadow-sm card border-info" id="card-content">
						<div class="card-header">
							<div class="mb-1 my-3 text-musted">기관일련번호</div>
						</div>
						<div class="card-body">
							<div class="mb-1 text-musted">"detail_number"</div>
						</div>
					</div>
				</div>
			
			<!-- 설립일 -->
			
				<div class="card-deck p-1 d-flex flex-column position-static text-center" >
					<div class="card mb-1 shadow-sm card border-info" id="card-content">
						<div class="card-header">
							<div class="mb-1 my-3 text-musted">설립일</div>
						</div>
						<div class="card-body">
							<div class="mb-1 text-musted">"establishment"</div>
						</div>
					</div>
				</div>
			
			<!-- 승인일 -->
		
				<div class="card-deck p-1 d-flex flex-column position-static text-center" >
					<div class="card mb-1 shadow-sm card border-info" id="card-content">
						<div class="card-header">
							<div class="mb-1 my-3 text-musted">승인일</div>
						</div>
						<div class="card-body">
							<div class="mb-1 text-musted">"approval"</div>
						</div>
					</div>
				</div>
				
			<!-- 연락처 -->
		
				<div class="card-deck p-1 d-flex flex-column position-static text-center" >
					<div class="card mb-1 shadow-sm card border-info" id="card-content">
						<div class="card-header">
							<div class="mb-1 my-3 text-musted">연락처</div>
						</div>
						<div class="card-body">
							<div class="mb-1 text-musted">"house_number"</div>
						</div>
					</div>
				</div>
			
	
			<div class="col-md-2">
			</div>

			<div class="col-md-2">
			</div>
			
		</div>
	</div><br>

	<!-- 2. 주차시설 탭  -->
	<div class="container">
		<div class="d-flex justify-content-between flex-wrap flex-md-nowrap align-items-center pt-3 pb-2 mb-3 border-bottom">
		<h4 class="n1 text-secondary"><small>시설정보</small></h4>
		</div>
		<!-- 내용 -->
		<div class="row">
			<div class="d-flex flex-row">
				<div class="p-1 align-self-start">
				<img class="mb-1 mt-3" src="resources/image/info.svg">
				</div>
				<div class="p-1 align-self-end">
				<div class="mb-1 my-3 text-musted">"parkinglot"</div>
				</div>
			</div>
		</div>
	</div>
	<br>
	
	<!-- 4. 사진 & 주소  -->
	<div class="container" id="picandmap">
		<div class="d-flex justify-content-between flex-wrap flex-md-nowrap align-items-center pt-3 pb-2 mb-3 border-bottom">
		<h4 class="n1 text-secondary"><small>사진/주소</small></h4>
		</div>
		<!-- 주소 -->
		<div class="row">
			<div class="d-flex flex-row">
				<div class="p-1 align-self-start">
				<img class="mb-3 my-3" src="resources/image/mappin.svg">
				</div>
				<div class="p-1 align-self-end">
				<div class="mb-3 my-3 text-musted">"address"</div>
				</div>
			</div>
		</div>
		<br>
		<div class="row">
		<!-- 사진 -->
		<div class="col-md-6">
			<div class="card" id="picture">
				<img src="resources/image/image.svg" class="rounded my-auto" alt="">
			</div>
		</div>
		<!-- 지도 -->
		<div class="col-md-6">
			<div class="card" id="map">
				<img src="resources/image/map.svg" class="rounded my-auto" alt="">
			</div>
		</div>
		</div>
	</div>	
	<br>
	
	<!-- 5. 시설게시판  -->
	<div class="container" id="board">
		<div class="d-flex justify-content-between flex-wrap flex-md-nowrap align-items-center pt-3 pb-2 mb-3 border-bottom">
		<h4 class="n1 text-secondary"><small>시설게시판</small></h4>
		</div>
		<!-- 게시판 : 게시판 VO가 없어서 매칭되지 않는 부분 확인 바라요. 번호/제목/날짜-->
		<p class="lead"><small>전체 이용후기 0</small></p>
		<table class="table text-center">
			<thead class="thead-light">
				<tr>
					<th scope="col">번호</th>
					<th scope="col">제목</th>
					<th scope="col">"userid"</th>
					<th scope="col">"sysdate"</th>
				</tr>
			</thead>
			<tbody class="table-sm">
				<tr>
					<td>sequence</td>
					<td>contents</td>
					<td>"userid"</td>
					<td>sysdate</td>
				</tr>
			</tbody>
		</table>
		<!-- 글쓰기버튼 : 모달로 창을 띄울지, 새로운 jsp 페이지로 만들지 논의 필요 -->
		<a href="#" class="btn btn-info btn-sm float-right">글쓰기</a>
		
		<!-- 페이징 -->
		<ul class="pagination pagination-sm justify-content-center">
			<li class="page-item disabled">
				<span class="page-link">&laquo;</span>
			</li>
			<li class="page-item"><a class="page-link" href="#">1</a></li>
			<li class="page-item"><a class="page-link" href="#">2</a></li>
			<li class="page-item"><a class="page-link" href="#">3</a></li>
			<li class="page-item"><a class="page-link" href="#">4</a></li>
			<li class="page-item"><a class="page-link" href="#">5</a></li>
			<li class="page-item">
				<span class="page-link">&raquo;</span>
			</li>
		</ul>
	</div>	
	
	<!-- jQuery javaScript 추가 -->
	<script src="resources/js/jquery.min.js"></script>
	
	<!-- Popper javaScript 추가 -->
	<script src="resources/js/popper.min.js"></script>
	
	<!-- Bootstrap javaScript 추가 -->
	<script src="resources/js/bootstrap.min.js"></script>

</body>
</html>
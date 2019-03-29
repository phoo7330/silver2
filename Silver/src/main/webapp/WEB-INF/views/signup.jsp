<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>

	<title>회원가입</title>
	
	
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

	<!-- 회원가입 선택 -->
	<div class="container" id="select-signup">
		<div class="py-5 text-center">
			<img class="mb-4" src="resources/image/user.svg" alt="" width="72" height="72"> 
			<div class="signup-header px-5 py-0">
				<h4 class="my-1">회원가입</h4>
				<p class="lead">실버서퍼 가입시 일반사용자,종사자,기관관리자가 구분됩니다. 기관 관리자 담당자는 기관관리자 버튼을 눌러주세요.</p>
			</div>
		</div>
		
		<!-- 사용자 구분 -->
	<div class="card-deck mb-3 text-center">
	<div class="col-1">
	</div>
	<div class="col-5">
		<div class="card mb-5 shadow-sm">
			<div class="card-header">
				<h4 class="my-0 font-weight-normal">일반가입자</h4>
			</div>
			<div class="card-body">
				<h4 class="card-title pricing-card-title">일반·종사자 가입</h4>
				<ul class="list-unstyled mt-3 mb-4">
				<li>일반사용자와 요양기관 구직</li>	
				<li>하고있는 종사자로 등록하기</li>		          
				</ul>
				<button id="custombtn" type="button" class="btn btn-lg btn-block btn-outline-info">가입하기</button>
			</div>
		</div>
	</div>
	<div class="col-5">
		<div class="card mb-5 shadow-sm">
			<div class="card-header">
				<h4 class="my-0 font-weight-normal">기관담당자</h4>
			</div>
			<div class="card-body">
				<h4 class="card-title pricing-card-title">기관관리자 가입</h4>
				<ul class="list-unstyled mt-3 mb-4">
				<li>실제 요양기관을 운영중인</li>
				<li>기관 담당자 등록하기</li>
				</ul>
				<button id="facilitybtn" type="button" class="btn btn-lg btn-block btn-outline-info">가입하기</button>
			</div>
		</div>
	</div>
	<div class="col-1">
	</div>
	</div>	
</div>

	<!-- 일반가입자 회원가입 -->
	<form class="form-signup" id="custom-signup" action="insertMember" method="post">
		
		<div class="container">
		<!-- 상단 -->
		<div class="py-5 text-center">
			<img class="mb-4" src="resources/image/userplus.svg" alt="" width="72" height="72"> 
			<div class="signup-header px-5 py-0">
				<h4 class="my-1">회원가입</h4>
				<p class="lead">일반가입자 회원가입 페이지 입니다.</p>
			</div>
		</div>
		
		<div class="p-3 col-12">
		
			
			<!-- 가입자구분 -->
			<div class="form-group row">
			<div class="col-sm-3">
			</div>
				<label for="inputType" class="col-sm-2 col-form-label">가입자 구분</label>
				<div class="col-sm-4">
					<div class="form-check form-check-inline">
						<input class="form-check-input" type="radio" name="type" id="custom" value=1 checked>
						<label class="form-check-label" for="custom">일반가입자</label>
					</div>
					<div class="form-check form-check-inline">
						<input class="form-check-input" type="radio" name="type" id="worker" value=2>
						<label class="form-check-label" for="worker">종사자</label>
					</div>
				</div>
			<div class="col-sm-3">
			</div>
			</div>
			<!-- 아이디 -->
	  		<div class="form-group row">
	  		<div class="col-sm-3">
			</div>
			    <label for="inputId" class="col-sm-2 col-form-label">아이디</label>
			    <div class="col-sm-4">
			      <input type="text" name="userid" class="form-control" id="inputId" value="${member.userid}" placeholder="아이디">
			    </div>
			<div class="col-sm-3">
			</div>
	  		</div>
	  		<!-- 패스워드 -->
			<div class="form-group row">
			<div class="col-sm-3">
			</div>
			    <label for="inputPwd" class="col-sm-2 col-form-label">패스워드</label>
			    <div class="col-sm-4">
			      <input type="password" name="userpwd" class="form-control" id="inputPwd" value="${member.userpwd}" placeholder="패스워드">
				  <small id="passwordHelpInline" class="text-muted"> 영문 소문자+숫자 조합입니다.</small>
			    </div>
			<div class="col-sm-3">
			</div>
			</div>	
			<!-- 이름 -->
			<div class="form-group row">
			<div class="col-sm-3">
			</div>
			    <label for="inputName" class="col-sm-2 col-form-label">이름</label>
			    <div class="col-sm-4">
			      <input type="text" name="username" class="form-control" id="inputName" value="${member.username}" placeholder="이름">
			    </div>
			<div class="col-sm-3">
			</div>
			</div>	
			<!-- 생년월일 -->
			<div class="form-group row">
			<div class="col-sm-3">
			</div>
			    <label for="inputBirth" class="col-sm-2 col-form-label">생년월일</label>
			    <div class="col-sm-4">
			      <input type="date" name="birthday" class="form-control" id="inputBirth" value="${member.birthday}">
			    </div>
			<div class="col-sm-3">
			</div>
			</div>	
			<!-- 성별 -->
			<div class="form-group row">
			<div class="col-sm-3">
			</div>
				<label for="inputType" class="col-sm-2 col-form-label">성별</label>
				<div class="col-sm-4">
					 <select class="custom-select my-1 mr-sm-2" name="gender" id="inputGender">
					    <option selected>선택</option>
					    <option name="gender" value="남성">남성</option>
					    <option name="gender" value="여성">여성</option>
					  </select>
				</div>
			<div class="col-sm-3">
			</div>
			</div>
			<!-- 이메일 -->
  			<div class="form-group row">
  			<div class="col-sm-3">
			</div>
			    <label for="inputEmail" class="col-sm-2 col-form-label">이메일</label>
			    <div class="col-sm-4">
			      <input type="email" name="email" class="form-control" id="inputEmail" value="${member.email}" placeholder="이메일">
			    </div>
			<div class="col-sm-3">
			</div>
			</div>	
			<!-- 주소 -->
			<div class="form-group row">
			<div class="col-sm-3">
			</div>
			    <label for="inputAddress" class="col-sm-2 col-form-label">주소</label>
			    <div class="col-sm-4">
			      <input type="text" name="address" class="form-control" id="inputAddress" value="${member.address}" placeholder="주소">
			    </div>
			<div class="col-sm-3">
			</div>
			</div>
			
			<!-- 경고값 초기화(3.26일 김동우 수정) -->
			<input type="hidden" name="warning" value=0>
			
			<!-- 제출버튼 -->
			<div class="form-group row">
			<div class="col-sm-3">
			</div>
				<div class="col-sm-6">
				<button type="submit" id="signupbtn" class="btn btn-info btn-lg btn-block">회원가입</button>
				</div>
			<div class="col-sm-3">
			</div>
			</div>
			
		
		</div> 
	</div>
	</form>

	<!-- jQuery javaScript 추가 -->
	<script src="resources/js/jquery.min.js"></script>
	
	<!-- Popper javaScript 추가 -->
	<script src="resources/js/popper.min.js"></script>
	
	<!-- Bootstrap javaScript 추가 -->
	<script src="resources/js/bootstrap.min.js"></script>
	
	<!-- 일반로그인 스크립트 -->
	<script>
 	 $(function(){
		 $("#custom-signup").hide();
		 
		 $('#custombtn').on('click',function(){
			 console.log("aaa");
			 $("#select-signup").hide();
			 $("#custom-signup").show(); 
		 });
	 });  
	</script>

</body>
</html>
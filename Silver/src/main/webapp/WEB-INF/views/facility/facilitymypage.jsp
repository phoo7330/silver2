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
	<div class="jumbotron text-center hoverable p-0 border-under">
	
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
	        <h6 class="h6 pb-1"><i class="fas fa-desktop pr-1"></i> 요양병원</h6>
	        <h4 class="h4 mb-4">"grade" - 최우수 </h4>
	      </a>			
	      <h4 class="h4 mb-4">"silvername"</h4>
	      <p class="font-weight-normal">"areaa, areab, areac"</p>
	      <p class="font-weight-normal">"service"</p>
	      <a class="btn btn-success">정보 수정 요청</a>
	    </div>
	    <!-- col -->
		<div class="col">
	    </div>
	    
	  </div>
	  <!-- Grid row -->	
	</div>


<!-- 하단 컨텐츠 -->
	
	<div class="container pt-3">
		<!-- 1. 기본정보 탭  -->
		<div class="border-bottom" id="basicTab">
			<div class="tab-content">
				<h4 class="text-secondary" id="inform-tabContent">기본정보</h4>  
		    </div>
		</div>
	</div>
	
	<div class="container">
		<div class="row pt-5">
			<!-- 2. 사이드바 -->
			<div class="col-4">
			<ul class="nav flex-column nav-pillsy" id="myTab" role="tablist" aria-orientation="vertical">
			  <li class="nav-item border-bottom">
			    <a class="nav-link text-muted active" id="edit-information" data-toggle="pill" href="#tab-edit-information" role="tab" aria-controls="v-pills-home" aria-selected="true"><img src="resources/image/lock.svg">  
			    기본정보</a>
			  </li>
			  <li class="nav-item border-bottom">
			    <a class="nav-link text-muted" id="input-elder" data-toggle="pill" href="#tab-input-elder" role="tab" aria-controls="v-pills-profile" aria-selected="false"><img src="resources/image/userplus.svg">  
			    진료시간</a>
			  </li>
			  <li class="nav-item border-bottom">
			    <a class="nav-link text-muted" id="message-box" data-toggle="pill" href="#tab-message-box" role="tab" aria-controls="v-pills-messages" aria-selected="false"><img src="resources/image/messagecircle.svg">  
			    시설정보</a>
			  </li>
			  <li class="nav-item border-bottom">
			    <a class="nav-link text-muted" id="resume-box" data-toggle="pill" href="#tab-resume-box" role="tab" aria-controls="v-pills-settings" aria-selected="false"><img src="resources/image/filetext.svg">  
			    게시판</a>
			  </li>
				
			</ul>
		  </div>
		  <!-- 3. 내용 -->
		  <div class="col-8">
		    <div class="tab-content" id="nav-tabContent">
		    	
				<div class="tab-pane fade show active" id="tab-edit-information" role="tabpanel" aria-labelledby="edit-account">
				<!-- 1) 개인정보 -->
				<form action="updateMember" method="post">
				<div class="card border mb-3" id="card-edit-account">
					<div class="container">
						<div class="pt-5 pb-1 border-bottom">
							<div class="tab-content">
						      <h5 class="text-secondary" id="inform-tabContent">개인정보</h5>  
						    </div>
						</div>
						<!-- 아이디 : disabled (form 부분통합,김동우 수정)-->
						
							<div class="form-group row pt-5">
							<div class="col-sm-1"></div>
								<label for="editName" class="col-sm-2 col-form-label col-form-label-sm"><small>아이디</small></label>
							    <div class="col-sm-8">
									<input type="text" class="form-control form-control-sm" id="editName" placeholder="${member.userid}" disabled>
							    </div>
							</div>
						
						<!-- 패스워드 : 두 컬럼의 패스워드 두개가 일치하지 않는 경우 수정 불가-->
						
							<div class="form-group row pt-4">
							<div class="col-sm-1"></div>
								<label for="editPassword" class="col-sm-2 col-form-label col-form-label-sm"><small>비밀번호</small></label>
							    <div class="col-sm-4 pr-1">
									<input type="password" class="form-control form-control-sm" name="userpwd" id="editPassword" placeholder="비밀번호">
							    </div>
							    <div class="col-sm-4 pl-1">
									<input type="password" class="form-control form-control-sm" id="editPassword" placeholder="비밀번호 확인">
							    </div>
							</div>
							
						<!-- 생년월일 : 기존 정보가 디폴트로 들어가 있어야 함 -->
						
							<div class="form-group row pt-4">
							<div class="col-sm-1"></div>
								<label for="editBirth" class="col-sm-2 col-form-label col-form-label-sm"><small>생년월일</small></label>
							    <div class="col-sm-8">
									<input type="date" class="form-control form-control-sm" id="editBirth" name="birthday" >
							    </div>
							</div>
						
						<!-- 성별 : 기존 정보가 디폴트로 들어가 있어야 함 -->
						
<!-- 패딩 수정 -->			<div class="form-group row pt-4 pb-4">
							<div class="col-sm-1"></div>
								<label for="editBirth" class="col-sm-2 col-form-label col-form-label-sm"><small>성별</small></label>
							    <div class="col-sm-8">
									 <select class="custom-select custom-select-sm my-1 mr-sm-2" name="gender" id="inputGender">
									    <option selected>선택</option>
									    <option id="gender" value="남성">남성</option>
									    <option id="gender" value="여성">여성</option>
									  </select>
							    </div>
							</div>		
					
					</div>	
				</div>
				<!-- 1-2. 연락처 -->
				<div class="card border mb-3" id="card-edit-account">
					<div class="container">
						<div class="pt-5 pb-1 border-bottom">
							<div class="tab-content">
						      <h5 class="text-secondary" id="inform-tabContent">연락처</h5>  
						    </div>
						</div>
						<!-- 이메일 : 기존 정보가 디폴트로 들어가 있어야 함 (김동우 수정 form부분통합) -->
						
							<div class="form-group row pt-5">
							<div class="col-sm-1"></div>
								<label for="editEmail" class="col-sm-2 col-form-label col-form-label-sm"><small>이메일</small></label>
     							<div class="col-sm-8">
     								<input type="email" class="form-control form-control-sm" id="editEmail" name="email" placeholder="이메일을 입력하세요.">
							    </div>
							</div>
						
						<!-- 전화번호 : 가입 시 없는 정보이기 때문에 빈 값 -->
						
<!-- 패딩 수정 -->			<div class="form-group row pt-4 pb-4">
							<div class="col-sm-1"></div>
								<label for="editEmail" class="col-sm-2 col-form-label col-form-label-sm"><small>전화번호</small></label>
     							<div class="col-sm-8">
     								<input type="number" class="form-control form-control-sm" id="editEmail" name="telephone" placeholder="전화번호를 입력하세요.">
							    	<small id="phoneHelp" class="form-text text-muted">"-" 없이 연락처를 입력하세요.</small>
							    </div>
							</div>
						
					</div>	
				</div>
				<!-- 1-3. 가입자구분 -->
				<div class="card border mb-3" id="card-edit-account">
					<div class="container">
						<div class="pt-5 pb-1 border-bottom">
							<div class="tab-content">
						      <h5 class="text-secondary" id="inform-tabContent">가입자 구분</h5>  
						    </div>
						</div>
						<!-- 가입자 구분 : 기존 정보가 디폴트로 들어가 있어야 함 -->
						
				<div class="form-group row pt-5">
							<div class="col-sm-1"></div>
								<label for="editType" class="col-sm-2 col-form-label col-form-label-sm"><small>가입자 구분</small></label>
     							<div class="col-sm-4">
     								<div class="form-check form-check-inline">
										<input class="form-check-input" type="radio" name="type" id="custom" value=1 checked>
										<label class="form-check-label form-check-sm" for="custom"><small>일반가입자</small></label>
									</div>
								</div>
								<div class="col-sm-4">
									<div class="form-check form-check-inline">
										<input class="form-check-input" type="radio" name="type" id="worker" value=2>
										<label class="form-check-label form-check-sm" for="worker"><small>종사자</small></label>
									</div>
							    </div>
							</div>
						
						<!-- 첨부파일 : 첨부파일 없을 시 '종사자'로 수정 불가 -->

							<div class="form-group row pt-4 pt-4">
							<div class="col-sm-1"></div>
								<label for="uploadLicense" class="col-sm-2 col-form-label col-form-label-sm" id="forFile"><small>자격증</small></label>
     							<div class="col-sm-8">
     								<div class="custom-file" id="attachedFile">
									  <input type="file" class="file-input" id="licenseFile" lang="ko">
									  <small id="licenseHelp" class="form-text text-muted">자격증 파일을 선택하세요.</small>
									</div>
							    </div>
							</div>
						
					</div>	
				
				</div>	
					<!-- 수정 버튼  -->
					<div class="text-center pt-3 pb-5">
						<button type="submit" id="submitbtn" class="btn btn-outline-secondary">수정</button>
					</div>
					</form>
				</div>
				
				<!-- 2) 어르신정보 -->
				
				<div class="tab-pane fade" id="tab-input-elder" role="tabpanel" aria-labelledby="input-elder">
					<form action="insertSenior" method="POST">
					<!-- 2-1. 기본정보 -->
					<div class="card border mb-3" id="card-edit-account">
						<div class="container">
							<div class="pt-5 pb-1 border-bottom">
								<div class="tab-content">
							      <h5 class="text-secondary" id="inform-tabContent">기본정보</h5>  
							    </div>
							    <small id="selecteHelp" class="form-text text-muted">요양시설 돌봄이 필요한 어르신 정보를 입력하세요.</small>
							</div>
							<!-- 생년월일 등록 -->
							
								<div class="form-group row pt-5">
								<div class="col-sm-1"></div>
									<label for="inputBirth" class="col-sm-2 col-form-label col-form-label-sm"><small>생년월일</small></label>
								    <div class="col-sm-8">
										<input type="date" class="form-control form-control-sm" id="inputBirth" name="sc_birthday">
								    </div>
								</div>
							
							<!-- 이름 등록 -->
							
								<div class="form-group row pt-5">
								<div class="col-sm-1"></div>
									<label for="inputName" class="col-sm-2 col-form-label col-form-label-sm"><small>이름</small></label>
	     							<div class="col-sm-8">
	     								<input type="text" class="form-control form-control-sm" id="inputName" placeholder="성함을 입력하세요." name="sc_name">
								    </div>
								</div>
							
							<!-- 혈액형 등록 -->
							
<!-- 패딩 수정 -->			<div class="form-group row pt-5 pb-4">
								<div class="col-sm-1"></div>
									<label for="bloodType" class="col-sm-2 col-form-label col-form-label-sm"><small>혈액형</small></label>
								    <div class="col-sm-8">
										 <select class="custom-select custom-select-sm my-1 mr-sm-2" id="bloodType" name="sc_bloodtype">
										    <option selected>선택</option>
										    <option value="A">A</option>
										    <option value="B">B</option>
										    <option value="O">O</option>
										    <option value="AB">AB</option>
										  </select>
								    </div>
								</div>		
							
						</div>	
					</div>
					<!-- 2-2. 일상생활 수행정도 -->
					<div class="card border mb-3" id="card-edit-account">
						<div class="container">
							<div class="pt-5 pb-1 border-bottom">
								<div class="tab-content">
							      <h5 class="text-secondary" id="inform-tabContent">일상생활 수행정도</h5>  
							    </div>
							    <small id="selecteHelp" class="form-text text-muted">스스로 가능, 도움 필요, 스스로 불가능 중 수행정도를 선택하세요.</small>
							</div>
							<!-- 수행정도 선택폼 : 현재 vo 없음 -->
							
								<div class="form-group row pt-5">
									<label for="meal" class="col-sm-2 col-form-label col-form-label-sm text-center"><small>식사</small></label>
								    <div class="col-sm-4">
										 <select class="custom-select custom-select-sm my-1 mr-sm-2" id="meal" name="scd_meal">
										    <option selected>선택</option>
										    <option value="스스로 가능">스스로 가능</option>
										    <option value="도움 필요">도움 필요</option>
										    <option value="스스로 불가능">스스로 불가능</option>
										  </select>
								    </div>
								    <label for="walking" class="col-sm-2 col-form-label col-form-label-sm text-center"><small>보행</small></label>
								    <div class="col-sm-4">
										 <select class="custom-select custom-select-sm my-1 mr-sm-2" id="walking" name="scd_care">
										    <option selected>선택</option>
										    <option value="스스로 가능">스스로 가능</option>
										    <option value="도움 필요">도움 필요</option>
										    <option value="스스로 불가능">스스로 불가능</option>
										  </select>
								    </div>
								</div>
								<div class="form-group row pt-3">
									<label for="washing" class="col-sm-2 col-form-label col-form-label-sm text-center"><small>세면</small></label>
								    <div class="col-sm-4">
										 <select class="custom-select custom-select-sm my-1 mr-sm-2" id="washing" name="scd_washing">
										    <option selected>선택</option>
										    <option value="스스로 가능">스스로 가능</option>
										    <option value="도움 필요">도움 필요</option>
										    <option value="스스로 불가능">스스로 불가능</option>
										  </select>
								    </div>
								    <label for="clothing" class="col-sm-2 col-form-label col-form-label-sm text-center"><small>의복</small></label>
								    <div class="col-sm-4">
										 <select class="custom-select custom-select-sm my-1 mr-sm-2" id="clothing" name="scd_clothing">
										    <option selected>선택</option>
										    <option value="스스로 가능">스스로 가능</option>
										    <option value="도움 필요">도움 필요</option>
										    <option value="스스로 불가능">스스로 불가능</option>
										  </select>
								    </div>
								</div>
								<div class="form-group row pt-3">
									<label for="bath" class="col-sm-2 col-form-label col-form-label-sm text-center"><small>목욕</small></label>
								    <div class="col-sm-4">
										 <select class="custom-select custom-select-sm my-1 mr-sm-2" id="bath" name="scd_bath">
										    <option selected>선택</option>
										    <option value="스스로 가능">스스로 가능</option>
										    <option value="도움 필요">도움 필요</option>
										    <option value="스스로 불가능">스스로 불가능</option>
										  </select>
								    </div>
								    <label for="washroom" class="col-sm-2 col-form-label col-form-label-sm text-center"><small>화장실</small></label>
<!-- 패딩 수정 -->						<div class="col-sm-4 pb-4">
										 <select class="custom-select custom-select-sm my-1 mr-sm-2" id="washroom" name="scd_toilet">
										    <option selected>선택</option>
										    <option value="스스로 가능">스스로 가능</option>
										    <option value="도움 필요">도움 필요</option>
										    <option value="스스로 불가능">스스로 불가능</option>
										  </select>
								    </div>
								</div>						
							
						</div>	
					</div>
					<!-- 2-3. 질환정보 -->
					<div class="card border mb-3" id="card-edit-account">
						<div class="container">
							<div class="pt-5 pb-1 border-bottom">
								<div class="tab-content">
							      <h5 class="text-secondary" id="inform-tabContent">질환정보</h5>  
							    </div>
							    <small id="selecteHelp" class="form-text text-muted">가지고 계신 질환을 선택해 주세요.</small>
							</div>
							<!-- 질환정보 등록 -->
							
<!-- 패딩 수정 -->					<div class="form-group row pt-4 pb-4 text-center">
								    <div class="col-sm-12">
										<div class="form-check form-check-inline p-3">
										  <input class="form-check-input" type="checkbox" id="disease_information" name="scd_disease" value="황달">
										  <label class="form-check-label" for="inlineCheckbox1">황달</label>
										</div>
										<div class="form-check form-check-inline p-3">
										  <input class="form-check-input" type="checkbox" id="disease_information" name="scd_disease" value="고혈압">
										  <label class="form-check-label" for="inlineCheckbox2">고혈압</label>
										</div>
										<div class="form-check form-check-inline p-3">
										  <input class="form-check-input" type="checkbox" id="disease_information" name="scd_disease" value="저혈압">
										  <label class="form-check-label" for="inlineCheckbox3">저혈압</label>
										</div>
										<div class="form-check form-check-inline p-3">
										  <input class="form-check-input" type="checkbox" id="disease_information" name="scd_disease" value="관절염">
										  <label class="form-check-label" for="inlineCheckbox4">관절염</label>
										</div>
										<div class="form-check form-check-inline p-3">
										  <input class="form-check-input" type="checkbox" id="disease_information" name="scd_disease" value="근육장애">
										  <label class="form-check-label" for="inlineCheckbox5">근육장애</label>
										</div>
										<div class="form-check form-check-inline p-3">
										  <input class="form-check-input" type="checkbox" id="disease_information" name="scd_disease" value="등병증">
										  <label class="form-check-label" for="inlineCheckbox6">등병증</label>
										</div>
										<div class="form-check form-check-inline p-3">
										  <input class="form-check-input" type="checkbox" id="disease_information" name="scd_disease" value="보행장애">
										  <label class="form-check-label" for="inlineCheckbox7">보행장애</label>
										</div>
										<div class="form-check form-check-inline p-3">
										  <input class="form-check-input" type="checkbox" id="disease_information" name="scd_disease" value="요실금">
										  <label class="form-check-label" for="inlineCheckbox8">요실금</label>
										</div>
										<div class="form-check form-check-inline p-3">
										  <input class="form-check-input" type="checkbox" id="disease_information" name="scd_disease" value="우울증">
										  <label class="form-check-label" for="inlineCheckbox9">우울증</label>
										</div>
										<div class="form-check form-check-inline p-3">
										  <input class="form-check-input" type="checkbox" id="disease_information" name="scd_disease" value="뇌졸증">
										  <label class="form-check-label" for="inlineCheckbox10">뇌졸증</label>
										</div>
										<div class="form-check form-check-inline p-3">
										  <input class="form-check-input" type="checkbox" id="disease_information" name="scd_disease" value="뇌출혈">
										  <label class="form-check-label" for="inlineCheckbox11">뇌출혈</label>
										</div>
										<div class="form-check form-check-inline p-3">
										  <input class="form-check-input" type="checkbox" id="disease_information" name="scd_disease" value="뇌경색증">
										  <label class="form-check-label" for="inlineCheckbox12">뇌경색증</label>
										</div>
										<div class="form-check form-check-inline p-3">
										  <input class="form-check-input" type="checkbox" id="disease_information" name="scd_disease" value="골절">
										  <label class="form-check-label" for="inlineCheckbox13">골절</label>
										</div>
										<div class="form-check form-check-inline p-3">
										  <input class="form-check-input" type="checkbox" id="disease_information" name="scd_disease" value="당뇨">
										  <label class="form-check-label" for="inlineCheckbox14">당뇨</label>
										</div>
										<div class="form-check form-check-inline p-3">
										  <input class="form-check-input" type="checkbox" id="disease_information" name="scd_disease" value="위장염">
										  <label class="form-check-label" for="inlineCheckbox15">위장염</label>
										</div>
										<div class="form-check form-check-inline p-3">
										  <input class="form-check-input" type="checkbox" id="disease_information" name="scd_disease" value="안면통증">
										  <label class="form-check-label" for="inlineCheckbox16">안면통증</label>
										</div>
										<div class="form-check form-check-inline p-3">
										  <input class="form-check-input" type="checkbox" id="disease_information" name="scd_disease" value="오십견">
										  <label class="form-check-label" for="inlineCheckbox17">오십견</label>
										</div>
										<div class="form-check form-check-inline p-3">
										  <input class="form-check-input" type="checkbox" id="disease_information" name="scd_disease" value="욕창">
										  <label class="form-check-label" for="inlineCheckbox18">욕창</label>
										</div>
										<div class="form-check form-check-inline p-3">
										  <input class="form-check-input" type="checkbox" id="disease_information" name="scd_disease" value="척추병">
										  <label class="form-check-label" for="inlineCheckbox19">척추병</label>
										</div>
										<div class="form-check form-check-inline p-3">
										  <input class="form-check-input" type="checkbox" id="disease_information" name="scd_disease" value="치매">
										  <label class="form-check-label" for="inlineCheckbox20">치매</label>
										</div>
										<div class="form-check form-check-inline p-3">
										  <input class="form-check-input" type="checkbox" id="disease_information" name="scd_disease" value="파킨슨병">
										  <label class="form-check-label" for="inlineCheckbox21">파킨슨병</label>
										</div>
										<div class="form-check form-check-inline p-3">
										  <input class="form-check-input" type="checkbox" id="disease_information" name="scd_disease" value="패혈증">
										  <label class="form-check-label" for="inlineCheckbox22">패혈증</label>
										</div>
										<div class="form-check form-check-inline p-3">
										  <input class="form-check-input" type="checkbox" id="disease_information" name="scd_disease" value="폐렴">
										  <label class="form-check-label" for="inlineCheckbox23">폐렴</label>
										</div>
								    </div>
								</div>
							
						</div>	
					</div>
					<!-- 수정 버튼  -->
					<div class="text-center pt-3 pb-5">
						<button type="submit" id="submitbtn" class="btn btn-outline-secondary">등록</button>
					</div>	
				</form>
				</div>
				
				<!-- 3-3. 쪽지함 -->
				<div class="tab-pane fade" id="tab-message-box" role="tabpanel" aria-labelledby="message-box">
					<div class="card border mb-3" id="card-edit-account">
						<div class="container">
							<!-- 쪽지함 네비게이션 1)받은쪽지함 2)보낸쪽지함 3)쪽지쓰기 -->
							<ul class="nav nav-tabs nav-fill pt-3" id="message-tab" role="tablist">
							  <li class="nav-item">
							    <a class="nav-link active" id="receive-message" data-toggle="pill" href="#pills-receive" role="tab" aria-controls="pills-home" aria-selected="true">받은쪽지함</a>
							  </li>
							  <li class="nav-item">
							    <a class="nav-link" id="send-message" data-toggle="pill" href="#pills-send" role="tab" aria-controls="pills-profile" aria-selected="false">보낸쪽지함</a>
							  </li>
							  <li class="nav-item">
							    <a class="nav-link" id="write-message" data-toggle="pill" href="#pills-write" role="tab" aria-controls="pills-contact" aria-selected="false">쪽지쓰기</a>
							  </li>
							</ul>
							<!-- 네비게이션 연결 -->
							<div class="tab-content" id="pills-tabContent">
								<!-- 받은쪽지함 -->
								<div class="tab-pane fade show active" id="pills-receive" role="tabpanel" aria-labelledby="pills-home-tab">
									<!-- 삭제/답장 버튼 -->
									<div class="form-group row pt-3 pb-0">
										<div class="col-sm-12">
								   			<button type="button" id="delbtn" class="btn btn-outline-secondary btn-sm">삭제</button>
								   			<button type="button" id="replybtn" class="btn btn-outline-secondary btn-sm">답장</button>
										</div>
									</div>
									<!-- 쪽지 리스트 테이블 -->
									<table class="table table-sm">
									  <thead>
									    <tr class="table-bordered text-center">
									      <th scope="col"><small>선택</small></th>
									      <th scope="col"><small>보낸사람</small></th>
									      <th scope="col"><small>내용</small></th>
									      <th scope="col"><small>날짜</small></th>
									    </tr>
									  </thead>
									  <!-- 체크박스: 다중선택 후 삭제 / 답장의 경우 한개만 선택 가능 -->
									  <tbody>
									    <tr class="text-center">
									      <th scope="row">
											<div class="form-check">
												<input class="form-check-input position-static" type="checkbox" id="blankCheckbox" value="option1">
											</div></th>
										  <td>"Sender"</td>
										  <td><label class="form-check-label" for="selectContents">"contents"</label></td>
										  <td>"sysdate"</td>
									    </tr>
									  </tbody>
									</table>
									<!-- 페이지네이션 -->
									<nav aria-label="Page navigation">
									  <ul class="pagination pagination-sm justify-content-center">
									    <li class="page-item">
									      <a class="page-link" aria-label="Previous">
									        <span aria-hidden="true">&laquo;</span>
									      </a>
									    </li>
									    <li class="page-item"><a class="page-link">1</a></li>
									    <li class="page-item"><a class="page-link">2</a></li>
									    <li class="page-item"><a class="page-link">3</a></li>
									    <li class="page-item">
									      <a class="page-link" aria-label="Next">
									        <span aria-hidden="true">&raquo;</span>
									      </a>
									    </li>
									  </ul>
									</nav>
								</div>
								<!-- 보낸쪽지함 -->
								<div class="tab-pane fade" id="pills-send" role="tabpanel" aria-labelledby="pills-profile-tab">
									<!-- 삭제 버튼 -->
									<div class="form-group row pt-3 pb-0">
										<div class="col-sm-12">
								   			<button type="button" id="delbtn" class="btn btn-outline-secondary btn-sm">삭제</button>
										</div>
									</div>
									<!-- 쪽지 리스트 테이블 -->
									<table class="table table-sm">
									  <thead>
									    <tr class="table-bordered text-center">
									      <th scope="col"><small>선택</small></th>
									      <th scope="col"><small>받는사람</small></th>
									      <th scope="col"><small>내용</small></th>
									      <th scope="col"><small>날짜</small></th>
									    </tr>
									  </thead>
									  <!-- 체크박스: 다중선택 후 삭제 / 답장의 경우 한개만 선택 가능 -->
									  <tbody>
									    <tr class="text-center">
									      <th scope="row">
											<div class="form-check">
												<input class="form-check-input position-static" type="checkbox" id="blankCheckbox" value="option1">
											</div></th>
										  <td>"Recipient"</td>
										  <td><label class="form-check-label" for="selectContents">"contents"</label></td>
										  <td>"sysdate"</td>
									    </tr>
									  </tbody>
									</table>
									<!-- 페이지네이션 -->
									<nav aria-label="Page navigation">
									  <ul class="pagination pagination-sm justify-content-center">
									    <li class="page-item">
									      <a class="page-link" aria-label="Previous">
									        <span aria-hidden="true">&laquo;</span>
									      </a>
									    </li>
									    <li class="page-item"><a class="page-link">1</a></li>
									    <li class="page-item"><a class="page-link">2</a></li>
									    <li class="page-item"><a class="page-link">3</a></li>
									    <li class="page-item">
									      <a class="page-link" aria-label="Next">
									        <span aria-hidden="true">&raquo;</span>
									      </a>
									    </li>
									  </ul>
									</nav>
								</div>
								<!-- 쪽지쓰기 -->
								<div class="tab-pane fade" id="pills-write" role="tabpanel" aria-labelledby="pills-contact-tab">
								<!-- 보내기 버튼 -->
									<div class="form-group row pt-3 pb-0">
										<div class="col-sm-12">
								   			<button type="button" id="delbtn" class="btn btn-outline-secondary btn-sm">보내기</button>
										</div>
									</div>
								<!-- 받는사람 -->
								<form>
								  <div class="form-group row">
								    <label for="writeRecipient" class="col-sm-2 col-form-label col-form-label-sm"><small>받는사람</small></label>
								    <div class="col-sm-10">
								      <input type="text" class="form-control form-control-sm" id="writeRecipient" placeholder="받는사람을 입력하세요.">
								    </div>
								   </div>
								</form>
									<div class="form-group pb-3">
									    <textarea class="form-control" id="writeMessage" rows="10"></textarea>
									</div>
								</div>
							</div>									
						</div>
					</div>
				</div>
				<!-- 3-4. 이력서 / 종사자 계정 구분 만든 후 -->
				<div class="tab-pane fade" id="tab-resume-box" role="tabpanel" aria-labelledby="resume-box">
<!-- 수정: 이력서 양식 추가 -->
					<div class="card border mb-3" id="card-agree">
						<div class="container">
							<div class="pt-5 pb-1 border-bottom">
								<div class="tab-content">
							      <h5 class="text-secondary" id="inform-tabContent">개인정보 수집동의</h5>  
							    </div>
							    <small id="selecteHelp" class="form-text text-muted">개인정보보호법 제 15조에 의한 수집・이용 동의</small>
							</div>
							<div class="group pt-4">
							    
								<ul class="lst lst_hypn">
								   <li><span class="lst_head">-</span>실버서퍼는 고객님의 개인정보를 아래와 같이 처리함을 알려드립니다.</li>
								</ul>
								<ul class="lst lst_hypn ml_35">
									<li><span class="lst_head">1.</span>개인정보의 수집· 이용 목적</li>
									<li><span class="lst_head lst_hypn">○</span><span class="fontStress">실버서퍼 홈페이지는 다음의 목적을 위해 개인정보를 수집 및 이용합니다.</span></li>
									<li><span class="lst_head lst_hypn">○</span><span class="fontStress">수집된 개인정보는 정해진 목적 이외의 용도로는 이용되지 않으며 수집목적이 변경 될 경우</span></li>
									<li><span class="lst_head lst_hypn">&nbsp;</span> <span class="fontStress">사전에 알리고 동의를 받을 예정입니다.</span></li>
									<li><span class="lst_head lst_hypn">-</span> <span class="fontStress">홈페이지 구직서비스 제고를 위해 수집</span></li>
								</ul>
								<ul class="lst lst_hypn ml_35">
									<li><span class="lst_head">2.</span>수집하려는 개인정보의 항목</li>
									<li><span class="lst_head lst_hypn">○</span><span class="fontStress">필수항목 : 성명, 성별, 생년월일, 휴대전화번호, 자격사항, 전화번호, E-mail, 주소, 희망직종, 희망지역, 근무형태 </span></li>
									<li><span class="lst_head lst_hypn">○</span><span class="fontStress">선택항목 : 상세근무형태, 게시기간, 기타사항</span></li>
								</ul>
								<ul class="lst lst_hypn ml_35">
								    <li><span class="lst_head">3.</span>개인정보의 파기(관련 법령에 따라 일정기간 저장)</li>
								    <li><span class="lst_head lst_hypn">○</span>실버서퍼 홈페이지는 원칙적으로 <span class="fontStress">개인정보 보존기간이 경과하거나, 처리목적이 달성된 경우에는 지체없이 해당 개인정보를 파기</span>합니다.</li>
							        <li><span class="lst_head lst_hypn">&nbsp;</span> <span class="fontStress">다만, 다른법령에 따라 보존하여야 하는 경우에는 그러하지 않을 수 있습니다.</span></li>
								    <li><span class="lst_head lst_hypn">○</span><span class="fontStress">이용자가 입력한 정보는 회원탈퇴 등 목적 달성 후 관련 법령에 따라</span></li>
							        <li><span class="lst_head lst_hypn">&nbsp;</span> <span class="fontStress">일정기간 저장 후 파기 됩니다.</span></li>
								    <li><span class="lst_head lst_hypn">-</span> <span class="fontStress">수집근거 : 정보주체의 동의</span></li>
								    <li><span class="lst_head lst_hypn">-</span> <span class="fontStress">보존기간 : "이력서"  등록부터  3년보유 후 삭제</span></li>
								</ul>
							    <ul class="lst lst_hypn ml_35">
							        <li><span class="lst_head">4.</span>동의를 거부 할 권리가 있다는 사실과 동의 거부에 따른 불이익 내용</li>
							        <li><span class="lst_head lst_hypn">○</span>이용자는 실버서퍼 홈페이지에서 수집하는 개인정보에 대해 동의를 거부 할 권리가 있으며,</li>
							        <li><span class="lst_head lst_hypn">&nbsp;</span> <font color="red">동의 거부시에는 이력서 작성 서비스가 제한 됩니다.</font></li>
							    </ul>
							    <div class="card text-center" id="agreeRadio">
							    <div class="click_box">   
							        <div class="btn_wrap ta_c">
							            <label class="m-0 p-2"><input type="checkbox" id="check1"/><strong> 개인정보보호법 제 15조에 의한 수집·이용에 동의합니다.</strong></label><!-- &nbsp;&nbsp;&nbsp; -->

							        </div>
							    </div>
							    </div>
							</div>
							
							<div class="group text-center">
							    <div class="btn-group p-4">
									<button type="button" class="btn btn-outline-secondary mx-1" id="agreebtn">동의함</button>
									<button type="button" class="btn btn-outline-secondary mx-1" id="disagreebtn">동의안함</button>	  
								</div>
							</div>
						</div>
					</div>
					<!-- 이력서 양식 -->
					<div class="card border mb-3" id="card-resume">
						<div class="container">
							<div class="pt-5 pb-1 border-bottom">
								<div class="tab-content">
							      <h5 class="text-secondary" id="inform-tabContent">이력서 양식 </h5>  
							    </div>
							</div>
							<!-- 개인정보 -->
							<label for="facilityForm" class="col-form-label col-form-label-lg pt-3"><strong>개인정보</strong></label>
							<p class="text-muted"><small>* 표시는 필수입력 사항입니다.</small></p>
							<table class="table table-bordered" id="facilityForm">
								<tbody>
								    <tr>
										<th class="bg-light w-30">* 성명</th>
										<th>"member.username"</th>
										<th class="bg-light w-30">성별</th>
										<th>"member.gender"</th>
								    </tr>
	                				<tr>
										<td class="bg-light">* 생년월일</td>
										<td>"member.birthday"</td>
										<td class="bg-light">* 전화번호</td>
										<td>"member.telephone"</td>
								    </tr>
							    	<tr>
										<td class="bg-light">주소</td>
										<td colspan="3">
					                      <form class="form-inline my-3 row">									
						                      <div class="form-group col-md-12">
						                        <select class="form-control form-control-sm col mr-1" name="sido1" id="sido1"></select>
						                        <select class="form-control form-control-sm col mr-1" name="gugun1" id="gugun1"></select>
						                      </div>
						                  </form>	
										
						                      <div class="form-group my-3">
						                      	<input type="text" class="form-control form-control-sm" placeholder="나머지 주소를 입력하세요." id="dong1">
						                      </div>      
										</td>
									</tr>
									<tr>
										<td class="bg-light">자격사항</td>
										<td colspan="3">
					                      <div class="form-group my-3">
					                        <select class="form-control form-control-sm" name="qualify1" id="qualify1"></select>
					                      </div>
										</td>
									</tr>
							 	</tbody>
							</table>
							<!-- 구직정보 -->
							<label for="facilityForm" class="col-form-label col-form-label-lg pt-3"><strong>구직정보</strong></label>
							<table class="table table-bordered" id="facilityForm">
								<tbody>
									<tr>
										<th class="bg-light w-30">* 희망직종</th>
										<th colspan="3">
											<div class="form-group my-3">
						                      <select class="form-control form-control-sm" name="job1" id="job1"></select>
											</div>
										</th>
									</tr>
									<tr>
										<td class="bg-light">* 희망지역</td>
										<td colspan="3">
											<form class="form-inline my-3 row">									
						                      <div class="form-group col-md-12">
						                        <select class="form-control form-control-sm col mr-1" name="sido1" id="sido1"></select>
						                        <select class="form-control form-control-sm col" name="gugun1" id="gugun1"></select>
						                      </div>
											</form>
										</td>
									</tr>
									<tr>
										<td class="bg-light">* 근무형태</td>
										<td colspan="3">
											<form class="form-inline my-3 row">									
						                      <div class="form-group col-md-12">
												<select class="form-control form-control-sm col mr-1" name="work1" id="work1"></select>
												<select class="form-control form-control-sm col" name="detail" id="detail"></select>
						                      </div>
											</form>
										</td>
									</tr>
									<tr>
										<td class="bg-light">기타사항</td>
										<td colspan="3" class="etc p-0 mb-0">
											<textarea class="form-control p-0" id="exampleFormControlTextarea5" rows="4"></textarea>
										</td>
									</tr>
								</tbody>
							</table>
							
						<!-- .container -->	
						</div>
					<!-- 이력서 양식 -->	
					</div>
				<!-- 3-4. 이력서 -->
				</div>
				<!-- 저장 버튼 -->
							<div class="text-center pt-3 pb-5">
								<button type="submit" id="savebtn" class="btn btn-outline-secondary">저장</button>
							</div>
				<!-- .tab-content -->
				</div>
			<!-- .col-8 -->
			</div>
		<!-- .row pt-5 -->
		</div>
	<!-- .container -->
	</div>

</body>
</html>
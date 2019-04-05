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
			<ul class="nav flex-column nav-pillsy" id="myTab" role="tablist" aria-orientation="vertical">
			  <li class="nav-item border-bottom">
			    <a class="nav-link text-muted active" id="edit-account" data-toggle="pill" href="#tab-edit-account" role="tab" aria-controls="v-pills-home" aria-selected="true"><img src="resources/image/lock.svg">  계정정보</a>
			  </li>
			  <li class="nav-item border-bottom">
			    <a class="nav-link text-muted" id="input-elder" data-toggle="pill" href="#tab-input-elder" role="tab" aria-controls="v-pills-profile" aria-selected="false"><img src="resources/image/userplus.svg">  어르신정보</a>
			  </li>
			  <li class="nav-item border-bottom">
			    <a class="nav-link text-muted" id="message-box" data-toggle="pill" href="#tab-message-box" role="tab" aria-controls="v-pills-messages" aria-selected="false"><img src="resources/image/messagecircle.svg">  쪽지함</a>
			  </li>
			  <li class="nav-item border-bottom">
			    <a class="nav-link text-muted" id="resume-box" data-toggle="pill" href="#tab-resume-box" role="tab" aria-controls="v-pills-settings" aria-selected="false"><img src="resources/image/filetext.svg">  이력서</a>
			  </li>
			</ul>
		  </div>
		  <!-- 3. 내용 -->
		  <div class="col-8">
		    <div class="tab-content" id="nav-tabContent">
		    	
				<div class="tab-pane fade show active" id="tab-edit-account" role="tabpanel" aria-labelledby="edit-account">
				<!-- 1) 개인정보 -->
				<div class="card border mb-3" id="card-edit-account">
					<div class="container">
						<div class="pt-5 pb-1 border-bottom">
							<div class="tab-content">
						      <h5 class="text-secondary" id="inform-tabContent">개인정보</h5>  
						    </div>
						</div>
						<!-- 아이디 : disabled (form 부분통합,김동우 수정)-->
						<form action="updateMember" method="post">
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
									<input type="date" class="form-control form-control-sm" id="editBirth" name="birthday" placeholder="${member.birthday}">
							    </div>
							</div>
						
						<!-- 성별 : 기존 정보가 디폴트로 들어가 있어야 함 -->
						
							<div class="form-group row pt-4">
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
						
						<!-- 수정버튼 : 1-1 id: 1-1btn -->
						<div class="form-group row pt-4 pb-3">
							<div class="col-sm-11">
							   <button type="submit" id="1-1btn" class="btn btn-outline-secondary btn-sm float-right">수정</button>
							</div>
						</div>
					</form>	
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
						<form action="updateMember2" method="post">
							<div class="form-group row pt-5">
							<div class="col-sm-1"></div>
								<label for="editEmail" class="col-sm-2 col-form-label col-form-label-sm"><small>이메일</small></label>
     							<div class="col-sm-8">
     								<input type="email" class="form-control form-control-sm" id="editEmail" name="email" placeholder="이메일을 입력하세요.">
							    </div>
							</div>
						
						<!-- 전화번호 : 가입 시 없는 정보이기 때문에 빈 값 -->
						
							<div class="form-group row pt-4 pb-0">
							<div class="col-sm-1"></div>
								<label for="editEmail" class="col-sm-2 col-form-label col-form-label-sm"><small>전화번호</small></label>
     							<div class="col-sm-8">
     								<input type="number" class="form-control form-control-sm" id="editEmail" name="telephone" placeholder="전화번호를 입력하세요.">
							    	<small id="phoneHelp" class="form-text text-muted">"-" 없이 연락처를 입력하세요.</small>
							    </div>
							</div>
						
						<!-- 수정버튼 : 1-2 id: 1-2btn -->
						<div class="form-group row pt-3 pb-3">
							<div class="col-sm-11">
							   <button type="submit" id="1-2btn" class="btn btn-outline-secondary btn-sm float-right">수정</button>
							</div>
						</div>
						</form>
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
						<form action="updateMember3" method="post">
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
					
							<div class="form-group row pt-4">
							<div class="col-sm-1"></div>
								<label for="uploadLicense" class="col-sm-2 col-form-label col-form-label-sm"><small>자격증</small></label>
     							<div class="col-sm-8">
     								<div class="custom-file">
									  <input type="file" class="file-input" id="licenseFile" lang="ko">
									  <small id="licenseHelp" class="form-text text-muted">자격증 파일을 선택하세요.</small>
									</div>
							    </div>
							</div>
						
						<!-- 수정버튼 : 1-3 id: 1-3btn -->
						<div class="form-group row pt-3 pb-3">
							<div class="col-sm-11">
							   <button type="submit" id="1-3btn" class="btn btn-outline-secondary btn-sm float-right">제출</button>
							</div>
						</div>
						</form>
					</div>	
				</div>	
				</div>
				<!-- 2) 어르신정보 -->
				<div class="tab-pane fade" id="tab-input-elder" role="tabpanel" aria-labelledby="input-elder">
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
							<form>
								<div class="form-group row pt-5">
								<div class="col-sm-1"></div>
									<label for="inputBirth" class="col-sm-2 col-form-label col-form-label-sm"><small>생년월일</small></label>
								    <div class="col-sm-8">
										<input type="date" class="form-control form-control-sm" id="inputBirth">
								    </div>
								</div>
							</form>
							<!-- 이름 등록 -->
							<form>
								<div class="form-group row pt-5">
								<div class="col-sm-1"></div>
									<label for="inputName" class="col-sm-2 col-form-label col-form-label-sm"><small>이름</small></label>
	     							<div class="col-sm-8">
	     								<input type="email" class="form-control form-control-sm" id="inputName" placeholder="성함을 입력하세요.">
								    </div>
								</div>
							</form>
							<!-- 혈액형 등록 -->
							<form>
								<div class="form-group row pt-5">
								<div class="col-sm-1"></div>
									<label for="bloodType" class="col-sm-2 col-form-label col-form-label-sm"><small>혈액형</small></label>
								    <div class="col-sm-8">
										 <select class="custom-select custom-select-sm my-1 mr-sm-2" id="bloodType">
										    <option selected>선택</option>
										    <option value="A">A</option>
										    <option value="B">B</option>
										    <option value="O">O</option>
										    <option value="AB">AB</option>
										  </select>
								    </div>
								</div>		
							</form>
							<!-- 등록버튼 : 2-1 id: 2-1btn -->
							<div class="form-group row pt-4 pb-3">
								<div class="col-sm-11">
								   <button type="button" id="2-1btn" class="btn btn-outline-secondary btn-sm float-right">등록</button>
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
							<form>
								<div class="form-group row pt-5">
									<label for="meal" class="col-sm-2 col-form-label col-form-label-sm text-center"><small>식사</small></label>
								    <div class="col-sm-4">
										 <select class="custom-select custom-select-sm my-1 mr-sm-2" id="meal">
										    <option selected>선택</option>
										    <option value="possible">스스로 가능</option>
										    <option value="help">도움 필요</option>
										    <option value="imppssible">스스로 불가능</option>
										  </select>
								    </div>
								    <label for="walking" class="col-sm-2 col-form-label col-form-label-sm text-center"><small>보행</small></label>
								    <div class="col-sm-4">
										 <select class="custom-select custom-select-sm my-1 mr-sm-2" id="walking">
										    <option selected>선택</option>
										    <option value="possible">스스로 가능</option>
										    <option value="help">도움 필요</option>
										    <option value="imppssible">스스로 불가능</option>
										  </select>
								    </div>
								</div>
								<div class="form-group row pt-3">
									<label for="washing" class="col-sm-2 col-form-label col-form-label-sm text-center"><small>세면</small></label>
								    <div class="col-sm-4">
										 <select class="custom-select custom-select-sm my-1 mr-sm-2" id="washing">
										    <option selected>선택</option>
										    <option value="possible">스스로 가능</option>
										    <option value="help">도움 필요</option>
										    <option value="imppssible">스스로 불가능</option>
										  </select>
								    </div>
								    <label for="clothing" class="col-sm-2 col-form-label col-form-label-sm text-center"><small>의복</small></label>
								    <div class="col-sm-4">
										 <select class="custom-select custom-select-sm my-1 mr-sm-2" id="clothing">
										    <option selected>선택</option>
										    <option value="possible">스스로 가능</option>
										    <option value="help">도움 필요</option>
										    <option value="imppssible">스스로 불가능</option>
										  </select>
								    </div>
								</div>
								<div class="form-group row pt-3">
									<label for="bath" class="col-sm-2 col-form-label col-form-label-sm text-center"><small>목욕</small></label>
								    <div class="col-sm-4">
										 <select class="custom-select custom-select-sm my-1 mr-sm-2" id="bath">
										    <option selected>선택</option>
										    <option value="possible">스스로 가능</option>
										    <option value="help">도움 필요</option>
										    <option value="imppssible">스스로 불가능</option>
										  </select>
								    </div>
								    <label for="washroom" class="col-sm-2 col-form-label col-form-label-sm text-center"><small>화장실</small></label>
								    <div class="col-sm-4">
										 <select class="custom-select custom-select-sm my-1 mr-sm-2" id="washroom">
										    <option selected>선택</option>
										    <option value="possible">스스로 가능</option>
										    <option value="help">도움 필요</option>
										    <option value="imppssible">스스로 불가능</option>
										  </select>
								    </div>
								</div>						
							</form>
							<!-- 등록버튼 : 2-1 id: 2-1btn -->
							<div class="form-group row pt-4 pb-3">
								<div class="col-sm-12">
								   <button type="button" id="2-1btn" class="btn btn-outline-secondary btn-sm float-right">등록</button>
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
							<form>
								<div class="form-group row pt-5 text-center">
								    <div class="col-sm-12">
										<div class="form-check form-check-inline p-3">
										  <input class="form-check-input" type="checkbox" id="disease_information" value="jaundice">
										  <label class="form-check-label" for="inlineCheckbox1">황달</label>
										</div>
										<div class="form-check form-check-inline p-3">
										  <input class="form-check-input" type="checkbox" id="disease_information" value="hypertension">
										  <label class="form-check-label" for="inlineCheckbox2">고혈압</label>
										</div>
										<div class="form-check form-check-inline p-3">
										  <input class="form-check-input" type="checkbox" id="disease_information" value="hypotension">
										  <label class="form-check-label" for="inlineCheckbox3">저혈압</label>
										</div>
										<div class="form-check form-check-inline p-3">
										  <input class="form-check-input" type="checkbox" id="disease_information" value="arthritis">
										  <label class="form-check-label" for="inlineCheckbox4">관절염</label>
										</div>
										<div class="form-check form-check-inline p-3">
										  <input class="form-check-input" type="checkbox" id="disease_information" value="muscle-dystrophy">
										  <label class="form-check-label" for="inlineCheckbox5">근육장애</label>
										</div>
										<div class="form-check form-check-inline p-3">
										  <input class="form-check-input" type="checkbox" id="disease_information" value="Dorsopathies">
										  <label class="form-check-label" for="inlineCheckbox6">등병증</label>
										</div>
										<div class="form-check form-check-inline p-3">
										  <input class="form-check-input" type="checkbox" id="disease_information" value="dysbasia">
										  <label class="form-check-label" for="inlineCheckbox7">보행장애</label>
										</div>
										<div class="form-check form-check-inline p-3">
										  <input class="form-check-input" type="checkbox" id="disease_information" value="incontinence">
										  <label class="form-check-label" for="inlineCheckbox8">요실금</label>
										</div>
										<div class="form-check form-check-inline p-3">
										  <input class="form-check-input" type="checkbox" id="disease_information" value="depression">
										  <label class="form-check-label" for="inlineCheckbox9">우울증</label>
										</div>
										<div class="form-check form-check-inline p-3">
										  <input class="form-check-input" type="checkbox" id="disease_information" value="cerebral1">
										  <label class="form-check-label" for="inlineCheckbox10">뇌졸증</label>
										</div>
										<div class="form-check form-check-inline p-3">
										  <input class="form-check-input" type="checkbox" id="disease_information" value="cerebral2">
										  <label class="form-check-label" for="inlineCheckbox11">뇌출혈</label>
										</div>
										<div class="form-check form-check-inline p-3">
										  <input class="form-check-input" type="checkbox" id="disease_information" value="cerebral3">
										  <label class="form-check-label" for="inlineCheckbox12">뇌경색증</label>
										</div>
										<div class="form-check form-check-inline p-3">
										  <input class="form-check-input" type="checkbox" id="disease_information" value="fracture">
										  <label class="form-check-label" for="inlineCheckbox13">골절</label>
										</div>
										<div class="form-check form-check-inline p-3">
										  <input class="form-check-input" type="checkbox" id="disease_information" value="diabetes">
										  <label class="form-check-label" for="inlineCheckbox14">당뇨</label>
										</div>
										<div class="form-check form-check-inline p-3">
										  <input class="form-check-input" type="checkbox" id="disease_information" value="gastritis">
										  <label class="form-check-label" for="inlineCheckbox15">위장염</label>
										</div>
										<div class="form-check form-check-inline p-3">
										  <input class="form-check-input" type="checkbox" id="disease_information" value="facial-pain">
										  <label class="form-check-label" for="inlineCheckbox16">안면통증</label>
										</div>
										<div class="form-check form-check-inline p-3">
										  <input class="form-check-input" type="checkbox" id="disease_information" value="frozen-shoulder">
										  <label class="form-check-label" for="inlineCheckbox17">오십견</label>
										</div>
										<div class="form-check form-check-inline p-3">
										  <input class="form-check-input" type="checkbox" id="disease_information" value="decubitus">
										  <label class="form-check-label" for="inlineCheckbox18">욕창</label>
										</div>
										<div class="form-check form-check-inline p-3">
										  <input class="form-check-input" type="checkbox" id="disease_information" value="spondylopathy">
										  <label class="form-check-label" for="inlineCheckbox19">척추병</label>
										</div>
										<div class="form-check form-check-inline p-3">
										  <input class="form-check-input" type="checkbox" id="disease_information" value="alzheimer">
										  <label class="form-check-label" for="inlineCheckbox20">치매</label>
										</div>
										<div class="form-check form-check-inline p-3">
										  <input class="form-check-input" type="checkbox" id="disease_information" value="parkinson">
										  <label class="form-check-label" for="inlineCheckbox21">파킨슨병</label>
										</div>
										<div class="form-check form-check-inline p-3">
										  <input class="form-check-input" type="checkbox" id="disease_information" value="sepsis">
										  <label class="form-check-label" for="inlineCheckbox22">패혈증</label>
										</div>
										<div class="form-check form-check-inline p-3">
										  <input class="form-check-input" type="checkbox" id="disease_information" value="pneumonia">
										  <label class="form-check-label" for="inlineCheckbox23">폐렴</label>
										</div>
								    </div>
								</div>
							</form>
							<!-- 등록버튼 : 2-3 id: 2-3btn -->
							<div class="form-group row pt-4 pb-3">
								<div class="col-sm-12">
								   <button type="button" id="2-3btn" class="btn btn-outline-secondary btn-sm float-right">등록</button>
								</div>
							</div>
						</div>	
					</div>
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
					
				</div>
		    </div>
		  </div>
		</div>
	</div>
	
	




</body>
</html>
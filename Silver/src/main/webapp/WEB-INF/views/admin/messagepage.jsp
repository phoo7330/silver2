<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
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
   <link rel="stylesheet" href="<c:url value="/resources/css/admin.css"/>">
   <link rel="stylesheet" href="<c:url value="/resources/css/messagepage.css"/>">
   
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
      <nav class="navbar navbar-expand-md fixed-top p-1 navbar-light bg-light border-1" id="main-nav">
          <a class="navbar-brand mr-5 p-0" href="memberpage"><img src="resources/image/adminLogo.png"></a>
          <!-- 오른쪽 상단 토글러 버튼 -->
         <button class="navbar-toggler pt-0" type="button" data-toggle="collapse" data-target="#navbarCollapse" aria-controls="navbarCollapse" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
         </button>
         <!-- 네비게이션 상단 메뉴 -->
         <div class="collapse navbar-collapse justify-content-between" id="navbarCollapse">
            <ul class="navbar-nav">
               <li class="nav-item">
               		<a class="nav-link mr-3" href="memberpage"><strong>회원관리</strong><span class="sr-only">(current)</span></a>
               </li>
               <li class="nav-item active">
               		<a class="nav-link mr-3" href="messagepage"><strong>질의응답</strong></a>
               </li>
               <li class="nav-item">
                	<a class="nav-link mr-3" href="boardpage"><strong>게시판</strong></a>   
               </li>
              </ul>
            <!-- 로그아웃 -->
            <ul class="navbar-nav mt-2 mt-md-0">
              <li class="nav-item">
                 <a class="nav-link" href="logout"><small>로그아웃</small></a>
              </li>
            </ul>
           
         </div>  
      </nav>   
   </header>
  
	<!-- 메시지함 --> 
	<div class="accordion mt-5" id="adminMessage">
	<!-- 기관관리자 정보수정 요청 -->
	  <div class="card">
	    <div class="card-header" id="headingOne">
	      <h2 class="mb-0">
	        <button class="btn btn-link" type="button" data-toggle="collapse" data-target="#collapseOne" aria-expanded="true" aria-controls="collapseOne">
	          기관관리자 정보수정 요청
	        </button>
	      </h2>
	    </div>
	
	    <div id="collapseOne" class="collapse show" aria-labelledby="headingOne" data-parent="#adminMessage">
	      <div class="card-body">
	      	<!-- 기관테이블 -->
			<div class="table-responsive text-center" id="table-facility">
			  <table class="table table-bordered table-sm">
			    <thead>
			      <tr>
			        <th class="w-10">#</th>
			        <th class="w-20">아이디</th>
			        <th class="w-20">기관명</th>
			        <th class="w-20">기관분류</th>
			        <th class="w-30">수정요청</th>
			      </tr>
			    </thead>
			    <tbody>
			      <tr>
			        <td scope="row">1</td>
			        <td>"member.userid"</td>
			        <td>"silversearch.silvername"</td>
			        <td>"silversearch.type"</td>
			        <td>"기관명/급여종류/주소"</td>       
			      </tr>
			    </tbody>
			  </table>
			</div>
			
			<!-- 받은내용 확인 -->
			<!-- Section -->
            <section class="sender-section">
			<!-- 제목 -->
			<h5 class="h1-responsive font-weight-bold my-3">기관 정보 수정 요청</h5>
			<!-- 기관명 | 받은날짜 -->
			<div class="form-row"> 
                <p class="col-md-6 dark-grey-text mb-2">"silversearch.silvername"</p>
                <p class="col dark-grey-text mb-1 text-right">"sysdate"</p>
			</div>
			<hr> 
			<!-- 수정요청내용 -->
			<form>
			  <div class="form-group">
			    <label for="requst-edit">수정사항</label>
			    <input type="text" class="form-control" id="requst-edit" readonly>
			  </div>
			  <div class="form-group">
			    <label for="request-etc">Example textarea</label>
			    <textarea class="form-control" id="request-etc" rows="4" readonly></textarea>
			  </div>
			  <div class="form-group">
			    <label for="attachment">첨부파일</label>
			    <input type="text" class="form-control" id="attachment" readonly>
			    <small id="emailHelp" class="form-text text-muted">사업자등록증 검토 후 요청사항 수정 진행</small>
			  </div>
			  <div class="form-row justify-content-center mb-4">
				<button type="button" id="f-replybtn" class="btn btn-outline-dark rounded-0 mt-3 mx-1">답장</button>
				<button type="button" id="f-cancelbtn" class="btn btn-outline-dark rounded-0 mt-3 mx-1">취소</button>
			  	<button type="button" id="f-delbtn" class="btn btn-outline-dark rounded-0 mt-3 mx-1">삭제</button>
			  </div>
			</form>
              
              
            <!-- Section -->
            </section>  
			<!-- 버튼 -->
			
			
	      </div>
	    </div>
	  </div>
	  
	  <!-- 종사자 회원변경 신청 -->
	  <div class="card">
	    <div class="card-header" id="headingTwo">
	      <h2 class="mb-0">
	        <button class="btn btn-link collapsed" type="button" data-toggle="collapse" data-target="#collapseTwo" aria-expanded="false" aria-controls="collapseTwo">
	          종사자 회원변경 신청
	        </button>
	      </h2>
	    </div>
	    <div id="collapseTwo" class="collapse" aria-labelledby="headingTwo" data-parent="#adminMessage">
	      <div class="card-body">
	      
	      </div>
	    </div>
	  </div>
	  
	  <!-- 일반회원 자주묻는질문 -->
	  <div class="card">
	    <div class="card-header" id="headingThree">
	      <h2 class="mb-0">
	        <button class="btn btn-link collapsed" type="button" data-toggle="collapse" data-target="#collapseThree" aria-expanded="false" aria-controls="collapseThree">
	          일반회원 자주묻는질문
	        </button>
	      </h2>
	    </div>
	    <div id="collapseThree" class="collapse" aria-labelledby="headingThree" data-parent="#adminMessage">
	      <div class="card-body">
	      
	      </div>
	    </div>
	  </div>
	</div>
</body>
</html>
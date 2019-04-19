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
/* 쪽지함 show & hide 스크립트 */
$(document).ready(function(){
	  $("#senderForm").hide();

	  $("#replybtn").click(function(){    
		 $("#receiveTable").hide();
		 $("#receivePage").hide();
		 $("#senderForm").show();
    });
	  
	  $("#sendbtn").click(function(){    
		$("#senderForm").hide();
		$("#receiveTable").show();
		$("#receivePage").show();
	  });
	  
	  $("#cancelbtn").click(function(){    
		$("#senderForm").hide();
		$("#receiveTable").show();
		$("#receivePage").show();
	  });

});
</script>
	<!-- 메인 네비게이션 -->
	<header>
		<nav class="navbar navbar-expand-md navbar-dark fixed-top p-3" id="main-nav">
	 		<a class="navbar-brand mr-5 p-0" href="facilitymypage"><img src="resources/image/facilityLogo.png"></a>
	 		<!-- 오른쪽 상단 토글러 버튼 -->
			<button class="navbar-toggler pt-0" type="button" data-toggle="collapse" data-target="#navbarCollapse" aria-controls="navbarCollapse" aria-expanded="false" aria-label="Toggle navigation">
	      	<span class="navbar-toggler-icon"></span>
			</button>
			<!-- 네비게이션 상단 메뉴 -->
			<div class="collapse navbar-collapse justify-content-between" id="navbarCollapse">
				<ul class="navbar-nav">
					<li class="nav-item active" style="color: black;">
			  			<a class="nav-link text-light mr-3" href="facilitymypage"><strong>기관정보</strong><span class="sr-only">(current)</span></a>
			  		</li>
			  		<li class="nav-item">
			  			<a class="nav-link text-light mr-3" href="recruitpage"><strong>구인정보</strong></a>
			  		</li>
			  		<li class="nav-item">
			  			<a class="nav-link text-light mr-3" href="talentpage"><strong>인재정보</strong></a>	
			  		</li>
			  		<li class="nav-item">
			  			<a class="nav-link text-light mr-3" href="questionpage"><strong>메세지함</strong></a>	
			  		</li>
			  	</ul>
				<!-- 로그아웃 -->
				<ul class="navbar-nav mt-2 mt-md-0">
				  <li class="nav-item">
				  	<a class="nav-link text-light" href="logout"><small>로그아웃</small></a>
				  </li>
				</ul>
			  
			</div>  
		</nav>	
	</header>

	<!-- Jumbotron -->
	<div class="jumbotron p-0">
	
	<!-- Card image -->
	<div class="view overlay rounded-top">
	    <div class="card bg-dark text-white border-0">
		  <img src="resources/image/talent.jpg" class="card-img">
		  <div class="card-img-overlay text-center mt-5  pt-5">
		    <h1 class="card-title text-dark">기관관리자 메세지함</h1>
		     <h1 class="card-title text-dark">ー</h1>
		  </div>
		</div>
	<!-- view overlay -->   
	</div>
	<!-- jumbotron --> 
	</div>


<!-- 메세지함 -->
<div class="card mb-1 border-0" id="message-card">
	<div class="row">
		<!-- 왼쪽 : 메뉴 -->
  		<div class="col-3">
    		<div class="nav flex-column nav-pills pt-3" id="v-pills-tab" role="tablist" aria-orientation="vertical">
      			<a class="nav-link active text-light border-bottom border-white" id="question-tab" data-toggle="pill" href="#v-question-tab" role="tab" aria-selected="true">
      			방문문의/이력서</a>
      			<a class="nav-link text-light border-bottom border-white" id="send-tab" data-toggle="pill" href="#v-send-tab" role="tab" aria-selected="false">
      			보낸메세지</a>
      			<a class="nav-link text-light border-bottom border-white" id="write-tab" data-toggle="pill" href="#v-write-tab" role="tab" aria-selected="false">
      			메세지작성</a>
			</div>
  		</div>
  		<!-- 오른쪽 : 콘텐츠 -->
		<div class="col-9">
			<div class="tab-content" id="v-pills-tabContent">
				
				<!-- 1. 방문문의/이력서 -->
				<div class="tab-pane fade show active mr-5" id="v-question-tab" role="tabpanel">
					<!-- 삭제/답장 버튼 -->
					<div class="form-group row pt-3 pb-0">
						<div class="col-sm-12">
				   			<button type="button" id="delbtn" class="btn btn-outline-secondary btn-sm">삭제</button>
							<button type="button" id="replybtn" class="btn btn-outline-secondary btn-sm">답장</button>
						</div>
					</div>
				<!-- 쪽지 리스트 테이블 -->
				<table class="table table-sm" id="receiveTable">
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
					      <td scope="row">
							<div class="form-check">
								<input class="form-check-input position-static" type="checkbox" id="blankCheckbox" value="option1">
							</div>
					      </td>
						  <td>"Sender"</td>
						  <td><label class="form-check-label" for="selectContents">"contents"</label></td>
						  <td>"sysdate"</td>
					    </tr>
			  		</tbody>
				</table>
				<!-- 페이지네이션 -->
				<nav id="receivePage" aria-label="Page navigation">
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
				<!-- 쪽지 눌렀을 때 -->
				<div class="form mb-3" id="senderForm">
					<div class="form-group row">
					   <label for="sender" class="col-sm-2 col-form-label col-form-label-sm"><small>보낸사람</small></label>
					   <div class="col-sm-10">
					   	<input type="text" class="form-control form-control-sm" id="sender" readonly>
					   </div>
					</div>
					<textarea class="form-control" id="sbwrite" name="sbwrite" style="height: 15rem;"></textarea>
					<button type="button" id="sendbtn" class="btn btn-outline-secondary btn-sm mt-3">보내기</button>
					<button type="button" id="cancelbtn" class="btn btn-outline-secondary btn-sm mt-3">취소</button>
				</div>
    		<!-- #v-question-tab end -->	  	
    		</div>
    		
    		<!-- 2. 보낸메세지 -->
			<div class="tab-pane fade mr-5" id="v-send-tab" role="tabpanel">
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
			<!-- #v-send-tab end -->
		      </div>
      
		      <!-- 3. 메세지작성 -->
		      <div class="tab-pane fade mr-5" id="v-write-tab" role="tabpanel">
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
      		<!-- #v-write-tab end -->
      		</div>
			<!-- #v-pills-tabContent end -->
			</div>
		<!-- .col-9 end -->
		</div>
	<!-- .row end -->
	</div>
<!-- #message-card end -->
</div>	

	<!-- Footer -->
	<footer class="page-footer font-small" id="table-footer">
  		<div class="footer-copyright py-4 px-3">
    		서울특별시 강남구 영동대로 513 4F <br/>
			Copyright (c) 2019 <span>Silver Surfer, Foundation for Smart Cloud IT Master</span> All Rights Reserved.
		</div>
	</footer>
		
</body>
</html>
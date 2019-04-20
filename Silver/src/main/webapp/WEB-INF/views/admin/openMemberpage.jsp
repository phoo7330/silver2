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
   <link rel="stylesheet" href="<c:url value="/resources/css/memberpage.css"/>">
   
   <!-- jQuery javaScript 추가 -->
   <script src="resources/js/jquery.min.js"></script>
   
   <!-- Popper javaScript 추가 -->
   <script src="resources/js/popper.min.js"></script>
   
   <!-- Bootstrap javaScript 추가 -->
   <script src="resources/js/bootstrap.min.js"></script>
   
</head>
<body>
<script>
$(document).ready(function(){
	
	  $("#closebtn").click(function(){    
		window.close();
	});
	  
});

$(document).ready(function(){
	  $("#senderForm").hide();
	  
	  $("#messagebtn").click(function(){    
		$("#m-informationForm").hide();
		$("#senderForm").show();
		window.location.replace("#main-information");
	});

	  $("#s-cancelbtn").click(function(){    
		 $("#senderForm").hide();
		 $("#m-informationForm").show();
		 window.location.replace("#main-information");
  	});
	  /* 메시지 전송 후 alert창 띄어야 함 */
	  $("#sendbtn").click(function(){    
		 $("#senderForm").hide();
		 $("#m-informationForm").show();
		 window.location.replace("#main-information");
	 });
});
</script>

	<!-- 일반회원&종사자회원 정보 -->
	<div class="container" id="open-general-practician">	
		<div class="card container border-dark mt-3 mb-3">
		<!-- Section -->
		<section class="sender-section"> 
		  <!-- 회원구분 / 가입일 -->
		  <div class="form-row mt-4" id="main-information"> 
			<h2 class="col-md-6">회원정보</h2>
			<div class="col-md-6 text-right">
			  <p class="dark-grey-text mb-0">member.type</p>
			  <p class="dark-grey-text mb-0">"member.registration"</p>
			</div>
		  </div>
		 <hr> 
	<!-- 메시지 누를 때 숨길 부분 -->
	<div id="m-informationForm"> 
		  <!-- All grid row -->
		  <div class="row">
		    <!-- 기본회원정보 : 일반&종사자 공통 사용 부분 -->
		    <div class="col-md-6">
	        	<div class="container text-center">
				  <table class="table table-bordered mt-3">
				    <thead>
				      <tr>
				        <th colspan="2">개인정보</th>
				      </tr>
				    </thead>
				    <tbody>
				     <tr>
				        <td>아이디</td>
				        <td>"member.userid"</td>
				      </tr>
				      <tr>
				      <tr>
				        <td>비밀번호</td>
				        <td>"member.userpw"</td>
				      </tr>
				      <tr>
				        <td>이름</td>
				        <td>"member.username"</td>
				      </tr>
				      <tr>
				        <td>생년월일</td>
				        <td>"member.birthday"</td>
				      </tr>
				      <tr>
				        <td>성별</td>
				        <td>"member.gender"</td>
				      </tr>
				      <tr>
				        <td>주소</td>
				        <td>"member.address"</td>
				      </tr>
				      <tr>
				        <td>이메일</td>
				        <td>"member.email"</td>
				      </tr>
				      <tr>
				        <td>연락처</td>
				        <td>"member.telephone"</td>
				      </tr>
				      <tr>
				        <td>경고</td>
				        <td>"member.warning"</td>
				      </tr>
				    </tbody>
				  </table>
				</div>
		    </div>
		
<!-- 우측 : 일반사용자-어르신정보 / 종사자-이력서정보 -->
		    <div class="col-md-6">
		    	<!-- 일반사용자-어르신정보 -->
	    		<div class="container text-center" id="silver-inform">
				  <hr class="border-dark mt-3 mb-0">
				  <table class="table">
				    <thead class="thead-light">
				      <tr>
				        <th colspan="4">어르신 기본정보</th>
				      </tr>
				    </thead>
				    <tbody>
				      <tr>
				        <td colspan="2" class="w-50">성함</td>
				        <td colspan="2" class="w-50">"성함"</td>
				      </tr>
				      <tr>
				        <td colspan="2" class="w-50">생년월일</td>
				        <td colspan="2" class="w-50">"생년월일"</td>
				      </tr>
				      <tr>
				        <td colspan="2" class="w-50">혈액형</td>
				        <td colspan="2" class="w-50">"혈액형"</td>
				      </tr>
				    </tbody>
				    <thead class="thead-light">
				      <tr>
				        <th colspan="4">일상생활 수행정도</th>
				      </tr>
				    </thead>
				    <tbody>
				      <tr>
				        <td class="w-20">식사</td>
				        <td class="w-40">"식사"</td>
				        <td class="w-20">보행</td>
				        <td class="w-40">"보행"</td>
				      </tr>
				      <tr>
				        <td class="w-20">세면</td>
				        <td class="w-40">"세면"</td>
				        <td class="w-20">의복</td>
				        <td class="w-40">"의복"</td>
				      </tr>
				      <tr>
				        <td class="w-20">목욕</td>
				        <td class="w-40">"목욕"</td>
				        <td class="w-20">화장실</td>
				        <td class="w-40">"화장실"</td>
				      </tr>
				    </tbody>
				    <thead class="thead-light">
				      <tr>
				        <th colspan="4">기타 질환정보</th>
				      </tr>
				    </thead>
				    <tbody>
				      <tr>
				      	<td colspan="4">"기타 질환정보"</td>
				      </tr>
				    </tbody>
				  </table>
				</div>
<!-- type==2 일 경우, 추가로 보이는 정보 -->		    	
		    	<!-- 종사자-이력서 정보 -->
		    		<div class="container text-center" id="resume-inform">
				  	 <hr class="hr border-dark mt-5 mb-0">
				  	  <table class="table">
					    <thead class="thead-light">
					      <tr>
					        <th colspan="2">이력서 정보</th>
					      </tr>
					    </thead>
					    <tbody>
					      <tr>
					        <td class="w-30">자격사항</td>
					        <td class="w-70">"자격사항"</td>
					      </tr>
					      <tr>
					        <td class="w-30">첨부파일</td>
					        <td class="w-70">"hyperlink"</td>
					      </tr>
					      <tr>
					        <td class="w-30">희망직종</td>
					        <td class="w-70">"희망직종"</td>
					      </tr>
					      <tr>
					        <td class="w-30">희망지역</td>
					        <td class="w-70">"희망지역"</td>
					      </tr>
					      <tr>
					        <td class="w-30">근무형태</td>
					        <td class="w-70">"근무형태"</td>
					      </tr>
					    </tbody>
					    <thead class="thead-light">
					      <tr>
					        <th colspan="2">기타사항</th>
					      </tr>
					    </thead>
					    <tbody>
					      <tr>
					        <td colspan="2">"기타사항"</td>
					      </tr>
					    </tbody>
					  </table>
					</div>
		    <!-- col-md-6 end -->  
		    </div> 
		  <!-- row end -->
		  </div>  
		  <!-- 버튼 -->
		  <div class="btn-group m-5 d-flex justify-content-center" >
			  <div>
			 	 <button type="button" class="btn btn-outline-dark mx-1 rounded-0" id="messagebtn">메시지</button>
			  </div>
			  <div>
			 	 <button type="button" class="btn btn-outline-dark mx-1 rounded-0" id="closebtn">창닫기</button>
			  </div>
			  <div>
			  	<button type="button" class="btn btn-outline-danger mx-1 rounded-0" id="warningbtn">경 고</button>	  
			  </div>
		  </div>
	 <!-- #m-informationForm end -->
	 </div>
		<!-- 메시지버튼 클릭 시 -->			
		<div class="card-body mb-3 container" id="senderForm">
		  <div class="form-group row mt-4">
		    <label for="recipient" class="col-sm-2 col-form-label col-form-label-sm">받는사람</label>
		    <div class="col-sm-10">
		      <input type="text" class="form-control form-control-sm" id="recipient" readonly>
		    </div>
		  </div>
		  <div class="form-group row">
		    <label for="sender" class="col-sm-2 col-form-label col-form-label-sm">제목</label>
		    <div class="col-sm-10">
		      <input type="text" class="form-control form-control-sm" id="title-sender">
		    </div>
		  </div>
		  <textarea class="form-control" id="sbwrite" name="sbwrite" style="height: 20rem;"></textarea>
			<div class="form-row justify-content-center mb-4">
			  <button type="button" id="sendbtn" class="btn btn-outline-dark mt-5 mx-1 rounded-0">보내기</button>
			  <button type="button" id="s-cancelbtn" class="btn btn-outline-dark mt-5 mx-1 rounded-0">취소</button>
			</div>
		</div>
	
		<!-- Section -->
		</section>  
		</div>
	</div>
</body>
</html>
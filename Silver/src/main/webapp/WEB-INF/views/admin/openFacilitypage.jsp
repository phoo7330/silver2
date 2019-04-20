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
		$("#f-informationForm").hide();
		$("#senderForm").show();
		window.location.replace("#main-information");
	});

	  $("#s-cancelbtn").click(function(){    
		 $("#senderForm").hide();
		 $("#f-informationForm").show();
		 window.location.replace("#main-information");
  	});
	  /* 메시지 전송 후 alert창 띄어야 함 */
	  $("#sendbtn").click(function(){    
		 $("#senderForm").hide();
		 $("#f-informationForm").show();
		 window.location.replace("#main-information");
	 });
});
</script>

	<!-- 기관관리자 정보 -->
	<div class="container" id="open-general-practician">	
		<div class="card container border-dark mt-3 mb-3">
		<!-- Section -->
		<section class="sender-section"> 
		  <!-- 기관구분/설립일 -->
		  <div class="form-row mt-4" id="main-information"> 
			<h2 class="col-md-6">기관정보</h2>
			<div class="col-md-6 text-right">
			  <p class="dark-grey-text mb-0">"DetailsOne.type"</p>
			  <p class="dark-grey-text mb-0">"DetailsOne.establishment"</p>
			</div>
		  </div>
		 <hr> 
	<!-- 메시지 누를 때 숨길 부분 -->
	<div id="f-informationForm"> 
		  <!-- All grid row -->
		  <div class="row">
		    <!-- 정보수정요청 -->
		    <div class="col-md-6">
		        <form class="container" id="" action="" method="post">
	                <div class="form-group row mt-3">
	                  <label for="establishment" class="col-sm-4 col-form-label">급여종류</label>
	                  <div class="col-sm-8">
	                    <input type="text" class="form-control" name="type" id="type" value="${DetailsOne.type}">
	                  </div>
	                </div>
	                <div class="form-group row">
	                  <label for="hp_service" class="col-sm-4 col-form-label">기관명</label>
	                  <div class="col-sm-8">
	                    <input type="text" class="form-control" name="silvername" id="silvername" value="${DetailsOne.silvername}">
	                  </div>
	                </div>
	                <div class="form-group row">
	                  <label for="protection" class="col-sm-4 col-form-label">주소</label>
	                  <div class="col-sm-8">
	                    <input type="text" class="form-control" name="hp_address" id="hp_address" value="${DetailsOne.hp_address}">
	                  </div>
	                </div>
	                <div class="form-group row">
	                  <label for="protection" class="col-sm-4 col-form-label">서비스</label>
	                  <div class="col-sm-8">
	                    <input type="text" class="form-control" name="service" id="service" value="${DetailsOne.service}">
	                  </div>
	                </div>
	                <div class="form-group row">
	                  <label for="religion" class="col-sm-4 col-form-label">사업자등록증</label>
	                  <div class="col-sm-8">
	                    <input type="text" class="form-control" name="businessLicense" id="businessLicense" value="">
	                  </div>
	                </div>
					<!-- 버튼 -->
					 <div class="m-5 d-flex justify-content-center" >
						 <div>
							 <button type="button" class="btn btn-outline-secondary mx-1 rounded-0" id="i-editbtn">기관정보수정</button>
						 </div>
					 </div>
		        </form>
		    </div>
		
			<!-- 우측  -->
		    <div class="col-md-6">
				<!-- 기관정보 -->		    
	    		<div class="container text-center" id="facility1-inform">
				  <table class="table table-sm mt-3">
				    <thead class="thead-light">
				      <tr>
				        <th colspan="4">기관정보</th>
				      </tr>
				    </thead>
				    <tbody>
				      <tr>
				        <td colspan="2" class="w-30">설립정보</td>
				        <td colspan="2" class="w-70">"DetailsOne.establishment"</td>
				      </tr>
				      <tr>
				        <td colspan="2" class="w-30">봉사활동</td>
				        <td colspan="2" class="w-70">"DetailsOne.hp_service"</td>
				      </tr>
				      <tr>
				        <td colspan="2" class="w-30">간병형태</td>
				        <td colspan="2" class="w-70">"DetailsOne.protection"</td>
				      </tr>
				      <tr>
				        <td colspan="2" class="w-30">입지정보</td>
				        <td colspan="2" class="w-70">"DetailsOne.location"</td>
				      </tr>
				      <tr>
				        <td colspan="2" class="w-30">종교활동</td>
				        <td colspan="2" class="w-70">"DetailsOne.religion"</td>
				      </tr>
				      <tr>
				        <td colspan="2" class="w-30">전화번호</td>
				        <td colspan="2" class="w-70">"DetailsOne.hospital_tel"</td>
				      </tr>
				    </tbody>
				    <thead class="thead-light">
				      <tr>
				        <th colspan="4">진료시간</th>
				      </tr>
				    </thead>
				    <tbody>
				      <tr>
				        <td colspan="2" class="w-30">쉬는날</td>
				        <td colspan="2" class="w-70">"DetailsOne.holiday"</td>
				      </tr>
				      <tr>
				        <td colspan="2" class="w-30">점심시간</td>
				        <td colspan="2" class="w-70">"DetailsOne.lunchtime"</td>
				      </tr>
				      <tr>
				        <td colspan="2" class="w-30">평일접수</td>
				        <td colspan="2" class="w-70">"DetailsOne.receipttime"</td>
				      </tr>
				      <tr>
				        <td colspan="2" class="w-30">토요일접수</td>
				        <td colspan="2" class="w-70">"DetailsOne.?"</td>
				      </tr>
				    </tbody>
				    <thead class="thead-light">
				      <tr>
				        <th colspan="4">병상정보</th>
				      </tr>
				    </thead>
				    <tbody>
				      <tr>
				      	<td colspan="4">"DetailsOne.facilityinformation"</td>
				      </tr>
				    </tbody>
				  </table>
				</div>
		    <!-- col-md-6 end -->  
		    </div> 
		  <!-- #row end -->
		  </div>  
		  <!-- 버튼 -->
		  <div class="fixed-bottom btn-group m-5 pb-3 d-flex justify-content-center" >
			  <div>
			 	 <button type="button" class="btn btn-outline-dark mx-1 rounded-0" id="messagebtn">메시지</button>
			  </div>
			  <div>
			 	 <button type="button" class="btn btn-outline-dark mx-1 rounded-0" id="closebtn">창닫기</button>
			  </div>
		  </div>
	 <!-- #f-informationForm end -->
	 </div>
		<!-- 메시지버튼 클릭 시 -->			
		<div class="card-body mb-3 container " id="senderForm">
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
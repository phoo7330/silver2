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
function what(){
	//vo에 담겨있는 시설타입을 꺼내 각타입에 맞는 문자로 변환해서 출력
	var type=0;
	var sttype='';
	type='${DetailsTwo.type}';
	if(type==2){
		sttype+='요양원';
		$('#type').val(sttype);
		$('#whattype').html(sttype);
		return;
	}else if(type==3){
		sttype+='방문시설';
		$('#type').val(sttype);
		$('#whattype').html(sttype);
		return;
	}else if(type==4){
		sttype+='치매전담'; 
		$('#type').val(sttype);
		$('#whattype').html(sttype);
		return;
	}
}


$(document).ready(function(){
		what();
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
			  <p class="dark-grey-text mb-0" id="whattype"></p>
			  <p class="dark-grey-text mb-0">설립입 : ${DetailsTwo.establishment}</p>
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
	                    <input type="text" class="form-control" name="type" id="type" value="">
	                  </div>
	                </div>
	                <div class="form-group row">
	                  <label for="hp_service" class="col-sm-4 col-form-label">기관명</label>
	                  <div class="col-sm-8">
	                    <input type="text" class="form-control" name="silvername" id="silvername" value="${DetailsTwo.silvername}">
	                  </div>
	                </div>
	                <div class="form-group row">
	                  <label for="protection" class="col-sm-4 col-form-label">주소</label>
	                  <div class="col-sm-8">
	                    <input type="text" class="form-control" name="hp_address" id="hp_address" value="${DetailsTwo.address}">
	                  </div>
	                </div>
	                <div class="form-group row">
	                  <label for="protection" class="col-sm-4 col-form-label">서비스</label>
	                  <div class="col-sm-8">
	                    <input type="text" class="form-control" name="service" id="service" value="${DetailsTwo.service}">
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
				  <table class="table mt-3">
				    <thead class="thead-light">
				      <tr>
				        <th colspan="4">기관정보</th>
				      </tr>
				    </thead>
				    <tbody>
				      <tr>
				        <td colspan="2" class="w-30">기관일련번호</td>
				        <td colspan="2" class="w-70">${DetailsTwo.detail_number}</td>
				      </tr>
				      <tr>
				        <td colspan="2" class="w-30">설립일</td>
				        <td colspan="2" class="w-70">${DetailsTwo.establishment}</td>
				      </tr>
				      <tr>
				        <td colspan="2" class="w-30">승인일</td>
				        <td colspan="2" class="w-70">${DetailsTwo.approval}</td>
				      </tr>
				      <tr>
				        <td colspan="2" class="w-30">연락처</td>
				        <td colspan="2" class="w-70">${DetailsTwo.tel}</td>
				      </tr>
				    </tbody>  
				    <thead class="thead-light">
				      <tr>
				        <th colspan="4">시설정보</th>
				      </tr>
				    </thead>
				    <tbody>
				      <tr>
				      	<td colspan="4">${DetailsTwo.parkinglot}</td>
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
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
$(function() {
      if('${message}'!=''){
         alert('${message}');
      };
     $('#myTab li a').on('click',function() {
      var item = $(this).html();
      $("#inform-tabContent").html(item);
      
         
    });
    $('#uploadbtn').on('click', function(){
         var picture=$('#uploadPicture').val();
         if(picture.length < 1){
            alert("사진이 들어갔는지 다시 확인해주세요");
            return;
         }
         $("#picture1").submit();
      });
     //기관정보 업데이트 버튼을 누르면
     $('#saveContent1').on('click', function(){
        var estlang = $('#establishment').val().length;
        var serlang = $('#hp_service').val().length;
        var prolang = $('#protection').val().length;
        var lolang = $('#location').val().length;
        var relang = $('#religion').val().length;
        var tellang = $('#hospital_tel').val().length;
        
        if(estlang<1){
           alert("설립정보를 입력하세요");
           return;
        }
        if(serlang<1){
           alert("설립정보를 입력하세요");
           return;
        }
        if(prolang<1){
           alert("설립정보를 입력하세요");
           return;
        }
        if(lolang<1){
           alert("설립정보를 입력하세요");
           return;
        }
        if(relang<1){
           alert("설립정보를 입력하세요");
           return;
        }
        if(tellang<1){
           alert("설립정보를 입력하세요");
           return;
        }
        $("#upfa1").submit(); 
     });
     //진료시간 수정 
     $('#saveContent2').on('click', function(){
      var holiday = '';
      $("input[class='form-check-input']:checked").each(function() {
           var test = $(this).val(); 
            holiday += test+"/";
         });
      holiday = holiday.substr(0, holiday.length -1);
      $('#selholyday').val(holiday);
      $("#upfa2").submit(); 
     });
     
     //병상정보 수정
      $('#saveContent3').on('click', function(){
         var treleng = $('#treatment').val().length;
         
         if(treleng<1){
              alert("병상정보를 입력하세요");
              return;
           }
           $("#upfa3").submit();  
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
                    <a class="nav-link text-light mr-3" href="questionpage"><strong>메시지함</strong></a>   
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
   
<!-- 상단 점보트론 -->
   <div class="jumbotron hoverable p-0 mb-0">
   
     <!-- Grid row -->
     <div class="row container col-md-12 p-0 m-0">
   
       <!-- col -->
       <div class="col">
       </div>
       <div class="col-md-4 offset-md-1 m-4">
       <form action="upSilverSearch_1" method="post" id="picture1" enctype="multipart/form-data">
         <!-- 이미지 미리보기 -->
         <div class="view overlay">
           <div class="view view-cascade overlay border" style="height: 170px;">
              <img src ="img/${DetailsOne.name}" style="height: 170px;"/>
            </div>

         <div class="text-center mt-2">
            <h5 class="mb-0"><strong>기관 사진 업로드</strong></h5> <br>
         </div>
           <!-- 파일업로드 -->
           <div class="input-group"> 
           <div class="custom-file">
             <input type="file" class="custom-file-input" id="uploadPicture" name="file">
             <label class="custom-file-label float-left" for="uploadPicture">파일을 선택하세요.</label>
           </div>
           <div class="input-group-append">
             <button class="btn btn-outline-secondary" type="button" id="uploadbtn">업로드</button>
           </div>
         </div>
         </div> 
         <input type="hidden" name="seach_seq" value="${DetailsOne.seach_seq}">
         </form>
       </div>
       
      <!-- col -->
       <div class="col">
       </div>
       
       <div class="col-md-4 text-md-left m-4">
         <!-- Excerpt -->
         <h6><i class="green-text"></i> 요양병원</h6>
         <h4>${DetailsOne.grade} - 최우수 </h4>
         <h4 class="h4 mb-4">${DetailsOne.silvername}</h4>
         <p class="font-weight-normal">${DetailsOne.hp_address} </p>
         <p class="font-weight-normal">${DetailsOne.service}</p>
         <!-- 모달 버튼 : 모달 Grid row 아래 -->
         <button type="button" class="btn btn-outline-primary text-light" data-toggle="modal" data-target="#modal-request">
           정보 수정 요청
         </button>
       </div>
       <!-- col -->
      <div class="col">
       </div>
     </div>
     <!-- Grid row -->   
   </div>

<!-- 정보 수정 요청 버튼 모달 -->
   <div class="modal fade right" id="modal-request" tabindex="-1" role="dialog" aria-hidden="true" data-backdrop="false">
     <div class="modal-dialog modal-full-height modal-right modal-notify modal-info" role="document">
       <div class="modal-content">
         <!--Header-->
         <div class="modal-header">
           <p class="heading lead mb-0 text-light"><strong>Silver Surfer</strong></p>
           <button type="button" class="close" data-dismiss="modal" aria-label="Close">
             <span aria-hidden="true" class="text-light">×</span>
           </button>
         </div>
   
         <!--Body-->
         <div class="modal-body">
           <div class="text-center">
             <h5><strong>기관 정보 수정 요청</strong></h5>
             <p>기관 등급의 경우, <strong>국민건강보험공단에서 실시한 평가결과</strong>를 표시하므로<br>
             평가결과의 수정은 3년 단위의 정기평가와 1~3년 단위 수시평가 이후<br> 수정이 가능합니다.</p>
             <p>기관명, 급여종류, 주소 변경은 <strong>사업자등록증</strong>을 첨부하여 정보 수정 요청을<br> 해주시기 바랍니다.</p>
           </div>
           
           <hr>
   
           <!-- 체크박스 -->
           <p class="text-center">
             <strong>수정사항 선택</strong>
           </p>
           <div class="form-group">
             <div class="custom-control custom-checkbox mb-1">
                 <input type="checkbox" class="custom-control-input" id="silvername">
                 <label class="custom-control-label" for="silvername">기관명</label>
             </div>
             <div class="custom-control custom-checkbox mb-1">
                 <input type="checkbox" class="custom-control-input" id="service">
                 <label class="custom-control-label" for="service">급여종류</label>
             </div>
             <div class="custom-control custom-checkbox">
                 <input type="checkbox" class="custom-control-input" id="area">
                 <label class="custom-control-label" for="area">주소</label>
             </div>
           </div>
           <p class="text-center">
             <strong>기타사항 입력</strong>
           </p>
           <!--기타사항-->
           <div class="md-form">
             <textarea type="text" id="etcForm" class="md-textarea form-control mb-3" rows="2"></textarea>
           </div>
           <!--파일업로드-->
           <div class="input-group">
             <div class="input-group-prepend">
               <span class="input-group-text" id="inputFile">올리기</span>
             </div>
             <div class="custom-file">
               <input type="file" class="custom-file-input" id="inputFile">
               <label class="custom-file-label" for="inputFile">사업자등록증을 업로드하세요.</label>
             </div>
           </div>
   
         </div>
   
         <!--Footer-->
         <div class="modal-footer justify-content-center">
           <a type="button" class="btn btn-outline-primary">보내기</a>
           <a type="button" class="btn btn-outline-primary" data-dismiss="modal">취소</a>
         </div>
       </div>
     </div>
   </div>
<!-- Modal -->


<!-- 하단 네비게이션 바 1 -->
   <nav class="navbar border-top-0 p-1 m-0" id="search-nav">      
   </nav>
   
<!-- 하단 수정 메뉴 -->
<div class="main">

   <!-- Grid row -->
   <div class="row">
     <!-- Grid column 1 -->
     <div class="col-md-4 pr-0">
   
       <!--Card Primary-->
       <div class="card cardMenu">
         <div class="card-body rounded-0" id="column1">
           <div class="row col-md-12 pr-0">
             <h5 class="col-md-9 font-weight-bold mb-4">기관정보</h5>
           </div>
         <!--Card Contents-->
             <div class="row col-md-12">
               <p class="col-md-6">설립정보</p>
               <p class="col"><strong>${DetailsOne.establishment}</strong></p>
             </div>
             <div class="row col-md-12">
               <p class="col-md-6">봉사활동</p>
               <p class="col"><strong>${DetailsOne.hp_service}</strong></p>
             </div>
             <div class="row col-md-12">
               <p class="col-md-6">간병형태</p>
               <p class="col"><strong>${DetailsOne.protection}</strong></p>
             </div>
             <div class="row col-md-12">
               <p class="col-md-6">입지정보</p>
               <p class="col"><strong>${DetailsOne.location}</strong></p>
             </div>
             <div class="row col-md-12">
               <p class="col-md-6">종교활동</p>
               <p class="col"><strong>${DetailsOne.religion}</strong></p>
             </div>
             <div class="row col-md-12">
               <p class="col-md-6">전화번호</p>
               <p class="col"><strong>${DetailsOne.hospital_tel}</strong></p>
             </div>
           <!-- card-body -->
           </div>
         <!-- Edit-button -->
         <div class="card-footer border-0 pb-3" id="column1">
            <button type="button" id="editbtn-1" class="btn btn-outline-secondary" data-toggle="modal" data-target="#editContent1">수정</button>
         </div>
       <!-- cardMenu -->
       </div>
     <!-- col-md-5 p-0 -->
     </div>
     
     <!-- editbtn-1 수정 모달 -->   
      <div class="modal" id="editContent1" tabindex="-1" role="dialog"
        aria-labelledby="myModalLabel" aria-hidden="true" data-backdrop="false">
        <div class="modal-dialog modal-side modal-bottom-right modal-notify modal-info" role="document">
          <!--Content-->
          <div class="modal-content">
            <!--Header-->
            <div class="modal-header">
              <h5 class="heading text-light mb-0">기관정보 수정</h5>
      
              <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                <span aria-hidden="true" class="text-light">&times;</span>
              </button>
            </div>
      
            <!--Body-->
            <div class="modal-body">
            <form class="container" id="upfa1" action="upDetails1" method="post">
               <input type="hidden" name="seach_seq" value="${DetailsOne.seach_seq}">
                <div class="form-group row">
                  <label for="establishment" class="col-sm-4 col-form-label">설립정보</label>
                  <div class="col-sm-8">
                    <input type="text" class="form-control" name="establishment" id="establishment" value="${DetailsOne.establishment}">
                  </div>
                </div>
                <div class="form-group row">
                  <label for="hp_service" class="col-sm-4 col-form-label">봉사활동</label>
                  <div class="col-sm-8">
                    <input type="text" class="form-control" name="hp_service" id="hp_service" value="${DetailsOne.hp_service}">
                  </div>
                </div>
                <div class="form-group row">
                  <label for="protection" class="col-sm-4 col-form-label">간병형태</label>
                  <div class="col-sm-8">
                    <input type="text" class="form-control" name="protection" id="protection" value="${DetailsOne.protection}">
                  </div>
                </div>
                <div class="form-group row">
                  <label for="protection" class="col-sm-4 col-form-label">입지정보</label>
                  <div class="col-sm-8">
                    <input type="text" class="form-control" name="location" id="location" value="${DetailsOne.location}">
                  </div>
                </div>
                <div class="form-group row">
                  <label for="religion" class="col-sm-4 col-form-label">종교활동</label>
                  <div class="col-sm-8">
                    <input type="text" class="form-control" name="religion" id="religion" value="${DetailsOne.religion}">
                  </div>
                </div>
                <div class="form-group row">
                  <label for="hospital" class="col-sm-4 col-form-label">전화번호</label>
                  <div class="col-sm-8">
                    <input type="text" class="form-control" name="hospital_tel" id="hospital_tel" value="${DetailsOne.hospital_tel}">
                  </div>
                </div>
              </form>
            </div>
             <div class="modal-footer justify-content-center">
               <button type="button" class="btn btn-outline-secondary" id="saveContent1">저장</button>
               <button type="button" class="btn btn-outline-secondary" data-dismiss="modal">취소</button>
            </div>
          </div>
          <!--/.Content-->
        </div>
      <!--Modal-->
      </div>
      
     
     <!-- Grid column 2 -->
     <div class="col-md-4 pl-0 pr-0" >
   
       <!--Card Primary-->
       <div class="card cardMenu">
         <div class="card-body" id="column2">
           <div class="row col-md-12 pr-0">
             <h5 class="col-md-9 font-weight-bold mb-4">진료시간</h5>
           </div>
                  <!--Card Contents-->
             <div class="row col-md-12">
               <p class="col-md-6">쉬는날</p>
               <p class="col"><strong>${DetailsOne.holiday}</strong></p>
             </div>
             <div class="row col-md-12">
               <p class="col-md-6">점심시간</p>
               <p class="col"><strong>${DetailsOne.lunchtime}</strong></p>
             </div>
             <div class="row col-md-12">
               <p class="col-md-6">평일 접수시간</p>
               <p class="col"><strong>${DetailsOne.receipttime}</strong></p>
             </div>
             <div class="row col-md-12">
               <p class="col-md-6">토요일 접수시간</p>
               <p class="col"><strong>${DetailsOne.facilityinformation}</strong></p>
             </div>
           <!-- card-body -->
           </div>
         <!-- Edit-button -->
         <div class="card-footer border-0 pb-3" id="column2">
            <button type="button" id="editbtn-2" class="btn btn-outline-secondary" data-toggle="modal" data-target="#editContent2">수정</button>
         </div>
       <!-- cardMenu -->
       </div>
     <!-- col-md-5 p-0 -->
     </div>
     
     <!-- editbtn-2 수정 모달 -->
      <div class="modal" id="editContent2" tabindex="-1" role="dialog" aria-hidden="true" data-backdrop="false">
        <div class="modal-dialog modal-side modal-bottom-right modal-notify modal-info" role="document">
          <!--Content-->
          <div class="modal-content">
            <!--Header-->
            <div class="modal-header">
              <h5 class="heading mb-0 text-light">진료시간 수정</h5>
              <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                <span aria-hidden="true" class="text-light">&times;</span>
              </button>
            </div>
      
         <!--Body-->
         <div class="modal-body">
            <form class="container" id="upfa2" action="upDetails2" method="post">
               <div class="form-group row">
                  <label for="holiday" class="col-sm-3 col-form-label">쉬는날</label>
                  <div class="col-sm-9" id="checkday">
                  <input type="hidden" name="seach_seq" value="${DetailsOne.seach_seq}">
                  <input type="hidden" id="selholyday" name="holiday">
                      <div class="form-check form-check-inline">
                        <input class="form-check-input" type="checkbox" id="monday" <c:if test="${fn:contains(DetailsOne.holiday,'월요일')}">checked</c:if> value="월요일">
                        <label class="form-check-label" for="monday">월</label>
                      </div>
                       <div class="form-check form-check-inline">
                        <input class="form-check-input" type="checkbox" id="tuesday"<c:if test="${fn:contains(DetailsOne.holiday,'화요일')}">checked</c:if> value="화요일">
                        <label class="form-check-label" for="tuesday">화</label>
                      </div>
                       <div class="form-check form-check-inline">
                        <input class="form-check-input" type="checkbox" id="wednesday" <c:if test="${fn:contains(DetailsOne.holiday,'수요일')}">checked</c:if> value="수요일">
                        <label class="form-check-label" for="wednesday">수</label>
                      </div>
                       <div class="form-check form-check-inline">
                        <input class="form-check-input" type="checkbox" id="thursday" <c:if test="${fn:contains(DetailsOne.holiday,'목요일')}">checked</c:if> value="목요일">
                        <label class="form-check-label" for="thursday">목</label>
                      </div>
                       <div class="form-check form-check-inline">
                        <input class="form-check-input" type="checkbox" id="friday" <c:if test="${fn:contains(DetailsOne.holiday,'금요일')}">checked</c:if> value="금요일">
                        <label class="form-check-label" for="friday">금</label>
                      </div>
                       <div class="form-check form-check-inline">
                        <input class="form-check-input" type="checkbox" id="saturday" <c:if test="${fn:contains(DetailsOne.holiday,'토요일')}">checked</c:if> value="토요일">
                        <label class="form-check-label" for="saturday">토</label>
                      </div>
                      <div class="form-check form-check-inline">
                        <input class="form-check-input" type="checkbox" id="sunday" <c:if test="${fn:contains(DetailsOne.holiday,'일요일')}">checked</c:if> value="일요일">
                        <label class="form-check-label" for="sunday">일</label>
                      </div>   
                       <div class="form-check form-check-inline">
                        <input class="form-check-input" type="checkbox" id="legalholiday" <c:if test="${fn:contains(DetailsOne.holiday,'공휴일')}">checked</c:if> value="공휴일">
                        <label class="form-check-label" for="legalholiday">공휴일</label>
                      </div> 
                  <!--col-sm-8-->
                    </div>   
            <!--form-group row-->
            </div>
            <!--lunchtime-->
            <div class="form-group row">
            <label for="lunchtime" class="col-sm-3 col-form-label">점심시간</label>
            <div class="col-sm-8">
               <input type="text" class="form-control" id="lunchtime" name="lunchtime" value="${DetailsOne.lunchtime}">
            </div>
            
            </div>
            <!--receipttime -->
            <div class="form-group row"> 
            <label for="receipttime " class="col-sm-3 col-form-label">평일  접수시간</label>
            <div class="col-sm-8">
               <input type="text" class="form-control" id="receipttime" name="receipttime" value="${DetailsOne.receipttime}">
            </div>
            </div>
            <!--facilityinformation -->
            <div class="form-group row">
            <label for="facilityinformation " class="col-sm-3 col-form-label">토요일 접수시간</label>
            <div class="col-sm-8">
               <input type="text" class="form-control" id="facilityinformation" name="facilityinformation" value="${DetailsOne.facilityinformation}">
            </div>
            </div>
          <!--container-->  
             </form>
        <!--modal-body--> 
         </div>
            
             <div class="modal-footer justify-content-center">
               <button type="button" class="btn btn-outline-secondary" id="saveContent2">저장</button>
               <button type="button" class="btn btn-outline-secondary" data-dismiss="modal">취소</button>
            </div>
          </div>
          <!--/.Content-->
        </div>
      <!--Modal-->
      </div>
      
      
     <!-- Grid column 3 -->
     <div class="col-md-4 pl-0">
   
       <!--Card Primary-->
       <div class="card cardMenu">
         <div class="card-body" id="column3">
           <div class="row col-md-12 pr-0">
             <h5 class="col-md-9 font-weight-bold mb-4">병상정보</h5>
           </div>
            <!--Card Contents-->
             <div class="row col-md-12">
               
               <p class="col"><strong>${DetailsOne.treatment}</strong></p>
             </div>
           <!--   <div class="row col-md-12">
               <p class="col-md-5">상급병상</p>
               <p class="col"><strong></strong></p>
             </div>
             <div class="row col-md-12">
               <p class="col-md-5">일반병상</p>
               <p class="col"><strong></strong></p>
             </div> -->
           <!-- card-body -->
           </div>
         <!-- Edit-button -->
         <div class="card-footer border-0 pb-3" id="column3">
            <button type="button" id="editbtn-3" class="btn btn-outline-secondary" data-toggle="modal" data-target="#editContent3">수정</button>
         </div>
       <!-- cardMenu -->
       </div>
     <!-- col-md-5 p-0 -->
     </div>
     
     <!-- editbtn-3 수정 모달 -->
     <div class="modal" id="editContent3" tabindex="-1" role="dialog"
        aria-labelledby="myModalLabel" aria-hidden="true" data-backdrop="false">
        <div class="modal-dialog modal-side modal-bottom-right modal-notify modal-info" role="document">
          <!--Content-->
          <div class="modal-content">
            <!--Header-->
            <div class="modal-header">
              <h5 class="heading text-light mb-0">병상정보 수정</h5>
              <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                <span aria-hidden="true" class="text-light">&times;</span>
              </button>
            </div>
      
          <!--Body-->
          <div class="modal-body">
            <form class="container" id="upfa3" action="upDetails3" method="post">
                <div class="form-group row">
                   <input type="hidden" name="seach_seq" value="${DetailsOne.seach_seq}">
                  <label for="physiotherapy" class="col-sm col-form-label"> ${DetailsOne.treatment}</label>
                 </div>
                  <div class="col-sm">
                    <input type="text" class="form-control" id="treatment" name="treatment" value="${DetailsOne.treatment}">
                  </div>
              </form>
            </div>
             <div class="modal-footer justify-content-center">
               <button type="button" class="btn btn-outline-secondary" id="saveContent3">저장</button>
               <button type="button" class="btn btn-outline-secondary" data-dismiss="modal">취소</button>
            </div>
          </div>
          <!--/.Content-->
        </div>
      <!--Modal-->
      </div>
      
		<!-- 
	    <div class="col-md-12">
			<div class="card">
				<div class="row col-md-12">
					<h5 class="col-md-9 font-weight-bold m-4 pl-0">시설게시판</h5>
				</div>
				<p class="lead ml-4 mb-0"><small>전체 이용후기 00 </small></p>
				<div class="table-responsive text-center p-4">
				<table class="table table-bordered">
					<thead class="thead-light">
						<tr>
							<th class="w-30">작성자</th>
							<th class="w-40">제목</th>
							<th class="w-30">작성날짜</th>
						</tr>
					</thead>
					<tbody class="table-sm" id="sbList">
						<tr>
							<td>"작성자"</td>
							<td>"제목"</td>
							<td>"작성날짜"</td>
						</tr>
					</tbody>
				</table>
				</div>
			</div>
		</div>
		 -->
	   <!-- row -->
	   </div>
	</div>

   <!-- Footer -->
   <footer class="page-footer font-small">
        <!-- Copyright -->
        <div class="footer-copyright py-4 px-3">
          서울특별시 강남구 영동대로 513 4F <br/>
         Copyright (c) 2019 <span>Silver Surfer, Foundation for Smart Cloud IT Master</span> All Rights Reserved.
      </div>
   </footer>

</body>
</html>
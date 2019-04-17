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


/* 직종 선택 */
$('document').ready(function() {
	var career = ["전체","시설장","사무국장","사회복지사","의사","촉탁의사","간호사","간호조무사","치과위생사","물리치료사","작업치료사","요양보호사 1급","요양보호사 2급","요양보호사 기존유예자","영양사","사무원","조리원","위생원","관리인","보조원 운전사","프로그램관리자","치매전문교육이수자","청구담당자","기타"];
	
	$("select[name^=job]").each(function() {
		$seljob = $(this);
		$.each(eval(career), function() {
			$seljob.append("<option value='"+this+"'>"+this+"</option>");
		});
	});
});

/* 근무형태 선택  */
$('document').ready(function() {
	var category0 = ["전체","정규직","계약직","시간제"];
	var category1 = ["일일3교대","일일2교대","전임주간","전임야간","주간","야간","기타"];
	var category2 = ["일일3교대","일일2교대","전임주간","전임야간","주간","야간","기타"];
	var category3 = ["주간","야간","기타"];
	
	 // 근무형태 박스 초기화 
	$("select[name^=work]").each(function() {
		$selwork = $(this);
		$.each(eval(category0), function() {
			$selwork.append("<option value='"+this+"'>"+this+"</option>");
		});
		$selwork.next().append("<option value='전체'>상세근무형태 선택</option>");
	});

// 근무형태 선택시 상세근무형태 선택 
	$("select[name^=work]").change(function() {
		var category = "category"+$("option",$(this)).index($("option:selected",$(this))); // 근무형태의 상세근무형태 Array
		var $detail = $(this).next(); // 상태근무형태 객체
			$("option",$detail).remove(); // 상태근무형태 초기화

		if(category == "category0")
			$detail.append("<option value=''>상세근무형태 선택</option>");
		else {
			$.each(eval(category), function() {
			$detail.append("<option value='"+this+"'>"+this+"</option>");
			});
		}
	});
});


/* 
 * 구인정보 show & hide 스크립트 
 * 입력 폼에서 '저장'버튼 누르면 입력 폼 하이드/ 수정 폼 쇼 
 * 입력 폼에서 '취소'버튼 누르면 입력 폼 값 비우기 
 * 확인 폼에서 '수정'버튼 혹은 '삭제' 버튼 누르면 확인 폼 하이드 / 수정 폼 쇼 
 */
$(document).ready(function(){
	  $("#register-recruit").hide();
	  $("#confirm-recruit").hide();

	  $("#r-savebtn").click(function(){    
		 $("#register-recruit").hide();
		 $("#confirm-recruit").show();
	});
	  
	  $("#r-cancelbtn").click(function(){    
		$("#register-recruit").empty();
	});
	  
	  $("#r-editbtn").click(function(){    
		$("#confirm-recruit").hide();
		$("#register-recruit").show();
	});
	  
	  $("#r-delbtn").click(function(){    
		$("#confirm-recruit").hide();
		$("#register-recruit").show();
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
				  	<a class="nav-link text-light" href="index"><small>로그아웃</small></a>
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
		  <img src="resources/image/recruit1.jpg" class="card-img">
		  <div class="card-img-overlay text-center mt-5  pt-5">
		    <h1 class="card-title text-dark">기관관리자 구인정보</h1>
		     <h1 class="card-title text-dark">ー</h1>
		  </div>
		</div>
	<!-- view overlay -->   
	</div>
	<!-- jumbotron --> 
	</div>

	<!-- main -->
	<div class="container" id="table-recruit">
	<!-- 기관정보 -->
	<label for="facilityForm" class="col-form-label col-form-label-lg p-4"><strong>등록 구인정보</strong></label>
		<table class="table table-bordered text-center mb-5 pb-5">
		  <thead>
		    <tr class="bg-light" id="#tr-top">
		      <th class="w-10"></th>
		      <th class="w-20">모집직종</th>
		      <th class="w-30">근무형태</th>
		      <th class="w-20">모집인원</th>
		      <th class="w-10">성별</th>
		    </tr>
		  </thead>
		  <tbody>
		    <tr>
		      <td scope="row">1</td>
		      <td>"모집직종"</td>
		      <td>"근무형태"</td>
		      <td>"모집인원"</td>
		      <td>"성별"</td>
		    </tr>
		    <tr>
		      <td scope="row">1</td>
		      <td>"모집직종"</td>
		      <td>"근무형태"</td>
		      <td>"모집인원"</td>
		      <td>"성별"</td>
		    </tr>
		    
		  </tbody>
		 </table>
		    
		</div>

	<!-- main -->
	<div class="container" id="register-recruit">
	<!-- 기관정보 -->
	<label for="facilityForm" class="col-form-label col-form-label-lg p-4"><strong>구인정보 입력</strong></label>
		<table class="table table-bordered" id="facilityForm">
			<tbody>
				<!-- 기관명 : 자동입력  -->
				<tr>
					<th class="bg-light">기관명</th>
					<th colspan="3">"seach_seq"</th>
				</tr>
				<!-- 급여종류 : 자동입력 -->
       			<tr>
					<td class="bg-light">급여종류</td>
					<td colspan="3">"Type"</td>
				</tr>
				<!-- 주소 : 입력 가능 -->
				<tr>
					<td class="bg-light">주소</td>
					<td colspan="3" class="pb-0">
			          <div class="form-group form-inline">
			           <input type="text" class="col form-control form-control-sm" id="dong1">
			          </div>
          			</td>
				</tr>
				<!-- 직종,인원 : 입력가능 -->
				<tr>
					<td class="bg-light w-20">모집직종</td>
					<td class="w-30 pb-0">
						<div class="form-group form-inline">
							<select class="col form-control form-control-sm" name="job1" id="job1"></select>
						</div>
					</td>
					<td class="bg-light w-20">모집인원</td>
					<td class="w-30 pb-0">
						<div class="form-group form-inline">
							<input type="number" class="col form-control form-control-sm" id="peopleNum">
			          	</div>
					</td>
				</tr>
				<!-- 근무형태 : 입력가능 -->
				<tr>
					<td class="bg-light w-20">근무형태</td>
					<td class="w-30 pb-0">
						<div class="form-group form-inline">
							<select class="col form-control form-control-sm mr-1" name="work1" id="work1"></select>
							<select class="col form-control form-control-sm" name="detail" id="detail"></select>
						</div>
					</td>
					<td class="bg-light w-20">성별</td>
					<td class="w-30 pb-0">
						<div class="form-group form-inline">
							<select class=" col custom-select">
							  <option value="1" selected>전체</option>
							  <option value="2">남성</option>
							  <option value="3">여성</option>
							</select>
			          	</div>
					</td>
				</tr>
				<!-- 상세내용 : 입력가능 -->
				<tr>
					<td class="bg-light">상세내용</td>
					<td colspan="3" class="etc p-0 mb-0">
						<textarea class="form-control p-0" id="exampleFormControlTextarea5" rows="10"></textarea>
					</td>
				</tr>
			</tbody>
		</table>
		<div class="form-group text-center mt-3 mb-5">
			<button type="button" class="btn btn-outline-primary text-light mx-2" id="r-savebtn">
			 등록</button>
			<button type="button" class="btn btn-secondary mx-2" id="r-cancelbtn">
			 취소</button>
		</div>
	</div>
	
	<!-- main -->
	<div class="container" id="confirm-recruit">
	<!-- 기관정보 -->
	<label for="facilityForm" class="col-form-label col-form-label-lg p-4"><strong>구인정보 확인</strong></label>
		<table class="table table-bordered" id="facilityForm">
			<tbody>
				<!-- 기관명 : 자동입력  -->
				<tr>
					<th class="bg-light">기관명</th>
					<th colspan="3">"seach_seq"</th>
				</tr>
				<!-- 급여종류 : 자동입력 -->
       			<tr>
					<td class="bg-light">급여종류</td>
					<td colspan="3">"Type"</td>
				</tr>
				<!-- 주소 : 입력 가능 -->
				<tr>
					<td class="bg-light">주소</td>
					<td colspan="3" class="pb-0"></td>
				</tr>
				<!-- 직종,인원 : 입력가능 -->
				<tr>
					<td class="bg-light w-20">모집직종</td>
					<td class="w-30 pb-0"></td>
					<td class="bg-light w-20">모집인원</td>
					<td class="w-30 pb-0"></td>
				</tr>
				<!-- 근무형태 : 입력가능 -->
				<tr>
					<td class="bg-light">근무형태</td>
					<td colspan="3" class="pb-0"></td>
				</tr>
				<!-- 상세내용 : 입력가능 -->
				<tr>
					<td class="bg-light">상세내용</td>
					<td colspan="3" class="etc1 p-0 mb-0"></td>
				</tr>
			</tbody>
		</table>
		<div class="form-group text-center mt-3 mb-5">
			<button type="button" class="btn btn-outline-primary text-light mx-2" id="r-editbtn">
			 수정</button>
			<button type="button" class="btn btn-secondary mx-2" id="r-delbtn">
			 삭제</button>
		</div>
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
	
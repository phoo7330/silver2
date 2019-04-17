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

/* 지역 선택 */
$('document').ready(function() {
	var area0 = ["시/도 선택","서울특별시","인천광역시","대전광역시","광주광역시","대구광역시","울산광역시","부산광역시","경기도","강원도","충청북도","충청남도","전라북도","전라남도","경상북도","경상남도","제주도"];
	var area1 = ["전체","강남구","강동구","강북구","강서구","관악구","광진구","구로구","금천구","노원구","도봉구","동대문구","동작구","마포구","서대문구","서초구","성동구","성북구","송파구","양천구","영등포구","용산구","은평구","종로구","중구","중랑구"];
	var area2 = ["전체","계양구","남구","남동구","동구","부평구","서구","연수구","중구","강화군","옹진군"];
	var area3 = ["전체","대덕구","동구","서구","유성구","중구"];
	var area4 = ["전체","광산구","남구","동구",     "북구","서구"];
	var area5 = ["전체","남구","달서구","동구","북구","서구","수성구","중구","달성군"];
	var area6 = ["전체","남구","동구","북구","중구","울주군"];
	var area7 = ["전체","강서구","금정구","남구","동구","동래구","부산진구","북구","사상구","사하구","서구","수영구","연제구","영도구","중구","해운대구","기장군"];
	var area8 = ["전체","고양시","과천시","광명시","광주시","구리시","군포시","김포시","남양주시","동두천시","부천시","성남시","수원시","시흥시","안산시","안성시","안양시","양주시","오산시","용인시","의왕시","의정부시","이천시","파주시","평택시","포천시","하남시","화성시","가평군","양평군","여주군","연천군"];
	var area9 = ["전체","강릉시","동해시","삼척시","속초시","원주시","춘천시","태백시","고성군","양구군","양양군","영월군","인제군","정선군","철원군","평창군","홍천군","화천군","횡성군"];
	var area10 = ["전체","제천시","청주시","충주시","괴산군","단양군","보은군","영동군","옥천군","음성군","증평군","진천군","청원군"];
	var area11 = ["전체","계룡시","공주시","논산시","보령시","서산시","아산시","천안시","금산군","당진군","부여군","서천군","연기군","예산군","청양군","태안군","홍성군"];
	var area12 = ["전체","군산시","김제시","남원시","익산시","전주시","정읍시","고창군","무주군","부안군","순창군","완주군","임실군","장수군","진안군"];
	var area13 = ["전체","광양시","나주시","목포시","순천시","여수시","강진군","고흥군","곡성군","구례군","담양군","무안군","보성군","신안군","영광군","영암군","완도군","장성군","장흥군","진도군","함평군","해남군","화순군"];
	var area14 = ["전체","경산시","경주시","구미시","김천시","문경시","상주시","안동시","영주시","영천시","포항시","고령군","군위군","봉화군","성주군","영덕군","영양군","예천군","울릉군","울진군","의성군","청도군","청송군","칠곡군"];
	var area15 = ["전체","거제시","김해시","마산시","밀양시","사천시","양산시","진주시","진해시","창원시","통영시","거창군","고성군","남해군","산청군","의령군","창녕군","하동군","함안군","함양군","합천군"];
	var area16 = ["전체","서귀포시","제주시","남제주군","북제주군"];

 // 시/도 선택 박스 초기화	
	$("select[name^=sido]").each(function() {
		$selsido = $(this);
		$.each(eval(area0), function() {
			$selsido.append("<option value='"+this+"'>"+this+"</option>");
		});
		$selsido.next().append("<option value='전체'>구/군 선택</option>");
	});

// 시/도 선택시 구/군 설정
	$("select[name^=sido]").change(function() {
		var area = "area"+$("option",$(this)).index($("option:selected",$(this))); // 선택지역의 구군 Array
		var $gugun = $(this).next(); // 선택영역 군구 객체
			$("option",$gugun).remove(); // 구군 초기화

		if(area == "area0")
			$gugun.append("<option value=''>구/군 선택</option>");
		else {
			$.each(eval(area), function() {
			$gugun.append("<option value='"+this+"'>"+this+"</option>");
			});
		}
	});

});


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
			            <select class="col-md-3 form-control form-control-sm mr-1" name="sido1" id="sido1"></select>
			            <select class="col-md-3 form-control form-control-sm mr-1" name="gugun1" id="gugun1"></select>
			            <input type="text" class="col form-control form-control-sm" id="dong1" placeholder="나머지 주소를 입력하세요.">
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
					<td class="bg-light">근무형태</td>
					<td colspan="3" class="pb-0">
						<div class="form-group form-inline">
							<select class="col-md-3 form-control form-control-sm mr-1" name="work1" id="work1"></select>
							<select class="col-md-3 form-control form-control-sm" name="detail" id="detail"></select>
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
	<footer class="page-footer font-small">
  		<div class="footer-copyright py-4 px-3">
    		서울특별시 강남구 영동대로 513 4F <br/>
			Copyright (c) 2019 <span>Silver Surfer, Foundation for Smart Cloud IT Master</span> All Rights Reserved.
		</div>
	</footer>

</body>
</html>
	
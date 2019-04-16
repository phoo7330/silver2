<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>

	<title>회원가입</title>
	
	
	<!-- 인코딩 -->
	<meta charset="UTF-8">
	<meta  name="viewport" content="width-device-width, initial-scale=1, shrink-to-fit=no">
    
	<!-- Bootstrap CSS 추가 -->
	<link rel="stylesheet" href="resources/css/bootstrap.min.css">
	
	<!-- Custom CSS 추가 -->
	<link rel="stylesheet" href="resources/css/custom.css">
	<link rel="stylesheet" href="resources/css/signin.css"> 
	
	 <style>
      .bd-placeholder-img {
        font-size: 1.125rem;
        text-anchor: middle;
        -webkit-user-select: none;
        -moz-user-select: none;
        -ms-user-select: none;
        user-select: none;
      }

      @media (min-width: 768px) {
        .bd-placeholder-img-lg {
          font-size: 3.5rem;
        }
      }
    </style>
    
</head>
<body>

	<!-- jQuery javaScript 추가 -->
	<script src="resources/js/jquery.min.js"></script>
	
	<!-- Popper javaScript 추가 -->
	<script src="resources/js/popper.min.js"></script>
	
	<!-- Bootstrap javaScript 추가 -->
	<script src="resources/js/bootstrap.min.js"></script>
	
	<!-- 일반로그인 스크립트 -->
	<script>
 	 $(function(){
 		if('${message}'!=''){
 			alert('${message}');
 		};
		 $("#custom-signup").hide();
		 $(".institution").hide(); 
		 /* 일반가입자 가입 버튼 */
		 
		 
		 $('#custombtn').on('click',function(){
			 console.log("aaa");
			 $(".select-signup").hide();
			 $(".institution").hide();
			 $("#custom-signup").show(); 
		 });
		 
		
		  /* 기관관리자 가입 버튼 */
		 $("#facilitybtn").on('click',function(){
			 console.log("aaa");
			 $(".select-signup").hide();
			 $("#custom-signup").hide();
			 $(".institution").show(); 
		 });
		 $("#signupbtn").on("click",function(){
			var idlang = $("#inputId1").val().length;
			var pslang = $("#inputPwd1").val().length; 
			var unlang = $("#inputName").val().length; 
			var bilang = $("#inputBirth").val().length;
			var gelang = $("#inputGender").val().length;
			var emlang = $("#inputEmail").val().length;
			var adlang = $("#inputAddress").val().length;
			if(idlang<4||idlang>10){
				alert("4~10자리 id 입력");
				return;
			}
			if(pslang<6||pslang>10){
				alert("6~10자리 pw 입력");
				return;
			}
			if(unlang<1){
				alert("이름을 입력해주세요");
				return;
			}
			if(bilang<1){
				alert("생년월일을 입력해주세요");
				return;
			}
			if(gelang>3){
				alert("성별을 입력해주세요");
				return;
			}
			if(emlang<1){
				alert("이메일을 입력해주세요");
				return;
			}
			if(adlang<1){
				alert("주소를 입력해주세요");
				return;
			}
			$("#custom-signup").submit(); 
		 });
		 
		  //기관관리자 유효성검사
		 $("#insertbtn").on("click",function(){
			var idlang = $("#inputId2").val().length;
			var pslang = $("#inputPwd2").val().length; 
			var unlang = $("#username").val().length; 
			
			if(idlang<4||idlang>10){
				alert("4~10자리 id 입력");
				return;
			}
			if(pslang<6||pslang>10){
				alert("6~10자리 pw 입력");
				return;
			}
			if(unlang<1){
				alert("기관검색을 해주세요");
				return;
			}
			$("#institution-signup").submit(); 
		 });
		 //일반사용자 아이디 실시간 검사
		 $('#inputId1').keyup(function(){
			 var userid = $("#inputId1").val();
			 console.log(userid);
			 if (userid.length <= 4) { //최소 글자수 이상
					 $(".span_id2").html("");
	 				 $(".span_id1").html("4자리 이상 입력하세요");
	 
	                    }else{
	                    	$.ajax({
	            				url:"idtest", 
	            				type:"get",
	            				data:{"userid":userid},
	            				success:succ
	            				});
	                    	
	                    }
	 
	                });
		 //기관관리자 아이디 실시간 검사
		 $('#inputId2').keyup(function(){
			 var userid = $("#inputId2").val();
			 console.log(userid);
			 if (userid.length <= 4) { //최소 글자수 이상
					 $(".span_id2").html("");
	 				 $(".span_id1").html("4자리 이상 입력하세요");
	 
	                    }else{
	                    	$.ajax({
	            				url:"idtest", 
	            				type:"get",
	            				data:{"userid":userid},
	            				success:succ
	            				});
	                    	
	                    }
	 
	                });
		
		
		  //시설정보를 받아오기 위해 시설이름을 검색한다.
		 $("#modal-searchbtn").on('click',function(){
			var name = $("#sname").val();
			console.log(name);
			// whatsilver
			$.ajax({
				url:"whatsilver", 
				type:"get",
				data:{"silvername":name},
				success:infosilver
				});
		 });
		 //검색창에서 엔터키를 눌렀을때도 위와 똑같이 작동함.
		 $("#sname").keydown(function(key) {
			 if (key.keyCode == 13) {
			 var name = $("#sname").val();
				console.log(name);
				// whatsilver
				$.ajax({
					url:"whatsilver", 
					type:"get",
					data:{"silvername":name},
					success:infosilver
					});
			 }
		 });
		  
	 });  
 	 
 	 
		/* 지역 선택 */
		$('document').ready(function() {
			var area0 = ["시/도 선택","서울특별시","인천광역시","대전광역시","광주광역시","대구광역시","울산광역시","부산광역시","경기도","강원도","충청북도","충청남도","전라북도","전라남도","경상북도","경상남도","제주도"];
			var area1 = ["강남구","강동구","강북구","강서구","관악구","광진구","구로구","금천구","노원구","도봉구","동대문구","동작구","마포구","서대문구","서초구","성동구","성북구","송파구","양천구","영등포구","용산구","은평구","종로구","중구","중랑구"];
			var area2 = ["계양구","남구","남동구","동구","부평구","서구","연수구","중구","강화군","옹진군"];
			var area3 = ["대덕구","동구","서구","유성구","중구"];
			var area4 = ["광산구","남구","동구",     "북구","서구"];
			var area5 = ["남구","달서구","동구","북구","서구","수성구","중구","달성군"];
			var area6 = ["남구","동구","북구","중구","울주군"];
			var area7 = ["강서구","금정구","남구","동구","동래구","부산진구","북구","사상구","사하구","서구","수영구","연제구","영도구","중구","해운대구","기장군"];
			var area8 = ["고양시","과천시","광명시","광주시","구리시","군포시","김포시","남양주시","동두천시","부천시","성남시","수원시","시흥시","안산시","안성시","안양시","양주시","오산시","용인시","의왕시","의정부시","이천시","파주시","평택시","포천시","하남시","화성시","가평군","양평군","여주군","연천군"];
			var area9 = ["강릉시","동해시","삼척시","속초시","원주시","춘천시","태백시","고성군","양구군","양양군","영월군","인제군","정선군","철원군","평창군","홍천군","화천군","횡성군"];
			var area10 = ["제천시","청주시","충주시","괴산군","단양군","보은군","영동군","옥천군","음성군","증평군","진천군","청원군"];
			var area11 = ["계룡시","공주시","논산시","보령시","서산시","아산시","천안시","금산군","당진군","부여군","서천군","연기군","예산군","청양군","태안군","홍성군"];
			var area12 = ["군산시","김제시","남원시","익산시","전주시","정읍시","고창군","무주군","부안군","순창군","완주군","임실군","장수군","진안군"];
			var area13 = ["광양시","나주시","목포시","순천시","여수시","강진군","고흥군","곡성군","구례군","담양군","무안군","보성군","신안군","영광군","영암군","완도군","장성군","장흥군","진도군","함평군","해남군","화순군"];
			var area14 = ["경산시","경주시","구미시","김천시","문경시","상주시","안동시","영주시","영천시","포항시","고령군","군위군","봉화군","성주군","영덕군","영양군","예천군","울릉군","울진군","의성군","청도군","청송군","칠곡군"];
			var area15 = ["거제시","김해시","마산시","밀양시","사천시","양산시","진주시","진해시","창원시","통영시","거창군","고성군","남해군","산청군","의령군","창녕군","하동군","함안군","함양군","합천군"];
			var area16 = ["서귀포시","제주시","남제주군","북제주군"];
		
		 // 시/도 선택 박스 초기화	
			$("select[name^=sido]").each(function() {
				$selsido = $(this);
				$.each(eval(area0), function() {
					$selsido.append("<option value='"+this+"'>"+this+"</option>");
				});
				$selsido.next().append("<option value=''>구/군 선택</option>");
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
function succ(data){
	console.log(data);
	if(data==0){
		$(".span_id2").html("");
		$(".span_id1").html("중복된 아이디가 있습니다.");
	}else if(data==1){
		$(".span_id1").html("");
		$(".span_id2").html("사용할 수 있는 아이디 입니다.");
	}
	
}	
		
function infosilver(data){
	console.log(data);
	var list ='';
	
	
	list += '<thead><tr><th class="th-name">기관명</th><th>주소</th></tr></thead><tbody>';
	$.each(data, function (index, item){
		list+='<tr style="cursor:pointer" onclick="location.href=\'javascript:printsilver('+item.seach_seq+','+item.type+')\'" data-dismiss="modal">';
		list+='<td>'+item.silvername+'</td><td>'+item.areaa+' '+item.areab+' '+item.areac+'</td></tr>';
		
	});
	list += '</tbody>';

	$('#selectsilver').html(list);
}	
function printsilver(seach_seq,type){
	console.log(seach_seq);
	console.log(type);
	if(type==1){
		$.ajax({
			url:"printsilverone", 
			type:"get",
			data:{"seach_seq":seach_seq},
			success:printsilver2
			});
	}else{
		$.ajax({
			url:"printsilvertwo", 
			type:"get",
			data:{"seach_seq":seach_seq},
			success:printsilver2
			});
	}
	
}	 	
function printsilver2(data){
	console.log(data);
    var siltype = null;
    if(data.type==1){
       siltype = "요양병원";          
    } else if(data.type==2){
       siltype = "요양원";          
    } else if(data.type==3){
       siltype = "방문시설";          
    } else if(data.type==4){
       siltype = "치매전담";          
    }
	$('#silvertype').val(siltype);
	$('#username').val(data.silvername);
	
	if(data.hospital_tel!=null){
		$('#telephone').val(data.hospital_tel);
		$('#address').val(data.hp_address);
	}else if(data.tel!=null){
		$('#telephone').val(data.tel);
		$('#address').val(data.address);
	}
	
	
	
	
}

	</script>


	<!-- 메인 네비게이션 -->
	<header>
		<nav class="navbar navbar-expand-md navbar-dark fixed-top p-3" id="main-nav">
	 		<a class="navbar-brand mr-5 p-0" href="index"><img src="resources/image/silversurferLogo.png"></a>
	 		<!-- 오른쪽 상단 토글러 버튼 -->
			<button class="navbar-toggler pt-0" type="button" data-toggle="collapse" data-target="#navbarCollapse" aria-controls="navbarCollapse" aria-expanded="false" aria-label="Toggle navigation">
	      	<span class="navbar-toggler-icon"></span>
			</button>
			<!-- 네비게이션 상단 메뉴 -->
			<div class="collapse navbar-collapse justify-content-between" id="navbarCollapse">
				<ul class="navbar-nav">
					<li class="nav-item active" style="color: black;">
			  			<a class="nav-link text-light mr-3" href="institution"><strong>요양기관</strong><span class="sr-only">(current)</span></a>
			  		</li>
			  		<li class="nav-item">
			  			<a class="nav-link text-light mr-3" href="careersIndex"><strong>종사자</strong></a>
			  		</li>
			  		<li class="nav-item">
			  			<a class="nav-link text-light mr-3" href="inquiry"><strong>자주하는질문</strong></a>	
			  		</li>
			  	</ul>
				<!-- 로그인 안한 경우 -->
			  	<c:if test="${sessionScope.loginId==null}">
			  	<ul class="navbar-nav mt-2 mt-md-0">
			  		<li class="nav-item">
			  			<a class="nav-link text-light" href="login"><small>로그인</small></a>
			  		</li>
			  		<li class="nav-item">
			  			<a class="nav-link text-light" href="signup"><small>회원가입</small></a>
			  		</li>
			  	</ul>
			  	</c:if>
			  	<!-- 로그인 후(dropdown) : 마이페이지/로그아웃 -->
			  	<c:if test="${sessionScope.loginId!=null}">
				  	<ul class="navbar-nav mt-2 mt-md-0">
				  		<li class="nav-item">
				  			<a class="nav-link text-light" href="logout"><small>로그아웃</small></a>
				  		</li>
				  	</ul>
			  	</c:if>
			</div>  
		</nav>	
	</header>	

<hr class="my-1">
	<!-- 회원가입 선택 -->
	<div class="container select-signup">
		<div class="py-5 text-center">
			<img class="mb-4" src="resources/image/user.svg" alt="" width="72" height="72"> 
			<div class="signup-header px-5 py-0">
				<h4 class="my-1">회원가입</h4>
				<p class="lead">실버서퍼 가입시 일반사용자,종사자,기관관리자가 구분됩니다. <br>기관 관리자 담당자는 기관관리자 버튼을 눌러주세요.</p>
			</div>
		</div>
		
		<!-- 사용자 구분 -->
	<div class="card-deck mb-3 text-center">
	<div class="col-1">
	</div>
	<div class="col-5">
		<div class="card mb-5 shadow-sm">
			<div class="card-header">
				<h4 class="my-0 font-weight-normal">일반가입자</h4>
			</div>
			<div class="card-body">
				<h4 class="card-title pricing-card-title">일반·종사자 가입</h4>
				<ul class="list-unstyled mt-3 mb-4">
				<li>일반사용자와 요양기관 구직</li>	
				<li>하고있는 종사자로 등록하기</li>		          
				</ul>
				<button id="custombtn" type="button" class="btn btn-lg btn-block btn-outline-info">가입하기</button>
			</div>
		</div>
	</div>
	<div class="col-5">
		<div class="card mb-5 shadow-sm">
			<div class="card-header">
				<h4 class="my-0 font-weight-normal">기관담당자</h4>
			</div>
			<div class="card-body">
				<h4 class="card-title pricing-card-title">기관관리자 가입</h4>
				<ul class="list-unstyled mt-3 mb-4">
				<li>실제 요양기관을 운영중인</li>
				<li>기관 담당자 등록하기</li>
				</ul>
				<button id="facilitybtn" type="button" class="btn btn-lg btn-block btn-outline-info">가입하기</button>
			</div>
		</div>
	</div>
	<div class="col-1">
	</div>
	</div>	
</div>

	<!-- 일반가입자 회원가입 --> 
	<form class="form-signup" id="custom-signup" action="insertMember" method="post">
		
		<div class="container c-signup">
		<!-- 상단 -->
		<div class="py-5 text-center">
			<img class="mb-4" src="resources/image/userplus.svg" alt="" width="72" height="72"> 
			<div class="signup-header">
				<h4 class="my-1">회원가입</h4>
				<p class="lead">일반가입자 회원가입 페이지 입니다.</p>
			</div>
		</div>
		<!-- 하단 -->
		<div class="p-1 col-12">
			
			<!-- 가입자구분 -->
			<div class="form-group row">
			<div class="col">
			</div>
				<label for="inputType" class="col-sm-2 col-form-label">가입자 구분</label>
				<div class="col-sm-4">
					<div class="form-check form-check-inline">
						<input class="form-check-input" type="radio" name="type" id="custom" value=1 checked>
						<label class="form-check-label" for="custom">일반가입자</label>
					</div>
					<div class="form-check form-check-inline">
						<input class="form-check-input" type="radio" name="type" id="worker" value=2>
						<label class="form-check-label" for="worker">종사자</label>
					</div>
				</div>
			<div class="col">
			</div>
			</div>
			<!-- 아이디 -->
	  		<div class="form-group row">
	  		<div class="col">
			</div>
			    <label for="inputId" class="col-sm-2 col-form-label">아이디</label>
			    <div class="col-sm-4">
			      <input type="text" name="userid" class="form-control" id="inputId1" placeholder="아이디"><span style="color:red" class="span_id1"></span><span style="color:blue" class="span_id2"></span>
			    </div>
			<div class="col">
			</div>
	  		</div>
	  		<!-- 패스워드 -->
			<div class="form-group row">
			<div class="col">
			</div>
			    <label for="inputPwd" class="col-sm-2 col-form-label">패스워드</label>
			    <div class="col-sm-4">
			      <input type="password" name="userpwd" class="form-control" id="inputPwd1" placeholder="패스워드">
				  <small id="passwordHelpInline" class="text-muted"> 영문 소문자+숫자 조합입니다.</small>
			    </div>
			<div class="col">
			</div>
			</div>	
			<!-- 이름 -->
			<div class="form-group row">
			<div class="col">
			</div>
			    <label for="inputName" class="col-sm-2 col-form-label">이름</label>
			    <div class="col-sm-4">
			      <input type="text" name="username" class="form-control" id="inputName" value="${member.username}" placeholder="이름">
			    </div>
			<div class="col">
			</div>
			</div>	
			<!-- 생년월일 -->
			<div class="form-group row">
			<div class="col">
			</div>
			    <label for="inputBirth" class="col-sm-2 col-form-label">생년월일</label>
			    <div class="col-sm-4">
			      <input type="date" name="birthday" class="form-control" id="inputBirth" value="${member.birthday}">
			    </div>
			<div class="col">
			</div>
			</div>	
			<!-- 성별 -->
			<div class="form-group row">
			<div class="col">
			</div>
				<label for="inputType" class="col-sm-2 col-form-label">성별</label>
				<div class="col-sm-4">
					 <select class="custom-select my-1 mr-sm-2" name="gender" id="inputGender">
					    <option selected>성별선택</option>
					    <option name="gender" value="남성">남성</option>
					    <option name="gender" value="여성">여성</option>
					  </select>
				</div>
			<div class="col">
			</div>
			</div>
			<!-- 이메일 -->
  			<div class="form-group row">
  			<div class="col">
			</div>
			    <label for="inputEmail" class="col-sm-2 col-form-label">이메일</label>
			    <div class="col-sm-4">
			      <input type="email" name="email" class="form-control" id="inputEmail" value="${member.email}" placeholder="이메일">
			    </div>
			<div class="col">
			</div>
			</div>	
			<!-- 주소 -->
			<div class="form-group row">
			<div class="col">
			</div>
			    <label for="inputAddress" class="col-sm-2 col-form-label">주소</label>
			    <div class="col-sm-4">
			      <input type="text" name="address" class="form-control" id="inputAddress" value="${member.address}" placeholder="주소">
			    </div>
			<div class="col">
			</div>
			</div>
			
			<!-- 경고값 초기화(3.26일 김동우 수정) -->
			<input type="hidden" name="warning" value=0>
			
			<!-- 제출버튼 -->
			<div class="form-group row">
				<div class="col">
				</div>
					<div class="col-sm-6">
						<button type="button" id="signupbtn" class="btn btn-info btn-lg btn-block">회원가입</button>
					</div>
				<div class="col">
				</div>
			</div>
			
		<!-- p-1 col-12 -->
		</div> 
		<!-- container c-signup -->
		</div>
	<!-- #custom-signup -->	
	</form>


	<!-- 기관관리자 회원가입 -->
	<form class="form-signup institution"  id="institution-signup" action="insertSilver" method="post" >
		
		<div class="container c-signup">
		<!-- 상단 -->
		<div class="py-5 text-center">
			<img class="mb-4" src="resources/image/userplus.svg" alt="" width="72" height="72"> 
			<div class="signup-header">
				<h4 class="my-1">기관등록</h4>
				<p class="lead">기관관리자 회원가입 페이지 입니다.</p>
			</div>
		</div>
		<!-- 하단 -->
		<div class="p-1 col-12">
			
			<!-- 아이디 -->
			<input type="hidden" name="type" value="3">
	  		<div class="form-group row">
	  		<div class="col">
			</div>
			    <label for="inputId" class="col-sm-2 col-form-label">아이디</label>
			    <div class="col-sm-4">
			      <input type="text" name="userid" class="form-control" id="inputId2" placeholder="아이디"><span style="color:red" class="span_id1"></span><span style="color:blue" class="span_id2"></span>
			    </div>
			<div class="col">
			</div>
	  		</div>
	  		<!-- 패스워드 -->
			<div class="form-group row">
			<div class="col">
			</div>
			    <label for="inputPwd" class="col-sm-2 col-form-label">패스워드</label>
			    <div class="col-sm-4">
			      <input type="password" name="userpwd" class="form-control" id="inputPwd2" value="" placeholder="패스워드">
				  <small id="passwordHelpInline" class="text-muted"> 영문 소문자+숫자 조합입니다.</small>
			    </div>
			<div class="col">
			</div>
			</div>	
			<!-- 기관명 -->
			<div class="form-group row">
			<div class="col">
			</div>
			    <label for="inputInstitution" class="col-sm-2 col-form-label">기관명</label>
			    <div class="col-sm-3 pr-0">
			      <input type="text" name="username" id="username" class="form-control" placeholder="기관명" readonly>
			    </div>
			    <!-- 기관검색 모달창 버튼 : 모달창은 맨 아래 -->
			    <div class="col-sm-1">
					<button type="button" class="btn btn-info btn-md btn-block" id="f-searchbtn" data-toggle="modal" data-target="#search-popup">검색</button>
				</div>
			<div class="col">
			</div>
			</div>	
			<!-- 기관분류 -->
			<div class="form-group row">
			<div class="col">
			</div>
			    <label for="InstitutionType" class="col-sm-2 col-form-label">기관분류</label>
				<div class="col-sm-4">
					<input type="text" class="form-control" id="silvertype" placeholder="기관분류" id="facilityType" readonly>
				</div>
			<div class="col">
			</div>
			</div>	
			<!-- 주소 -->
			<div class="form-group row mb-0">
				<div class="col">
				</div>
					<label for="inputAddress" class="col-sm-2 col-form-label">주소</label>
		         	<div class="form-group col-sm-4">
		         		<input type="text" class="form-control mb-1" placeholder="주소" id="address"  name="address" readonly>
		        	</div>
	        	<div class="col">
				</div>   
			</div>
			<!-- 전화 -->
  			<div class="form-group row">
  			<div class="col">
			</div>
			    <label for="inputPhone" class="col-sm-2 col-form-label">전화</label>
			    <div class="col-sm-4">
			      <input type="text" name="telephone" class="form-control" id="telephone" value="" placeholder="전화번호" readonly>
			    </div>
			<div class="col">
			</div>
			</div>	

			<!-- 제출버튼 -->
			<div class="form-group row">
				<div class="col">
				</div>
					<div class="col-sm-6 mb-5">
						<button type="button" id="insertbtn" class="btn btn-info btn-lg btn-block">기관등록 요청하기</button>
					</div>
				<div class="col">
				</div>
			</div>
			
		<!-- p-1 col-12 -->
		</div> 
		<!-- container c-signup -->
		</div>
		
		
		<!-- Modal -->
	<div class="modal fade" id="search-popup" tabindex="-3" role="dialog" aria-hidden="true" data-backdrop="false">
		  <div class="modal-dialog modal-lg modal-full-height modal-right modal-notify modal-info" role="document">
		    <div class="modal-content">
		      <!--Header-->
		      <div class="modal-header">
		        <p class="heading lead">기관명 검색하기</p>
		        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
		          <span aria-hidden="true" class="white-text">×</span>
		        </button>
		      </div>
		      <!--Body-->
		      <div class="modal-body">
		        <div class="text-center">
		          <p>
		            <strong>기관명을 검색하세요.</strong>
		          </p>
		          <p>
		            찾으시려는<strong> 기관명</strong>을 정확하게 입력해주세요.
		          </p>
		        </div>
		        <hr>
		        <!-- search -->
		        <div class="form-group row">
		        <form onsubmit="return false">
					    <label for="inputInstitution" class="col-sm-2 col-form-label">기관명</label>
					    <div class="col-sm-7 pr-0">
					      <input type="text" id="sname" name="searchFacility" class="form-control" placeholder="지역 혹은 기관명을 입력하세요.">
					    </div>
					    <div class="col-sm-3">
							<button type="button" id="modal-searchbtn" class="btn btn-info btn-md btn-block">검색</button>
						</div>
				</form>
					</div>	
					<!-- 검색 리스트 -->
					<table id="selectsilver" class="table table-bordered">
				        
					</table>
				
		      <!--Footer-->
		      <div class="modal-footer justify-content-center">
		        <a type="button" class="btn btn-outline-info" data-dismiss="modal">닫기</a>
		        </div>
		    </div>
		  </div>
		</div>
	</div>
		

	<!-- #institution-signup -->	
	</form>

</body>
</html>
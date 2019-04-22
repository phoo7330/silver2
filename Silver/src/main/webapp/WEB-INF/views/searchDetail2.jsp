<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>

	<title>실버서퍼-기관검색</title>
	
	<!-- 인코딩 -->
	<meta charset="UTF-8">
	<meta  name="viewport" content="width-device-width, initial-scale=1, shrink-to-fit=no">
	<script type="text/javascript" src="https://openapi.map.naver.com/openapi/v3/maps.js?ncpClientId=ynuycabqm2"></script>
	<script type="text/javascript" src="resources/src/MarkerClustering.js"></script>
    <!-- jQuery javaScript 추가 -->
	<script src="resources/js/jquery.min.js"></script>
	
	<!-- Popper javaScript 추가 -->
	<script src="resources/js/popper.min.js"></script>
	
	<!-- Bootstrap javaScript 추가 -->
	<script src="resources/js/bootstrap.min.js"></script>
    
	<!-- Bootstrap CSS 추가 -->
	<link rel="stylesheet" href="resources/css/bootstrap.min.css">
	
	<!-- Custom CSS 추가 -->
	<link rel="stylesheet" href="resources/css/custom.css">
	<link rel="stylesheet" href="resources/css/search.css">

</head>
<body>
<script>
$(function(){
	grade();
	what();
	mark();
	selectBoard();
	senior();
	
	
	$("#cancelbtn").on("click",function(){
		$('#insertform')[0].reset(); //게시글 취소버튼
	});
	$("#m-insertb").on("click",function(){ // 쪽지 보내기 버튼
		if('${message}'!=''){
			alert('${message}');
		};
		if('${silid}'==''){
			alert("현 시설은 아직 가입하지 않은 시설입니다. 전화로 문의해주세요.");
			return;
		}
		
		insertmessage();
	});
	$("#btn-comment").on("click",function(){
		insertComment();
	});
	$("#insertbtn").on("click",function(){	
		insertBoard();  //게시글 저장버튼
	});	
	$("#editbtn").click('show.bs.modal', function(){
		updateBoard2();
		});
});

function senior(){   // 방문신청에 노인정보를 미리 넣어둠
	var senior = '';
	//console.log('${sc}');
	senior += '-기본정보\n이름 : ${sc.sc_name} 생년월일 : ${sc.sc_birthday} 혈액형 : ${sc.sc_bloodtype}';
	senior += '\n-일상생활 수행정도\n식사 : ${scd.scd_meal} 보행 : ${scd.scd_care} 세면 : ${scd.scd_washing}';
	senior += '\n의복 : ${scd.scd_clothing} 목욕 : ${scd.scd_bath} 화장실 : ${scd.scd_toilet}';
	senior += '\n질환정보 : ${scd.scd_disease}';
	senior += '\n기타사항 : ${scd.scd_others}';
	
	$("#con2").html(senior);
}
function insertmessage(){
	var ms_vdate=$('#ms_vdate').val();
	console.log(ms_vdate);
	if(ms_vdate==''){
		alert("방문날짜를 입력하세요");
		return;
	}
	var title = $('#request-title').val().length;
	if(title<1){
		alert("제목을 입력하세요");
		return;
	}
	var content = $('#request-content').val().length;
	if(content<10){
		alert("내용을 10자이상 입력하세요");
		return;
	}
	
	var userid = $('#inputId').val();
	var title = $('#request-title').val();
	var content = $('#request-content').val();
	var content2 = $('#con2').val();
	var sender = $('#ms_sender').val();
	console.log(userid);
	console.log(title);
	console.log(content);
	console.log(content2);
	console.log(sender);
	//$('#insertmessage1')[0].submit();
	$.ajax({
        type : 'post',
        url : 'insertmessage1',
        data : {userid:userid,
        		ms_title:title,
        		ms_content:content,
        		ms_content2:content2,
        		ms_Sender:sender,
        		ms_vdate:ms_vdate	
        },
        success : function(data){
        	if(data==1){
        		alert("신청되었습니다!");
            	location.reload();
        	}else{
        		alert("신청에 실패했습니다. 다시시도하거나 관리자에게 문의하세요.");
            	location.reload();
        	}
        	
        }
	});  
	
}
function insertComment(){
	var sb_seq=$('#sb_seq').val();
	var sbc_seq=$('#thisseq').val();
	var sbc_write=$('#sbc_write').val();
	var userid=$('#comment-userid').val();
	var btn_comment=$("#btn-comment").html();
	 $('#sbc_write').val('');
	
	 if(btn_comment=='등록'){
		 $.ajax({
		        type : 'post',
		        url : 'insertComment',
		        data : {userid:userid,
		        		sb_seq:sb_seq,
		        		sbc_write:sbc_write	
		        },
		        success : function(){
		        	alert("등록되었습니다!");
		        	printC();
		        }
			});   
	 }else{
		 $("#btn-comment").html('등록');
		 $('#sbc_1').html("댓글쓰기");
		 $.ajax({
		        type : 'post',
		        url : 'updatecom',
		        data : {userid:userid,
		        		sbc_seq:sbc_seq,
		        		sb_seq:sb_seq,
		        		sbc_write:sbc_write	
		        },
		        success : function(){
		        	alert("수정되었습니다!");
		        	printC();
		        }
			});   
	 }
	
}
function printC(page){
	var sb_seq=$('#sb_seq').val();
	var page=page;
	$.ajax({
        type : 'get',
        url : 'selectComment',
        data : {sb_seq:sb_seq,
        		page:page
        },
        success : listC        	
	}); 
}
function listC(data){

	var list = '';
	var paging = '';
	var page = 1;
	var countComent=0;
	var loginId="${sessionScope.loginId}";
	$.each(data.result, function (index, item){
		list += '<tr><td><div class="form-group row">';
		list += '<h6 class="col-md-6" id="table-static">';
		list += '<small>'+item.userid+' | '+item.sbc_date+'</small></h6>';
		list += '<div class="col-md-6"><div class="dropdown float-right">';
		list += '<a class="btn btn-outline-light btn-sm dropdown-toggle" href="#" role="button" id="dropdownMenuLink" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"><small><img src="resources/image/morevertical.svg"></small></a> ';
		list += '<div class="dropdown-menu" aria-labelledby="dropdownMenuLink">';
		list += '<a class="dropdown-item" href="javascript:updatecom('+item.sbc_seq+')"><small>수정</small></a>';
		list += '<input type="hidden" id="sbc_seq" value="'+item.sbc_seq+'">'
		list += '<a class="dropdown-item" href="javascript:delcom('+item.sbc_seq+')"><small>삭제</small></a></div></div></div>';
		list += '<h6 class="col-md-12" id="table-contents">'+item.sbc_write+'</h6></td></tr>'; 
 
		
	}); 
	 var start= data.navi.startPageGroup;
	 var end=data.navi.endPageGroup;
	
	 paging+='<li style="cursor:pointer" onclick="location.href=\'javascript:printC('+(data.navi.currentPage-1)+')\'" class="page-item disabled"><span class="page-link">&laquo;</span></li>'
	 for(var i=start; start<end+1; start++){
			 paging+='<li class="page-item"><b><a class="page-link" href="javascript:printC('+start+')">'+start+'</a></b></li>';
	 }
	 paging+='<li style="cursor:pointer" onclick="location.href=\'javascript:printC('+(data.navi.currentPage+1)+')\'" class="page-item disabled"><span class="page-link">&raquo;</span></li>'
	 countComent+=data.navi.totalBoard;
	 
	$('#countcoment').html(countComent);
	$('#cList').html(list);


	$('#pag2').html(paging);
}
function updatecom(sbc_seq){
	var sbc_seq=sbc_seq;
	$.ajax({
        type : 'get',
        url : 'selonecom',
        data : {sbc_seq:sbc_seq},
        success : function(data){
        	
        	if(data==''){
        		alert("본인의 댓글만 수정할 수 있습니다.");
        		return;
        	}else{
        		updatecom2(data);
        	}
        	
        }
	});
}
function updatecom2(data){
	$(document).scrollTop(1000); 
	$('#sbc_write').val(data.sbc_write);
	$('#hiddenseq').html("<input type='hidden' id='thisseq' value='"+data.sbc_seq+"'>");
	console.log(data.sbc_write);
	$('#sbc_1').html("댓글수정하기");
	$('#btn-comment').html("수정");
	
}

function delcom(sbc_seq){
	
	var sbc_seq=sbc_seq;
	$.ajax({
        type : 'post',
        url : 'delcom',
        data : {sbc_seq:sbc_seq},
        success : function(data){
        	if(data==0){
        		alert("본인의 댓글만 삭제할 수 있습니다.");
        		return;
        	}else{
        		alert("삭제되었습니다");
        		printC();
        	}
        	
        }
        	       	
	}); 

}

function updateBoard(){ //수정창이 뜨면서 기존값이 입력됨
	var sb_seq=$('#sb_seq').val();
	$.ajax({
        type : 'get',
        url : 'oneboard',
        data : {sb_seq:sb_seq},
        success : upboardprint
	}); 
	function upboardprint(data){
		$('#uptitle').val(data.sbtitle);
		$('#upwrite').val(data.sbwrite);
		$('#up_seq').val(data.sb_seq);
	}
}
function updateBoard2(){
	var title = $("#uptitle").val().length;
	var write = $("#upwrite").val().length;
	if(title<1){
		alert("제목을 입력하세요");
		return;
	}
	if(write<1){
		alert("내용을 입력하세요");
		return;
	}
	var SilverBoard = $("form[name=updateform]").serialize();

	$.ajax({
        type : 'post',
        url : 'updatesb',
        data : SilverBoard,
        success : init2()
        	//$('#write-board').modal("hide");
        	//$("#write-board").toggle();
        
    });
}

function init2(){
	alert("수정되었습니다!");
	$('#edit-board').modal('hide');
	$('#updateform')[0].reset(); 

	$('#board-title').html('');
	$('#board-date').html('');
	$('#board-id').html('');
	$('#board-contents').html('');
	
	$("#tab-board-detail").hide();
	$("#tab-basic").show();
 	$("#tab-time").show();
 	$("#tab-facility").show();
 	$("#tab-address").show();
 	$("#tab-board").show();
 	window.location.replace("#tab-board");
	selectBoard();
}
function deleteBoard(){ // 게시글 시퀀스값을 가져와서 삭제한다. 
	var sb_seq=$('#sb_seq').val();

	
	$.ajax({
        type : 'post',
        url : 'delsb',
        data : {sb_seq:sb_seq},
        success : function(data){
        	if(data==1){
        	selectBoard();
        	alert("삭제되었습니다");
        	$('#board-title').html('');
    		$('#board-date').html('');
    		$('#board-id').html('');
    		$('#board-contents').html('');
    		
    		$("#tab-board-detail").hide();
    		$("#tab-basic").show();
    	 	$("#tab-time").show();
    	 	$("#tab-facility").show();
    	 	$("#tab-address").show();
    	 	$("#tab-board").show();
    	 	window.location.replace("#tab-board");
        	}
        	else{
        		alert("삭제실패");
        	}
        }
	}); 
}
function selectBoard(page){
	var seach_seq='${DetailsTwo.seach_seq}';
	var page=page; 
	
	 $.ajax({
        type : 'get',
        url : 'pageboard',
        data : {seach_seq:seach_seq,
        		page:page	
        },
        success : printB
	}); 
}
function printB(data){
	var list = '';
	var paging = '';
	var page = 1;
	var countBoard = '';
	 $.each(data.result, function (index, item){
		 list+='<tr style="cursor:pointer" class="select-table" data-value="'+item.sb_seq+'">';
		 list+='<td>'+item.userid+'</td>';
		 list+='<td>'+item.sbtitle+'</td>';
		 list+='<td>'+item.sbdate+'</td></tr>';
	 });
	 var start= data.navi.startPageGroup;
	 var end=data.navi.endPageGroup;
	
	 paging+='<li style="cursor:pointer" onclick="location.href=\'javascript:selectBoard('+(data.navi.currentPage-1)+')\'" class="page-item disabled"><span class="page-link">&laquo;</span></li>'
	 for(var i=start; start<end+1; start++){
			 paging+='<li class="page-item"><b><a class="page-link" href="javascript:selectBoard('+start+')">'+start+'</a></b></li>';
	 }
	 paging+='<li style="cursor:pointer" onclick="location.href=\'javascript:selectBoard('+(data.navi.currentPage+1)+')\'" class="page-item disabled"><span class="page-link">&raquo;</span></li>'
	 countBoard+='전체 이용후기 '+data.navi.totalBoard;
	 
	 $('#cb').html(countBoard);
	 $('#sbList').html(list);
	 $('#pag').html(paging);
	 $('.select-table').on('click', function() {
		 	$("#tab-board-detail").show(); 
			$("#tab-basic").hide();
		 	$("#tab-time").hide();
		 	$("#tab-facility").hide();
		 	$("#tab-address").hide();
		 	$("#tab-board").hide();
		 	location.href="#nav-top";
		var sb_seq=$(this).attr('data-value');
		$.ajax({
	        type : 'get',
	        url : 'oneboard',
	        data : {sb_seq:sb_seq},
	        success : printOneB
		}); 
			function printOneB(data){
				//$('#board-table').append('<input id="sb_seq" type="hidden" value="'+data.sb_seq+'">');
				$('#board-title').html(data.sbtitle+'<input id="sb_seq" type="hidden" value="'+data.sb_seq+'">');
				$('#board-date').html(data.sbdate);
				$('#board-id').html(data.userid);
				$('#board-contents').html(data.sbwrite);
				if (data.userid != "${sessionScope.loginId}") {
					$(".dropdown").hide();
				}
				printC();
			}
		});
}
function insertBoard(){
	var title = $("#sbtitle").val().length;
	var write = $("#sbwrite").val().length;
	if(title<1){
		alert("제목을 입력하세요");
		return;
	}
	if(write<1){
		alert("내용을 입력하세요");
		return;
	}
	var SilverBoard = $("form[name=insertform]").serialize();

	$.ajax({
        type : 'post',
        url : 'insertsb',
        data : SilverBoard,
        success : init()
        
    });
}
function init(){
	alert("저장되었습니다!");
	$('#write-board').modal('hide');
	$('#insertform')[0].reset(); 
	selectBoard();
}
function what(){
	//vo에 담겨있는 시설타입을 꺼내 각타입에 맞는 문자로 변환해서 출력
	var type=0;
	var sttype='';
	type='${DetailsTwo.type}';
	if(type==2){
		sttype+='요양원';
		$('#siltype').append(sttype);
		return;
	}else if(type==3){
		sttype+='방문시설';
		$('#siltype').append(sttype);
		return;
	}else if(type==4){
		sttype+='치매전담'; 
		$('#siltype').append(sttype);
		return;
	}
}

function grade(){
	//vo에 담겨있는 등급을 꺼내 각타입에 맞는 문자로 변환해서 출력
	var grade= null;
	var stgrade = '';
	grade='${DetailsTwo.grade}';
	if(grade=='A'){
		stgrade += '최우수';
		$('#grade').html(stgrade);
		return;
	}else if(grade=='B'){
		stgrade += '우수';
		$('#grade').html(stgrade);
		return;
	}else if(grade=='C'){
		stgrade += '양호';
		$('#grade').html(stgrade);
		return;
	}else if(grade=='D'){
		stgrade += '보통';
		$('#grade').html(stgrade);
		return;
	}
	else if(grade=='정보없음'){
		stgrade += '정보없음';
		$('#grade').html(stgrade);
		return;
	}
}
		
function mark(){
	
	//vo에 담겨있는 위도,경도를 꺼내 지도와 마커를 표시
	var grd_lo = '${DetailsTwo.longitude}';
 		grd_la = '${DetailsTwo.lauitude}';
	var map = new naver.maps.Map('map', {
	    center: new naver.maps.LatLng(grd_la, grd_lo),
	    zoom: 12,
	});
	var marker = new naver.maps.Marker({
	    position: new naver.maps.LatLng(grd_la, grd_lo),
	    map: map
	}); 
}	
/* 게시글작성페이지 이동  */
$(function() {
	$("#tab-board-detail").hide();
	
	$('#nav-under-basic').on('click', function() {
		$("#tab-board-detail").hide(); 
		$("#tab-basic").show();  
	 	$("#tab-time").show(); 
	 	$("#tab-facility").show(); 
	 	$("#tab-address").show(); 
	 	$("#tab-board").show(); 
	 	$("#nav-top").show();  	
	 	window.location.replace("#tab-basic"); 
	});
	
	$('#nav-under-address').on('click', function() {
		$("#tab-board-detail").hide(); 
		$("#tab-basic").show();  
	 	$("#tab-time").show(); 
	 	$("#tab-facility").show(); 
	 	$("#tab-address").show(); 
	 	$("#tab-board").show(); 
	 	$("#nav-top").show(); 
	 	window.location.replace("#tab-address");
	});
	
	$('#nav-under-board').on('click', function() {
		$("#tab-board-detail").hide(); 
		$("#tab-basic").show();  
	 	$("#tab-time").show(); 
	 	$("#tab-facility").show(); 
	 	$("#tab-address").show(); 
	 	$("#tab-board").show(); 
	 	$("#nav-top").show(); 
	 	window.location.replace("#tab-board"); 
	});
	
}); 
$(function() {
	$('#btn-return').on('click', function() {
		// 목록가기를 누르면 현재 게시글을 비운다. 
		
		$('#board-title').html('');
		$('#board-date').html('');
		$('#board-id').html('');
		$('#board-contents').html('');
		
		$("#tab-board-detail").hide();
		$("#tab-basic").show();
	 	$("#tab-time").show();
	 	$("#tab-facility").show();
	 	$("#tab-address").show();
	 	$("#tab-board").show();
	 	window.location.replace("#tab-board");
		
	});
	
});
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
			  			<a class="nav-link text-light mr-3" href="search"><strong>요양기관</strong><span class="sr-only">(current)</span></a>
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
			  		<li class="log">
			  			<div class="dropdown mr-5">
			  				<span class="welcome"><small>환영합니다</small></span>
			  					<a class="dropdown-toggle text-light" href="#" role="button" id="dropdownMenuLink" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
			  						<small>${sessionScope.loginId}님</small>
			  					</a>
				  			<div class="dropdown-menu" aria-labelledby="dropdownMenuLink">
				  				<a class="dropdown-item" href="mypage"><small>마이페이지</small></a>
				  				<a class="dropdown-item" href="logout"><small>로그아웃</small></a>
				  			</div>
			  			</div>
			  		</li>
				</ul>
			  	</c:if>
			</div>  
		</nav>	
	</header>   
	
	<!-- 왼쪽/기관정보 -->
	<div class="position-relative overflow-hidden bg-white" id="f-information">
		<div class="row mb-1">
		<div class="col-md-1">
		</div>
    		<div class="col-md-4" id="ilist">
	    		<div class="col p-4 d-flex flex-column position-static">
		    		<strong id="siltype" class="d-inline-block md-2 my-3 text-danger"><img src="resources/image/plussquare.svg"></strong>
		    		<h2 class="mb-0">${DetailsTwo.silvername}</h2>
					<div class="mb-1 text-musted">${DetailsTwo.areaa} ${DetailsTwo.areab} ${DetailsTwo.areac}</div>
		    		<p class="text-light bg-dark" style="width: 4rem;">${DetailsTwo.service}</p>
				</div>
			</div>
		<div class="col-md-2">
		</div>
		<!-- 오른쪽/등급 -->
			<div class="col-md-4">
				<div class="card-deck p-4 d-flex flex-column position-static text-center" >
					<div class="card shadow-sm card" id="card-all">
						<div class="card-body p-2">  
					     	<h1 class="pt-3 mb-0 font-weight-normal text-dark">${DetailsTwo.grade} </h1> 	
					    	<h2><strong class="pt-0 mb-0 text-dark" id="grade"></strong></h2>
						 	<hr id="hr-grade">   
							     <c:if test="${sessionScope.loginId!=null}">
							     	<button type="button" class="btn btn-link mb-0 mt-3 p-0" data-toggle="modal" data-target="#request-visit">
									<h4 class="mb-0"><strong>방문신청</strong></h4>  
									</button>
							     </c:if>	
								 <c:if test="${sessionScope.loginId==null}">
								 	<button id="notlogin" type="button" class="btn btn-link mb-0 mt-3 p-0" >
									<h3 class="mb-0"><strong class="text-danger">방문신청</strong></h3>  
									</button>
								 </c:if>	
							</div>
						</div>
					</div>
				</div>
				<div class="col-md-1">
			</div>
		</div>
	</div>
	
	<!-- Modal -->
	<div class="modal fade" id="request-visit" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
	  aria-hidden="true">
	  <div class="modal-dialog modal-lg" role="document">
	    <div class="modal-content">
	      <div class="modal-header">
	        <h5 class="modal-title" id="exampleModalLabel">기관 방문 신청</h5>
	        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
	          <span aria-hidden="true">&times;</span>
	        </button>
	      </div>
	      <div class="modal-body">
	        <form id="insertmessage1" action="insertmessage1" method="post" >
	        <!-- 아이디, 이름, 방문일, 신청일, 요청사항 -->
	          <div class="form-row">
	            <div class="form-group col">
	              <label for="inputId">아이디</label>
	              <input type="hidden" id="ms_sender" name="ms_sender" value="${silid}">
	              <input type="text" class="form-control form-control-sm" name="userid" id="inputId" value="${member.userid}" disabled>
	            </div>
	            <div class="form-group col">
	              <label for="inputName">이름</label>
	              <input type="text" class="form-control form-control-sm" id="inputName" value="${member.username}" disabled>
	            </div>
	          </div>
	          <div class="form-row">
	            <div class="form-group col">
	              <label for="inputId">방문일</label>
	              <input type="date" class="form-control form-control-sm" name="ms_vdate" id="ms_vdate" placeholder="날짜선택">
	            </div>
	            <div class="form-group col">
	              <label for="inputName">신청일</label>
	              <input type="date" class="form-control form-control-sm" id="inputName" placeholder="sysdate" readonly>
	            </div>
	          </div>
	           <div class="form-group">
	            <label for="request-title">제목</label>
	            <textarea class="form-control" name="ms_title" id="request-title" rows="1"></textarea>
	          </div>
	          <div class="form-group">
	            <label for="request-content">기타 요청사항</label>
	            <textarea class="form-control" name="ms_content" id="request-content" rows="4"></textarea>
	          </div>
	          <!-- 어르신정보 -->
	          <div class="form-group">
	            <label for="silver-inform">어르신정보</label>
	            	<div class="card">
	            	<textarea id="con2" name="ms_content2" class="container" rows="8" cols="40" disabled></textarea>
		            </div>
	          </div>
	        </form>
	      </div>
	      <!-- 신청 및 닫기 버튼 -->
	      <div class="modal-footer justify-content-center">
	        <button type="button" id="m-insertb" class="btn btn-primary">신청</button>
	        <button type="button" class="btn btn-secondary" data-dismiss="modal">닫기</button>
	      </div>
	    </div>
	  </div>
	</div>	

	<!-- 하단 네비게이션 바  -->
	<nav class="nav-scroller py-1 mb-2 sticky-top bg-light border-bottom" id="nav-under">
		<div class="container">
			<div class="nav"> 
		  		<a class="nav-item nav-link text-secondary active" id="nav-under-basic" href="#tab-basic">
		  			<strong>상세정보</strong> <span class="sr-only">(current)</span> </a>
		  		<a class="nav-item nav-link text-secondary" id="nav-under-address" href="#tab-address">
		  			<strong>사진/주소</strong> </a>
		  		<a class="nav-item nav-link text-secondary" id="nav-under-board" href="#tab-board">
		  			<strong>게시판</strong> </a>	
			</div>
		</div>
	</nav>

	<!-- 1. 기본정보 탭  -->
	<div class="container" id="tab-basic">
		<div class="d-flex justify-content-between flex-wrap flex-md-nowrap align-items-center pt-3 pb-2 mb-3 border-bottom">
		<h4 class="n1 text-secondary"><small>기본정보</small></h4>
		</div>
		<!-- 내용 -->
		<div class="card-deck col-md-12">
			<!-- 기관일련번호 -->
			
				<div class="card-deck p-1 d-flex flex-column position-static text-center" >
					<div class="card mb-1 shadow-sm" id="card-content">
						<div class="card-header">
							<div class="mb-1 my-3 text-musted">기관일련번호</div>
						</div>
						<div class="card-body">
							<div class="mb-1 text-musted">${DetailsTwo.detail_number}</div>
						</div>
					</div>
				</div>
			
			<!-- 설립일 -->
			
				<div class="card-deck p-1 d-flex flex-column position-static text-center" >
					<div class="card mb-1 shadow-sm" id="card-content">
						<div class="card-header">
							<div class="mb-1 my-3 text-musted">설립일</div>
						</div>
						<div class="card-body">
							<div class="mb-1 text-musted">${DetailsTwo.establishment}</div>
						</div>
					</div>
				</div>
			
			<!-- 승인일 -->
		
				<div class="card-deck p-1 d-flex flex-column position-static text-center" >
					<div class="card mb-1 shadow-sm" id="card-content">
						<div class="card-header">
							<div class="mb-1 my-3 text-musted">승인일</div>
						</div>
						<div class="card-body">
							<div class="mb-1 text-musted">${DetailsTwo.approval}</div>
						</div>
					</div>
				</div>
				
			<!-- 연락처 -->
		
				<div class="card-deck p-1 d-flex flex-column position-static text-center" >
					<div class="card mb-1 shadow-sm" id="card-content">
						<div class="card-header">
							<div class="mb-1 my-3 text-musted">연락처</div>
						</div>
						<div class="card-body">
							<div class="mb-1 text-musted">${DetailsTwo.tel}</div>
						</div>
					</div>
				</div>
			
	
			<div class="col-md-2">
			</div>

			<div class="col-md-2">
			</div>
			
		</div>
	</div><br>

	<!-- 2. 주차시설 탭  -->
	<div class="container">
		<div class="d-flex justify-content-between flex-wrap flex-md-nowrap align-items-center pt-3 pb-2 mb-3 border-bottom">
		<h4 class="n1 text-secondary"><small>시설정보</small></h4>
		</div>
		<!-- 내용 -->
		<div class="row">
			<div class="d-flex flex-row">
				<div class="p-1 align-self-start">
				<img class="mb-1 mt-3" src="resources/image/info.svg">
				</div>
				<div class="p-1 align-self-end">
				<div class="mb-1 my-3 text-musted">${DetailsTwo.parkinglot}</div>
				</div>
			</div>
		</div>
	</div>
	<br>
	
	<!-- 4. 사진 & 주소  -->
	<div class="container" id="tab-address">
		<div class="d-flex justify-content-between flex-wrap flex-md-nowrap align-items-center pt-3 pb-2 mb-3 border-bottom">
		<h4 class="n1 text-secondary"><small>사진/주소</small></h4>
		</div>
		<!-- 주소 -->
		<div class="row">
			<div class="d-flex flex-row">
				<div class="p-1 align-self-start">
				<img class="mb-3 my-3" src="resources/image/mappin.svg">
				</div>
				<div class="p-1 align-self-end">
				<div class="mb-3 my-3 text-musted">${DetailsTwo.address}</div>
				</div>
			</div>
		</div>
		<br>
		<div class="row">
		<!-- 사진 -->
		<div class="col-md-6">
			<div class="card" id="picture">
				<img src="resources/image/image.svg" class="rounded my-auto" alt="">
			</div>
		</div>
		<!-- 지도 -->
		<div class="col-md-6">
			<div class="card" id="map">
				<img src="resources/image/map.svg" class="rounded my-auto" alt="">
			</div>
		</div>
		</div>
	</div>	
	<br>
	
	<!-- 5. 시설게시판  -->
	<div class="container" id="tab-board">
		<div class="d-flex justify-content-between flex-wrap flex-md-nowrap align-items-center pt-3 pb-2 mb-3 border-bottom">
		<h4 class="n1 text-secondary"><small>시설게시판</small></h4>
		</div>
		
		<p class="lead"><small id="cb"> </small></p>
		<table class="table text-center">
			<thead class="thead-light">
				<tr>
					<th scope="col">작성자</th>
					<th scope="col" style="width: 50%;">제목</th>
					<th scope="col">작성날짜</th>
				</tr>
			</thead>
			<tbody class="table-sm" id="sbList">
						<!-- 게시글출력. 5개씩 -->
			</tbody>
		</table>
		<!-- 모달버튼 --> <!-- 로그인된사람만 보이게 -->
		<c:if test="${sessionScope.loginId!=null}">	
			<button type="button" class="btn-sm btn-info float-right" data-toggle="modal" data-target="#write-board">
	  		글쓰기 
			</button>
		</c:if>	
		<!-- 모달 -->
		<div class="modal fade" id="write-board" tabindex="-1" role="dialog" aria-labelledby="Modal" aria-hidden="true">
		  <div class="modal-dialog" role="document">
		    <div class="modal-content">
		    
		      <div class="modal-header">
		        <h6 class="modal-write">게시글쓰기</h6>
		        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
		          <span aria-hidden="true">&times;</span>
		        </button>
		      </div>
		      
		      <div class="modal-body">
				<form id="insertform" name="insertform">
					<fieldset disabled>
					<div class="form-group">
				      <label for="disabledText">아이디</label>
				      <input type="text" id="disabledText" class="form-control" placeholder="${sessionScope.loginId}">
				    </div>
				    </fieldset>
					<div class="form-group">
						<label>제목</label>
						<input type="text" id="sbtitle" name="sbtitle" class="form-control">
					</div>
					<div class="form-group">
						<label>내용</label>
						<textarea class="form-control" id="sbwrite" name="sbwrite" style="height: 15rem;"></textarea>
					</div>
					<input type="hidden" id="seach_seq" name="seach_seq" value="${DetailsTwo.seach_seq}">
					<input type="hidden" id="userid" name="userid" value="${sessionScope.loginId}">
					
				 </form>   
		      </div>
		      <!-- 버튼-취소/저장 -->
		      <div class="modal-footer">
		        <button type="button" id="cancelbtn" class="btn btn-secondary btn-sm" data-dismiss="modal">취소</button>
		        <button type="button" id="insertbtn" class="btn btn-info btn-sm">저장</button>
		      </div>
		    </div>
		  </div>
		</div>
		<!-- 페이징 -->
		<ul id="pag" class="pagination pagination-circle pg-blue justify-content-center">
			
		</ul>
	</div>	
			<!-- 7-1. 게시글 수정 모달 : 제목, 내용 기존 값 그대로 입력되어있어야함 / 모달의 경우 다른 div에 포함되면 안돼서 7번 게시글 위로 위치 -->
			<div class="modal fade" id="edit-board" tabindex="-1" role="dialog" aria-labelledby="Modal" aria-hidden="true">
			  <div class="modal-dialog" role="document">
			    <div class="modal-content">
					<!-- 헤더 -->			    
					<div class="modal-header">
				        <h6 class="modal-write">게시글수정</h6>
				        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
				          <span aria-hidden="true">&times;</span>
				        </button>
					</div>
			      <!-- 바디 -->
			      <div class="modal-body">
					<form id="updateform" name="updateform">
						<fieldset disabled>
						<div class="form-group">
					      <label for="disabledText">아이디</label>
					      <input type="text" id="disabledText" class="form-control" placeholder="${sessionScope.loginId}">
						  
					    </div>
					    </fieldset>
						<div class="form-group">
							<label>제목</label>
							<input type="text" id="uptitle" name="sbtitle" class="form-control">
						</div>
						<div class="form-group">
							<label>내용</label>
							<textarea class="form-control" id="upwrite" name="sbwrite" style="height: 15rem;"></textarea>
						</div>
						<input type="hidden" id="seach_seq" name="seach_seq" value="${DetailsTwo.seach_seq}">
					    <input type="hidden" id="userid" name="userid" value="${sessionScope.loginId}">
						<input type="hidden" id="up_seq" name="sb_seq">
					 </form>   
			      </div>
			      <!-- 버튼-취소/저장 -->
			      <div class="modal-footer">
			        <button type="button" id="cancelbtn" class="btn btn-secondary btn-sm" data-dismiss="modal">취소</button>
			        <button type="button" id="editbtn" class="btn btn-info btn-sm">수정</button>
			      </div>
			    </div>
			  </div>
			</div>
			
	<!-- 7. 게시판 세부내용 -->
	<div class="container" id="tab-board-detail">
		<div class="d-flex justify-content-between flex-wrap flex-md-nowrap align-items-center pt-3 pb-2 mb-3 border-bottom">
			<h4 class="n1 text-secondary"><small>시설게시판</small></h4>
		</div>
		<button type="button" class="btn btn-outline-secondary btn-sm float-right my-2" id="btn-return">목록보기</button>
		<table class="table table-bordered" id="board-table">
			<!-- 게시판 타이틀 -->
			<tr>
				<td class="pb-0">
					<h3 id="board-title"></h3>
					<h6 id="board-date"><small></small></h6>
					<div class="form-group row mb-2">
						<h5 id="board-id" class="col-sm-6 mb-0"></h5>
						<div class="col-sm-6">
							<div class="form-group row float-right mx-1">
								<!-- 게시글 수정/삭제 -->
								<div class="dropdown">
									<a class="btn btn-outline-light btn-sm dropdown-toggle mx-1" href="#" role="button" id="dropdownMenuLink" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
									<small><img src="resources/image/morevertical.svg"></small>
									</a>
									<div class="dropdown-menu" aria-labelledby="dropdownMenuLink">
										<a class="dropdown-item" data-toggle="modal" data-target="#edit-board" onclick="location.href='javascript:updateBoard()'"><small>수정</small></a>
										<a class="dropdown-item" href="javascript:deleteBoard()"><small>삭제</small></a>
									</div>
								</div>
							</div>
						</div>
					</div>
				</td>
			</tr>

			<!-- 게시판 내용 -->
			<tr>
				<td class="board-text" style="height: 20rem;">
					<p class="text-justify font-weight-light p-3" id="board-contents"> </p>
				</td>
			</tr>
			<!-- 게시판 댓글 쓰기 -->
			<c:if test="${sessionScope.loginId!=null}">
			<tr>
				<td class="board-comment">
					<div class="col-md-4">
						<h5 id="sbc_1" class="mb-0">댓글쓰기</h5>
						<!-- *** value : 기존 userid 들어가는 부분 - static -->
						<input type="text" readonly class="form-control-plaintext p-0" id="comment-userid" value="${sessionScope.loginId}">
					</div>
					<!-- 댓글입력 -->
					<div class="form-group row p-1 mb-0">
						<div class="col-md-10 pr-0">
							<textarea name="sbc_write" class="form-control mx-1" id="sbc_write" rows="2"></textarea>
						</div>
						<div class="col-md-2">
						<button type="submit" class="btn btn-secondary" id="btn-comment">등록</button>
						<tr id=hiddenseq></tr>
						</div>
					</div>
				</td>
			</tr>
			</c:if>
			<!-- 게시판 댓글 목록 -->
			<tr>
				<td class="nav-comment">
					<ul class="nav nav-tabs">
					  <li class="nav-item">
					    <a class="nav-link active" id="comment-tab" data-toggle="tab" href="#comment-list">댓글<span id="countcoment" class="badge badge-light"></span></a>
					  </li>
					</ul>
					<!-- 댓글 테이블 -->
					<div class="tab-content pt-3" id="myTabContent">
						<div class="tab-pane fade show active" id="comment-list">
							<table id="cList" class="col-md-12">
								
								<!-- 댓글들어가는 공간  -->

							</table>
						<ul id="pag2" class="pagination pagination-sm justify-content-center"></ul>
				
						</div>
					</div>
				</td>
			</tr>
		</table>
	</div>
</body>
</html>
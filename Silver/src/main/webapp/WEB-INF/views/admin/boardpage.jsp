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
   <link rel="stylesheet" href="<c:url value="/resources/css/boardpage.css"/>">
   
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
	selectboard();
	selectboard2();
	selectboard3();
});
function selectboard3(){
	$.ajax({
		url:"selb3", 
		type:"get",
		success:init3
		});
}
function init3(data){
	console.log(data);
	var list3 = '';
	 $.each(data, function (index, item){
		 list3 += '<tr style="cursor:pointer" class="select-table2" onclick="window.open(\'openCommentDetail\',\'talentedDetail\', \'toolbar=no, width=1000,height=800, top=150, left=150\').location.href=\'openCommentDetail?sbc_seq='+item.sbc_seq+'\'" >';
		 list3 += '<td scope="row">'+(index+1)+'</td>';
		 list3 += '<td>'+item.userid+'</td>';
		 list3 += '<td>'+item.sbc_write+'</td>';
		 list3 += '<td>'+item.sbc_date+'</td>';
		 list3 += '</tr>';
	 });
	 
	  $("#selectboard3").html(list3); 
}

function selectboard2(){
	$.ajax({
		url:"selb2", 
		type:"get",
		success:init2
		});
}
function init2(data){
	console.log(data);
	var list2 = '';
	 $.each(data, function (index, item){
		 list2 += '<tr style="cursor:pointer" class="select-table2" onclick="window.open(\'openBoardDetail\',\'boarddDetail\', \'toolbar=no, width=1000,height=800, top=150, left=150\').location.href=\'openBoardDetail?sb_seq='+item.sb_seq+'\'" >';
		 list2 += '<td scope="row">'+(index+1)+'</td>';
		 list2 += '<td>'+item.userid+'</td>';
		 list2 += '<td>'+item.sbtitle+'</td>';
		 list2 += '<td>'+item.sbdate+'</td>';
		 list2 += '</tr>';
	 });
	 
  $("#selectboard2").html(list2); 
}

function selectboard(){
	$.ajax({
		url:"selb1", 
		type:"get",
		success:init
		});
}
function init(data){
	console.log(data);
	 var list = '';
	 $.each(data, function (index, item){
		 list += '<tr style="cursor:pointer" class="select-table" onclick="window.open(\'openRecruitDetail\',\'recruitDetail\', \'toolbar=no, width=1000,height=800, top=150, left=150\').location.href=\'openRecruitDetail?jo_seq='+item.jo_seq+'\'" >';
		 list += '<td scope="row">'+(index+1)+'</td>';
		 list += '<td>'+item.userid+'</td>';
		 list += '<td>'+item.silvername+'</td>';
		 list += '<td>'+item.jo_job+'</td>';
		 list += '<td>'+item.jo_date+'</td>';
		 list += '</tr>';
	 });
	 
  $("#selectboard1").html(list); 
}


$(document).ready(function(){
	$("#f-temporarybtn").click(function(){  //게시판2 상세보기 
		window.open(
		"openBoardDetail",
		"boarddDetail",
		"toolbar=no, width=1000,height=800, top=150, left=150"
		);
	});	
	  $("#r-temporarybtn").click(function(){    
		window.open(
		"openRecruitDetail",
		"recruitDetail",
		"toolbar=no, width=1000,height=800, top=150, left=150"
		);
	});
	  
	  $("#c-temporarybtn").click(function(){    
			window.open(
			"openCommentDetail",
			"talentedDetail",
			"toolbar=no, width=1000,height=800, top=150, left=150"
			);
		});	 
	  
	  
	  
});
</script>

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
               <li class="nav-item">
               		<a class="nav-link mr-3" href="messagepage"><strong>메시지함</strong></a>
               </li>
               <li class="nav-item active">
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
 
<!-- col-md-12 --> 
<div class="col-md-12 ml-sm-auto mt-4 pt-4 border-0">
	<div class="row">
		<!-- 메시지함 -->
		<div class="card col-md-8 p-0 border-0" style="background-color: #f8f9fa;">
			<div class="card border-top-2" id="information">
				<!-- Collapse --> 
				<div class="accordion m-0" id="adminMessage">
				<!-- 구인게시판 -->
				  <div class="card">
				    <div class="card-header border-0" id="headingOne">
				      <h2 class="mb-0">
				        <button class="btn btn-link" type="button" data-toggle="collapse" data-target="#collapseOne" aria-expanded="true" aria-controls="collapseOne">
				          구인게시판
				        </button>
				      </h2>
				    </div>
				    
					<!-- collapseOne -->
				    <div id="collapseOne" class="collapse show" aria-labelledby="headingOne" data-parent="#adminMessage">
				      <div class="card-body border-0">
				      	<div class="table-responsive text-center" id="table-recruit">
						  <table class="table table-bordered bg-light">
						    <thead>
						      <tr>
						        <th class="w-10">#</th>
						        <th class="w-20">기관아이디</th>
						        <th class="w-20">기관명</th>
						        <th class="w-30">모집직종</th>
						        <th class="w-20">등록일</th>
						      </tr>
						    </thead>
						    <tbody id="selectboard1">
						      
						    </tbody>
						  </table>
						</div>
						
 
				      	
				      </div>
				    <!-- .collapse show end -->  
				    </div>
				  <!-- .card --> 
				  </div>
				  
				  <!-- 구직게시판 -->
				  <div class="card">
				    <div class="card-header border-0" id="headingTwo">
				      <h2 class="mb-0">
				        <button class="btn btn-link collapsed" type="button" data-toggle="collapse" data-target="#collapseTwo" aria-expanded="false" aria-controls="collapseTwo">
				          기관게시판
				        </button>
				      </h2>
				    </div>
				    
				    <!-- collapseTwo -->
				    <div id="collapseTwo" class="collapse" aria-labelledby="headingTwo" data-parent="#adminMessage">
<div class="card-body border-0">
						  <div class="table-responsive text-center" id="table-f-board">
						    <table class="table table-bordered bg-light">
						      <thead>
						        <tr>
						          <th class="w-10">#</th>
						          <th class="w-20">작성자</th>
						          <th class="w-30">제목</th>
						          <th class="w-20">작성날짜</th>
						        </tr>
						      </thead>
						      <tbody id="selectboard2">
						        <tr>
						          <td scope="row">1</td>
						          <td>"username"</td>  
						          <td>"Title"</td>  
						          <td>"Date"</td>
						        </tr>
						      </tbody>
						    </table>
						  </div>	
<!-- button : tr 연결 후 삭제 -->	
<button type="button" class="btn btn-link" id="f-temporarybtn">tr: 작성글 상세보기 </button> 
					<!-- card-body -->
					</div>
				    <!-- .collapse show end -->  
				    </div>
				  <!-- .card --> 
				  </div>
				  
				  <!-- 기관게시판 -->
				  <div class="card">
				    <div class="card-header border-0" id="headingThree">
				      <h2 class="mb-0">
				        <button class="btn btn-link collapsed" type="button" data-toggle="collapse" data-target="#collapseThree" aria-expanded="false" aria-controls="collapseThree">
				          댓글관리
				        </button>
				      </h2>
				    </div>
				    
				    <!-- collapseThree -->
				    <div id="collapseThree" class="collapse" aria-labelledby="headingThree" data-parent="#adminMessage">
				      <div class="card-body border-0">
						  <div class="table-responsive text-center" id="table-board-c">
						    <table class="table table-bordered bg-light">
						      <thead>
						        <tr>
						          <th class="w-10">#</th>
						          <th class="w-30">댓글작성자</th>
						          <th class="w-40">댓글내용</th>
						          <th class="w-20">작성날짜</th>
						        </tr>
						      </thead>
						      <tbody id="selectboard3">
						        <tr>
						          <td scope="row">1</td>
						          <td>"silvername"</td>
						          <td>"member.username"</td>  
						          <td>"댓글내용"</td>  
						        </tr>
						      </tbody>
						    </table>
						  </div>	
<!-- button : tr 연결 후 삭제 -->	
<button type="button" class="btn btn-link" id="c-temporarybtn">tr: 작성글 상세보기 </button> 
					<!-- card-body -->
					</div>
				    <!-- .collapse show end -->  
				    </div>
				  <!-- .card --> 
				  </div>
				<!-- .accordion -->  
				</div>
			<!-- #information -->	
			</div>	
		<!-- card col-md8 p-0 border-0 end -->
		</div>
		
		<!-- 통계 -->
		<div class="card col-md-4 p-0 border-0" id="listcard">
			<div class="card border-top-2" id="card-graph">
			   	<div class="container">
				<label for="statistics-member" class="col-form-label col-form-label-lg mt-3"><strong>게시판통계</strong></label>
					<div class="form-row">
					
					
					</div>
				</div>
			</div>
		<!-- #listcard end -->
		</div>
		
	</div>
</div> 
  

</body>
</html>
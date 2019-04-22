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
      <!-- 그래프 api -->
   <script type="text/javascript" src="https://www.google.com/jsapi"></script>
</head>
<body>

<script>
//어떤 그래프를 사용할지 지정 : Google Visualization 라이브러리 로드 
google.load('visualization', '1.0', {'packages':['corechart']});

// 그래프 API 로드가 완료되면 실행할 수 있도록 이벤트 지정 
google.setOnLoadCallback(drawChart);
google.setOnLoadCallback(drawChart2);
google.setOnLoadCallback(drawChart3);

function drawChart() {
	var data = new google.visualization.DataTable();

	data.addColumn('string', '인물');
	data.addColumn('number', '취득표');
	var a,b,c = 0; /*  "정규직","계약직","시간제" */
	a = parseInt('${ctype1}');
	b = parseInt('${ctype2}');
	c = parseInt('${ctype3}');
	data.addRows([
			['정규직', a],
			['계약직', b],
			['시간제', c],
			
	]);

	// 그래프의 옵션을 지정 
	var opt = {
		'title': '구인계시판 근무형태 분포',
		'width': 400,
		'height': 400,
		pieSliceText: 'label',
		legend: 'none' 
	};


var chart = new google.visualization.PieChart(
		document.getElementById('chart_div'));
chart.draw(data, opt);


}


  function drawChart2() {
	var data2 = new google.visualization.DataTable();

	data2.addColumn('string', '인물');
	data2.addColumn('number', '취득표');
	var a1,a2,a3,a4,a5,a6,a7,a8,a9,a10,a11,a12,a13,a14,a15,a16,a17,a18,a19,a20,a21,a22,a23 = 0;
	
	a1 = parseInt('${cjob1}');
	a2 = parseInt('${cjob2}');
	a3 = parseInt('${cjob3}');
	a4 = parseInt('${cjob4}');
	a5 = parseInt('${cjob5}');
	a6 = parseInt('${cjob6}');
	a7 = parseInt('${cjob7}');
	a8 = parseInt('${cjob8}');
	a9 = parseInt('${cjob9}');
	a10 = parseInt('${cjob10}');
	a11 = parseInt('${cjob11}');
	a12 = parseInt('${cjob12}');
	a13 = parseInt('${cjob13}');
	a14 = parseInt('${cjob14}');
	a15 = parseInt('${cjob15}');
	a16 = parseInt('${cjob16}');
	a17 = parseInt('${cjob17}');
	a18 = parseInt('${cjob18}');
	a19 = parseInt('${cjob19}');
	a20 = parseInt('${cjob20}');
	a21 = parseInt('${cjob21}');
	a22 = parseInt('${cjob22}');
	a23 = parseInt('${cjob23}');
	data2.addRows([
			['시설장', a1],
			['사무국장', a2],
			['사회복지사', a3],
			['의사', a4],
			['촉탁의사', a5],
			['간호사', a6],
			['간호조무사', a7],
			['치과위생사', a8],
			['물리치료사', a9],
			['작업치료사', a10],
			['요양보호사 1급', a11],
			['요양보호사 2급', a12],
			['요양보호사 기존유예자', a13],
			['영양사', a14],
			['사무원', a15],
			['조리원', a16],
			['위생원', a17],
			['관리인', a18],
			['보조원 운전사', a19],
			['프로그램관리자', a20],
			['치매전문교육이수자', a21],
			['청구담당자', a22],
			['기타', a23],
	]);

	
	// 그래프의 옵션을 지정 
	var opt2 = {
		'title': '구인게시판 직종 분포',
		'width': 400,
		'height': 400,
		pieSliceText: 'label',
		legend: 'none' 
	};

	var chart2 = new google.visualization.PieChart(
			document.getElementById('chart_div2'));
	chart2.draw(data2, opt2);

}  

  function drawChart3() {
		var data3 = new google.visualization.DataTable();

		data3.addColumn('string', '인물');
		data3.addColumn('number', '취득표');
		var a,b,c = 0;  
		a = parseInt('${cgen1}');
		b = parseInt('${cgen2}');
		c = parseInt('${cgen3}');
		data3.addRows([
				['남성', a],
				['여성', b],
				['전체', c],
		]);

		// 그래프의 옵션을 지정 
		var opt3 = {
			'title': '구인게시판 성별 분포',
			'width': 400,
			'height': 400,
			pieSliceText: 'label',
			legend: 'none' 
		};


	var chart3 = new google.visualization.PieChart(
			document.getElementById('chart_div3'));
	chart3.draw(data3, opt3);


	}



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
			<div class="card border-top-2 bg-white" id="card-graph">
			   	<div class="container">
				<label for="statistics-member" class="col-form-label col-form-label-lg mt-3"><strong>게시판통계</strong></label>
					<div class="form-row">
					<div id="chart_div">
							
					</div>
					<div id="chart_div2">
							
					</div>
					<div id="chart_div3">
							
					</div>
					</div>
				</div>
			</div>
		<!-- #listcard end -->
		</div>
		
	</div>
</div> 
  

</body>
</html>
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
/* 방문문의/이력서 show & hide 스크립트 : 각 id 확인 
 #question-tab : 좌측 방문문의/이력서 메뉴 버튼 
 #receiveTable : 맨 처음 보이는 테이블 리스트 
 #confirmForm : 리스트를 누르면 보이는 상세 내용 
 #senderForm : 상세 내용에서 답장 버튼 누르면 나오는 메일 폼 
 #s-forwarding : 메일 성공시 나오는 최종 폼 
 */
 
function selmessage2(){
	var userid="${sessionScope.managerId}";
	 $.ajax({
	        type : 'get',
	        url : 'selmes2',
	        data : {userid:userid
	        },
	        success : output2
	        
		});   
 }
 
function output2(data){
	console.log("output 들어옴");
	console.log(data);
	var list = '';
	if(data.length==0){
		console.log("메세지없음");
		list +='<tr><td colspan="4" class="text-center">메세지가 없습니다.</td></tr>';
		$("#selmessage2").html(list);
		
	} else{
		$.each(data, function (index, item){
			console.log("구인글있음");
			list += '<tr class="text-center">';
			list += '<td scope="row"><div class="form-check"><input class="form-check-input position-static" type="checkbox" name="blankCheckbox2" value="'+item.ms_seq+'"></div></td>';
			list += '<td style="cursor:pointer" onclick="location.href=\'javascript:onesel2('+item.ms_seq+')\'" >'+item.ms_Sender+'</td>';
			list += '<td style="cursor:pointer" onclick="location.href=\'javascript:onesel2('+item.ms_seq+')\'" >'+item.ms_title+'</td>';
			list += '<td style="cursor:pointer" onclick="location.href=\'javascript:onesel2('+item.ms_seq+')\'" >'+item.ms_date+'</td>';
			list += '</tr>'
	});
	
	$("#selmessage2").html(list);
	}
	console.log("끝");

}

function onesel2(ms_seq){
	console.log("온셀2:"+ms_seq);
	$("#sendTable").hide();  //보낸글 자세히보기
	$("#sentForm").show();
	 $.ajax({
			url:"selectonem", 
			type:"get",
			data:{"ms_seq":ms_seq},
			success:oneoutput2
			});
}
function oneoutput2(data){
	console.log(data);
	$("#sendp").val(data.ms_Sender);
	$("#sendtitle").val(data.ms_title);
	$("#sendcon").val(data.ms_content);
	$("#senddate").val(data.ms_date);
	
	
}
function selmessage(){ //메세지를 불러온다.
	 var userid="${sessionScope.managerId}";
	 $.ajax({
	        type : 'get',
	        url : 'selmes1',
	        data : {userid:userid
	        },
	        success : output
	        
		});   
 }
 
function output(data){
	console.log("output 들어옴");
	console.log(data);
	var list = '';
	if(data.length==0){
		console.log("메세지없음");
		list +='<tr><td colspan="4" class="text-center">메세지가 없습니다.</td></tr>';
		$("#selmessage").html(list);
		
	} else{
		$.each(data, function (index, item){
			console.log("구인글있음");
			list += '<tr class="text-center">';
			list += '<td scope="row"><div class="form-check"><input class="form-check-input position-static" type="checkbox" name="blankCheckbox1" value="'+item.ms_seq+'"></div></td>';
			list += '<td style="cursor:pointer" onclick="location.href=\'javascript:onesel('+item.ms_seq+')\'" >'+item.userid+'</td>';
			list += '<td style="cursor:pointer" onclick="location.href=\'javascript:onesel('+item.ms_seq+')\'" >'+item.ms_title+'</td>';
			list += '<td style="cursor:pointer" onclick="location.href=\'javascript:onesel('+item.ms_seq+')\'" >'+item.ms_date+'</td>';
			list += '</tr>'
	});
	
	$("#selmessage").html(list);
	}
	console.log("끝");

}
function onesel(ms_seq){
	console.log(ms_seq);
	 $("#receiveTable").hide();
	 $("#senderForm").hide();
	 $("#s-forwarding").hide();
	 $("#confirmForm").show();
	 $.ajax({
			url:"selectonem", 
			type:"get",
			data:{"ms_seq":ms_seq},
			success:oneoutput
			});
}
function oneoutput(data){
	console.log(data);
	$("#userid").html("보낸이 : "+data.userid);
	$("#ms_title").html(data.ms_title);
	$("#ms_content").html(data.ms_content);
	$("#ms_date").html(data.ms_date);
	$("#ms_content2").html(data.ms_content2);
	$("#ms_vdate").html(data.ms_vdate);
	var id = '';
    id += '<input type="text" class="form-control form-control-sm" id="ms_Sender" value="'+data.userid+'" disabled>';

	$("#recipient").html(id);
	
}
function remessage(){  //답장보내기
	var ms_Sender=$("#ms_Sender").val();
	var userid="${sessionScope.managerId}";
	var ms_title=$("#remestitle").val();
	var ms_content=$("#rewrite").val();
	 $.ajax({
		url:"remessage1", 
		type:"post",
		data:{"ms_Sender":ms_Sender,
			"userid":userid,
			"ms_title":ms_title,
			"ms_content":ms_content
		},
		success:function(data){
			
			$("#remestitle").val('');
			$("#rewrite").val('');
		}
		}); 
	
}


$(document).ready(function(){		////페이지 시작부분
		selmessage();// 페이지 처음 로딩시 메세지 불러옴
		selmessage2();
	  $("#senderForm").hide();
	  $("#confirmForm").hide();
	  $("#s-forwarding").hide();
	  
	  $("#question-tab").click(function(){    
		$("#senderForm").hide();
		$("#confirmForm").hide();
		$("#s-forwarding").hide();
		$("#receiveTable").show();

	});

	  $("#temporarybtn").click(function(){   // 받은메세지 상세보기 버튼 
		 $("#receiveTable").hide();
		 $("#senderForm").hide();
		 $("#s-forwarding").hide();
		 $("#confirmForm").show();

    });
    $("#q-delbtn").click(function(){   
    	var checkBoxArr = [];			// 한개일경우, 배열일경우 다르다

    	$("input[name=blankCheckbox1]:checked").each(function(i){

    	checkBoxArr.push($(this).val());

    	});
    	
    		jQuery.ajaxSettings.traditional = true;

   		 $.ajax({
   			url:"delmessage1", 
   			type:"post",
   			data:{"checkBoxArr":checkBoxArr
   				
   			},
   			success:function(data){
   				alert("삭제되었습니다.");
   				window.location.reload(); 
   			}
   			});  
    	
		//console.log(checkBoxArr); // 체크된 메세지만 선택해서 시퀀스를가져옴
		
		

   });
	  $("#replybtn").click(function(){   //답장하기 버튼을 눌렀을때  
		$("#receiveTable").hide();
		$("#confirmForm").hide();
		$("#s-forwarding").hide();
		$("#senderForm").show();
		
		

	  });
	  
	  $("#c-cancelbtn").click(function(){    
		$("#senderForm").hide();
		$("#confirmForm").hide();
		$("#s-forwarding").hide();
		$("#receiveTable").show();

	  });
	  
	  $("#sendbtn").click(function(){    //답장 보내기
		  remessage();
		$("#senderForm").hide();
		$("#confirmForm").hide();
		$("#receiveTable").hide();
		$("#s-forwarding").show();
		
	  });
	  
	  $("#s-cancelbtn").click(function(){    
		$("#senderForm").hide();
		$("#receiveTable").hide();
		$("#s-forwarding").hide();
		$("#confirmForm").show();

	  });

});

/* 보낸메시지 show & hide 스크립트 : 각 id 확인 
#sendTable : 보낸메시지함 테이블 리스트 
#sentForm : 보낸메일함 폼 
 */
 
 $(document).ready(function(){
	  $("#sentForm").hide();
	  
	  $("#send-tab").click(function(){    
		$("#sentForm").hide();
		$("#sendTable").show();

	});
	  
	  $("#temporarybtn2").click(function(){    //보낸메세지함 자세히보기
		$("#sendTable").hide();
		$("#sentForm").show();

	});
	  
	  $("#listbtn").click(function(){    
		$("#sentForm").hide();
		$("#sendTable").show();

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

	<!-- Jumbotron -->
	<div class="jumbotron p-0">
	
	<!-- Card image -->
	<div class="view overlay rounded-top">
	    <div class="card bg-dark text-white border-0">
		  <img src="resources/image/message.jpg" class="card-img">
		  <div class="card-img-overlay text-center mt-5  pt-5">
		    <h1 class="card-title text-dark">기관관리자 메세지함</h1>
		     <h1 class="card-title text-dark">ー</h1>
		  </div>
		</div>
	<!-- view overlay -->   
	</div>
	<!-- jumbotron --> 
	</div>

	<!-- 메세지함 -->
	<div class="col-md-12">
	<div class="row">
		<!-- 왼쪽 : 메뉴 -->
  		<div class="col-md-3 p-0">
    		<div class="nav flex-column nav-pills pt-3" id="v-pills-tab" role="tablist" aria-orientation="vertical">
      			<a class="nav-link active text-light border-bottom border-white p-4 text-center" id="question-tab" data-toggle="pill" href="#v-question-tab" role="tab" aria-selected="true">
      			받은메시지</a>
      			<a class="nav-link text-light border-bottom border-white p-4 text-center" id="send-tab" data-toggle="pill" href="#v-send-tab" role="tab" aria-selected="false">
      			보낸메시지</a>
			</div>
  		</div>
  		<!-- 오른쪽 : 콘텐츠 -->
		<div class="col-md-9 p-0">
			<div class="tab-content" id="v-pills-tabContent">
				
			<!-- 1. 방문문의/이력서 -->
			<div class="tab-pane fade show active" id="v-question-tab" role="tabpanel">
				<div class="p-2" id="receiveTable">
  				<!-- 삭제버튼 -->
					<div class="form-group row pt-2">
						<div class="col-sm-12">
				   		<button type="button" id="q-delbtn" class="btn btn-outline-secondary">삭제</button>
						</div>
					</div>
				<!-- 쪽지 리스트 테이블 -->
				<table class="table table-bordered">
			  		<thead>
						<tr class=" text-center">
							<th class="w-10"><small>선택</small></th>
							<!-- 이력서&방문문의 구분 -->
							<th class="w-15"><small>보낸사람</small></th>
							<th class="w-40"><small>제목</small></th>
							<th class="w-35"><small>받은날짜</small></th> <!-- 보낸이가 메일을 보낸 시점 = 기간관리자가 메일을 받은 시점 -->
						</tr>
			  		</thead> 
			  		<!-- 체크박스: 다중선택 후 삭제 / 답장의 경우 한개만 선택 가능 -->
			  		<tbody id="selmessage">
						<tr class="text-center">
							
						</tr>
			  		</tbody>
				</table>
				<!-- 페이지네이션 -->
				<nav id="receivePage" aria-label="Page navigation">
				  <ul class="pagination pagination-sm justify-content-center pt-3">
				    <li class="page-item">
				      <a class="page-link" aria-label="Previous">
				        <span aria-hidden="true">&laquo;</span>
				      </a>
				    </li>
				    <li class="page-item"><a class="page-link">1</a></li>
				    <li class="page-item"><a class="page-link">2</a></li>
				    <li class="page-item"><a class="page-link">3</a></li>
				    <li class="page-item">
				      <a class="page-link" aria-label="Next">
				        <span aria-hidden="true">&raquo;</span>
				      </a>
				    </li>
				  </ul>
				</nav>

			<!-- class="container" id="receiveTable" end -->
			</div>
				<!-- 테이블 클릭 시 확인할 수 있는 내용 -->
			<div class="container pt-3">
				<div class="card" id="confirmForm">
					<div class="card-body">
		            <!-- Section -->
		            <section class="sender-section">
		              <!-- 제목 -->
		              <h4 class="font-weight-bold my-3" id="ms_title"></h4>
		              <!-- 아이디/이름 | 받은날짜 -->
		              <div class="form-row"> 
		                <p class="col-md-6 dark-grey-text mb-2" id="userid"></p>
		                <p class="col dark-grey-text mb-1 text-right" id="ms_date"></p>
		              </div>
		             <hr> 
		              <!-- All grid row -->
		              <div class="row">
		                <!-- 좌측 -->
		                <div class="col-md-5">
		                  <div class="date-etc mb-4">      
		                    <h5 class="font-weight-bold dark-grey-text mb-3">방문신청일</h5>
		                    <h3 class="mb-5" id="ms_vdate"></h3>
		                    <p class="dark-grey-text mb-4" id="ms_content"></p>
		                  </div>
		                </div>
		
		                <!-- 우측 -->
		                <div class="col-md-7" id="ms_content2">
		                  <!-- <div class="silver-title mb-4">
		                    <div class="row">
		                      <h4 class="font-weight-bold dark-grey-text mb-3"></h4>
		                    </div>
		                  </div> -->
		                 <!--  <div class="silver-inform">
		                    이름
		                    <div class="row">
		                      <div class="col-md-4">
		                        <h5 class="dark-grey-text">성함</h5>
		                      </div>
		                      <div class="col-md-8">
		                        <h5 class="dark-grey-text">"이름"</h5>
		                      </div>
		                    </div>
		                    생년월일
		                    <div class="row">
		                      <div class="col-md-4">
		                        <h5 class="dark-grey-text">생년월일</h5>
		                      </div>
		                      <div class="col-md-8">
		                        <h5 class="dark-grey-text">"생년월일"</h5>
		                      </div>
		                    </div>
		                    혈액형
		                    <div class="row">
		                      <div class="col-md-4">
		                        <h5 class="dark-grey-text">혈액형</h5>
		                      </div>
		                      <div class="col-md-8">
		                        <h5 class="dark-grey-text">"혈액형"</h5>
		                      </div>
		                    </div>
		                    
		                    <hr class="border-dark">
		                    
		                    식사, 보행
		                    <div class="row">
		                      <div class="col-md-3">
		                        <p class="dark-grey-text"><small>식사</small></p>
		                      </div>
		                      <div class="col-md-3">
		                        <p class="dark-grey-text"><small>"식사"</small></p>
		                      </div>
		                      <div class="col-md-3">
		                        <p class="dark-grey-text"><small>보행</small></p>
		                      </div>
		                      <div class="col-md-3">
		                        <p class="dark-grey-text"><small>"보행"</small></p>
		                      </div>
		                    </div>
		                    세면, 의복
		                    <div class="row">
		                      <div class="col-md-3">
		                        <p class="dark-grey-text"><small>세면</small></p>
		                      </div>
		                      <div class="col-md-3">
		                        <p class="dark-grey-text"><small>"세면"</small></p>
		                      </div>
		                      <div class="col-md-3">
		                        <p class="dark-grey-text"><small>의복</small></p>
		                      </div>
		                      <div class="col-md-3">
		                        <p class="dark-grey-text"><small>"의복"</small></p>
		                      </div>
		                    </div>
		                    목욕, 화장실
		                    <div class="row">
		                      <div class="col-md-3">
		                        <p class="dark-grey-text"><small>목욕</small></p>
		                      </div>
		                      <div class="col-md-3">
		                        <p class="dark-grey-text"><small>"목욕"</small></p>
		                      </div>
		                      <div class="col-md-3">
		                        <p class="dark-grey-text"><small>화장실</small></p>
		                      </div>
		                      <div class="col-md-3">
		                        <p class="dark-grey-text"><small>"화장실"</small></p>
		                      </div>
		                    </div>
		                    
		                    <hr class="border-dark">
		                    
		                    기타 질환정보
		                      <div class="col-md-12">
		                        <p class="dark-grey-text"><small>질환정보</small></p>
		                        <p class="dark-grey-text"><small>"질환정보"</small></p>
		                     </div>
		                  silver-inform  
		                  </div> -->
		                <!-- col-md-6 -->  
		                </div>
		              <!-- All grid row -->
		              </div>
		            <!-- Section -->
		            </section>  
					<!-- 버튼 -->
					<div class="form-row justify-content-center m-2">
						<button type="button" id="replybtn" class="btn btn-outline-secondary mx-1">답장</button>
						<button type="button" id="c-cancelbtn" class="btn btn-outline-secondary mx-1">취소</button>
					</div>
					<!-- card-body -->
					</div>
	       		<!-- #confirmForm -->
	       		</div>
	       		
	       		<!-- 답장 눌렀을 때  -->
				<div class="card mb-3 container" id="senderForm">
				  <div class="form-group row mt-4">
				    <label for="sender" class="col-sm-2 col-form-label col-form-label-sm">받는사람</label>
				    <div class="col-sm-10" id="recipient">
				      <!-- <input type="text" class="form-control form-control-sm" id="recipient" value="" disabled> -->
				    </div>
				  </div>
				  <div class="form-group row">
				    <label for="sender" class="col-sm-2 col-form-label col-form-label-sm">제목</label>
				    <div class="col-sm-10">
				      <input type="text" class="form-control form-control-sm" id="remestitle">
				    </div>
				  </div>
				  <textarea class="form-control" id="rewrite"  style="height: 15rem;"></textarea>
					<div class="form-row justify-content-center m-3">
					  <button type="button" id="sendbtn" class="btn btn-outline-secondary mx-1">보내기</button>
					  <button type="button" id="s-cancelbtn" class="btn btn-outline-secondary mx-1">취소</button>
					</div>
				</div>
				
				<!-- 메일 전송 성공 페이지 -->
				<div class="d-flex justify-content-center p-2">
					<div class="card border-0" id="s-forwarding" style="width: 30rem;">
					  <img src="resources/image/email.png" class="card-img-top rounded mx-auto d-block">
					  <div class="card-body text-center">
					    <p class="text-muted">메일이 전송되었습니다.</p>
					    <p class="text-muted">전송된 메일은 [보낸메시지]에서 확인할 수 있습니다.</p>
					  </div>
					</div>
				</div>	
			<!-- confirmForm .container -->
			</div>
    		<!-- #v-question-tab end -->	  	
    		</div>
    		
    		<!-- 2. 보낸메시지 -->
			<div class="tab-pane fade" id="v-send-tab" role="tabpanel">
				<div class="p-2" id="sendTable">
				<!-- 삭제버튼 -->
				<div class="form-group row pt-2">
					<div class="col-sm-12">
			   		<button type="button" id="s-delbtn" class="btn btn-outline-secondary">삭제</button>
					</div>
				</div>
				<!-- 쪽지 리스트 테이블 -->
				<table class="table table-bordered">
			  		<thead>
						<tr class=" text-center">
							<th class="w-10"><small>선택</small></th>
					
							<th class="w-15"><small>받는사람</small></th>
							<th class="w-40"><small>제목</small></th>
							<th class="w-35"><small>보낸날짜</small></th> <!-- 기간관리자가 메일을 보낸 시점 -->
						</tr>
			  		</thead>
			  		<!-- 체크박스: 다중선택 후 삭제 / 답장의 경우 한개만 선택 가능 -->
			  		<tbody id="selmessage2">
						
			  		</tbody>
				</table>
				<!-- 페이지네이션 -->
				<nav id="receivePage" aria-label="Page navigation">
				  <ul class="pagination pagination-sm justify-content-center pt-3">
				    <li class="page-item">
				      <a class="page-link" aria-label="Previous">
				        <span aria-hidden="true">&laquo;</span>
				      </a>
				    </li>
				    <li class="page-item"><a class="page-link">1</a></li>
				    <li class="page-item"><a class="page-link">2</a></li>
				    <li class="page-item"><a class="page-link">3</a></li>
				    <li class="page-item">
				      <a class="page-link" aria-label="Next">
				        <span aria-hidden="true">&raquo;</span>
				      </a>
				    </li>
				  </ul>
				</nav>

				<!-- class="container" id="sendTable" end -->
				</div>
				
				 <!-- tr 눌렀을 때  -->
				 <div class="container pt-3">
				 	<div class="card" id="sentForm">
				 		<div class="card-body">
						  <div class="form-group row mt-4">
						    <label for="sender" class="col-sm-2 col-form-label col-form-label-sm">받는사람</label>
						    <div class="col-sm-10">
						      <input type="text" class="form-control form-control-sm" id="sendp" readonly>
						    </div>
						  </div>
						  <div class="form-group row mt-4">
						    <label for="sender" class="col-sm-2 col-form-label col-form-label-sm">보낸날짜</label>
						    <div class="col-sm-10">
						      <input type="text" class="form-control form-control-sm" id="senddate" readonly>
						    </div>
						  </div>
						  <div class="form-group row">
						    <label for="sender" class="col-sm-2 col-form-label col-form-label-sm">제목</label>
						    <div class="col-sm-10">
						      <input type="text" class="form-control form-control-sm" id="sendtitle" readonly>
						    </div>
						  </div>
						  <textarea class="form-control" id="sendcon" name="sendcon" style="height: 15rem;" readonly></textarea>
						  <div class="form-row justify-content-center m-3">
						      <button type="button" id="listbtn" class="btn btn-outline-dark mx-1 rounded-0">목록</button>
							  <button type="button" id="t-delbtn" class="btn btn-outline-dark mx-1 rounded-0">삭제</button>
						  </div>
						<!-- .card-body -->
						</div>
					<!-- #sentForm -->
					</div>
				<!-- .container pt-3 -->
				</div>
				<!-- #v-send-tab end -->
		      </div>
			<!-- #v-pills-tabContent end -->
			</div>
		<!-- .col-9 end -->
		</div>
	<!-- .row end -->
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
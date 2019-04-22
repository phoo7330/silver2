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
   <link rel="stylesheet" href="<c:url value="/resources/css/messagepage.css"/>">
   
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
		var userid="${sessionScope.adminId}";
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
		 var userid="${sessionScope.adminId}";
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
		var userid="${sessionScope.adminId}";
		var ms_title=$("#remestitle").val();
		var ms_content=$("#rewrite").val();
		console.log(ms_Sender);
		console.log(ms_title);
		console.log(ms_content);
		console.log(userid);
		
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
 
$(document).ready(function(){
	selmessage();// 페이지 불러올때 받은 쪽지 불러옴
	selmessage2();// 보낸메세지함도 불러옴
	  $("#senderForm").hide();
	  $("#confirmForm").hide();
	  $("#s-forwarding").hide();
	  
	  $("#question-tab").click(function(){    
		$("#senderForm").hide();
		$("#confirmForm").hide();
		$("#s-forwarding").hide();
		$("#receiveTable").show();
	});

	  $("#temporarybtn").click(function(){    
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
	  $("#replybtn").click(function(){    
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
	  
	  $("#sendbtn").click(function(){
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
		window.location.replace("#sendTable");
	});
	  
	  $("#temporarybtn2").click(function(){    
		$("#sendTable").hide();
		$("#sentForm").show();
		window.location.replace("#sentForm");
	});
	  
	  $("#listbtn").click(function(){    
		$("#sentForm").hide();
		$("#sendTable").show();
		window.location.replace("#sendTable");
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
               <li class="nav-item active">
               		<a class="nav-link mr-3" href="messagepage"><strong>메시지함</strong></a>
               </li>
               <li class="nav-item">
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
		<div class="card col-md-8 p-0 border-top-2" style="background-color: #d9d9d9; border-top:5px solid #000000;">
			<div class="card border-0" id="information">
				<div class="container">
					<label for="table-member" class="col-form-label col-form-label-lg mt-3"><strong>메시지함</strong></label>
					<!-- 1. 메세지함 -->
					<div class="row">
						<!-- 왼쪽 : 메뉴 -->
				  		<div class="col-md-3 p-0">
				    		<div class="nav flex-column nav-pills pt-3" id="v-pills-tab" role="tablist" aria-orientation="vertical">
				      			<a class="nav-link active text-light bg-dark border-bottom border-white p-4 text-center" id="question-tab" data-toggle="pill" href="#v-question-tab" role="tab" aria-selected="true">
				      			받은메시지</a>
				      			<a class="nav-link text-light bg-dark border-bottom border-white p-4 text-center" id="send-tab" data-toggle="pill" href="#v-send-tab" role="tab" aria-selected="false">
				      			보낸메시지</a>
							</div>
				  		</div>
				  		<!-- 오른쪽 : 콘텐츠 -->
						<div class="col-md-9 p-0">
							<div class="tab-content" id="v-pills-tabContent">	
							<!-- 1. 받은메시지 -->
							<div class="tab-pane fade show active" id="v-question-tab" role="tabpanel">
								<div class="p-2" id="receiveTable">
				  				<!-- 삭제버튼 -->
									<div class="form-group row pt-2">
										<div class="col-sm-12">
								   		<button type="button" id="q-delbtn" class="btn btn-outline-dark rounded-0">삭제</button>
										</div>
									</div>
								<!-- 쪽지 리스트 테이블 -->
								<table class="table table-bordered bg-light">
							  		<thead>
										<tr class=" text-center">
											<th class="w-10"><small>선택</small></th>
											<th class="w-15"><small>받는사람</small></th>
											<th class="w-40"><small>제목</small></th>
											<th class="w-35"><small>받은날짜</small></th>
										</tr>
							  		</thead>
							  		<tbody id="selmessage">
										<tr class="text-center">
											<td scope="row">
												<div class="form-check">
													<input class="form-check-input position-static" type="checkbox" id="blankCheckbox1" value="option1">
												</div>
											</td>
											
											<td></td>
											<td></td>
											<td></td>
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
						<!-- class="container" id="receiveTable" end -->
							</div>
							<!-- 테이블 클릭 시 확인할 수 있는 내용 -->
							<div class="container pt-3">
								<div class="card border-dark" id="confirmForm">
									<div class="card-body">
						            
						              <!-- indexpage: 문의하기 / mypage: 회원변경 / 기관마이페이지: 기관정보 -->
						              <h5 class="font-weight-bold my-3" id="ms_title"></h5>
						              <!-- 아이디/이름 | 받은날짜 -->
						              <div class="form-row"> 
						                <p class="col-md-6 dark-grey-text mb-2" id="userid"></p>
						                <p class="col dark-grey-text mb-1 text-right" id="ms_date"></p>
						              </div>
						             <hr> 
						              <!-- All grid row -->
						              <div class="justify-content-center">
						              	<form>
										  <!-- <div class="form-group">
										    <label for="attatchment">첨부파일</label>
										    <input type="text" class="form-control " id="attatchment" readonly>
										    <small id="formHelp" class="form-text text-muted">첨부파일 확인</small>
										  </div>
										  수정사항 체크박스 : 기관명,급여종류,주소 중 체크된 내용 추가
										  <div class="form-group">
										    <label for="modification">수정사항</label>
										    <input type="text" class="form-control " id="modification" readonly>
										    <small id="formHelp" class="form-text text-muted">기관관리자만 해당</small>
										  </div> -->
										  <div class="form-group">
										    <label for="etc-textarea">기타사항</label>
										    <textarea class="form-control" id="ms_content" rows="3" readonly></textarea>
										  </div>
										  <div class="form-group">
										    <label for="etc-textarea">기타사항2</label>
										    <textarea class="form-control" id="ms_content2" rows="3" readonly></textarea>
										  </div>
										</form>
						              <!-- All grid row end -->
						              </div>
						          
									<!-- 버튼 -->
									<div class="form-row justify-content-center m-2">
										<button type="button" id="replybtn" class="btn btn-outline-dark mx-1 rounded-0">답장</button>
										<button type="button" id="c-cancelbtn" class="btn btn-outline-dark mx-1 rounded-0">취소</button>
									</div>
									<!-- card-body -->
									</div>
					       		<!-- #confirmForm -->
					       		</div>
					       		
					       		<!-- 답장 눌렀을 때  -->
								<div class="card mb-3 container border-dark" id="senderForm">
								  <div class="form-group row mt-4">
								    <label for="sender" class="col-sm-2 col-form-label col-form-label-sm">받는사람</label>
								    <div class="col-sm-10" id="recipient">
								      <input type="text" class="form-control form-control-sm" id="recipient" readonly>
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
									  <button type="button" id="sendbtn" class="btn btn-outline-dark mx-1 rounded-0">보내기</button>
									  <button type="button" id="s-cancelbtn" class="btn btn-outline-dark mx-1 rounded-0">취소</button>
									</div>
								</div>
								
								<!-- 메일 전송 성공 페이지 -->
								<div class="d-flex justify-content-center p-2">
									<div class="card border-0" id="s-forwarding" style="width: 30rem;">
									  <img src="resources/image/email_black.png" class="card-img-top rounded mx-auto d-block">
									  <div class="card-body text-center">
									    <p class="text-dark">메일이 전송되었습니다.</p>
									    <p class="text-dark">전송된 메일은 [보낸메시지]에서 확인할 수 있습니다.</p>
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
							   		<button type="button" id="s-delbtn" class="btn btn-outline-dark rounded-0">삭제</button>
									</div>
								</div>
								<!-- 쪽지 리스트 테이블 -->
								<table class="table table-bordered bg-light">
							  		<thead>
										<tr class=" text-center">
											<th class="w-10"><small>선택</small></th>
											<th class="w-15"><small>받는사람</small></th>
											<th class="w-40"><small>제목</small></th>
											<th class="w-35"><small>보낸날짜</small></th><!-- 기간관리자가 메일을 보낸 시점 -->
										</tr>
							  		</thead>
							  		<!-- 체크박스: 다중선택 후 삭제 / 답장의 경우 한개만 선택 가능 -->
							  		<tbody id="selmessage2">
										<tr class="text-center">
											<td scope="row">
												<div class="form-check">
													<input class="form-check-input position-static" type="checkbox" id="blankCheckbox2" value="option1">
												</div>
											</td>
											<td></td>  
											<td></td>
											<td></td>
											<td></td>
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
								<!-- class="container" id="sendTable" end -->
								</div>
								
								 <!-- tr 눌렀을 때  -->
								 <div class="container pt-3">
								 	<div class="card border-dark" id="sentForm">
								 		<div class="card-body">
										  <div class="form-group row mt-4">
										    <label for="sender" class="col-sm-2 col-form-label col-form-label-sm">받는사람</label>
										    <div class="col-sm-10">
										      <input type="text" class="form-control form-control-sm" id="sendp" readonly>
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
				<!-- .container -->
				</div>	
			<!-- #information -->	
			</div>	
		<!-- card col-md8 p-0 border-0 end -->
		</div>
		
		<!-- 통계 -->
		<div class="card col-md-4 p-0 border-0" id="listcard">
			<div class="card border-top-2" id="card-graph">
			   	<div class="container">
				<label for="statistics-member" class="col-form-label col-form-label-lg mt-3"><strong>메시지통계</strong></label>
					<div class="form-row">
					
					
					</div>
				</div>
			</div>
		<!-- #listcard end -->
		</div>
	<!-- .row -->	
	</div>
<!-- .col-md-12 -->
</div> 
  

</body>
</html>
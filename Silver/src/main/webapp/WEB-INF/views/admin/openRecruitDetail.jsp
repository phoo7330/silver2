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
$(document).ready(function(){
		console.log('${job}');
		what();
	  $("#r-viewList").click(function(){    
		window.close();
	});
	  
});
function what(){
	//vo에 담겨있는 시설타입을 꺼내 각타입에 맞는 문자로 변환해서 출력
	var type=0;
	var sttype='';
	type='${job.type}';
	if(type==1){
		sttype+='요양병원';
		$('#siltype').html(sttype);
		return;
	}else if(type==2){
		sttype+='요양원';
		$('#siltype').html(sttype);
		return;
	}else if(type==3){
		sttype+='방문시설';
		$('#siltype').html(sttype);
		return;
	}else if(type==4){
		sttype+='치매전담'; 
		$('#siltype').html(sttype);
		return;
	}
}
$(document).ready(function(){
	  $("#senderForm").hide();
	  
	  $("#r-messagebtn").click(function(){    
		$("#r-informationForm").hide();
		$("#senderForm").show();
		window.location.replace("#main-information");
	});
	  $("#r-warningbtn").click(function(){  //회원경고
		  var id = $(this).attr("data-value");

		  $.ajax({
		        type : 'post',
		        url : 'warningmem',
		        data : {userid:id
		        },
		        success : function(data){
		        	if(data==1){
		        		alert("경고횟수가 추가되었습니다");
		        		window.close();
		        	}
		        	
		        }        	
			}); 
		  
	  });
	  
	  
	  $("#r-delbtn").click(function(){ //삭제버튼을 눌렀을떄
		  var jo_seq = $(this).attr("data-value");
	  
		   $.ajax({
				url:"deljob2", 
				type:"post",
				data:{"jo_seq":jo_seq
				},
				success:function(data){
					alert("삭제되었습니다");
					opener.parent.location.reload();  //자식팝업창 닫으면서 부모창 새로고침
					  window.close();
					}
				}); 
		  
	  });
	  $("#s-cancelbtn").click(function(){    
		 $("#senderForm").hide();
		 $("#r-informationForm").show();
		 window.location.replace("#main-information");
  	});
	  /* 메시지 전송 후 alert창 띄어야 함 */
	  $("#sendbtn").click(function(){    
		 $("#senderForm").hide();
		 $("#r-informationForm").show();
		 window.location.replace("#main-information");
	 });
});
</script>

	<!-- 일반회원&종사자회원 정보 -->
	<div class="container" id="open-general-practician">	
		<div class="card container border-dark mt-3 mb-3">
		<!-- Section -->
		<section class="sender-section"> 
		  <!-- 회원구분 / 가입일 -->
		  <div class="form-row mt-4" id="main-information"> 
			<h2 class="col-md-6">구인정보 상세보기</h2>
			<div class="col-md-6 text-right">
			  <p class="dark-grey-text mb-0">${job.silvername}</p>
			  <p class="dark-grey-text mb-0">${job.jo_date}</p>
			</div>
		  </div>
		 <hr> 
		<!-- 메시지 누를 때 숨길 부분 -->
		<div id="r-informationForm"> 
		  <!-- All grid row -->
		  <div class="row">
		    <!-- 구인정보 상세보기 -->
			<div class="container" id="confirm-recruit">
			<!-- 기관정보 -->
			<div class="float-right">
				<button type="button" class="btn btn-secondary mb-3 rounded-0" id="r-viewList">목록보기</button>
			</div>
			<table class="table table-bordered" id="facilityForm">
				<tbody>
					<tr>
						<th class="bg-light">기관명</th>
						<th colspan="3" id="onename">${job.silvername}</th>
					</tr>
	       			<tr>
						<td class="bg-light w-20">급여종류</td>
						<td class="w-30 pb-0" id="siltype"></td>
						<td class="bg-light w-20">구인글등록일</td>
						<td class="w-30 pb-0">${job.jo_date}</td>
					</tr>
					<tr>
						<td class="bg-light">주소</td>
						<td colspan="3" class="pb-0">${job.areaa} ${job.areab} ${job.areac}</td>
					</tr>
					<tr>
						<td class="bg-light w-20">모집직종</td>
						<td class="w-30 pb-0">${job.jo_job}</td>
						<td class="bg-light w-20">모집인원</td>
						<td class="w-30 pb-0">${job.jo_int}</td>
					</tr>
					<tr>
						<td class="bg-light w-20">근무형태</td>
						<td class="w-30 pb-0">${job.jo_type}</td>
						<td class="bg-light w-20">상세근무형태</td>
						<td class="w-30 pb-0">${job.jo_detailtype}</td>
					</tr>
					<tr style="height: 200px;">
						<td class="bg-light">상세내용</td>
						<td colspan="3" class="etc1 pb-0">${job.jo_content}</td>
					</tr>
				</tbody>
			</table>
			 <!-- 버튼 -->
			   <div class="fixed-bottom btn-group m-5 pb-3 d-flex justify-content-center" >
				  <div>
				 	 <button type="button" class="btn btn-outline-dark mx-1 rounded-0" id="r-messagebtn">메시지</button>
				  </div>
				  <div>
				 	 <button type="button" class="btn btn-outline-danger mx-1 rounded-0" data-value="${job.jo_seq}" id="r-delbtn">삭 제</button>
				  </div>
				  <div>
				  	<button type="button" class="btn btn-outline-danger mx-1 rounded-0" data-value="${job.userid}" id="r-warningbtn">경 고</button>	  
				  </div>
			  </div>
		</div>
	  <!-- row end -->
	  </div>  
	 <!-- #m-informationForm end -->
	 </div>
		<!-- 	
		<div class="card-body mb-3 container" id="senderForm">
		  <div class="form-group row mt-3">
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
			<div class="fixed-bottom m-5 pb-3 form-row justify-content-center mb-4">
			  <button type="button" id="sendbtn" class="btn btn-outline-dark mt-5 mx-1 rounded-0">보내기</button>
			  <button type="button" id="s-cancelbtn" class="btn btn-outline-dark mt-5 mx-1 rounded-0">취소</button>
			</div>
		</div>
	 -->
		<!-- Section -->
		</section>  
		</div>
	</div>
</body>
</html>
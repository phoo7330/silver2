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
	
	
	  $("#b-viewList").click(function(){    
		window.close();
	});
	  
});

$(document).ready(function(){
	  $("#senderForm").hide();
	  
	  $("#b-messagebtn").click(function(){    
		$("#b-informationForm").hide();
		$("#senderForm").show();
		window.location.replace("#main-information");
	});

	  $("#b-delbtn").click(function(){ //삭제버튼을 눌렀을떄
		  var sb_seq = $(this).attr("data-value");
	  
		   $.ajax({
				url:"delboard2", 
				type:"post",
				data:{"sb_seq":sb_seq
				},
				success:function(data){
					alert("삭제되었습니다");
					opener.parent.location.reload();  //자식팝업창 닫으면서 부모창 새로고침
					  window.close();
					}
				}); 
		  
	  });
	  
	  
	  $("#b-cancelbtn").click(function(){    
		 $("#senderForm").hide();
		 $("#b-informationForm").show();
		 window.location.replace("#main-information");
  	});
	  /* 메시지 전송 후 alert창 띄어야 함 */
	  $("#sendbtn").click(function(){    
		 $("#senderForm").hide();
		 $("#b-informationForm").show();
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
			<h2 class="col-md-6">게시글 상세보기</h2>
			<div class="col-md-6 text-right">
			  <p class="dark-grey-text mb-0">작성자</p>
			  <p class="dark-grey-text mb-0">${sbone.userid}</p>
			</div>
		  </div>
		 <hr> 
		<!-- 메시지 누를 때 숨길 부분 -->
		<div id="b-informationForm"> 
		  <!-- All grid row -->
		  <div class="row">
		  <!-- 게시글 상세보기 -->
			<div class="container" id="confirm-board">
			<!-- 기관정보 -->
			<div class="float-right">
				<button type="button" class="btn btn-secondary mb-3 rounded-0" id="b-viewList">목록보기</button>
			</div>
			<table class="table table-bordered" id="boardForm">
			    <!-- 게시판 타이틀 -->
			    <tr>
			      <td class="pb-0 bg-light">
			        <h3 class="font-weight-bold">${sbone.sbtitle}</h3>
			        <h6 id="board-date"><small>${sbone.sbdate}</small></h6>
			      </td>
			    </tr>
			    <!-- 게시판 내용 -->
			    <tr>
			      <td class="board-text" style="height: 20rem;">
			        <p class="text-justify font-weight-light p-1" id="board-contents">${sbone.sbwrite}</p>
			      </td>
			    </tr>
			  </table>
			 <!-- 버튼 -->
			   <div class="fixed-bottom btn-group m-5 pb-3 d-flex justify-content-center" >
				  <div>
				 	 <button type="button" class="btn btn-outline-dark mx-1 rounded-0" id="b-messagebtn">메시지</button>
				  </div>
				  <div>
				 	 <button type="button" class="btn btn-outline-danger mx-1 rounded-0" data-value="${sbone.sb_seq}" id="b-delbtn">삭 제</button>
				  </div>
				  <div>
				  	<button type="button" class="btn btn-outline-danger mx-1 rounded-0" id="b-warningbtn">경 고</button>	  
				  </div>
			  </div>
		</div>
	  <!-- row end -->
	  </div>  
	 <!-- #m-informationForm end -->
	 </div>
		<!-- 메시지버튼 클릭 시 -->			
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
			  <button type="button" id="t-cancelbtn" class="btn btn-outline-dark mt-5 mx-1 rounded-0">취소</button>
			</div>
		</div>
	
		<!-- Section -->
		</section>  
		</div>
	</div>
</body>
</html>
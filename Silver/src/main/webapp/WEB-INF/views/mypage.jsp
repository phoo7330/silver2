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
	<link rel="stylesheet" href="<c:url value="/resources/css/custom.css"/>">
	<link rel="stylesheet" href="resources/css/mypage.css">
	
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
		$("#insertgo").on("click",function(){	
			insertMessage();  //보내기버튼
		});
		
	    $.ajax({
	    	  url: "SelectSendMessageBox"
	    	, method: "POST"
	    	, success: function(resp) {
	    		var ctx = '<tbody>';
	    		$.each(resp, function(index, item) {	
	    			ctx += '<tr class="text-center"><th scope="row"><div class="form-check">';
	    			ctx += '<input class="form-check-input position-static" type="checkbox" id="sendBlankCheckbox' + index + '" value="option1">';
	    			ctx += '</div></th><td>';
	    			ctx += item.ms_Sender;
	    			ctx += '</td>'
	    			ctx += '<td><label class="form-check-label" for="selectContents">';
	    			ctx += item.ms_content;
	    			ctx += '</label></td>';
	    			ctx += '<td>' + item.ms_date + '</td>';
	    			ctx += '</tr>';
	    		});
	    		ctx += '</tbody>';
	    		$("#sendTable").append(ctx);
	    	}
	    });
	    
	    $.ajax({
	    	  url: "SelectReceiveMessageBox"
	    	, method: "POST"
	    	, success: function(resp) {
	    		var ctx = '<tbody>';
	    		$.each(resp, function(index, item) {
	    			ctx += '<tr class="text-center"><th scope="row"><div class="form-check">';
	    			ctx += '<input class="form-check-input position-static receiveBlankCheckbox" type="checkbox" id="receiveBlankCheckbox' + index + '" value="option1">';
	    			ctx += '</div></th><td id="receiveMessageBoxSender' + index + '">';
	    			ctx += item.userid;
	    			ctx += '</td>'
	    			ctx += '<td><label class="form-check-label" for="selectContents">';
	    			ctx += item.ms_content;
	    			ctx += '</label></td>';
	    			ctx += '<td>' + item.ms_date + '</td>';
	    			ctx += '</tr>';
	    		});
	    		ctx += '</tbody>';
	    		$("#receiveTable").append(ctx);
	    	}
	    });
	  });
	
	  $(function() {
		  $('#myTab li a').on('click',function() {
			var item = $(this).html();
			$("#inform-tabContent").html(item);
		 });
		//어르신등록
			$('#submitbtn2').on('click',function(){
					$('#inputBirth').attr("readonly",false);
					$('#inputName').attr("readonly",false);
					$('#inputblood').html('<select class="custom-select custom-select-sm my-1 mr-sm-2"id="bloodType" name="sc_bloodtype" ><option <c:if test="${sc.sc_bloodtype == null }">selected</c:if>>선택</option><option value="A" <c:if test="${sc.sc_bloodtype == \'A\'}">selected</c:if>>A</option><option value="B" <c:if test="${sc.sc_bloodtype == \'B\'}">selected</c:if>>B</option><option value="O" <c:if test="${sc.sc_bloodtype == \'O\'}">selected</c:if>>O</option><option value="AB" <c:if test="${sc.sc_bloodtype == \'AB\'}">selected</c:if>>AB</option> </select>');
					$('#inputMeal').html('<select class="custom-select custom-select-sm my-1 mr-sm-2" id="meal" name="scd_meal" ><option <c:if test="${scd.scd_meal == null }">selected</c:if>>선택</option><option value="스스로 가능" <c:if test="${scd.scd_meal == \'스스로 가능\'}">selected</c:if>>스스로 가능</option><option value="도움 필요" <c:if test="${scd.scd_meal == \'도움 필요\'}">selected</c:if>>도움 필요</option><option value="스스로 불가능" <c:if test="${scd.scd_meal == \'스스로 불가능\'}">selected</c:if>>스스로 불가능</option></select>');
					$('#inputWalking').html('<select class="custom-select custom-select-sm my-1 mr-sm-2" id="walking" name="scd_care"> <option <c:if test="${scd.scd_care == null}">selected</c:if>>선택</option><option value="스스로 가능" <c:if test="${scd.scd_care == \'스스로 가능\'}">selected</c:if>>스스로 가능</option><option value="도움 필요"<c:if test="${scd.scd_care == \'도움 필요\'}">selected</c:if>>도움 필요</option><option value="스스로 불가능" <c:if test="${scd.scd_care == \'스스로 불가능\'}">selected</c:if>>스스로 불가능</option></select>');
					$('#inputWashing').html(' <select class="custom-select custom-select-sm my-1 mr-sm-2"id="washing" name="scd_washing"><option <c:if test="${scd.scd_washing == null}">selected</c:if>>선택</option><option value="스스로 가능" <c:if test="${scd.scd_washing == \'스스로 가능\'}">selected</c:if>>스스로 가능</option><option value="도움 필요" <c:if test="${scd.scd_washing == \'도움 필요\'}">selected</c:if>>도움 필요</option><option value="스스로 불가능" <c:if test="${scd.scd_washing == \'스스로 불가능\'}">selected</c:if>>스스로 불가능</option></select');
					$('#inputClothing').html(' <select class="custom-select custom-select-sm my-1 mr-sm-2" id="clothing" name="scd_clothing"><option <c:if test="${scd.scd_clothing == null}">selected</c:if>>선택</option><option value="스스로 가능" <c:if test="${scd.scd_clothing == \'스스로 가능\'}">selected</c:if>>스스로 가능</option><option value="도움 필요" <c:if test="${scd.scd_clothing == \'도움 필요\'}">selected</c:if>>도움 필요</option><option value="스스로 불가능" <c:if test="${scd.scd_clothing == \'스스로 불가능\'}">selected</c:if>>스스로 불가능</option></select>');
					$('#inputBath').html('<select class="custom-select custom-select-sm my-1 mr-sm-2"id="bath" name="scd_bath"><option <c:if test="${scd.scd_bath == null}">selected</c:if>>선택</option><option value="스스로 가능" <c:if test="${scd.scd_bath == \'스스로 가능\'}">selected</c:if>>스스로 가능</option><option value="도움 필요" <c:if test="${scd.scd_bath == \'도움 필요\'}">selected</c:if>>도움 필요</option><option value="스스로 불가능" <c:if test="${scd.scd_bath == \'스스로 불가능\'}">selected</c:if>>스스로 불가능</option></select>');
					$('#inputWashroom').html('<select class="custom-select custom-select-sm my-1 mr-sm-2"id="washroom" name="scd_toilet"><option <c:if test="${scd.scd_toilet == null}">selected</c:if>>선택</option><option value="스스로 가능" <c:if test="${scd.scd_toilet == \'스스로 가능\'}">selected</c:if>>스스로 가능</option><option value="도움 필요" <c:if test="${scd.scd_toilet == \'도움 필요\'}">selected</c:if>>도움 필요</option><option value="스스로 불가능" <c:if test="${scd.scd_toilet == \'스스로 불가능\'}">selected</c:if>>스스로 불가능</option></select>');
					$('#disease_information').attr("disabled", false);
					$('#disease_information2').attr("disabled", false);
					$('#disease_information3').attr("disabled", false);
					$('#disease_information4').attr("disabled", false);
					$('#disease_information5').attr("disabled", false);
					$('#disease_information6').attr("disabled", false);
					$('#disease_information7').attr("disabled", false);
					$('#disease_information8').attr("disabled", false);
					$('#disease_information9').attr("disabled", false);
					$('#disease_information10').attr("disabled", false);
					$('#disease_information11').attr("disabled", false);
					$('#disease_information12').attr("disabled", false);
					$('#disease_information13').attr("disabled", false);	
					$('#disease_information14').attr("disabled", false);
					$('#disease_information15').attr("disabled", false);
					$('#disease_information16').attr("disabled", false);
					$('#disease_information17').attr("disabled", false);
					$('#disease_information18').attr("disabled", false);
					$('#disease_information19').attr("disabled", false);
					$('#disease_information20').attr("disabled", false);
					$('#disease_information21').attr("disabled", false);
					$('#disease_information22').attr("disabled", false);
					$('#disease_information23').attr("disabled", false);
					$('#scd_others').attr("readonly",false);
					//어르신수정버튼 숨기기
					$('#submitbtn2').attr("type","hidden");
					//어르신취소버튼붙이기
					$('#insertbtn2').append('<input type="button" id="canslebtn2" class="btn btn-outline-secondary" value="취소" onClick="window.location.href=window.location.href" >');
					
					if('${sc}'!=''){
					//어르신수정버튼붙이기
					$('#insertbtn2').append('<input type="button" id="sbmbtntest2" class="btn btn-outline-secondary" value="수정" >');
					}else{
					//어르신최초등록버튼붙이기	
					$('#insertbtn2').append('<input type="button" id="sbmbtntest3" class="btn btn-outline-secondary" value="등록" >');
					}
					//어르신최초등록버튼 실행시
					$('#sbmbtntest3').on('click',function(){
						var birthday = $('#inputBirth').val();
						var name = $('#inputName').val();
						var blood = $('#bloodType').val();
						var meal = $('#meal').val();
						var walk = $('#walking').val();
						var washing = $('#washing').val();
						var cloth = $('#clothing').val();
						var shower = $('#bath').val();
					 	var toilet = $('#washroom').val();
					 	
					 	if(birthday == ''){
					 		alert('어르신 생년월일을 입력해주세요!');
					 		return;
					 	}else if(name ==''){
					 		alert('어르신 성함을 입력해주세요!');
					 		return;
					 	}else if(blood == '선택'){
					 		alert('어르신 혈액형을 입력해주세요!');
					 		return;
					 	}else if(meal== '선택'){
					 		alert('어르신 식사수행정도를 입력해주세요!');
					 		return;
					 	}else if(walk== '선택'){
					 		alert('어르신 보행수행정도를 입력해주세요!');
					 		return;
					 	}else if(washing== '선택'){
					 		alert('어르신  세면수행정도를 입력해주세요!');
					 		return;
					 	}else if(cloth== '선택'){
					 		alert('어르신 의복수행정도를 입력해주세요!');
					 		return;
					 	}else if(shower== '선택'){
					 		alert('어르신 목욕수행정도를 입력해주세요!');
					 		return;
					 	}else if(toilet== '선택'){
					 		alert('어르신 화장실수행정도를 입력해주세요!');
					 		return;
					 	}
					 	
						$('#insertSenior').submit();
						alert('어르신등록!');
					});
					
					//어르신수정버튼 실행시
					$('#sbmbtntest2').on('click',function(){
						//console.log("!");
						var birthday = $('#inputBirth').val();
						var name = $('#inputName').val();
						var blood = $('#bloodType').val();
						var meal = $('#meal').val();
						var walk = $('#walking').val();
						var washing = $('#washing').val();
						var cloth = $('#clothing').val();
						var shower = $('#bath').val();
					 	var toilet = $('#washroom').val();
						
						if(birthday == ''){
					 		alert('어르신 생년월일을 입력해주세요!');
					 		return;
					 	}else if(name ==''){
					 		alert('어르신 성함을 입력해주세요!');
					 		return;
					 	}else if(blood == '선택'){
					 		alert('어르신 혈액형을 입력해주세요!');
					 		return;
					 	}else if(meal== '선택'){
					 		alert('어르신 식사수행정도를 입력해주세요!');
					 		return;
					 	}else if(walk== '선택'){
					 		alert('어르신 보행수행정도를 입력해주세요!');
					 		return;
					 	}else if(washing== '선택'){
					 		alert('어르신  세면수행정도를 입력해주세요!');
					 		return;
					 	}else if(cloth== '선택'){
					 		alert('어르신 의복수행정도를 입력해주세요!');
					 		return;
					 	}else if(shower== '선택'){
					 		alert('어르신 목욕수행정도를 입력해주세요!');
					 		return;
					 	}else if(toilet== '선택'){
					 		alert('어르신 화장실수행정도를 입력해주세요!');
					 		return;
					 	}
					 	
						$('#updateSenior').submit();
						
					});
					//취소버튼 실행시
					$('#canslebtn2').on('click',function(){
						location.reload();
					});
			});
			
			
			//개인정보 수정,등록, 삭제
			$('#submitbtn').on('click', function() {
				
			
				$('#editPassword').attr("disabled", false);
				$('#editPasswordT').attr("disabled", false);
				$('#editEmail').attr("disabled" , false);
				$('#selectPhone').html('<input type="text" class="form-control form-control-sm"id="editPhone" name="telephone" value="${member.telephone}">');
				$('#selectfile').html('<div class="custom-file"><input type="file" class="file-input" id="licenseFile" lang="ko"> <small id="licenseHelp" class="form-text text-muted">자격증 파일을 선택하세요.</small></div>');
				$('#selectType1').html('<div class="form-check form-check-inline"> <input class="form-check-input" type="radio" name="type" id="custom" value=1 checked> <label class="form-check-label form-check-sm" for="custom"><small>일반가입자</small></label></div>');
				$('#selectType2').html('<div class="form-check form-check-inline"> <input class="form-check-input" type="radio" name="type" id="worker" value=2> <label class="form-check-label form-check-sm" for="worker"><small>종사자</small></label> </div>'); 
				$('#updatebtn').append('<input type="button" id="canslebtn" class="btn btn-outline-secondary"value="취소" onClick="window.location.href=window.location.href" >');
				$('#updatebtn').append('<input type="button" id="sbmbtntest" class="btn btn-outline-secondary"value="등록" >');
				$('#submitbtn').attr("type","hidden");
				$('#attachedFile').html('<input type="file" class="file-input" id="licenseFile" lang="ko"><small id="licenseHelp" class="form-text text-muted">자격증 파일을 선택하세요.</small>');
				/* 수정: 스크립트 추가: 종사자 클릭했을 때 첨부파일 show */
				$('#worker').on('click', function() {
			  		$("#attachedFile").show();  
			  		$("#forFile").show();
			  	});	
				/* 수정: 스크립트 추가: 일반가입자 클릭했을 때 첨부파일 remove */	
				$('#custom').on('click',function(){
					  $("#attachedFile *").remove();  
				  	  $("#forFile *").remove();
				  }); 
				//취소버튼실행시
				$("#canslebtn").on("click",function(){
					location.reload();
				});
				//수정버튼실행시
				$("#sbmbtntest").on("click", function() {
					var pwd = $('#editPassword').val();
					var pwd2 = $('#editPasswordT').val();
					var email = $('#editEmail').val();
					var phone = $('#editPhone').val();
					if(pwd == ''){
						alert('비밀번호를 입력해주세요!');
						return;
					}else if(pwd !=pwd2){
						alert('비밀번호와 확인비밀번호가 일치하지 않습니다!');
						return;
					}else if(email == '' ){
						alert('이메일을 입력해주세요!');
						return;
					}else if(phone == ''){
						alert('전화번호를 입력해주세요!');
						return;
					}
					
					$('#updateMember').submit();
				});
			});
		  //function end
		  });
	 //이력서
	  $(document).ready(function(){
		 
		$('#cnlResumebtn').hide();
	  	$('#istResumebtn').hide();
	  	$('#udtResumebtn').hide();
	  	$('#qualify1').hide();
		$('#job1').hide();
		$('#gugun1').hide();
		$('#sido1').hide();
		$('#work1').hide();
		$('#detail').hide();
		 //이력서 수정버튼 클릭시   수정 등록 취소 버튼 셋팅
		$('#resumebtn').click(function(){
	  			$('#qualify1').show();
	  			$('#job2').hide();
	  			$('#gugun2').hide();
	  			$('#sido2').hide();
	  			$('#work2').hide();
	  			$('#detail2').hide();
	  			$('#showQualify1').hide();
	  			$('#job1').show();
	  			$('#gugun1').show();
	  			$('#sido1').show();
	  			$('#work1').show();
	  			$('#detail').show();
	  			$('#exampleFormControlTextarea5').attr('readonly',false);
	  			$('#resumebtn').hide();
	  			$('#cnlResumebtn').show();
	  			//모델값의 존재여부로 if로 update or insert 버튼을 생성
	  			var rs2 = "${rs}";
	  			
	  			if(rs2 == ""){
	  				$('#istResumebtn').show();
	  			}else{
	  				$('#udtResumebtn').show();
	  			}
	  			$('#udtResumebtn').click(function(){
	  				updateresume();
	  				location.reload();

	  			});
	  			
				$('#istResumebtn').click(function(){
					insertresume();
					location.reload();

	  			});
	  		  	
	  		});
	  });
	 //이력서 출력
	 
	 
	 // 이력서 수정 취소 등록 기능
	 $(function(){
		 $('#cnlResumebtn').on('click',function(){
			 location.reload();
		 });
		 
		 $('#udtResumebtn').on('click',function(){
			 $('#udtResumebtn').submit();
			 location.reload();
		 });
		 
		 $('#istResumebtn').on('click',function(){
			 $('#istResumebtn').submit();
			 location.reload();
		 });
	});
	  /* 쪽지함 show & hide 스크립트 */
	  $(document).ready(function(){
		  $("#senderForm").hide();
	  
		  $("#replybtn").click(function(){  
			 var temp = $(".receiveBlankCheckbox:checked");
			 if (temp.length != 1) {
				 alert("선택 체크하고 눌러주세요");
				 return;
			 }
			 var tempid = temp.attr("id");
			 var sender = $("#receiveMessageBoxSender" + tempid.substring(tempid.length -1, tempid.length));
			 $("#sender").val(sender.html());
			 $("#receiveTable").hide();
			 $("#receivePage").hide();
			 $("#senderForm").show();
	      });
		  
		  $("#sendbtn").click(function(){
			  var val = $("#sbwrite").val();
			  if (!val) {
				  alert("메세지를 입력해주세요.");
				  return 
			  }
			  insertReply(); 
			  
			$("#senderForm").hide();
			$("#receiveTable").show();
			$("#receivePage").show();
		  });
		  
		  $("#cancelbtn").click(function(){    
			$("#senderForm").hide();
			$("#receiveTable").show();
			$("#receivePage").show();
		  });

	  });
	  function insertresume(){
		  var re_type = $("#work1").val();
		  var re_detailType = $("#detail").val();
		  var re_job = $("#job1").val();
		  var re_content = $("#exampleFormControlTextarea5").val();
		  var re_areaa = $("#sido1").val();
		  var re_arebb = $("#gugun1 ").val();
		  var re_qualification = $("#qualify1").val();
		  
		  console.log(re_type);
		  console.log(re_detailType);
		  console.log(re_content);
		  console.log(re_areaa);
		  console.log(re_arebb);
		  console.log(re_qualification);
		  
		  $.ajax({
		        type : 'post',
		        url : 'insertResume',
		        data : {re_type: re_type
		        		,re_detailType: re_detailType
		        		,re_job : re_job
		        		,re_content : re_content
		        		,re_areaa : re_areaa
		        		,re_arebb : re_arebb
		        		,re_qualification : re_qualification
		        },
		        success : function(){
		  				console.log("통과했는지?");
		  				alert('이력서등록 성공!');
		  				return true;
		        },
		        error: function(){
		        	alert('이미 이력서가 등록되어있습니다.');
		        	return false;
		        }
		  });
	  }
	  
	  function updateresume(){
		  var re_type = $("#work1").val();
		  var re_detailType = $("#detail").val();
		  var re_job = $("#job1").val();
		  var re_content = $("#exampleFormControlTextarea5").val();
		  var re_areaa = $("#sido1").val();
		  var re_arebb = $("#gugun1 ").val();
		  var re_qualification = $("#qualify1").val();
		 
		  console.log(re_type);
		  console.log(re_detailType);
		  console.log(re_content);
		  console.log(re_areaa);
		  console.log(re_arebb);
		  console.log(re_qualification);
		 
		  $.ajax({
		        type : 'post',
		        url : 'updateResume',
		        data : {re_type: re_type
		        		,re_detailType: re_detailType
		        		,re_job : re_job
		        		,re_content : re_content
		        		,re_areaa : re_areaa
		        		,re_arebb : re_arebb
		        		,re_qualification : re_qualification
		        },
		        success : function(){
		  				console.log("업데이트통과했는지?");
		  				alert('이력서수정 성공!');
		  				return true;
		        },
		        error: function(){
		        	alert('이력서수정 실패. 값을 다시 확인해주십시오.');
		        	return false;
		        }
		  });
	  }
	  
	   /* function selectresume(){
		  var re_qualification="";
		  var re_job= '';
		  var re_areaa= '';
		  var re_arebb= '';
		  var re_type= '';
		  var re_detailType= '';
		  var re_content= '';  
		  $.ajax({
			  type : 'POST'
		      ,url : 'selectResume'
		      ,success : function(resp){
		        		re_qualification += resp.re_qualification ;
		        		re_job += resp.re_job;
		        		re_areaa += resp.re_areaa;
		        		re_arebb += resp.re_arebb;
		        		re_type += resp.re_type;
		        		re_detailType += resp.re_detailType;
		        		re_content += resp.re_content;
		        		$("#showQualify1").val(re_qualification);
		        		$("#job2").val(re_job);
		        		$("#sido2").val(re_areaa);
		        		$("#gugun2").val(re_arebb);
		        		$("#work2").val(re_type);
		        		$("#detail2").val(re_detailType);
		        		$("#exampleFormControlTextarea5").val(re_content);
		          }
		  	   ,error : function(){
		  		   alert('이력서실패');
		  	   }
		      });
		} */ 
		
	  
	  
	  function insertReply(){
			var ms_sender =  $("#sender").val();//받는사람
/* 			var userid =$("#userid").val();//보낸아이디 */
			var ms_content = $("#sbwrite").val();//내용

			$.ajax({
		        type : 'post',
		        url : 'insertMessage',
		        data : {ms: ms_content,
		        		sender: ms_sender},
		        success : function(result){
		        	/* alert("result : " + result); */
		        	if(result==1){
		        	init2();
		        	} else {
		        		alert('실패');
		        	}
		        }	        
		    });
		}	
		function init2(resp){
			var ms_sender =  $("#sender").val();	
			alert(ms_sender+"님에게 전송했습니다.");
/* 			$('#writeRecipient')[0].reset();  */
/* 			selectMessage(); */
			 $("#sbwrite").val("");
			 $("#sendTable tbody").remove();
			 $("#receiveTable tbody").remove();
			 $.ajax({
				  url: "SelectSendMessageBox"
				, method: "POST"
				, success: function(resp) {
					var ctx = '<tbody>';
					$.each(resp, function(index, item) {	
						ctx += '<tr class="text-center"><th scope="row"><div class="form-check">';
						ctx += '<input class="form-check-input position-static" type="checkbox" id="sendBlankCheckbox' + index + '" value="option1">';
						ctx += '</div></th><td>';
						ctx += item.ms_Sender;
						ctx += '</td>'
						ctx += '<td><label class="form-check-label" for="selectContents">';
						ctx += item.ms_content;
						ctx += '</label></td>';
						ctx += '<td>' + item.ms_date + '</td>';
						ctx += '</tr>';
					});
					ctx += '</tbody>';
					$("#sendTable").append(ctx);
				}
			});
			
			$.ajax({
				  url: "SelectReceiveMessageBox"
				, method: "POST"
				, success: function(resp) {
					var ctx = '<tbody>';
					$.each(resp, function(index, item) {
						ctx += '<tr class="text-center"><th scope="row"><div class="form-check">';
						ctx += '<input class="form-check-input position-static receiveBlankCheckbox" type="checkbox" id="receiveBlankCheckbox' + index + '" value="option1">';
						ctx += '</div></th><td id="receiveMessageBoxSender' + index + '">';
						ctx += item.userid;
						ctx += '</td>'
						ctx += '<td><label class="form-check-label" for="selectContents">';
						ctx += item.ms_content;
						ctx += '</label></td>';
						ctx += '<td>' + item.ms_date + '</td>';
						ctx += '</tr>';
					});
					ctx += '</tbody>';
					$("#receiveTable").append(ctx);
				}
			});
		}
	  	  
/* 수정: 스크립트 추가: 종사자 클릭했을 때 첨부파일 show */

	  $(function() {
	  	$("#attachedFile").hide();
	  	$("#forFile").hide();
	  	
	  	$('#worker').on('click', function() {
	  		$("#attachedFile").show();  
	  		$("#forFile").show();
	  	});	
	  });	
 
/* 수정: 스크립트 추가: 개인정보 수집동의 클릭 이벤트 */ 

	  $(document).ready(function(){
	    	$("#card-resume").hide();
	    	
	        $("#agreebtn").click(function(){    
	            if($("#check1").is(":checked") == false){
	                alert("개인정보보호법 제 15조에 의한 수집· 이용 동의 에 동의하세요.");
	                return;
	            }else{
	            	$("#card-agree").hide();
	                $("#card-resume").show();
	            }
	        });    
	        
	        $("#disagreebtn").click(function(){    
	        	location.href="index";
	        });
	        
	        /* 저장 값 들어가면 저장 값이 나오도록 if 문 추가해야함. */
	        $("#resume-box").click(function(){    
            	$("#card-resume").hide();
                $("#card-agree").show();
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
		
		
		/* 직종 선택 */
		$('document').ready(function() {
			var career = ["선택","시설장","사무국장","사회복지사","의사","촉탁의사","간호사","간호조무사","치과위생사","물리치료사","작업치료사","요양보호사 1급","요양보호사 2급","요양보호사 기존유예자","영양사","사무원","조리원","위생원","관리인","보조원 운전사","프로그램관리자","치매전문교육이수자","청구담당자","기타"];
			
			$("select[name^=job]").each(function() {
				$seljob = $(this);
				$.each(eval(career), function() {
					$seljob.append("<option value='"+this+"'>"+this+"</option>");
				});
			});
		});
		
		
		/* 자격 선택 */
		$('document').ready(function() {
			var qualification = ["선택","사회복지사1급","사회복지사2급","사회복지사3급","의사","간호사","간호조무사","치과위생사","물리치료사","작업치료사","요양보호사 1급","요양보호사 2급","요양보호사 기존유예자","영양사","기타"];
			
			$("select[name^=qualify]").each(function() {
				$selqualify = $(this);
				$.each(eval(qualification), function() {
					$selqualify.append("<option value='"+this+"'>"+this+"</option>");
				});
			});
		});
		
		
		/* 근무형태 선택  */
		$('document').ready(function() {
			var category0 = ["선택","정규직","계약직","시간제"];
			var category1 = ["일일3교대","일일2교대","전임주간","전임야간","주간","야간","기타"];
			var category2 = ["일일3교대","일일2교대","전임주간","전임야간","주간","야간","기타"];
			var category3 = ["주간","야간","기타"];
			
			 // 근무형태 박스 초기화 
			$("select[name^=work]").each(function() {
				$selwork = $(this);
				$.each(eval(category0), function() {
					$selwork.append("<option value='"+this+"'>"+this+"</option>");
				});
				$selwork.next().append("<option value=''>상세근무형태 선택</option>");
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

		//쪽지 쓰기
		function insertMessage(){
			var ms_sender =  $("#writeRecipient").val();//받는사람
/* 			var userid =$("#userid").val();//보낸아이디 */
			var ms_content = $("#writeMessage").val();//내용

			if(ms_sender==''){
				alert("아이디을 입력하세요");
				return;
			}
			if(ms_content==''){
				alert("내용을 입력하세요");
				return;
			}

			$.ajax({
		        type : 'post',
		        url : 'insertMessage',
		        data : {ms: ms_content,
		        		sender: ms_sender},
		        success : function(result){
		        	/* alert("result : " + result); */
		        	if(result==1){
		        	init();			        		
		        	} else {
		        		alert('실패');
		        	}
		        }	        
		    });
		}	
		function init(resp){
			var ms_sender =  $("#writeRecipient").val();	
			alert(ms_sender+"님에게 전송했습니다.");

			 $("#sendTable tbody").remove();
			 $("#receiveTable tbody").remove();
			 $.ajax({
				  url: "SelectSendMessageBox"
				, method: "POST"
				, success: function(resp) {
					var ctx = '<tbody>';
					$.each(resp, function(index, item) {	
						ctx += '<tr class="text-center"><th scope="row"><div class="form-check">';
						ctx += '<input class="form-check-input position-static" type="checkbox" id="sendBlankCheckbox' + index + '" value="option1">';
						ctx += '</div></th><td>';
						ctx += item.ms_Sender;
						ctx += '</td>'
						ctx += '<td><label class="form-check-label" for="selectContents">';
						ctx += item.ms_content;
						ctx += '</label></td>';
						ctx += '<td>' + item.ms_date + '</td>';
						ctx += '</tr>';
					});
					ctx += '</tbody>';
					$("#sendTable").append(ctx);
					
				}
			});
			
			$.ajax({
				  url: "SelectReceiveMessageBox"
				, method: "POST"
				, success: function(resp) {
					var ctx = '<tbody>';
					$.each(resp, function(index, item) {
						ctx += '<tr class="text-center"><th scope="row"><div class="form-check">';
						ctx += '<input class="form-check-input position-static receiveBlankCheckbox" type="checkbox" id="receiveBlankCheckbox' + index + '" value="option1">';
						ctx += '</div></th><td id="receiveMessageBoxSender' + index + '">';
						ctx += item.userid;
						ctx += '</td>'
						ctx += '<td><label class="form-check-label" for="selectContents">';
						ctx += item.ms_content;
						ctx += '</label></td>';
						ctx += '<td>' + item.ms_date + '</td>';
						ctx += '</tr>';
					});
					ctx += '</tbody>';
					$("#receiveTable").append(ctx);
				}
			});
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
	
	
	
	<div class="container">
		<!-- 1. 기본정보 탭  -->
<!-- 수정 -->	<div class="border-bottom" id="basicTab">
			<div class="tab-content">
<!-- 수정 -->		<h4 class="text-secondary" id="inform-tabContent">계정정보</h4>  
		    </div>
		</div>
	</div>
	
	<div class="container">
		<div class="row pt-5">
			<!-- 2. 사이드바 -->
			<div class="col-4">
			<ul class="nav flex-column nav-pillsy" id="myTab" role="tablist" aria-orientation="vertical">
			  <li class="nav-item border-bottom">
			    <a class="nav-link text-muted active" id="edit-account" data-toggle="pill" href="#tab-edit-account" role="tab" aria-controls="v-pills-home" aria-selected="true"><img src="resources/image/lock.svg">  
			    계정정보</a>
			  </li>
			  <li class="nav-item border-bottom">
			    <a class="nav-link text-muted" id="input-elder" data-toggle="pill" href="#tab-input-elder" role="tab" aria-controls="v-pills-profile" aria-selected="false"><img src="resources/image/userplus.svg">  
			    어르신정보</a>
			  </li>
			  <li class="nav-item border-bottom">
			    <a class="nav-link text-muted" id="message-box" data-toggle="pill" href="#tab-message-box" role="tab" aria-controls="v-pills-messages" aria-selected="false"><img src="resources/image/messagecircle.svg">  
			    쪽지함</a>
			  </li>
<!-- 수정 -->		<c:if test="${member.type==2}">
				  <li class="nav-item border-bottom">
				    <a class="nav-link text-muted" id="resume-box" data-toggle="pill" href="#tab-resume-box" role="tab" aria-controls="v-pills-settings" aria-selected="false"><img src="resources/image/filetext.svg">  
				    이력서</a>
				  </li>
				</c:if>
			</ul>
		  </div>
		  <!-- 3. 내용 -->
		  <div class="col-8">
		    <div class="tab-content" id="nav-tabContent">
		    	
				<div class="tab-pane fade show active" id="tab-edit-account" role="tabpanel" aria-labelledby="edit-account">
				<!-- 1) 개인정보 -->
				<form action="updateMember" method="post" id="updateMember">
				<div class="card border mb-3" id="card-edit-account">
					<div class="container">
						<div class="pt-5 pb-1 border-bottom">
							<div class="tab-content">
						      <h5 class="text-secondary" id="inform-tabContent">개인정보</h5>  
						    </div>
						</div>
						<!-- 아이디 : disabled (form 부분통합,김동우 수정)-->
						
							<div class="form-group row pt-5">
							<div class="col-sm-1"></div>
								<label for="editName" class="col-sm-2 col-form-label col-form-label-sm"><small>아이디</small></label>
							    <div class="col-sm-8">
									<input type="text" class="form-control form-control-sm" id="editName" placeholder="${member.userid}" disabled>
							    </div>
							</div>
						
						<!-- 패스워드 : 두 컬럼의 패스워드 두개가 일치하지 않는 경우 수정 불가-->
						
							<div class="form-group row pt-4">
							<div class="col-sm-1"></div>
								<label for="editPassword" class="col-sm-2 col-form-label col-form-label-sm"><small>비밀번호</small></label>
							    <div class="col-sm-4 pr-1">
									<input type="password" class="form-control form-control-sm" name="userpwd" id="editPassword" placeholder="비밀번호" disabled="disabled">
							    </div>
							    <div class="col-sm-4 pl-1">
									<input type="password" class="form-control form-control-sm" id="editPasswordT" placeholder="비밀번호 확인" disabled="disabled">
							    </div>
							</div>
							
						<!-- 생년월일 : 기존 정보가 디폴트로 들어가 있어야 함 -->
						
							<div class="form-group row pt-4">
							<div class="col-sm-1"></div>
								<label for="editBirth" class="col-sm-2 col-form-label col-form-label-sm"><small>생년월일</small></label>
							    <div class="col-sm-8" id="selectDate">
											
											<input type="text" class="form-control form-control-sm"
												id="editBirth" name="birthday"
												value="${member.birthday}" readonly="readonly">
								</div>
							</div>
						
						<!-- 성별 : 기존 정보가 디폴트로 들어가 있어야 함 -->
						
<!-- 패딩 수정 -->			<div class="form-group row pt-4 pb-4">
							<div class="col-sm-1"></div>
								<label for="editBirth" class="col-sm-2 col-form-label col-form-label-sm"><small>성별</small></label>
							    <div class="col-sm-8">
									<input type="text" class="form-control form-control-sm"
												id="inputGender" name="gender" value="${member.gender}"	readonly="readonly">
							    </div>
							</div>		
					
					</div>	
				</div>
				<!-- 1-2. 연락처 -->
				<div class="card border mb-3" id="card-edit-account">
					<div class="container">
						<div class="pt-5 pb-1 border-bottom">
							<div class="tab-content">
						      <h5 class="text-secondary" id="inform-tabContent">연락처</h5>  
						    </div>
						</div>
						<!-- 이메일 : 기존 정보가 디폴트로 들어가 있어야 함 (김동우 수정 form부분통합) -->
						
							<div class="form-group row pt-5">
							<div class="col-sm-1"></div>
								<label for="editEmail" class="col-sm-2 col-form-label col-form-label-sm"><small>이메일</small></label>
     							<div class="col-sm-8">
											<input type="email" class="form-control form-control-sm"
												id="editEmail" name="email" value="${member.email}"
												disabled>
								</div>
							</div>
						
						<!-- 전화번호 : 가입 시 없는 정보이기 때문에 빈 값 -->
						
<!-- 패딩 수정 -->			<div class="form-group row pt-4 pb-4">
							<div class="col-sm-1"></div>
								<label for="editEmail" class="col-sm-2 col-form-label col-form-label-sm"><small>전화번호</small></label>
     							<div class="col-sm-8" id="selectPhone">
											<input type="text" class="form-control form-control-sm"
												id="editPhone" name="telephone" value="${member.telephone}" disabled>
								</div>
							</div>
						
					</div>	
				</div>
				<!-- 1-3. 가입자구분 -->
				<div class="card border mb-3" id="card-edit-account">
					<div class="container">
						<div class="pt-5 pb-1 border-bottom">
							<div class="tab-content">
						      <h5 class="text-secondary" id="inform-tabContent">가입자 구분</h5>  
						    </div>
						</div>
						<!-- 가입자 구분 : 기존 정보가 디폴트로 들어가 있어야 함 -->
						
				<div class="form-group row pt-5">
							<div class="col-sm-1"></div>
								<label for="editType" class="col-sm-2 col-form-label col-form-label-sm"><small>가입자 구분</small></label>
     							<!-- <div class="col-sm-4">
     								<div class="form-check form-check-inline">
										<input class="form-check-input" type="radio" name="type" id="custom" value=1 checked>
										<label class="form-check-label form-check-sm" for="custom"><small>일반가입자</small></label>
									</div>
								</div>
								<div class="col-sm-4">
									<div class="form-check form-check-inline">
										<input class="form-check-input" type="radio" name="type" id="worker" value=2>
										<label class="form-check-label form-check-sm" for="worker"><small>종사자</small></label>
									</div>
							    </div> -->
							    <div class="col-sm-4" id="selectType1">
										<div class="form-check form-check-inline" >
										<input class="form-check-input" type="radio" name="type" 
										id="custom" disabled
										<c:if test="${member.type==1}">checked</c:if>> <label
										class="form-check-label form-check-sm" for="custom"><small>일반가입자</small></label>
									</div>
									</div>
									<div class="col-sm-4" id="selectType2">
									<div class="form-check form-check-inline" >
										<input class="form-check-input" type="radio" name="type"
										id="worker" disabled
										<c:if test="${member.type==2}">checked </c:if>> <label
										class="form-check-label form-check-sm" for="worker"><small>종사자</small></label>
									</div>
								</div>
							</div>
						
						<!-- 첨부파일 : 첨부파일 없을 시 '종사자'로 수정 불가 -->

							<div class="form-group row pt-4 pt-4">
							<div class="col-sm-1"></div>
								<label for="uploadLicense" class="col-sm-2 col-form-label col-form-label-sm" id="forFile"><small>자격증</small></label>
     							<div class="col-sm-8">
     								<div class="custom-file" id="attachedFile">
									  <!-- <input type="file" class="file-input" id="licenseFile" lang="ko">
									  <small id="licenseHelp" class="form-text text-muted">자격증 파일을 선택하세요.</small> -->
										<input type="text" class="form-control form-control-sm" id="licenseFile"
													lang="ko" placeholder="자격증 파일명.txt"  readonly="readonly">
									</div>
							    </div>
							</div>
						
					</div>	
				
				</div>	
					<!-- 수정 버튼  -->
					<div class="text-center pt-3 pb-5" id="updatebtn">
						<input type="button" id="submitbtn"
						class="btn btn-outline-secondary" value="수정">
					</div>
					</form>
				</div>
				
				<!-- 2) 어르신정보 -->
				
				<div class="tab-pane fade" id="tab-input-elder" role="tabpanel" aria-labelledby="input-elder">
					<c:if test="${sc == null}">
					<form action="insertSenior" method="POST" id="insertSenior">
					<!-- 2-1. 기본정보 -->
					
					<div class="card border mb-3" id="card-edit-account">
						<div class="container">
							<div class="pt-5 pb-1 border-bottom">
								<div class="tab-content">
							      <h5 class="text-secondary" id="inform-tabContent">기본정보</h5>  
							    </div>
							    <small id="selecteHelp" class="form-text text-muted">요양시설 돌봄이 필요한 어르신 정보를 입력하세요.</small>
							</div>
							<!-- 생년월일 등록 -->
							
								<div class="form-group row pt-5">
								<div class="col-sm-1"></div>
									<label for="inputBirth" class="col-sm-2 col-form-label col-form-label-sm"><small>생년월일</small></label>
								    <div class="col-sm-8">
										<input type="date" class="form-control form-control-sm" id="inputBirth" name="sc_birthday" value="${sc.sc_birthday}" readonly="readonly">
								    </div>
								</div>
							
							<!-- 이름 등록 -->
							
								<div class="form-group row pt-5">
								<div class="col-sm-1"></div>
									<label for="inputName" class="col-sm-2 col-form-label col-form-label-sm"><small>이름</small></label>
	     							<div class="col-sm-8">
	     								<input type="text" class="form-control form-control-sm" id="inputName" value ="${sc.sc_name}" name="sc_name" readonly="readonly">
								    </div>
								</div>
							
							<!-- 혈액형 등록 -->
							
<!-- 패딩 수정 -->			<div class="form-group row pt-5 pb-4">
								<div class="col-sm-1"></div>
									<label for="bloodType" class="col-sm-2 col-form-label col-form-label-sm"><small>혈액형</small></label>
								    <div class="col-sm-8" id="inputblood">
										 <!-- <select class="custom-select custom-select-sm my-1 mr-sm-2" id="bloodType" name="sc_bloodtype">
										    <option selected>선택</option>
										    <option value="A">A</option>
										    <option value="B">B</option>
										    <option value="O">O</option>
										    <option value="AB">AB</option>
										  </select> -->
										  <input type="text" class="form-control form-control-sm"
											id="bloodType" name="sc_bloodtype" value="${sc.sc_bloodtype}"readonly="readonly">
								    </div>
								</div>		
							
						</div>	
					</div>
					<!-- 2-2. 일상생활 수행정도 -->
					<div class="card border mb-3" id="card-edit-account">
						<div class="container">
							<div class="pt-5 pb-1 border-bottom">
								<div class="tab-content">
							      <h5 class="text-secondary" id="inform-tabContent">일상생활 수행정도</h5>  
							    </div>
							    <small id="selecteHelp" class="form-text text-muted">스스로 가능, 도움 필요, 스스로 불가능 중 수행정도를 선택하세요.</small>
							</div>
							<!-- 수행정도 선택폼 : 현재 vo 없음 -->
							
								<div class="form-group row pt-5">
									<label for="meal" class="col-sm-2 col-form-label col-form-label-sm text-center"><small>식사</small></label>
								    <div class="col-sm-4" id="inputMeal">
										 <!-- <select class="custom-select custom-select-sm my-1 mr-sm-2" id="meal" name="scd_meal">
										    <option selected>선택</option>
										    <option value="스스로 가능">스스로 가능</option>
										    <option value="도움 필요">도움 필요</option>
										    <option value="스스로 불가능">스스로 불가능</option>
										  </select> -->
										  <input type="text" class="form-control form-control-sm"
												id="meal" name="scd_meal" value="${scd.scd_meal}"readonly="readonly">
								    </div>
								    <label for="walking" class="col-sm-2 col-form-label col-form-label-sm text-center"><small>보행</small></label>
								    <div class="col-sm-4" id="inputWalking">
										 <!-- <select class="custom-select custom-select-sm my-1 mr-sm-2" id="walking" name="scd_care">
										    <option selected>선택</option>
										    <option value="스스로 가능">스스로 가능</option>
										    <option value="도움 필요">도움 필요</option>
										    <option value="스스로 불가능">스스로 불가능</option>
										  </select> -->
										  <input type="text" class="form-control form-control-sm"
												id="walking" name="scd_care" value="${scd.scd_care}"readonly="readonly">
								    </div>
								</div>
								<div class="form-group row pt-3">
									<label for="washing" class="col-sm-2 col-form-label col-form-label-sm text-center"><small>세면</small></label>
								    <div class="col-sm-4" id="inputWashing">
										<!--  <select class="custom-select custom-select-sm my-1 mr-sm-2" id="washing" name="scd_washing">
										    <option selected>선택</option>
										    <option value="스스로 가능">스스로 가능</option>
										    <option value="도움 필요">도움 필요</option>
										    <option value="스스로 불가능">스스로 불가능</option>
										  </select> -->
										  <input type="text" class="form-control form-control-sm"
												id="walking" name="scd_care" value="${scd.scd_care}"readonly="readonly">
								    </div>
								    <label for="clothing" class="col-sm-2 col-form-label col-form-label-sm text-center"><small>의복</small></label>
								    <div class="col-sm-4" id="inputClothing">
										 <!-- <select class="custom-select custom-select-sm my-1 mr-sm-2" id="clothing" name="scd_clothing">
										    <option selected>선택</option>
										    <option value="스스로 가능">스스로 가능</option>
										    <option value="도움 필요">도움 필요</option>
										    <option value="스스로 불가능">스스로 불가능</option>
										  </select> -->
										  <input type="text" class="form-control form-control-sm"
												id="clothing" name="scd_clothing" value="${scd.scd_clothing}"readonly="readonly">
								    </div>
								</div>
								<div class="form-group row pt-3">
									<label for="bath" class="col-sm-2 col-form-label col-form-label-sm text-center"><small>목욕</small></label>
								    <div class="col-sm-4" id="inputBath">
										<!--  <select class="custom-select custom-select-sm my-1 mr-sm-2" id="bath" name="scd_bath">
										    <option selected>선택</option>
										    <option value="스스로 가능">스스로 가능</option>
										    <option value="도움 필요">도움 필요</option>
										    <option value="스스로 불가능">스스로 불가능</option>
										  </select> -->
										  <input type="text" class="form-control form-control-sm"
												id="bath" name="scd_bath" value="${scd.scd_bath}"readonly="readonly">
								    </div>
								    <label for="washroom" class="col-sm-2 col-form-label col-form-label-sm text-center"><small>화장실</small></label>
<!-- 패딩 수정 -->						<div class="col-sm-4 pb-4" id="inputWashroom">
										 <!-- <select class="custom-select custom-select-sm my-1 mr-sm-2" id="washroom" name="scd_toilet">
										    <option selected>선택</option>
										    <option value="스스로 가능">스스로 가능</option>
										    <option value="도움 필요">도움 필요</option>
										    <option value="스스로 불가능">스스로 불가능</option>
										  </select> -->
										  <input type="text" class="form-control form-control-sm"
												id="washroom" name="scd_toilet" value="${scd.scd_toilet}"readonly="readonly">
								    </div>
								</div>						
							
						</div>	
					</div>
					<!-- 2-3. 질환정보 -->
					<div class="card border mb-3" id="card-edit-account">
						<div class="container">
							<div class="pt-5 pb-1 border-bottom">
								<div class="tab-content">
							      <h5 class="text-secondary" id="inform-tabContent">질환정보</h5>  
							    </div>
							    <small id="selecteHelp" class="form-text text-muted">가지고 계신 질환을 선택해 주세요.</small>
							</div>
							<!-- 질환정보 등록 -->
							
<!-- 패딩 수정 -->					<div class="form-group row pt-4 pb-4 text-center">
								    <div class="col-sm-12" id="disease">
											<div class="form-check form-check-inline p-3" id="disease1">
												<input class="form-check-input" type="checkbox"
													id="disease_information" name="scd_disease" value="황달"  <c:if test="${fn:contains(scd.scd_disease,'황달')}">checked</c:if> disabled="disabled" >
												<label class="form-check-label" for="inlineCheckbox1">황달</label>
											</div>
											<div class="form-check form-check-inline p-3" id="disease2">
												<input class="form-check-input" type="checkbox"
													id="disease_information2" name="scd_disease" value="고혈압" <c:if test="${fn:contains(scd.scd_disease,'고혈압')}">checked</c:if> disabled="disabled">
												<label class="form-check-label" for="inlineCheckbox2">고혈압</label>
											</div>
											<div class="form-check form-check-inline p-3" id="disease3">
												<input class="form-check-input" type="checkbox"
													id="disease_information3" name="scd_disease" value="저혈압" <c:if test="${fn:contains(scd.scd_disease,'저혈압')}">checked</c:if> disabled="disabled">
												<label class="form-check-label" for="inlineCheckbox3">저혈압</label>
											</div>
											<div class="form-check form-check-inline p-3" id="disease4">
												<input class="form-check-input" type="checkbox"
													id="disease_information4" name="scd_disease" value="관절염" <c:if test="${fn:contains(scd.scd_disease,'관절염')}">checked</c:if> disabled="disabled">
												<label class="form-check-label" for="inlineCheckbox4">관절염</label>
											</div>
											<div class="form-check form-check-inline p-3" id="disease5">
												<input class="form-check-input" type="checkbox"
													id="disease_information5" name="scd_disease" value="근육장애" <c:if test="${fn:contains(theString, '근육장애')}">checked</c:if> disabled="disabled">
												<label class="form-check-label" for="inlineCheckbox5">근육장애</label>
											</div>
											<div class="form-check form-check-inline p-3" id="disease6">
												<input class="form-check-input" type="checkbox"
													id="disease_information6" name="scd_disease" value="등병증" <c:if test="${fn:contains(scd.scd_disease,'등병증')}">checked</c:if> disabled="disabled">
												<label class="form-check-label" for="inlineCheckbox6">등병증</label>
											</div>
											<div class="form-check form-check-inline p-3" id="disease7">
												<input class="form-check-input" type="checkbox"
													id="disease_information7" name="scd_disease" value="보행장애" <c:if test="${fn:contains(scd.scd_disease,'보행장애')}">checked</c:if> disabled="disabled">
												<label class="form-check-label" for="inlineCheckbox7">보행장애</label>
											</div>
											<div class="form-check form-check-inline p-3" id="disease8">
												<input class="form-check-input" type="checkbox"
													id="disease_information8" name="scd_disease" value="요실금" <c:if test="${fn:contains(scd.scd_disease,'요실금')}">checked</c:if> disabled="disabled">
												<label class="form-check-label" for="inlineCheckbox8">요실금</label>
											</div>
											<div class="form-check form-check-inline p-3" id="disease9">
												<input class="form-check-input" type="checkbox"
													id="disease_information9" name="scd_disease" value="우울증" <c:if test="${fn:contains(scd.scd_disease,'우울증')}">checked</c:if> disabled="disabled">
												<label class="form-check-label" for="inlineCheckbox9">우울증</label>
											</div>
											<div class="form-check form-check-inline p-3" id="disease10">
												<input class="form-check-input" type="checkbox"
													id="disease_information10" name="scd_disease" value="뇌졸증" <c:if test="${fn:contains(scd.scd_disease,'뇌졸증')}">checked</c:if> disabled="disabled">
												<label class="form-check-label" for="inlineCheckbox10">뇌졸증</label>
											</div>
											<div class="form-check form-check-inline p-3" id="disease11">
												<input class="form-check-input" type="checkbox"
													id="disease_information11" name="scd_disease" value="뇌출혈" <c:if test="${fn:contains(scd.scd_disease,'뇌출혈')}">checked</c:if> disabled="disabled">
												<label class="form-check-label" for="inlineCheckbox11">뇌출혈</label>
											</div>
											<div class="form-check form-check-inline p-3" id="disease12">
												<input class="form-check-input" type="checkbox"
													id="disease_information12" name="scd_disease" value="뇌경색증" <c:if test="${fn:contains(scd.scd_disease,'뇌경색증')}">checked</c:if> disabled="disabled">
												<label class="form-check-label" for="inlineCheckbox12">뇌경색증</label>
											</div>
											<div class="form-check form-check-inline p-3" id="disease13">
												<input class="form-check-input" type="checkbox"
													id="disease_information13" name="scd_disease" value="골절" <c:if test="${fn:contains(scd.scd_disease,'골절')}">checked</c:if> disabled="disabled">
												<label class="form-check-label" for="inlineCheckbox13">골절</label>
											</div>
											<div class="form-check form-check-inline p-3" id="disease14">
												<input class="form-check-input" type="checkbox"
													id="disease_information14" name="scd_disease" value="당뇨" <c:if test="${fn:contains(scd.scd_disease,'당뇨')}">checked</c:if> disabled="disabled">
												<label class="form-check-label" for="inlineCheckbox14">당뇨</label>
											</div>
											<div class="form-check form-check-inline p-3" id="disease15">
												<input class="form-check-input" type="checkbox"
													id="disease_information15" name="scd_disease" value="위장염" <c:if test="${fn:contains(scd.scd_disease,'위장염')}">checked</c:if> disabled="disabled">
												<label class="form-check-label" for="inlineCheckbox15">위장염</label>
											</div>
											<div class="form-check form-check-inline p-3" id="disease16">
												<input class="form-check-input" type="checkbox"
													id="disease_information16" name="scd_disease" value="안면통증" <c:if test="${fn:contains(scd.scd_disease,'안면통증')}">checked</c:if> disabled="disabled">
												<label class="form-check-label" for="inlineCheckbox16">안면통증</label>
											</div>
											<div class="form-check form-check-inline p-3" id="disease17">
												<input class="form-check-input" type="checkbox"
													id="disease_information17" name="scd_disease" value="오십견" <c:if test="${fn:contains(scd.scd_disease,'오십견')}">checked</c:if> disabled="disabled">
												<label class="form-check-label" for="inlineCheckbox17">오십견</label>
											</div>
											<div class="form-check form-check-inline p-3" id="disease18">
												<input class="form-check-input" type="checkbox"
													id="disease_information18" name="scd_disease" value="욕창" <c:if test="${fn:contains(scd.scd_disease,'욕창')}">checked</c:if> disabled="disabled">
												<label class="form-check-label" for="inlineCheckbox18">욕창</label>
											</div>
											<div class="form-check form-check-inline p-3" id="disease19">
												<input class="form-check-input" type="checkbox"
													id="disease_information19" name="scd_disease" value="척추병" <c:if test="${fn:contains(scd.scd_disease,'척추병')}">checked</c:if> disabled="disabled">
												<label class="form-check-label" for="inlineCheckbox19">척추병</label>
											</div>
											<div class="form-check form-check-inline p-3" id="disease20">
												<input class="form-check-input" type="checkbox"
													id="disease_information20" name="scd_disease" value="치매" <c:if test="${fn:contains(scd.scd_disease,'치매')}">checked</c:if> disabled="disabled">
												<label class="form-check-label" for="inlineCheckbox20">치매</label>
											</div>
											<div class="form-check form-check-inline p-3" id="disease21">
												<input class="form-check-input" type="checkbox"
													id="disease_information21" name="scd_disease" value="파킨슨병" <c:if test="${fn:contains(scd.scd_disease,'파킨슨병')}">checked</c:if> disabled="disabled">
												<label class="form-check-label" for="inlineCheckbox21">파킨슨병</label>
											</div>
											<div class="form-check form-check-inline p-3" id="disease22">
												<input class="form-check-input" type="checkbox"
													id="disease_information22" name="scd_disease" value="패혈증" <c:if test="${fn:contains(scd.scd_disease,'패혈증')}">checked</c:if> disabled="disabled">
												<label class="form-check-label" for="inlineCheckbox22">패혈증</label>
											</div>
											<div class="form-check form-check-inline p-3" id="disease23">
												<input class="form-check-input" type="checkbox"
													id="disease_information23" name="scd_disease" value="폐렴" <c:if test="${fn:contains(scd.scd_disease,'폐렴')}">checked</c:if> disabled="disabled">
												<label class="form-check-label" for="inlineCheckbox23">폐렴</label>
											</div>
											
											<div class="form-check form-check-inline p-3">
											<label for="meal"
											class="col-sm-4"><small>기타</small></label>
											<input type="text" class="form-control form-control-sm"
												id="scd_others" 
												value ="${scd.scd_others}"  
												name="scd_others" readonly="readonly">
											</div>
								    
								    </div>
								</div>
						</div>	
					</div>
					<!-- 수정 버튼  -->
					<div class="text-center pt-3 pb-5" id="insertbtn2">
						<input type="button" id="submitbtn2" class="btn btn-outline-secondary" value="수정">
					</div>	
				</form>
				</c:if>
					<c:if test="${sc != null}">
						<form action="updateSenior" method="POST" id="updateSenior" name="abc">
						<!-- 2-1. 기본정보 -->
							<div class="card border mb-3" id="card-edit-account">
								<div class="container">
									<div class="pt-5 pb-1 border-bottom">
										<div class="tab-content">
											<h5 class="text-secondary" id="inform-tabContent">기본정보</h5>
										</div>
										<small id="selecteHelp" class="form-text text-muted">요양시설
											돌봄이 필요한 어르신 정보를 입력하세요.</small>
									</div>
									<!-- 생년월일 등록 -->

									<div class="form-group row pt-5">
										<div class="col-sm-1"></div>
										<label for="inputBirth"
											class="col-sm-2 col-form-label col-form-label-sm"><small>생년월일</small></label>
										<div class="col-sm-8">
											<input type="date" class="form-control form-control-sm"
												id="inputBirth" name="sc_birthday" value="${sc.sc_birthday}" readonly="readonly" >
										</div>
									</div>

									<!-- 이름 등록 -->

									<div class="form-group row pt-5">
										<div class="col-sm-1"></div>
										<label for="inputName"
											class="col-sm-2 col-form-label col-form-label-sm"><small>이름</small></label>
										<div class="col-sm-8">
											<input type="text" class="form-control form-control-sm"
												id="inputName" 
												value= "${sc.sc_name}"  
												name="sc_name" readonly="readonly">
										</div>
									</div>

									<!-- 혈액형 등록 -->

									<div class="form-group row pt-5">
										<div class="col-sm-1"></div>
										<label for="bloodType"
											class="col-sm-2 col-form-label col-form-label-sm"><small>혈액형</small></label>
										<div class="col-sm-8" id="inputblood">
											<%--  <select class="custom-select custom-select-sm my-1 mr-sm-2"
												id="bloodType" name="sc_bloodtype" >
												<option <c:if test="${sc.sc_bloodtype == null }">selected</c:if>>선택</option>
												<option value="A" <c:if test="${sc.sc_bloodtype == 'A'}">selected</c:if>>A</option>
												<option value="B" <c:if test="${sc.sc_bloodtype == 'B'}">selected</c:if>>B</option>
												<option value="O" <c:if test="${sc.sc_bloodtype == 'O'}">selected</c:if>>O</option>
												<option value="AB" <c:if test="${sc.sc_bloodtype == 'AB'}">selected</c:if>>AB</option> 
											</select> --%> 
												<input type="text" class="form-control form-control-sm"
												id="bloodType" name="sc_bloodtype" value="${sc.sc_bloodtype}"readonly="readonly">
											
										</div>
									</div>

								</div>
							</div>
							<!-- 2-2. 일상생활 수행정도 -->
							<div class="card border mb-3" id="card-edit-account">
								<div class="container">
									<div class="pt-5 pb-1 border-bottom">
										<div class="tab-content">
											<h5 class="text-secondary" id="inform-tabContent">일상생활
												수행정도</h5>
										</div>
										<small id="selecteHelp" class="form-text text-muted">스스로
											가능, 도움 필요, 스스로 불가능 중 수행정도를 선택하세요.</small>
									</div>
									<!-- 수행정도 선택폼 : 현재 vo 없음 -->

									<div class="form-group row pt-5">
										<label for="meal"
											class="col-sm-2 col-form-label col-form-label-sm text-center"><small>식사</small></label>
										<div class="col-sm-4" id="inputMeal">
											<%-- <select class="custom-select custom-select-sm my-1 mr-sm-2"
												id="meal" name="scd_meal" >
												<option <c:if test="${scd.scd_meal == null }">selected</c:if>>선택</option>
												<option value="스스로 가능" <c:if test="${scd.scd_meal == '스스로 가능'}">selected</c:if>>스스로 가능</option>
												<option value="도움 필요" <c:if test="${scd.scd_meal == '도움 필요'}">selected</c:if>>도움 필요</option>
												<option value="스스로 불가능" <c:if test="${scd.scd_meal == '스스로 불가능'}">selected</c:if>>스스로 불가능</option>
											</select> --%>
											<input type="text" class="form-control form-control-sm"
												id="meal" name="scd_meal" value="${scd.scd_meal}"readonly="readonly">
										</div>
										<label for="walking"
											class="col-sm-2 col-form-label col-form-label-sm text-center"><small>보행</small></label>
										<div class="col-sm-4" id="inputWalking">
											<%-- <select class="custom-select custom-select-sm my-1 mr-sm-2"
												id="walking" name="scd_care">
												<option <c:if test="${scd.scd_care == null}">selected</c:if>>선택</option>
												<option value="스스로 가능" <c:if test="${scd.scd_care == '스스로 가능'}">selected</c:if>>스스로 가능</option>
												<option value="도움 필요"<c:if test="${scd.scd_care == '도움 필요'}">selected</c:if>>도움 필요</option>
												<option value="스스로 불가능" <c:if test="${scd.scd_care == '스스로 불가능'}">selected</c:if>>스스로 불가능</option>
											</select> --%>
											<input type="text" class="form-control form-control-sm"
												id="walking" name="scd_care" value="${scd.scd_care}"readonly="readonly">
										</div>
									</div>
									<div class="form-group row pt-3">
										<label for="washing"
											class="col-sm-2 col-form-label col-form-label-sm text-center"><small>세면</small></label>
										<div class="col-sm-4" id="inputWashing"> 
											<%-- <select class="custom-select custom-select-sm my-1 mr-sm-2"
												id="washing" name="scd_washing">
												<option <c:if test="${scd.scd_washing == null}">selected</c:if>>선택</option>
												<option value="스스로 가능" <c:if test="${scd.scd_washing == \'스스로 가능\'}">selected</c:if>>스스로 가능</option>
												<option value="도움 필요" <c:if test="${scd.scd_washing == \'도움 필요\'}">selected</c:if>>도움 필요</option>
												<option value="스스로 불가능" <c:if test="${scd.scd_washing == \'스스로 불가능\'}">selected</c:if>>스스로 불가능</option>
											</select> --%>
											<input type="text" class="form-control form-control-sm"
												id="washing" name="scd_washing" value="${scd.scd_washing}"readonly="readonly">
											
										</div>
										<label for="clothing"
											class="col-sm-2 col-form-label col-form-label-sm text-center"><small>의복</small></label>
										<div class="col-sm-4" id="inputClothing">
											<%-- <select class="custom-select custom-select-sm my-1 mr-sm-2"
												id="clothing" name="scd_clothing">
												<option <c:if test="${scd.scd_clothing == null}">selected</c:if>>선택</option>
												<option value="스스로 가능" <c:if test="${scd.scd_clothing == \'스스로 가능\'}">selected</c:if>>스스로 가능</option>
												<option value="도움 필요" <c:if test="${scd.scd_clothing == \'도움 필요\'}">selected</c:if>>도움 필요</option>
												<option value="스스로 불가능" <c:if test="${scd.scd_clothing == \'스스로 불가능\'}">selected</c:if>>스스로 불가능</option>
											</select> --%>
											<input type="text" class="form-control form-control-sm"
												id="clothing" name="scd_clothing" value="${scd.scd_clothing}"readonly="readonly">
										</div>
									</div>
									<div class="form-group row pt-3">
										<label for="bath"
											class="col-sm-2 col-form-label col-form-label-sm text-center"><small>목욕</small></label>
										<div class="col-sm-4" id="inputBath">
											<%-- <select class="custom-select custom-select-sm my-1 mr-sm-2"
												id="bath" name="scd_bath">
												<option <c:if test="${scd.scd_bath == null}">selected</c:if>>선택</option>
												<option value="스스로 가능" <c:if test="${scd.scd_bath == \'스스로 가능\'}">selected</c:if>>스스로 가능</option>
												<option value="도움 필요" <c:if test="${scd.scd_bath == \'도움 필요\'}">selected</c:if>>도움 필요</option>
												<option value="스스로 불가능" <c:if test="${scd.scd_bath == \'스스로 불가능\'}">selected</c:if>>스스로 불가능</option>
											</select> --%>
											<input type="text" class="form-control form-control-sm"
												id="bath" name="scd_bath" value="${scd.scd_bath}"readonly="readonly">
										</div>
										<label for="washroom"
											class="col-sm-2 col-form-label col-form-label-sm text-center"><small>화장실</small></label>
										<div class="col-sm-4" id="inputWashroom">
											<%-- <select class="custom-select custom-select-sm my-1 mr-sm-2"
												id="washroom" name="scd_toilet">
												<option <c:if test="${scd.scd_toilet == null}">selected</c:if>>선택</option>
												<option value="스스로 가능" <c:if test="${scd.scd_toilet == \'스스로 가능\'}">selected</c:if>>스스로 가능</option>
												<option value="도움 필요" <c:if test="${scd.scd_toilet == \'도움 필요\'}">selected</c:if>>도움 필요</option>
												<option value="스스로 불가능" <c:if test="${scd.scd_toilet == \'스스로 불가능\'}">selected</c:if>>스스로 불가능</option>
											</select> --%>
											<input type="text" class="form-control form-control-sm"
												id="washroom" name="scd_toilet" value="${scd.scd_toilet}"readonly="readonly">
										</div>
									</div>

								</div>
							</div>
							<!-- 2-3. 질환정보 -->
							<div class="card border mb-3" id="card-edit-account">
								<div class="container">
									<div class="pt-5 pb-1 border-bottom">
										<div class="tab-content">
											<h5 class="text-secondary" id="inform-tabContent">질환정보</h5>
										</div>
										<small id="selecteHelp" class="form-text text-muted">가지고
											계신 질환을 선택해 주세요.</small>
									</div>
									<!-- 질환정보 등록 -->

									<div class="form-group row pt-4 pb-4 text-center">
								    	<div class="col-sm-12" id="disease">
											<div class="form-check form-check-inline p-3" id="disease1">
												<input class="form-check-input" type="checkbox"
													id="disease_information" name="scd_disease" value="황달"  <c:if test="${fn:contains(scd.scd_disease,'황달')}">checked</c:if> disabled="disabled" >
												<label class="form-check-label" for="inlineCheckbox1">황달</label>
											</div>
											<div class="form-check form-check-inline p-3" id="disease2">
												<input class="form-check-input" type="checkbox"
													id="disease_information2" name="scd_disease" value="고혈압" <c:if test="${fn:contains(scd.scd_disease,'고혈압')}">checked</c:if> disabled="disabled">
												<label class="form-check-label" for="inlineCheckbox2">고혈압</label>
											</div>
											<div class="form-check form-check-inline p-3" id="disease3">
												<input class="form-check-input" type="checkbox"
													id="disease_information3" name="scd_disease" value="저혈압" <c:if test="${fn:contains(scd.scd_disease,'저혈압')}">checked</c:if> disabled="disabled">
												<label class="form-check-label" for="inlineCheckbox3">저혈압</label>
											</div>
											<div class="form-check form-check-inline p-3" id="disease4">
												<input class="form-check-input" type="checkbox"
													id="disease_information4" name="scd_disease" value="관절염" <c:if test="${fn:contains(scd.scd_disease,'관절염')}">checked</c:if> disabled="disabled">
												<label class="form-check-label" for="inlineCheckbox4">관절염</label>
											</div>
											<div class="form-check form-check-inline p-3" id="disease5">
												<input class="form-check-input" type="checkbox"
													id="disease_information5" name="scd_disease" value="근육장애" <c:if test="${fn:contains(theString, '근육장애')}">checked</c:if> disabled="disabled">
												<label class="form-check-label" for="inlineCheckbox5">근육장애</label>
											</div>
											<div class="form-check form-check-inline p-3" id="disease6">
												<input class="form-check-input" type="checkbox"
													id="disease_information6" name="scd_disease" value="등병증" <c:if test="${fn:contains(scd.scd_disease,'등병증')}">checked</c:if> disabled="disabled">
												<label class="form-check-label" for="inlineCheckbox6">등병증</label>
											</div>
											<div class="form-check form-check-inline p-3" id="disease7">
												<input class="form-check-input" type="checkbox"
													id="disease_information7" name="scd_disease" value="보행장애" <c:if test="${fn:contains(scd.scd_disease,'보행장애')}">checked</c:if> disabled="disabled">
												<label class="form-check-label" for="inlineCheckbox7">보행장애</label>
											</div>
											<div class="form-check form-check-inline p-3" id="disease8">
												<input class="form-check-input" type="checkbox"
													id="disease_information8" name="scd_disease" value="요실금" <c:if test="${fn:contains(scd.scd_disease,'요실금')}">checked</c:if> disabled="disabled">
												<label class="form-check-label" for="inlineCheckbox8">요실금</label>
											</div>
											<div class="form-check form-check-inline p-3" id="disease9">
												<input class="form-check-input" type="checkbox"
													id="disease_information9" name="scd_disease" value="우울증" <c:if test="${fn:contains(scd.scd_disease,'우울증')}">checked</c:if> disabled="disabled">
												<label class="form-check-label" for="inlineCheckbox9">우울증</label>
											</div>
											<div class="form-check form-check-inline p-3" id="disease10">
												<input class="form-check-input" type="checkbox"
													id="disease_information10" name="scd_disease" value="뇌졸증" <c:if test="${fn:contains(scd.scd_disease,'뇌졸증')}">checked</c:if> disabled="disabled">
												<label class="form-check-label" for="inlineCheckbox10">뇌졸증</label>
											</div>
											<div class="form-check form-check-inline p-3" id="disease11">
												<input class="form-check-input" type="checkbox"
													id="disease_information11" name="scd_disease" value="뇌출혈" <c:if test="${fn:contains(scd.scd_disease,'뇌출혈')}">checked</c:if> disabled="disabled">
												<label class="form-check-label" for="inlineCheckbox11">뇌출혈</label>
											</div>
											<div class="form-check form-check-inline p-3" id="disease12">
												<input class="form-check-input" type="checkbox"
													id="disease_information12" name="scd_disease" value="뇌경색증" <c:if test="${fn:contains(scd.scd_disease,'뇌경색증')}">checked</c:if> disabled="disabled">
												<label class="form-check-label" for="inlineCheckbox12">뇌경색증</label>
											</div>
											<div class="form-check form-check-inline p-3" id="disease13">
												<input class="form-check-input" type="checkbox"
													id="disease_information13" name="scd_disease" value="골절" <c:if test="${fn:contains(scd.scd_disease,'골절')}">checked</c:if> disabled="disabled">
												<label class="form-check-label" for="inlineCheckbox13">골절</label>
											</div>
											<div class="form-check form-check-inline p-3" id="disease14">
												<input class="form-check-input" type="checkbox"
													id="disease_information14" name="scd_disease" value="당뇨" <c:if test="${fn:contains(scd.scd_disease,'당뇨')}">checked</c:if> disabled="disabled">
												<label class="form-check-label" for="inlineCheckbox14">당뇨</label>
											</div>
											<div class="form-check form-check-inline p-3" id="disease15">
												<input class="form-check-input" type="checkbox"
													id="disease_information15" name="scd_disease" value="위장염" <c:if test="${fn:contains(scd.scd_disease,'위장염')}">checked</c:if> disabled="disabled">
												<label class="form-check-label" for="inlineCheckbox15">위장염</label>
											</div>
											<div class="form-check form-check-inline p-3" id="disease16">
												<input class="form-check-input" type="checkbox"
													id="disease_information16" name="scd_disease" value="안면통증" <c:if test="${fn:contains(scd.scd_disease,'안면통증')}">checked</c:if> disabled="disabled">
												<label class="form-check-label" for="inlineCheckbox16">안면통증</label>
											</div>
											<div class="form-check form-check-inline p-3" id="disease17">
												<input class="form-check-input" type="checkbox"
													id="disease_information17" name="scd_disease" value="오십견" <c:if test="${fn:contains(scd.scd_disease,'오십견')}">checked</c:if> disabled="disabled">
												<label class="form-check-label" for="inlineCheckbox17">오십견</label>
											</div>
											<div class="form-check form-check-inline p-3" id="disease18">
												<input class="form-check-input" type="checkbox"
													id="disease_information18" name="scd_disease" value="욕창" <c:if test="${fn:contains(scd.scd_disease,'욕창')}">checked</c:if> disabled="disabled">
												<label class="form-check-label" for="inlineCheckbox18">욕창</label>
											</div>
											<div class="form-check form-check-inline p-3" id="disease19">
												<input class="form-check-input" type="checkbox"
													id="disease_information19" name="scd_disease" value="척추병" <c:if test="${fn:contains(scd.scd_disease,'척추병')}">checked</c:if> disabled="disabled">
												<label class="form-check-label" for="inlineCheckbox19">척추병</label>
											</div>
											<div class="form-check form-check-inline p-3" id="disease20">
												<input class="form-check-input" type="checkbox"
													id="disease_information20" name="scd_disease" value="치매" <c:if test="${fn:contains(scd.scd_disease,'치매')}">checked</c:if> disabled="disabled">
												<label class="form-check-label" for="inlineCheckbox20">치매</label>
											</div>
											<div class="form-check form-check-inline p-3" id="disease21">
												<input class="form-check-input" type="checkbox"
													id="disease_information21" name="scd_disease" value="파킨슨병" <c:if test="${fn:contains(scd.scd_disease,'파킨슨병')}">checked</c:if> disabled="disabled">
												<label class="form-check-label" for="inlineCheckbox21">파킨슨병</label>
											</div>
											<div class="form-check form-check-inline p-3" id="disease22">
												<input class="form-check-input" type="checkbox"
													id="disease_information22" name="scd_disease" value="패혈증" <c:if test="${fn:contains(scd.scd_disease,'패혈증')}">checked</c:if> disabled="disabled">
												<label class="form-check-label" for="inlineCheckbox22">패혈증</label>
											</div>
											<div class="form-check form-check-inline p-3" id="disease23">
												<input class="form-check-input" type="checkbox"
													id="disease_information23" name="scd_disease" value="폐렴" <c:if test="${fn:contains(scd.scd_disease,'폐렴')}">checked</c:if> disabled="disabled">
												<label class="form-check-label" for="inlineCheckbox23">폐렴</label>
											</div>
											
											<div class="form-check form-check-inline p-3">
											<label for="meal"
											class="col-sm-4"><small>기타</small></label>
											<input type="text" class="form-control form-control-sm"
												id="scd_others" 
												value ="${scd.scd_others}"  
												name="scd_others" readonly="readonly">
											</div>
										</div>
									</div>

								</div>
							</div>
							<!-- 수정 버튼  -->
							<!-- <div class="text-center pt-3 pb-5" id="insertbtn2">
								<button type="button" id="submitbtn2"
									class="btn btn-outline-secondary" value="등록"></button>
							</div> -->
							
							<div class="text-center pt-3 pb-5" id="insertbtn2">
								<input type="button" id="submitbtn2"
								class="btn btn-outline-secondary" value="수정">
							</div>
						</form>
					</c:if>
					
				</div>
				
				<!-- 3-3. 쪽지함 -->
				<div class="tab-pane fade" id="tab-message-box" role="tabpanel" aria-labelledby="message-box">
					<div class="card border mb-3" id="card-edit-account">
						<div class="container">
							<!-- 쪽지함 네비게이션 1)받은쪽지함 2)보낸쪽지함 3)쪽지쓰기 -->
							<ul class="nav nav-tabs nav-fill pt-3" id="message-tab" role="tablist">
							  <li class="nav-item">
							    <a class="nav-link active" id="receive-message" data-toggle="pill" href="#pills-receive" role="tab" aria-controls="pills-home" aria-selected="true">받은쪽지함</a>
							  </li>
							  <li class="nav-item">
							    <a class="nav-link" id="send-message" data-toggle="pill" href="#pills-send" role="tab" aria-controls="pills-profile" aria-selected="false">보낸쪽지함</a>
							  </li>
							  <li class="nav-item">
							    <a class="nav-link" id="write-message" data-toggle="pill" href="#pills-write" role="tab" aria-controls="pills-contact" aria-selected="false">쪽지쓰기</a>
							  </li>
							</ul>
							<!-- 네비게이션 연결 -->
							<div class="tab-content" id="pills-tabContent">
								<!-- 받은쪽지함 -->
								<div class="tab-pane fade show active" id="pills-receive" role="tabpanel" aria-labelledby="pills-home-tab">
									<!-- 삭제/답장 버튼 -->
									<div class="form-group row pt-3 pb-0">
										<div class="col-sm-12">
								   			<button type="button" id="delbtn" class="btn btn-outline-secondary btn-sm">삭제</button>
											<button type="button" id="replybtn" class="btn btn-outline-secondary btn-sm" data-toggle="modal" data-target="#messageForm">
											답장</button>
										</div>
									</div>
									<!-- 쪽지 리스트 테이블 -->
									<table class="table table-sm" id="receiveTable">
									  <thead>
									    <tr class="table-bordered text-center">
									      <th scope="col"><small>선택</small></th>
									      <th scope="col"><small>보낸사람</small></th>
									      <th scope="col"><small>내용</small></th>
									      <th scope="col"><small>날짜</small></th>
									    </tr>
									  </thead>
									  <!-- 체크박스: 다중선택 후 삭제 / 답장의 경우 한개만 선택 가능 -->
									  <!-- <tbody>
									    <tr class="text-center">
									      <th scope="row">
											<div class="form-check">
												<input class="form-check-input position-static" type="checkbox" id="blankCheckbox" value="option1">
											</div></th>
										  <td>"Sender"</td>
										  <td><label class="form-check-label" for="selectContents">"contents"</label></td>
										  <td>"sysdate"</td>
									    </tr>
									  </tbody> -->
									</table>
									<!-- 페이지네이션 -->
									<nav id="receivePage" aria-label="Page navigation">
									  <ul class="pagination pagination-sm justify-content-center">
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
									<!-- 쪽지 눌렀을 때 -->
									<div class="form mb-3" id="senderForm">
										<div class="form-group row">
										   <label for="sender" class="col-sm-2 col-form-label col-form-label-sm"><small>보낸사람</small></label>
										   <div class="col-sm-10">
										   	<input type="text" class="form-control form-control-sm" id="sender" readonly>
										   </div>
										</div>
											<textarea class="form-control" id="sbwrite" name="sbwrite" style="height: 15rem;"></textarea>
											<button type="button" id="sendbtn" class="btn btn-outline-secondary btn-sm mt-3">보내기</button>
											<button type="button" id="cancelbtn" class="btn btn-outline-secondary btn-sm mt-3">취소</button>
								    </div>  	
								</div>
								<!-- 보낸쪽지함 -->
								<div class="tab-pane fade" id="pills-send" role="tabpanel" aria-labelledby="pills-profile-tab">
									<!-- 삭제 버튼 -->
									<div class="form-group row pt-3 pb-0">
										<div class="col-sm-12">
								   			<button type="button" id="delbtn" class="btn btn-outline-secondary btn-sm">삭제</button>
										</div>
									</div>
									<!-- 쪽지 리스트 테이블 -->
									<table class="table table-sm" id="sendTable">
									  <thead>
									    <tr class="table-bordered text-center">
									      <th scope="col"><small>선택</small></th>
									      <th scope="col"><small>받는사람</small></th>
									      <th scope="col"><small>내용</small></th>
									      <th scope="col"><small>날짜</small></th>
									    </tr>
									  </thead>
									  <!-- 체크박스: 다중선택 후 삭제 / 답장의 경우 한개만 선택 가능 -->
									  <!-- <tbody>
									    <tr class="text-center">
									      <th scope="row">
											<div class="form-check">
												<input class="form-check-input position-static" type="checkbox" id="blankCheckbox" value="option1">
											</div></th>
										  <td>"Recipient"</td>
										  <td><label class="form-check-label" for="selectContents">"contents"</label></td>
										  <td>"sysdate"</td>
									    </tr>
									  </tbody> -->
									</table>
									<!-- 페이지네이션 -->
									<nav aria-label="Page navigation">
									  <ul class="pagination pagination-sm justify-content-center">
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
								</div>
								<!-- 쪽지쓰기 -->
								<div class="tab-pane fade" id="pills-write" role="tabpanel" aria-labelledby="pills-contact-tab">
								<!-- 보내기 버튼 -->
									<div class="form-group row pt-3 pb-0">
										<div class="col-sm-12">
								   			<button type="button" id="insertgo" class="btn btn-outline-secondary btn-sm">보내기</button>
										</div>
									</div>
								<!-- 받는사람 -->
								<form>
								  <div class="form-group row">
								    <label for="writeRecipient" class="col-sm-2 col-form-label col-form-label-sm"><small>받는사람</small></label>
								    <div class="col-sm-10">
								      <input type="text" class="form-control form-control-sm" id="writeRecipient" placeholder="받는사람을 입력하세요.">
								    </div>
								   </div>
								</form>
									<div class="form-group pb-3">
									    <textarea class="form-control" id="writeMessage" rows="10"></textarea>
									</div>
								</div>
							</div>									
						</div>
					</div>
				</div>

				<!-- 3-4. 이력서 / 종사자 계정 구분 만든 후 -->
				<div class="tab-pane fade" id="tab-resume-box" role="tabpanel" aria-labelledby="resume-box">
<!-- 수정: 이력서 양식 추가 -->
					<div class="card border mb-3" id="card-agree">
						<div class="container">
							<div class="pt-5 pb-1 border-bottom">
								<div class="tab-content">
							      <h5 class="text-secondary" id="inform-tabContent">개인정보 수집동의</h5>  
							    </div>
							    <small id="selecteHelp" class="form-text text-muted">개인정보보호법 제 15조에 의한 수집・이용 동의</small>
							</div>
							<div class="group pt-4">
							    
								<ul class="lst lst_hypn">
								   <li><span class="lst_head">-</span>실버서퍼는 고객님의 개인정보를 아래와 같이 처리함을 알려드립니다.</li>
								</ul>
								<ul class="lst lst_hypn ml_35">
									<li><span class="lst_head">1.</span>개인정보의 수집· 이용 목적</li>
									<li><span class="lst_head lst_hypn">○</span><span class="fontStress">실버서퍼 홈페이지는 다음의 목적을 위해 개인정보를 수집 및 이용합니다.</span></li>
									<li><span class="lst_head lst_hypn">○</span><span class="fontStress">수집된 개인정보는 정해진 목적 이외의 용도로는 이용되지 않으며 수집목적이 변경 될 경우</span></li>
									<li><span class="lst_head lst_hypn">&nbsp;</span> <span class="fontStress">사전에 알리고 동의를 받을 예정입니다.</span></li>
									<li><span class="lst_head lst_hypn">-</span> <span class="fontStress">홈페이지 구직서비스 제고를 위해 수집</span></li>
								</ul>
								<ul class="lst lst_hypn ml_35">
									<li><span class="lst_head">2.</span>수집하려는 개인정보의 항목</li>
									<li><span class="lst_head lst_hypn">○</span><span class="fontStress">필수항목 : 성명, 성별, 생년월일, 휴대전화번호, 자격사항, 전화번호, E-mail, 주소, 희망직종, 희망지역, 근무형태 </span></li>
									<li><span class="lst_head lst_hypn">○</span><span class="fontStress">선택항목 : 상세근무형태, 게시기간, 기타사항</span></li>
								</ul>
								<ul class="lst lst_hypn ml_35">
								    <li><span class="lst_head">3.</span>개인정보의 파기(관련 법령에 따라 일정기간 저장)</li>
								    <li><span class="lst_head lst_hypn">○</span>실버서퍼 홈페이지는 원칙적으로 <span class="fontStress">개인정보 보존기간이 경과하거나, 처리목적이 달성된 경우에는 지체없이 해당 개인정보를 파기</span>합니다.</li>
							        <li><span class="lst_head lst_hypn">&nbsp;</span> <span class="fontStress">다만, 다른법령에 따라 보존하여야 하는 경우에는 그러하지 않을 수 있습니다.</span></li>
								    <li><span class="lst_head lst_hypn">○</span><span class="fontStress">이용자가 입력한 정보는 회원탈퇴 등 목적 달성 후 관련 법령에 따라</span></li>
							        <li><span class="lst_head lst_hypn">&nbsp;</span> <span class="fontStress">일정기간 저장 후 파기 됩니다.</span></li>
								    <li><span class="lst_head lst_hypn">-</span> <span class="fontStress">수집근거 : 정보주체의 동의</span></li>
								    <li><span class="lst_head lst_hypn">-</span> <span class="fontStress">보존기간 : "이력서"  등록부터  3년보유 후 삭제</span></li>
								</ul>
							    <ul class="lst lst_hypn ml_35">
							        <li><span class="lst_head">4.</span>동의를 거부 할 권리가 있다는 사실과 동의 거부에 따른 불이익 내용</li>
							        <li><span class="lst_head lst_hypn">○</span>이용자는 실버서퍼 홈페이지에서 수집하는 개인정보에 대해 동의를 거부 할 권리가 있으며,</li>
							        <li><span class="lst_head lst_hypn">&nbsp;</span> <font color="red">동의 거부시에는 이력서 작성 서비스가 제한 됩니다.</font></li>
							    </ul>
							    <div class="card text-center" id="agreeRadio">
							    <div class="click_box">   
							        <div class="btn_wrap ta_c">
							            <label class="m-0 p-2"><input type="checkbox" id="check1"/><strong> 개인정보보호법 제 15조에 의한 수집·이용에 동의합니다.</strong></label><!-- &nbsp;&nbsp;&nbsp; -->

							        </div>
							    </div>
							    </div>
							</div>
							
							<div class="group text-center">
							    <div class="btn-group p-4">
									<button type="button" class="btn btn-outline-secondary mx-1" id="agreebtn">동의함</button>
									<button type="button" class="btn btn-outline-secondary mx-1" id="disagreebtn">동의안함</button>	  
								</div>
							</div>
						</div>
					</div>
					<!-- 이력서 양식 -->
					<div class="card border mb-3" id="card-resume">
						<div class="container">
							<div class="pt-5 pb-1 border-bottom">
								<div class="tab-content">
							      <h5 class="text-secondary" id="inform-tabContent">이력서 양식 </h5>  
							    </div>
							</div>
							<!-- 개인정보 -->
						
							<label for="facilityForm" class="col-form-label col-form-label-lg pt-3"><strong>개인정보</strong></label>
							<p class="text-muted"><small>* 표시는 필수입력 사항입니다.</small></p>
							<table class="table table-bordered" id="facilityForm">
								<tbody>
								    <tr>
										<th class="bg-light w-30"> 성명</th>
										<th>${member.username}</th>
										<th class="bg-light w-30">성별</th>
										<th>${member.gender}</th>
								    </tr>
	                				<tr>
										<td class="bg-light"> 생년월일</td>
										<td>${member.birthday}</td>
										<td class="bg-light"> 전화번호</td>
										<td>${member.telephone}</td>
								    </tr>
							    	<tr>
										<td class="bg-light">주소</td>
										<td colspan="3">${member.address}</td>
					                       <!-- <div class="form-inline my-3 row">									
						                      <div class="form-group col-md-12">
						                        <select class="form-control form-control-sm col mr-1" name="sido1" id="sido1"></select>
						                        <select class="form-control form-control-sm col mr-1" name="gugun1" id="gugun1"></select>
						                      </div>
						                  </div> -->	
											<%-- <div class="form-group my-3">
						                      	<input type="text" class="form-control form-control-sm" value="${member.address}" id="dong1" readonly="readonly">
						                      </div>   --%>    
										
									</tr>
									<tr>
										<td class="bg-light">자격사항</td>
										<td colspan="3">
					                      	<div class="form-group my-3" >
						                        <select class="form-control form-control-sm"  name="qualify1" id="qualify1"></select>
						                      	 <input type="text" class="form-control form-control-sm"  id="showQualify1" value="${rs.re_qualification}" readonly="readonly" > 
						                  	  </div>
					                  	 
					                    </td>
									</tr>
							 	</tbody>
							</table>
							<!-- 구직정보 -->
							<c:if test="${rs==null}"> <!-- 이력서 모델이 없을때 등록 -->
							<form action="insertResume" method="post" id="insertResume">
							</c:if>
							<c:if test="${rs!=null}"> <!-- 이력서 모델이 있을떄 수정 -->
							<form action="updateResume" method="post" id="updateResume">
							</c:if>
							
							<label for="facilityForm" class="col-form-label col-form-label-lg pt-3"><strong>구직정보</strong></label>
							<table class="table table-bordered" id="facilityForm">
								<tbody>
									<tr>
										<th class="bg-light w-30">* 희망직종</th>
										<th colspan="3">
											<div class="form-group my-3" >
						                      <select class="form-control form-control-sm" name="job1" id="job1"></select>
						                     <input type="text" class="form-control form-control-sm" name="job1" id="job2" value="${rs.re_job}" readonly="readonly"> 
												<div id="job"></div>
											</div>
										</th>
									</tr>
									<tr>
										<td class="bg-light">* 희망지역</td>
										<td colspan="3">
											<div class="form-inline my-3 row">									
						                      <div class="form-group col-md-12" >
						                        <select class="form-control form-control-sm col mr-1" name="sido1" id="sido1"></select>
						                        <select class="form-control form-control-sm col" name="gugun1" id="gugun1"></select>
						                       <input type="text" class="form-control form-control-sm col mr-1" name="sido1" id="sido2" value="${rs.re_areaa}" readonly="readonly">
						                      	 <input type="text" class="form-control form-control-sm col" name="gugun1" id="gugun2" value="${rs.re_arebb}"  readonly="readonly"> 
						                      	<div id="sido"></div>
						                      </div>
											</div>
										</td>
									</tr>
									<tr>
										<td class="bg-light">* 근무형태</td>
										<td colspan="3">
											<div class="form-inline my-3 row">									
						                      <div class="form-group col-md-12" >
												<select class="form-control form-control-sm col mr-1" name="work1" id="work1"></select>
												<select class="form-control form-control-sm col" name="detail" id="detail"></select>
						                      <input type="text" class="form-control form-control-sm col mr-1" name="work1" id="work2"  value="${rs.re_type}" readonly="readonly">
						                      	<input type="text" class="form-control form-control-sm col" name="detail" id="detail2" value="${rs.re_detailType}"  readonly="readonly"> 
						                      </div>
											</div>
										</td>
									</tr>
									<tr>
									  <td class="bg-light">기타사항</td>
										<td colspan="3" class="etc p-0 mb-0" >
											<textarea class="form-control p-0" id="exampleFormControlTextarea5" name="re_content" rows="4" readonly="readonly">${rs.re_content}</textarea>
										</td>
									</tr>
								</tbody>
							</table>
								<div class="text-center pt-3 pb-5" id="updateRsm">
								<input type="button" id="resumebtn" class="btn btn-outline-secondary" value="수정" >
								<input type="button" id="cnlResumebtn" class="btn btn-outline-secondary" value="취소">
								<input type="button" id="udtResumebtn" class="btn btn-outline-secondary" value="수정">
								<input type="button" id="istResumebtn" class="btn btn-outline-secondary" value="등록">
								</div>
						</form>
						<!-- .container -->	
						</div>
					<!-- 이력서 양식 -->	
					</div>
				<!-- 3-4. 이력서 -->
				</div>
		
				<!-- .tab-content -->
				</div>
			<!-- .col-8 -->
			</div>
		<!-- .row pt-5 -->
		</div>
	<!-- .container -->
	</div>
	
	




</body>
</html>
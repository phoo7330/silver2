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
/* 새창열기, 닫기 & 값 보내기 참고 
 * https://sourcestudy.tistory.com/341 
 */
$(document).ready(function(){
	  $("#g-temporarybtn").click(function(){    
		window.open(
		"openMemberpage",
		"memberDetail",
		"toolbar=no, width=1000,height=800, top=150, left=150"
		);
	});
	  
});

$(document).ready(function(){
	  $("#f-temporarybtn").click(function(){    
		window.open(
		"openFacilitypage",
		"facilityDetail",
		"toolbar=no, width=1000,height=800, top=150, left=150"
		);
	});
	  
});

$(document).ready(function(){
	  $("#f2-temporarybtn").click(function(){    
		window.open(
		"openFacilitypage2",
		"facilityDetail2",
		"toolbar=no, width=1000,height=800, top=150, left=150"
		);
	});
	  
});

$(document).ready(function(){
	  $("#table-facility").hide();
	  
	  $("#general-userbtn").click(function(){    
		$("#table-facility").hide();
		$("#table-member").show();
	});

	  $("#practician-userbtn").click(function(){    
		$("#table-facility").hide();
		$("#table-member").show();
	});

	  $("#facility-userbtn").click(function(){    
		 $("#table-member").hide();
		 $("#table-facility").show();
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
               		<a class="nav-link mr-3" href="messagepage"><strong>질의응답</strong></a>
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
  
  <!-- 회원관리 --> 
	<div class="col-md-12 ml-sm-auto mt-4 pt-4 border-0">
		<div class="row">
			<!-- 좌측 -->
			<div class="card col-md-8 p-0 border-0">
				<div class="card border-top-2" id="information">
					
				</div>	
			</div>
			
			<!-- 우측 -->
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
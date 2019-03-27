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
<script>$(function(){
	
	gr();
	ty();

});


function gr(){
	var grade= null;
	var stgrade = '';
	grade='${DetailsTwo.grade}';
	console.log(grade);
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
	console.log(stgrade);

}
	
function ty(){
	var type= 0;
	var typename = '';
	type='${DetailsTwo.type}';
	console.log(type);
	if(type==2){
		typename += '요양원';
		
		$('#siltype').append(typename);
		return;
	}else if(type==3){
		
		typename += '방문시설';
		$('#siltype').append(typename);
		return;
	}else if(type==4){
		typename += '치매전담';
		$('#siltype').append(typename);
		return;
	}
}	
</script>
<!-- 네비게이션 바 -->
	<nav class="navbar navbar-expand-lg navbar-light bg-light">
 		<a class="navbar-brand" href="index"><img src="resources/image/box.svg"> 실버서퍼</a>
		<button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbar" aria-controls="navbar" aria-expanded="false">
	    <span class="navbar-toggler-icon"></span>
		</button>

		<div class="collapse navbar-collapse justify-content-between" id="navbar">
		  <!-- 왼쪽 자동 정렬 -->
		  	<div class="navbar-nav"> 
		  		<a class="nav-item nav-link active" href="institution">
		  			요양기관 <span class="sr-only">(current)</span> </a>
		  		<a class="nav-item nav-link" href="worker">
		  			종사자 </a>
		  		<a class="nav-item nav-link" href="inquiry">
		  			자주하는질문 </a>	
			</div>
		  <!-- 오른쪽 자동 정렬 -->
		  	<c:if test="${sessionScope.loginId==null}">
		  	<div class="navbar-nav mr-sm-2">
		  		<a class="nav-item nav-link" href="login">
		  			로그인 </a>
		  		<a class="nav-item nav-link" href="signup">
		  			회원가입 </a>
		  	</div>
		  	</c:if>
		  	
		  	<c:if test="${sessionScope.loginId!=null}">
		  	<div class="navbar-nav mr-sm-2">
		  		<p class="lead">${sessionScope.loginId}님 환영합니다.</p>
		  		<a class="nav-item nav-link" href="logout">
		  			로그아웃 </a>
		  	</div>
			</c:if>
		</div>  
	</nav>	

<hr class="my-1">
	
	<!-- 왼쪽/기관정보 -->
	<div class="position-relative overflow-hidden p-1 p-md-1 m-md-1 bg-white">
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
					<div class="card mb-1 shadow-sm card border-info" id="card-all">
						<div class="card-header">
							<h4 class="my-4 font-weight-normal">${DetailsTwo.grade}</h4>
						</div>
						<div class="card-body">
					        <h4 id="grade" class="card-title pricing-card-title"></h4>
						</div>
					</div>
				</div>
			</div>
			<div class="col-md-1">
			</div>
		</div>
	</div>

	<!-- 하단 네비게이션 바  -->
	
	<nav class="nav-scroller py-1 mb-2 sticky-top bg-light border-bottom" id="nav-under">
		<div class="container">
			<div class="nav"> 
		  		<a class="nav-item nav-link text-secondary active" href="#basic">
		  			<strong>상세정보</strong> <span class="sr-only">(current)</span> </a>
		  		<a class="nav-item nav-link text-secondary" href="#picandmap">
		  			<strong>사진/주소</strong> </a>
		  		<a class="nav-item nav-link text-secondary" href="#board">
		  			<strong>게시판</strong> </a>	
			</div>
		</div>
	</nav>
	
	<!--  
   public class Details {
   private int detail_seq;
   private int seach_seq;
   private int detail_number; // 기관일련번호 /1 
   private String establishment; // 설립일 / 1 
   private String approval; // 승인일 / 1 
   private String address; // 주소 / 4 
   private String house_number; // 연락처 / 1 
   private String parkinglot; // 주차시설
	-->
	
	<!-- 1. 기본정보 탭  -->
	<div class="container" id="basic">
		<div class="d-flex justify-content-between flex-wrap flex-md-nowrap align-items-center pt-3 pb-2 mb-3 border-bottom">
		<h4 class="n1 text-secondary"><small>기본정보</small></h4>
		</div>
		<!-- 내용 -->
		<div class="card-deck col-md-12">
			<!-- 기관일련번호 -->
			
				<div class="card-deck p-1 d-flex flex-column position-static text-center" >
					<div class="card mb-1 shadow-sm card border-info" id="card-content">
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
					<div class="card mb-1 shadow-sm card border-info" id="card-content">
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
					<div class="card mb-1 shadow-sm card border-info" id="card-content">
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
					<div class="card mb-1 shadow-sm card border-info" id="card-content">
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
	<div class="container" id="picandmap">
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
	<div class="container" id="board">
		<div class="d-flex justify-content-between flex-wrap flex-md-nowrap align-items-center pt-3 pb-2 mb-3 border-bottom">
		<h4 class="n1 text-secondary"><small>시설게시판</small></h4>
		</div>
		<!-- 게시판 : 게시판 VO가 없어서 매칭되지 않는 부분 확인 바라요. 번호/제목/날짜-->
		<p class="lead"><small>전체 이용후기 0</small></p>
		<table class="table text-center">
			<thead class="thead-light">
				<tr>
					<th scope="col">번호</th>
					<th scope="col">제목</th>
					<th scope="col">"userid"</th>
					<th scope="col">"sysdate"</th>
				</tr>
			</thead>
			<tbody class="table-sm">
				<tr>
					<td>sequence</td>
					<td>contents</td>
					<td>"userid"</td>
					<td>sysdate</td>
				</tr>
			</tbody>
		</table>
		<!-- 모달버튼 -->
		<button type="button" class="btn-sm btn-info float-right" data-toggle="modal" data-target="#write-board">
  		글쓰기 
		</button>
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
				<form>
					<fieldset disabled>
					<div class="form-group">
				      <label for="disabledText">아이디</label>
				      <input type="text" id="disabledText" class="form-control" placeholder="">
				    </div>
				    </fieldset>
					<div class="form-group">
						<label>제목</label>
						<input type="text" class="form-control">
					</div>
					<div class="form-group">
						<label>내용</label>
						<textarea class="form-control" style="height: 15rem;"></textarea>
					</div>
				</form>   
		      </div>
		      <!-- 버튼-취소/저장 -->
		      <div class="modal-footer">
		        <button type="button" class="btn btn-secondary btn-sm" data-dismiss="modal">취소</button>
		        <button type="button" class="btn btn-info btn-sm">저장</button>
		      </div>
		    </div>
		  </div>
		</div>
		
		<!-- 페이징 -->
		<ul class="pagination pagination-sm justify-content-center">
			<li class="page-item disabled">
				<span class="page-link">&laquo;</span>
			</li>
			<li class="page-item"><a class="page-link" href="#">1</a></li>
			<li class="page-item"><a class="page-link" href="#">2</a></li>
			<li class="page-item"><a class="page-link" href="#">3</a></li>
			<li class="page-item"><a class="page-link" href="#">4</a></li>
			<li class="page-item"><a class="page-link" href="#">5</a></li>
			<li class="page-item">
				<span class="page-link">&raquo;</span>
			</li>
		</ul>
	</div>	
	
	
</body>
</html>
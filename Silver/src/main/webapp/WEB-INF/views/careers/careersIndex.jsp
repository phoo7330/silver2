<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
	<title>SilverSurfer</title>
	 
	<!-- 인코딩 -->
	<meta charset="UTF-8">
	<meta  name="viewport" content="width-device-width, initial-scale=1, shrink-to-fit=no">

	<!-- Bootstrap CSS 추가 -->
	<link rel="stylesheet" href="resources/css/bootstrap.min.css">
	
	<!-- Custom CSS 추가 -->
	<link rel="stylesheet" href="resources/css/custom.css">
	<link rel="stylesheet" href="resources/css/careers.css">

</head>
<body>
	<!-- jQuery javaScript 추가 -->
	<script src="resources/js/jquery.min.js"></script>
	
	<!-- Popper javaScript 추가 -->
	<script src="resources/js/popper.min.js"></script>
	
	<!-- Bootstrap javaScript 추가 -->
	<script src="resources/js/bootstrap.min.js"></script>
	<script type="text/javascript" src="https://openapi.map.naver.com/openapi/v3/maps.js?ncpClientId=ynuycabqm2"></script>
    <script type="text/javascript" src="resources/src/MarkerClustering.js"></script>

<script>

/* 디폴트 기관 디테일 정보 숨김 function wlist(accidentDeath) 안에 버튼 클릭 이벤트 */
$(function() {
	$("#information").hide();
	
});	

let isEnd = false; 
//기본 플레그
var flag = 1;
var page = 1;
var ffff = 0;
var upmark = 0;
var totalmaptest = [];
$(function() {	
		init();
		pagelist(page);
		
		$('#alllist').scroll(function(){
	        let $alllist = $(this);
	        let scrollTop = $('#alllist').scrollTop();
	        let windowHeight = $('#alllist').height();
	        let documentHeight = $(document).height();
	        var scrollBottom = $("#alllist").height()- $("#alllist").scrollTop();
	        var scHeight = $('#alllist').prop('scrollHeight');
	        
	        //console.log(" | scrollTop:" + scrollTop+"바텀"+ scrollBottom);
	      var scrollHeight = $('#alllist').height();
	      var scrollPosition = (scrollHeight + scrollTop);
	      //console.log(scrollHeight+"po"+scrollPosition);
	      console.log(scHeight+"dd"+scrollPosition);
	      if (scHeight-3<scrollPosition) {
	          //console.log("플래그"); 
	          page += 1;
	             ffff = 1;
	             //console.log("페이지"+page);
	             //console.log("업마크"+upmark);
	             //console.log(flag);
	             if(upmark==1){ 
	                //console.log("실행되니?");
	                pagelist2();
	             }else{
	                pagelist(page);
	             }
	             
	             
	      }
	        
	        // scrollbar의 thumb가 바닥 전 30px까지 도달 하면 리스트를 가져온다.
	       /* if( scrollTop + 400 > windowHeight ){
	                page += 1;
	                f = 1;
	                pagelist(flag);
	        } */
	   });
});
function pagelist(page){
	   $.ajax({
	      url:"jpagemap",
	      type:"get",
	      data:{
	         "page":page
	      },
	      success:wlist
	   });
	}
function pagelist2(){
	   $.ajax({
	      url:"jselectmap2",
	      type:"POST",
	      traditional: true,
	      data: {maptestJSON : JSON.stringify(totalmaptest),
	            page: page},
	      success:wlist
	   });
	}	
	
function wlist(accidentDeath){
	   if(accidentDeath.length==0){
	      return;
	   }
	   
	   if (ffff == 0) {
	      var list = '';
	      
	   $.each(accidentDeath, function (index, item){
		   list += '<tr>';
	        list += '<td scope="row" class="p-2">';
	        list += '<p class="mb-0">기관명 : '+item.silvername+'</p>';
	        list += '<p class="mb-0">주소 : '+item.areaa+item.areab+item.areac+'</p>';
	        list += '<p class="mb-0">모집직종 : '+item.jo_job+'</p>';
	        list += '<p class="mb-0">근무형태 : '+item.jo_type+'</p>';
	        list += '<p class="mb-0">등록일 : '+item.jo_date+'</p>';
	        list += '<span class="table-remove"><button type="button" class="btn informbtn btn-danger btn-rounded btn-sm my-0">기관정보 확인</button></span>';
			list += '</td></tr>';
	    });
	      $('#mlist').html(list);
	   } else {
	      var list = '';
	   $.each(accidentDeath, function (index, item){
		   list += '<tr>';
	        list += '<td scope="row" class="p-2">';
	        list += '<p class="mb-0">기관명 : '+item.silvername+'</p>';
	        list += '<p class="mb-0">주소 : '+item.areaa+item.areab+item.areac+'</p>';
	        list += '<p class="mb-0">모집직종 : '+item.jo_job+'</p>';
	        list += '<p class="mb-0">근무형태 : '+item.jo_type+'</p>';
	        list += '<p class="mb-0">등록일 : '+item.jo_date+'</p>';
	        list += '<span class="table-remove"><button type="button" class="btn informbtn btn-danger btn-rounded btn-sm my-0">기관정보 확인</button></span>';
			list += '</td></tr>';
	    });
  
	      $('#mlist').append(list);
	   }
	   
	   /* 버튼 누를 때  */
	   $('.informbtn').on('click', function() {
			$("#map").hide(); 
			$("#information").show();  
			/* console.log("!"); */
		});	
	   
	   $('#gobackbtn').on('click', function() {
	   		$("#information").hide(); 
	   		$("#map").show();  
	   	});
 	
	 
	}	
function init(){
	$.ajax({
	url:"jselectmap",
	type:"get",
	success:output
		   });
}

function init2(maptest) {
	   ffff=0;
	   jQuery.ajaxSettings.traditional = true;
	   var recount=0;
	   recount = count(maptest);
	   console.log(recount);
	   if(recount==0){
	      var listn='';
	      listn += '<table class="table table-horver">';
	      listn += '<tbody>';
	      listn += '<tr>';
	      listn += '<td scope="row"><p class="text-primary font-weight-bold my-0">검색결과가 없습니다</p></td>';
	      listn += '</tr>';
	      listn += '</tbody>';
	      listn += '</table>'; 
	      $('#mlist').html(listn);
	      return;
	   }
	   // console.log("maptest : " + JSON.stringify(maptest));
	   //console.log(maptest);  
	   
	   $.ajax({
	      url:"jselectmap2",
	      data: {maptestJSON : JSON.stringify(maptest)},
	      type:"post",
	      success:wlist
	      
	   });
	}
	
function count(data){
	   var cc = data.length;
	   var count = '';
	          count+='총'
	          count+=cc;
	          count+='개의 구인정보를 찾았습니다.';
	          $('#count').html(count); 
	   return cc;   
	}
	
function output(resp){
	var accidentDeath = {
	        "searchResult": {
	             "accidentDeath": 
	                makers(resp)
	        },
	        "resultCode": "Success"
	   }
	write(accidentDeath); // 지도에 마커그림
	  
	count(makers(resp));
}
//DB에 있는 좌표를 받아옴
function makers(data){
var makers_temp = [];
for(var i = 0;i < data.length ;i++){
   makers_temp.push({
         "seach_seq":data[i].seach_seq,
         "type":data[i].type,
         "areaa":data[i].areaa,
         "areab":data[i].areab,
         "areac":data[i].areac,
         "silvername":data[i].silvername,
         "service":data[i].service,
         "grade":data[i].grade,
         "grd_lo":data[i].longitude,
         "grd_la":data[i].lauitude,
         "jo_seq":data[i].jo_seq,
         "userid":data[i].userid,
         "jo_type":data[i].jo_type,
         "jo_detailtype":data[i].jo_detailtype,
         "jo_job":data[i].jo_job,
         "jo_content":data[i].jo_content,
         "jo_date":data[i].jo_date,
         "jo_gender":data[i].jo_gender
   });
}
return makers_temp;
} 

//받은 좌표로 마커를 찍음
function write(accidentDeath){
    var map = new naver.maps.Map("map", {
           zoom: 3,
           center: new naver.maps.LatLng(36.2253017, 127.6460516),
           zoomControl: true,
           zoomControlOptions: {
               position: naver.maps.Position.TOP_LEFT,
               style: naver.maps.ZoomControlStyle.SMALL
           }
       });
       var bounds = map.getBounds(),
       southWest = bounds.getSW(),
       northEast = bounds.getNE(),
       lngSpan = northEast.lng() - southWest.lng(),
       latSpan = northEast.lat() - southWest.lat();
    
       var markers = [],
           data = accidentDeath.searchResult.accidentDeath;
       var infoWindows = [];
       
      
       
      //data에 있는 마커를 var markers에 저장한다.
      
      //data.length만큼 반복해서 마커를 찍는다.
       for (var i = 0, ii = data.length; i < ii; i++) {
           var spot = data[i],
               latlng = new naver.maps.LatLng(spot.grd_la, spot.grd_lo),
               marker = new naver.maps.Marker({
                   position: latlng,
                   draggable: false
                   //마커의 드래그 가능여부.
               });
         
           
           var infoWindow = new naver.maps.InfoWindow({
               content: '<div style="width:150px;text-align:center;padding:10px;">시설이름:<br> <b>"'+ spot.silvername +'"</b></div>'
           });
           
           
           infoWindows.push(infoWindow);
           markers.push(marker);
           
       }
       /* console.log(accidentDeath);  
       output2(accidentDeath); */
       
       naver.maps.Event.addListener(map, 'zoom_changed', function() {
           updateMarkers(map, markers);
           
       });
       naver.maps.Event.addListener(map, 'dragend', function() {
           updateMarkers(map, markers);
       });
       function updateMarkers(map, markers) {
         page = 1;
         upmark = 1;
         $("#alllist").scrollTop(0); 
           var mapBounds = map.getBounds();
           var marker, position;
           var maptest = [];
           
           for (var i = 0; i < markers.length; i++) {
               marker = markers[i]
               position = marker.getPosition();
              
               
               
               if (mapBounds.hasLatLng(position)) {
                   showMarker(map, marker);
                  
               maptest.push({
                     "longitude":position._lng,
                     "lauitude":position._lat
                              });
               
               totalmaptest = maptest; 
         
               } else {
                   hideMarker(map, marker);
                   
               }
               
              // console.log(position);
           }
           //console.log(maptest);
          // 현재 지도상의 마커만 배열에 들어감. 여기서 리스트 출력하자
           init2(maptest);
             
         
       }
       function showMarker(map, marker) {
           if (marker.getMap()) return;
           marker.setMap(map);
           
           
       }
       function hideMarker(map, marker) {
           if (!marker.getMap()) return;
           marker.setMap(null);
           
           
       }
      
      
      
       var htmlMarker1 = {
               content: '<div style="cursor:pointer;width:40px;height:40px;line-height:42px;font-size:10px;color:white;text-align:center;font-weight:bold;background:url(resources/images/cluster-marker-1.png);background-size:contain;"></div>',
               size: N.Size(40, 40),
               anchor: N.Point(20, 20)
           },
           htmlMarker2 = {
               content: '<div style="cursor:pointer;width:40px;height:40px;line-height:42px;font-size:10px;color:white;text-align:center;font-weight:bold;background:url(resources/images/cluster-marker-2.png);background-size:contain;"></div>',
               size: N.Size(40, 40),
               anchor: N.Point(20, 20)
           },
           htmlMarker3 = {
               content: '<div style="cursor:pointer;width:40px;height:40px;line-height:42px;font-size:10px;color:white;text-align:center;font-weight:bold;background:url(resources/images/cluster-marker-3.png);background-size:contain;"></div>',
               size: N.Size(40, 40),
               anchor: N.Point(20, 20)
           },
           htmlMarker4 = {
               content: '<div style="cursor:pointer;width:40px;height:40px;line-height:42px;font-size:10px;color:white;text-align:center;font-weight:bold;background:url(resources/images/cluster-marker-4.png);background-size:contain;"></div>',
               size: N.Size(40, 40),
               anchor: N.Point(20, 20)
           },
           htmlMarker5 = {
               content: '<div style="cursor:pointer;width:40px;height:40px;line-height:42px;font-size:10px;color:white;text-align:center;font-weight:bold;background:url(resources/images/cluster-marker-5.png);background-size:contain;"></div>',
               size: N.Size(40, 40),
               anchor: N.Point(20, 20)
           };
       var markerClustering = new MarkerClustering({
           minClusterSize: 2,
           maxZoom: 8,
           map: map,
           markers: markers,
           disableClickZoom: false,
           gridSize: 120,
           icons: [htmlMarker1, htmlMarker2, htmlMarker3, htmlMarker4, htmlMarker5],
           indexGenerator: [2, 10, 50, 100, 200],
           stylingFunction: function(clusterMarker, count) {
               $(clusterMarker.getElement()).find('div:first-child').text(count);
           }
       });
       //클릭한 마커만 오른쪽 리스트에 표시한다
       function getClickHandler(seq) {
           return function(e) {
               var marker = markers[seq],
                   infoWindow = infoWindows[seq];
               var maptest = [];
               var position = marker.getPosition();
               
               if (infoWindow.getMap()) {
                   infoWindow.close();
               } else {
                   infoWindow.open(map, marker);
                    maptest.push({
                     "longitude":position._lng,
                     "lauitude":position._lat
                              });
                   
                   init2(maptest); 
                  
               }
           }
       }
       //마커별로 이벤트를 입력한다.
       for (var i=0, ii=markers.length; i<ii; i++) {
           naver.maps.Event.addListener(markers[i], 'click', getClickHandler(i));
       }
       
}
	
	
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
		var career = ["전체","시설장","사무국장","사회복지사","의사","촉탁의사","간호사","간호조무사","치과위생사","물리치료사","작업치료사","요양보호사 1급","요양보호사 2급","요양보호사 기존유예자","영양사","사무원","조리원","위생원","관리인","보조원 운전사","프로그램관리자","치매전문교육이수자","청구담당자","기타"];
		
		$("select[name^=job]").each(function() {
			$seljob = $(this);
			$.each(eval(career), function() {
				$seljob.append("<option value='"+this+"'>"+this+"</option>");
			});
		});
	});
	
	
	/* 근무형태 선택  */
	$('document').ready(function() {
		var category0 = ["전체","정규직","계약직","시간제"];
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
				<div class="col">
				<form action="search">
						<div class="input-group md-form form-sm form-2 pl-0">
						  <input class="form-control my-0 py-1 amber-border" type="text" placeholder="지역 혹은 기관명을 검색하세요." aria-label="Search">
					
						  <div class="input-group-append">
						  	<button class="btn btn-block btn-lg btn-light btn-sm" id="searchbtn" type="submit"><img src="resources/image/search.svg" ></button>
						  </div>
						
						</div>
					</form>
				</div>
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
	
<!-- 좌측 슬라이드 바 -->	
<div class="container-fluid">
	<div class="row">
	<nav class="col-md-3 d-none d-md-block bg-light sidebar">
      <div class="sidebar-sticky pt-4" >
      	<div class="container">
      		<!-- 지역 선택: 스크립트 31번 줄부터 -->
	      	<div class="form-group">
				<label for="citySelector">지역</label>
			    <select class="form-control form-control-sm" name="sido1" id="sido1"></select>
				<select class="form-control form-control-sm mt-1" name="gugun1" id="gugun1"></select>
			</div>
			<!-- 직종 선택: 스크립트 78번 줄부터 -->
			<div class="form-group my-3">
				<label for="jobSelector">직종</label>
				<select class="form-control form-control-sm" name="job1" id="job1"></select>
   			</div>
   			<!-- 근무형태 선택: 스크립트 91번 줄부터 -->
   			<div class="form-group my-3">
				<label for="workSelector">근무형태</label>
			    <select class="form-control form-control-sm" name="work1" id="work1"></select>
				<select class="form-control form-control-sm mt-1" name="detail" id="detail"></select>
			</div>
   			<!-- 성별 선택 -->  			
			<label class="my-3" for="genderRadio">모집성별</label>
			<div class="form-group row">
		   		<div class="form-check ml-3 mr-3">
					<input class="form-check-input" type="radio" name="gender" id="gender1" value="option1" checked>
					<label class="form-check-label" for="gender1">전체</label>
				</div>
				<div class="form-check mr-3">
					<input class="form-check-input" type="radio" name="gender" id="gender2" value="option2">
					<label class="form-check-label" for="gender2">남자</label>
				</div>
				<div class="form-check mr-3">
					<input class="form-check-input" type="radio" name="gender" id="gender3" value="option3">
					<label class="form-check-label" for="gender3">여자</label>
				</div>
			</div>
			<!-- 검색버튼 -->
			<div class="form-group my-5 text-center">
				<button type="button" class="btn btn-danger" id="selectbtn">검색</button>
			</div>
		</div>
      </div>
    </nav>
    
    <!-- 지도&리스트 -->
	<div class="col-md-9 ml-sm-auto mt-5 pt-4 border-0">
		<div class="row">
			
			<div class="card col-md-6 p-0 border-0">
				<!-- 지도 --> 
				 
				<div class="card border-0" id="map">
				</div>
				
				<!-- 기관정보 -->
				<div class="card border-top-2" id="information">
					<div class="container">
						<!-- 
						 <h2 class="featurette-heading">경희늘푸른노인전문병원
						 	<span class="text-muted">Checkmate.</span>
						 </h2>
       					 <p class="lead"></p>
       					 -->
					<label for="facilityForm" class="col-form-label col-form-label-lg pt-3"><strong>구인정보</strong></label>
						<table class="table table-bordered table-sm" id="facilityForm">
							<tbody>
							    <tr>
							      <th class="bg-light w-30">기관명</th>
							      <th>"seach_seq"</th>
							      <th class="bg-light w-30">급여종류</th>
							      <th>"Type"</th>
							    </tr>
							    <tr>
							      <td class="bg-light">주소</td>
							      <td colspan="3">"areaa","areab","areac"</td>
							    </tr>
							    <tr>
							      <td class="bg-light">모집직종</td>
							      <td>"jo_type"</td>
							      <td class="bg-light">근무형태</td>
							      <td>"job_detailtype"</td>
							    </tr>
							    <tr>
							      <td class="bg-light">모집인원</td>
							      <td>전체 : "인원" "jo_gender"</td>
							      <td class="bg-light">근무지</td>
							      <td>"areaa","areab"</td>
							    </tr>
							     <tr>
							      <td class="bg-light">기타</td>
							      <td colspan="3">"jo_content"</td>
							    </tr>
							    <tr>
							    	<td colspan="4" class="text-center"><strong>채용관련정보</strong></td>
							    </tr>
							    <tr>
							      <td class="bg-light">채용담당자</td>
							      <td>"직종"</td>
							      <td class="bg-light">전화번호</td>
							      <td>"전화번호"</td>
							    </tr>
							 </tbody>
						</table>
							<!--  -->
						<div class="btn-group float-right pt-3">
							 <button type="button" class="btn btn-outline-secondary mx-1" id="fdetailbtn">기관정보 상세보기</button>
							<button type="button" class="btn btn-outline-secondary mx-1" id="gobackbtn">목록보기</button>	  
						</div>
					</div>
				</div>
				
			</div>
			
			<!-- 리스트 -->
			<div class="card col-md-6 p-0 border-0" id="listcard">
				<div class="listcard">
				   	<!-- Editable table -->
					<h5 id="count" class="card-header text-center pt-3"></h5>
					<p class="p-2 mb-0"><small>등록한 게시물에 대해서는 게시자가 관리합니다. </small></p>
		
					<div class="card-body p-0" id="alllist">
					<!--  style="width:100%; height:100%; overflow:auto" -->
					
						<div id="table" class="table-editable">
							<table class="table border-bottom" id="mlist"></table>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	
    <!-- close; row -->
	</div>
<!-- close; container -->	
</div>



</body>
</html>
	
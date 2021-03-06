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
let isEnd = false; 
//기본 플레그
var flag = 1;
var page = 1;
var ffff = 0;
var upmark = 0;
var totalmaptest = [];
var selno = 0;
var onelist = [];
$(function() {	
		init();
		pagelist(page);
		
		$('#listcard').scroll(function(){
	        let $listcard = $(this);
	        let scrollTop = $('#listcard').scrollTop();
	        let windowHeight = $('#listcard').height();
	        let documentHeight = $(document).height();
	        var scrollBottom = $("#listcard").height()- $("#listcard").scrollTop();
	        var scHeight = $('#listcard').prop('scrollHeight');
	        var scrollHeight = $('#listcard').height();
	      var scrollPosition = (scrollHeight + scrollTop);
	      if (scHeight-3<scrollPosition) {
	          page += 1;
	             ffff = 1;
	             if(upmark==1){ 
	                pagelist2();
	             }else{
	                pagelist(page);
	             }
	      }
	   });
		//왼쪽 선택박스 선택에 따라 검색한다.
		$("#selectbtn").on('click', function() {  
			
			var job = [];
			
			if($("#sido1 option:selected").val()!="시/도 선택"){
				var areaa=$("#sido1 option:selected").val();
			}
			if($("#gugun1 option:selected").val()!="전체"){
				var areab=$("#gugun1 option:selected").val();
			}
			if($("#job1 option:selected").val()!="전체"){
				var jo_job=$("#job1 option:selected").val();
			}
			if($("#work1 option:selected").val()!="전체"){
				var jo_type=$("#work1 option:selected").val();
			}
			if($("#detail option:selected").val()!="전체"){
				var jo_detailtype=$("#detail option:selected").val();
			}
			if($('input:radio[name=gender]:checked').val()!="전체"){
				var jo_gender=$('input:radio[name=gender]:checked').val();
			}
			job.push({
				"areaa":areaa,
				"areab":areab,
				"jo_job":jo_job,
				"jo_type":jo_type,
				"jo_detailtype":jo_detailtype,
				"jo_gender":jo_gender
			});
			console.log(job);
			$.ajax({
				url:"selectjob2", 
				type:"POST",
				traditional: true,
				data:{jobJSON : JSON.stringify(job)},
				success:output
				});
			
			
		});
		
});
$(function() {
	$("#information").hide();
	
	//검색버튼클릭안하고 엔터쳐도 검색이 되게 한다. 
	$("#silvername").keydown(function(key) {
        //키의 코드가 13번일 경우 (13번은 엔터키)
        if (key.keyCode == 13) {
        	$("#information").hide();
			$("#map").show(); 
			 var job = $("form[name=searchjob]").serialize();
			console.log(job); 
			$.ajax({
				url:"selectjob1", 
				type:"get",
				data:job,
				success:output
				});
        }
    });
	//검색어(주소, 시설이름)을 검색한다.
	$("#searchbtn").on('click', function() {
			$("#information").hide();
			$("#map").show(); 
			 var job = $("form[name=searchjob]").serialize();
			console.log(job); 
			$.ajax({
				url:"selectjob1", 
				type:"get",
				data:job,
				success:output
				});
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
	      onelist=[];
	   $.each(accidentDeath, function (index, item){
		   
		 	onelist.push(accidentDeath[index]);
		    list += '<tr style="cursor:pointer"  class="onetr" data-value="'+index+'">';
		    list += '<td scope="row" class="p-2">';
	        list += '<p class="mb-0">기관명 : '+item.silvername+'</p>';
	        list += '<p class="mb-0">주소 : '+item.areaa+" "+item.areab+" "+item.areac+'</p>';
	        list += '<p class="mb-0">모집직종 : '+item.jo_job+'</p>';
	        list += '<p class="mb-0">근무형태 : '+item.jo_type+'</p>';
	        list += '<p class="mb-0">등록일 : '+item.jo_date+'</p>';
	        list += '<span class="table-remove"><button type="button" class="btn informbtn btn-danger btn-rounded btn-sm my-0">구인글 상세보기</button></span>';
			list += '</td></tr>';
	    });
	      $('#mlist').html(list);
	   } else {
	      var list = '';
	   $.each(accidentDeath, function (index, item){
		    onelist.push(accidentDeath[index]);
		    list += '<tr style="cursor:pointer"  class="onetr" data-value="'+(4+index)+'">';
	        list += '<td scope="row" class="p-2">';
	        list += '<p class="mb-0">기관명 : '+item.silvername+'</p>';
	        list += '<p class="mb-0">주소 : '+item.areaa+" "+item.areab+" "+item.areac+'</p>';
	        list += '<p class="mb-0">모집직종 : '+item.jo_job+'</p>';
	        list += '<p class="mb-0">근무형태 : '+item.jo_type+'</p>';
	        list += '<p class="mb-0">등록일 : '+item.jo_date+'</p>';
	        list += '<span class="table-remove"><button type="button" class="btn informbtn btn-danger btn-rounded btn-sm my-0">구인글 상세보기</button></span>';
			list += '</td></tr>';
	    });
  
	      $('#mlist').append(list);
	   }
	   
	   /* tr 누를 때  */
	   $('.onetr').on('click', function() {
			$("#map").hide(); 
			$("#information").show();  
			var oneindex = $(this).attr("data-value");
				var siltype = null;
			       if(onelist[oneindex].type==1){
			          siltype = "요양병원";          
			       } else if(onelist[oneindex].type==2){
			          siltype = "요양원";          
			       } else if(onelist[oneindex].type==3){
			          siltype = "방문시설";          
			       } else if(onelist[oneindex].type==4){
			          siltype = "치매전담";          
			       }
				$("#jname").html(onelist[oneindex].silvername);
				$("#jtype").html(siltype);
				$("#jare").html(onelist[oneindex].areaa+" "+onelist[oneindex].areab+" "+onelist[oneindex].areac);
				$("#jjtype").html(onelist[oneindex].jo_job);
				$("#jdet").html(onelist[oneindex].jo_detailtype);
				$("#jgen").html(onelist[oneindex].jo_gender+" "+onelist[oneindex].jo_int+"명");
				$("#jcon").html(onelist[oneindex].jo_content);
				
				var bt = '';
				// 상세보기 버튼을 누르면 새창으로 열림 
				bt += '<button target="_blank"  type="button" onclick="window.open(\'about:blank\').location.href=\'searchDetail?seach_seq='+onelist[oneindex].seach_seq+'\'" class="btn btn-outline-danger mx-1" id="fdetailbtn">기관정보 상세보기</button>';
				$("#detailbt").html(bt);
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
       updateMarkers(map, markers);
       
       naver.maps.Event.addListener(map, 'zoom_changed', function() {
           updateMarkers(map, markers);
           
       });
       naver.maps.Event.addListener(map, 'dragend', function() {
           updateMarkers(map, markers);
       });
       function updateMarkers(map, markers) {
         page = 1;
         upmark = 1;
         $("#listcard").scrollTop(0); 
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
           }
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
		var area1 = ["전체","강남구","강동구","강북구","강서구","관악구","광진구","구로구","금천구","노원구","도봉구","동대문구","동작구","마포구","서대문구","서초구","성동구","성북구","송파구","양천구","영등포구","용산구","은평구","종로구","중구","중랑구"];
		var area2 = ["전체","계양구","남구","남동구","동구","부평구","서구","연수구","중구","강화군","옹진군"];
		var area3 = ["전체","대덕구","동구","서구","유성구","중구"];
		var area4 = ["전체","광산구","남구","동구",     "북구","서구"];
		var area5 = ["전체","남구","달서구","동구","북구","서구","수성구","중구","달성군"];
		var area6 = ["전체","남구","동구","북구","중구","울주군"];
		var area7 = ["전체","강서구","금정구","남구","동구","동래구","부산진구","북구","사상구","사하구","서구","수영구","연제구","영도구","중구","해운대구","기장군"];
		var area8 = ["전체","고양시","과천시","광명시","광주시","구리시","군포시","김포시","남양주시","동두천시","부천시","성남시","수원시","시흥시","안산시","안성시","안양시","양주시","오산시","용인시","의왕시","의정부시","이천시","파주시","평택시","포천시","하남시","화성시","가평군","양평군","여주군","연천군"];
		var area9 = ["전체","강릉시","동해시","삼척시","속초시","원주시","춘천시","태백시","고성군","양구군","양양군","영월군","인제군","정선군","철원군","평창군","홍천군","화천군","횡성군"];
		var area10 = ["전체","제천시","청주시","충주시","괴산군","단양군","보은군","영동군","옥천군","음성군","증평군","진천군","청원군"];
		var area11 = ["전체","계룡시","공주시","논산시","보령시","서산시","아산시","천안시","금산군","당진군","부여군","서천군","연기군","예산군","청양군","태안군","홍성군"];
		var area12 = ["전체","군산시","김제시","남원시","익산시","전주시","정읍시","고창군","무주군","부안군","순창군","완주군","임실군","장수군","진안군"];
		var area13 = ["전체","광양시","나주시","목포시","순천시","여수시","강진군","고흥군","곡성군","구례군","담양군","무안군","보성군","신안군","영광군","영암군","완도군","장성군","장흥군","진도군","함평군","해남군","화순군"];
		var area14 = ["전체","경산시","경주시","구미시","김천시","문경시","상주시","안동시","영주시","영천시","포항시","고령군","군위군","봉화군","성주군","영덕군","영양군","예천군","울릉군","울진군","의성군","청도군","청송군","칠곡군"];
		var area15 = ["전체","거제시","김해시","마산시","밀양시","사천시","양산시","진주시","진해시","창원시","통영시","거창군","고성군","남해군","산청군","의령군","창녕군","하동군","함안군","함양군","합천군"];
		var area16 = ["전체","서귀포시","제주시","남제주군","북제주군"];
	
	 // 시/도 선택 박스 초기화	
		$("select[name^=sido]").each(function() {
			$selsido = $(this);
			$.each(eval(area0), function() {
				$selsido.append("<option value='"+this+"'>"+this+"</option>");
			});
			$selsido.next().append("<option value='전체'>구/군 선택</option>");
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
			$selwork.next().append("<option value='전체'>상세근무형태 선택</option>");
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
	
	/* 구인정보 상세보기 & 빠른지원 show and hide */
function callc(){
	userid = "${sessionScope.workerId}";
		console.log(userid);
		$.ajax({
			url:"selonere", 
			type:"get",
			data:{"userid":userid},
			success:printc
			});
	}
function printc(data){ //빠른지원메뉴에 값을 전부 넣어둔다. 이력서가 등록이 안되어있으면 리턴시킨다.
	if(data==null){
		alert("마이페이지에서 이력서를 먼저 등록해주세요!");
		return;
	}
	
	console.log(data);
	console.log('${member}');
	$('#username').html('${member.username}');
	$('#gender').html('${member.gender}');
	$('#birthday').html('${member.birthday}');
	$('#telephone').html('${member.telephone}');
	$('#address').html('${member.address}');
	
	$('#re_qu').html(data.re_qualification);
	$('#rejob').html(data.re_job);
	$('#reare').html(data.re_areaa+" "+data.re_arebb);
	$('#retype').html(data.re_type);
	$('#exampleFormControlTextarea5').html(data.re_content);
	
}

function insertmessage(){  //이력서 내용으로 쪽지 보내기 
	var userid = "${sessionScope.workerId}";
	var title = '구직신청';
	var content = '성명 : '+$('#username').html()+'\n성별 : '+$('#gender').html()+'\n생년월일 : '+$('#birthday').html()+'\n전화번호 : '+$('#telephone').html()+'\n주소 : '+$('#address').html();
	var content2 = '희망직종 : '+$('#rejob').html()+'\n희망지역 : '+$('#reare').html()+'\n근무형태 : '+$('#retype').html()+'\n기타사항 : '+$('#exampleFormControlTextarea5').html();
	var sender = $('#jname').html();
	
	console.log(sender.length);
	
	 $.ajax({
        type : 'post',
        url : 'insertmessage1',
        data : {userid:userid,
        		ms_title:title,
        		ms_content:content,
        		ms_content2:content2,
        		ms_Sender:sender	
        },
        success : function(data){
        	if(data==1){
        		alert("신청되었습니다!");
        	}else{
        		alert("신청에 실패했습니다. 다시시도하거나 관리자에게 문의하세요.");
        	} 
        	
        }
	});   
	
}


 $(document).ready(function(){
	  $("#quick-applyForm").hide();
	  
	  $("#quick-applybtn").click(function(){ //빠른지원을 눌렀을때 이력서 정보를 불러와 넣자   
		  callc();
		$("#recruit-detail").hide();
		$("#quick-applyForm").show();
	});
	  
	  $("#q-applybtn").click(function(){ //지원하기 버튼
		/* 지원 시 완료 alert창 띄우기 */
		insertmessage();
		$("#quick-applyForm").hide();
		$("#recruit-detail").show();
	});
	  
	  $("#q-cancelbtn").click(function(){    
		$("#quick-applyForm").hide();
		$("#recruit-detail").show();
	});
	  
 });	
	
	</script>
	
	<!-- 메인 네비게이션 -->
	<header>
		<nav class="navbar navbar-expand-md navbar-dark fixed-top shadow-sm p-3" id="main-nav">
	 		<a class="navbar-brand mr-5 p-0" href="index"><img src="resources/image/silversurferLogo.png"></a>
	 		<!-- 오른쪽 상단 토글러 버튼 -->
			<button class="navbar-toggler pt-0" type="button" data-toggle="collapse" data-target="#navbarCollapse" aria-controls="navbarCollapse" aria-expanded="false" aria-label="Toggle navigation">
	      	<span class="navbar-toggler-icon"></span>
			</button>
			<!-- 네비게이션 상단 메뉴 -->
			
			<div class="collapse navbar-collapse justify-content-between" id="navbarCollapse">
				<div class="col">
				<form id="searchjob" name="searchjob"  onsubmit="return false">
						<div class="input-group md-form form-sm form-2 pl-0">
						  <input class="form-control my-0 py-1 amber-border" type="text" id="silvername" name="silvername" placeholder="지역 혹은 기관명을 검색하세요." aria-label="Search">
					
						  <div class="input-group-append">
						  	<button type="button" class="btn btn-block btn-lg btn-light btn-sm" id="searchbtn" ><img src="resources/image/search.svg" ></button>
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
					<input class="form-check-input" type="radio" name="gender" id="gender1" value="전체" checked>
					<label class="form-check-label" for="gender1">전체</label>
				</div>
				<div class="form-check mr-3">
					<input class="form-check-input" type="radio" name="gender" id="gender2" value="남">
					<label class="form-check-label" for="gender2">남자</label>
				</div>
				<div class="form-check mr-3">
					<input class="form-check-input" type="radio" name="gender" id="gender3" value="여">
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
		
				<!-- card-center -->
				<div class="card border-top-2" id="information">
					<!-- 구인글 상세보기 -->
					<div class="container" id="recruit-detail">
					<label for="facilityForm" class="col-form-label col-form-label-lg mt-3"><strong>구인정보</strong></label>
						<table class="table table-bordered" id="facilityForm">
							<tbody>
							    <tr>
							      <th class="bg-light w-20">기관명</th>
							      <th class="w-30" id="jname">"seach_seq"</th>
							      <th class="bg-light w-20">급여종류</th>
							      <th class="w-30" id="jtype">"Type"</th>
							    </tr>
							    <tr>
							      <td class="bg-light">주소</td>
							      <td id="jare">"areaa","areab","areac"</td>
								  <td class="bg-light">모집직종</td>
							      <td id="jjtype">"jo_type"</td>
							    </tr>
							    <tr>
							      <td class="bg-light">근무형태</td>
							      <td id="jdet">"job_detailtype"</td>
							      <td class="bg-light">모집인원</td>
							      <td id="jgen">전체 : "인원" "jo_gender"</td>
							    </tr>
							    
							     <tr>
							      <td class="bg-light">상세내용</td>
							      <td colspan="3" id="jcon">"jo_content"</td>
							    </tr>
							 </tbody>
						</table>
							<!--  -->
						<div class="btn-group float-right pt-3">
							<div>
							<c:if test="${sessionScope.workerId!=null}">
								<button type="button" class="btn btn-outline-secondary mx-1" id="quick-applybtn">빠른지원</button>
							</c:if>
							</div>
							<div id="detailbt">
								<!-- 상세정보 가기버튼 -->
							</div>
							<div>
								<button type="button" class="btn btn-outline-danger mx-1" id="gobackbtn">목록보기</button>	  
							</div>
						</div>
					</div>
					
					<!-- 빠른지원 양식 -->
					<div class="container" id="quick-applyForm">
					  <!-- 개인정보 -->
					  <label for="facilityForm" class="col-form-label col-form-label-lg pt-3"><strong>개인정보</strong></label>
					  <table class="table table-bordered" id="facilityForm">
					    <tbody>
					      <tr>
					        <th class="bg-light w-30">성명</th>
					        <th id="username"></th>
					      </tr>
					      <tr>
					        <td class="bg-light w-30">성별</td>
					        <td id="gender"></td>
					      </tr>
					      <tr>
					        <td class="bg-light">생년월일</td>
					        <td id="birthday"></td>
					      </tr>
					      <tr>
					        <td class="bg-light">전화번호</td>
					        <td id="telephone"></td>
					      </tr>
					      <tr>
					        <td class="bg-light">주소</td>
					        <td colspan="3" id="address">"주소"</td>
					      </tr>
					      <tr>
					        <td class="bg-light">자격사항</td>
					        <td colspan="3" id="re_qu"></td>
					      </tr>
					    </tbody>
					  </table>
					  <!-- 구직정보 -->
					  <label for="facilityForm" class="col-form-label col-form-label-lg pt-3"><strong>구직정보</strong></label>
					  <table class="table table-bordered" id="facilityForm">
					    <tbody>
					      <tr>
					        <th class="bg-light w-30">희망직종</th>
					        <th colspan="3" id="rejob">"희망직종"</th>
					      </tr>
					      <tr>
					        <td class="bg-light">희망지역</td>
					        <td colspan="3" id="reare">"희망지역"</td>
					      </tr>
					      <tr>
					        <td class="bg-light">근무형태</td>
					        <td colspan="3" id="retype">"근무형태"</td>
					      </tr>
					      <tr>
					        <td class="bg-light">기타사항</td>
					        <td colspan="3" class="etc p-0 mb-0">
					          <textarea class="form-control p-0" id="exampleFormControlTextarea5" rows="4" disabled></textarea>
					        </td>
					      </tr>
					    </tbody>
					  </table>
					  <div class="btn-group d-flex justify-content-center mt-3 mb-3">
						<!-- 지원 시 완료 alert창 띄우기 -->					  
					    <div>
					      <button type="button" class="btn btn-outline-danger mx-1" id="q-applybtn">지원</button>
					    </div>
					    <div>
					      <button type="button" class="btn btn-outline-danger mx-1" id="q-cancelbtn">취소</button>
					    </div>
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
	
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
    <script src="https://code.jquery.com/jquery-1.12.4.min.js" integrity="sha256-ZosEbRLbNQzLpnKIkEdrPv7lOy9C27hHQ+Xp8a4MxAQ=" crossorigin="anonymous"></script>
   <script type="text/javascript" src="https://openapi.map.naver.com/openapi/v3/maps.js?ncpClientId=ynuycabqm2"></script>
   <script type="text/javascript" src="resources/src/MarkerClustering.js"></script>
    
   <!-- Bootstrap CSS 추가 -->
   <link rel="stylesheet" href="resources/css/bootstrap.min.css">
   
   <!-- Custom CSS 추가 -->
   <link rel="stylesheet" href="resources/css/custom.css">
   <link rel="stylesheet" href="resources/css/search.css">

</head>
<body>

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
              <a class="nav-item nav-link" href="practician">
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

   <!-- 대시보드 -->
   <!-- <div class="container"> -->
   <header id="search">
      <div class="p-1 bg-white text-black">
         <div class="row shadow-sm p-3 bg-white rounded">
            <div class="container">
            <div class="row mx-1">
            <!-- 버튼 -->
               <button type="button" class="btn btn-outline-info btn-sm mx-1 categoryBtn" btnFlag="1">요양병원</button>
               <button type="button" class="btn btn-outline-info btn-sm mx-1 categoryBtn" btnFlag="2">요양원</button>
               <button type="button" class="btn btn-outline-info btn-sm mx-1 categoryBtn" btnFlag="3">방문시설</button>
               <button type="button" class="btn btn-outline-info btn-sm mx-1 categoryBtn" btnFlag="4">치매전담</button>
               
            <!-- 검색 -->
            <form class="form-inline mt-2 mt-md-0">
               <input class="form-control mr-sm-2 form-control-sm mx-2" type="text" placeholder="시설명 검색" aria-label="search">
               <button class="btn btn-info my-2 my-sm-0 btn-sm" type="submit">검색</button>
            </form>
            </div>
            </div>
         </div>
      </div>
   </header>

   <!-- 지도&검색내역 표기 -->
   <div class="container">   
      <div class="row my-1">
         <!-- 지도 -->
         <div class="col-md-6">
            <div class="card p-2" id="map">
            </div>
         </div>
      <!-- 리스트 -->
         <div class="col-md-6">
               <div class="row no-gutters overflow-hidden flex-md-row">
                 <div id="list" class="col mt-1 d-flex flex-column position-static">
          <!-- 리스트 상단 -->
              <header id="list-header">
                 <div class="bg-white text-dark">
                    <div class="row ">
                       <div class="col-sm-8 info">
                          <p id="count" class="text-secondary font-weight-bold"></p>
                       </div>   
                       <div class="col-sm-4">
                       <button type="button" class="btn btn-sm btn-info float-right">엑셀로 출력</button>
                       </div>
                    </div>
                 <hr class="my-1">
                 </div>
              </header>
     
           <!-- 리스트 테이블 -->
          
         <div id="alllist" style="width:100%; height:600px; overflow:auto">
              
              <table id="mlist" width="100%" border="0" cellspacing="0" cellpadding="0">
             </table>
          
          </div>
           </div>
         </div>
      </div>
   </div>
   </div>

   <!-- jQuery javaScript 추가 -->
   <script src="resources/js/jquery.min.js"></script> 
   
   <!-- Popper javaScript 추가 -->
   <script src="resources/js/popper.min.js"></script>
   
   <!-- Bootstrap javaScript 추가 -->
   <script src="resources/js/bootstrap.min.js"></script>




<script>
let isEnd = false; 
//기본 플레그
var flag = 1;
var page = 1;
var ffff = 0;
var upmark = 0;
var totalmaptest = [];
$(function() {
   init(flag);
   pagelist(flag,page);
   
   $(".categoryBtn").on("click",function(){
      page = 1;
      ffff = 0;
      upmark = 0;
      $("#alllist").scrollTop(0); 
      flag = $(this).attr("btnFlag");
      init(flag);
      pagelist(flag);
   });
   
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
                pagelist(flag,page);
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
function count(data){
   var cc = data.length;
   var count = '';
          count+='총'
          count+=cc;
          count+='개의 시설을 찾았습니다.';
          $('#count').html(count); 
   return cc;   
}
function pagelist(flag,page){
   $.ajax({
      url:"pagemap",
      type:"get",
      data:{
         "type":flag,
         "page":page
      },
      success:wlist
   });
}
function pagelist2(){
   $.ajax({
      url:"selectmap2",
      type:"POST",
      traditional: true,
      data: {maptestJSON : JSON.stringify(totalmaptest),
            page: page},
      success:wlist
   });
}
function init(flag) {
   
   $.ajax({
      url:"selectmap",
      type:"get",
      data:{"type":flag},
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
      url:"selectmap2",
      data: {maptestJSON : JSON.stringify(maptest)},
      type:"post",
      success:wlist
      
   });
}
/* function output2(resp){
   //console.log("list : " + makers(resp));
   //wlist(makers(resp));
} */ 
function output(resp){
   
   // 2014년 사망사고 위치
   var accidentDeath = {
        "searchResult": {
             "accidentDeath": 
                makers(resp)
        },
        "resultCode": "Success"
   }
   //wlist(makers(resp));
   write(accidentDeath); // 지도에 마커그림
   //wlist(makers(resp));
   count(makers(resp));
}
//DB에 있는 좌표를 받아옴
function makers(data){
var makers_temp = [];
for(var i = 0;i < data.length ;i++){
   makers_temp.push({
         "mseq":data[i].seach_seq,
         "type":data[i].type,
         "areaa":data[i].areaa,
         "areab":data[i].areab,
         "areac":data[i].areac,
         "silvername":data[i].silvername,
         "service":data[i].service,
         "grade":data[i].grade,
         "grd_lo":data[i].longitude,
         "grd_la":data[i].lauitude});
}
return makers_temp;
} 
function wlist(accidentDeath){
   if(accidentDeath.length==0){
      return;
   }
   
   if (ffff == 0) {
      var list = '';
      
      list += '<table class="table table-horver">';
    
      
   $.each(accidentDeath, function (index, item){
       var siltype = null;
       if(item.type==1){
          siltype = "요양병원";          
       } else if(item.type==2){
          siltype = "요양원";          
       } else if(item.type==3){
          siltype = "방문시설";          
       } else if(item.type==4){
          siltype = "치매전담";          
       }
          
         list += '<tbody>';//개별 tr 클릭시 search_seq값을 컨트롤러로 넘긴다.
         list += '<tr style="cursor:pointer" onclick="location.href=\'searchDetail?seach_seq='+item.seach_seq+'\'" class="onesilver" name="seach_seq" data-value="'+item.seach_seq+'">';
         list += '<td scope="row"><p class="text-primary font-weight-bold my-0">'+item.grade+'등급</p><p class="text-danger my-0">'+siltype+'</p><p class="my-0 font-weight-bold">'+item.silvername+'</p>'+item.areaa+item.areab+item.areac+'<br><p class="text-dark bg-light" style="width: 4.5rem;">'+item.service+'</p><hr class="my-1"></span></td>'; //등급 & 시설종류 1.요양병원 2.요양원 3.방문시설 4.치매전담
         list += '</tr>';
         list += '</tbody>';
         
    });
         list += '</table>';
      $('#mlist').html(list);
   } else {
      var list = '';
      
    
      
   $.each(accidentDeath, function (index, item){
       var siltype = null;
       if(item.type==1){
          siltype = "요양병원";          
       } else if(item.type==2){
          siltype = "요양원";          
       } else if(item.type==3){
          siltype = "방문시설";          
       } else if(item.type==4){
          siltype = "치매전담";          
       }
         
         list += '<tbody>'; //개별 tr 클릭시 search_seq값을 컨트롤러로 넘긴다.
         list += '<tr style="cursor:pointer" onclick="location.href=\'searchDetail?seach_seq='+item.seach_seq+'\'" class="onesilver" name="seach_seq" data-value="'+item.seach_seq+'">';
         list += '<td scope="row"><p class="text-primary font-weight-bold my-0">'+item.grade+'등급</p><p class="text-danger my-0">'+siltype+'</p><p class="my-0 font-weight-bold">'+item.silvername+'</p>'+item.areaa+item.areab+item.areac+'<br><p class="text-dark bg-light" style="width: 5rem;">'+item.service+'</p><hr class="my-1"></span></td>'; //등급 & 시설종류 1.요양병원 2.요양원 3.방문시설 4.치매전담
         list += '</tr>';
         list += '</tbody>';
         
         
         
    });
      
      $('#mlist').append(list);
   }
 
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
   
</script>
</body>
</html>
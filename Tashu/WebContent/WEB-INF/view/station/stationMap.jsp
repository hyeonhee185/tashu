<%@page import="kr.or.ddit.station.vo.StationVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>대여소 조회</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0">

<style>
   body {
      margin: 0px; /* 지도 스크롤 없애기 */
   }
   
   #map {
      width: 100vw;
      height: 100vh;
      min-height: 500px; 
   
   }
</style>

<script type="text/javascript" src="<%=request.getContextPath()%>/js/jquery-3.6.0.min.js"></script>
<script type="text/javascript">

$(function(){
	$("#area").change(function(){
		//생활권 값
		var area = $(this).val();
		// 타겟..
		var $target = $("select[name='dong']");
		
		$.ajax({
			url : "<%=request.getContextPath()%>/station/stationArea.do",
			data : {"area" : area},
			dataType : "json",
			success : function(result){
				$.each(result, function(i,v){
					$target.append("<option value='"+v.station_dong+"'>"+v.station_dong+"</option>")
				});
			},
			error : function(xhr){
				alert(xhr.status);
			}
			
		});
	});
	
	$('#check').on("click",function(){
	 var dong = $("select[name='dong']").val();
	 $.ajax({
		url : "<%=request.getContextPath()%>/station/stationList.do",
		data : {"dong" : dong},
		dataType : "json",
		async : false,
		success : function(result){

});



</script>



</head>

<body>



<%
   List<StationVO> stationList = (List<StationVO>)request.getAttribute("stationList");
%>
      <select name="area" id="area">
         <option>생활권을 선택해주세요</option>
         <option value="1생활권">1생활권</option>
         <option value="2생활권">2생활권</option>
         <option value="3생활권">3생활권</option>
      </select>
      <select name="dong" id="dong">
      <option>원하는 동을 선택해주세요</option>
      
      </select>
      
      <input type="button" value="확인" name="check" id="check">
      <div id="result"></div>
   

      <!-- 지도를 표시할 div 입니다 -->
      <div id="map" > </div>
   
      <script type="text/javascript"
         src="//dapi.kakao.com/v2/maps/sdk.js?appkey=6a565fe5be54a82849d0d5e2fa1514b6">
      </script>
      
      <script>
      var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
          mapOption = { 
              center: new kakao.maps.LatLng(36.482114   , 127.259628), // 지도의 중심좌표
              level: 4 // 지도의 확대 레벨
          };
      
      // 지도를 표시할 div와  지도 옵션으로  지도를 생성합니다
      var map = new kakao.maps.Map(mapContainer, mapOption); 
      
      //하늘
      function resizeMap() {
    	    var mapContainer = document.getElementById('map');
    	    mapContainer.style.width = '350px';
    	    mapContainer.style.height = '350px'; 
    	}

    	function relayout() {    
    	    
    	    // 지도를 표시하는 div 크기를 변경한 이후 지도가 정상적으로 표출되지 않을 수도 있습니다
    	    // 크기를 변경한 이후에는 반드시  map.relayout 함수를 호출해야 합니다 
    	    // window의 resize 이벤트에 의한 크기변경은 map.relayout 함수가 자동으로 호출됩니다
    	    map.relayout();
    	}
      // 마커를 표시할 위치와 title 객체 배열입니다 
      var positions = [
          {
              title: '첫마을 1단지', 
              latlng: new kakao.maps.LatLng(36.482114, 127.259628)
          },
          {
              title: '첫마을 3단지', 
              latlng: new kakao.maps.LatLng(36.47985, 127.260513)
          },
          {
              title: '첫마을 4단지', 
              latlng: new kakao.maps.LatLng(36.480436, 127.253314)
          },
          {
              title: 'LH세종특별본부',
              latlng: new kakao.maps.LatLng(36.495484, 127.266063)
          },
          {
              title: '한솔동 주민센터',
              latlng: new kakao.maps.LatLng(36.4789789, 127.2555235)
          },
          {
              title: '한솔중학교',
              latlng: new kakao.maps.LatLng(36.474876, 127.255207)
          },
          {
              title: '첫마을 5단지',
              latlng: new kakao.maps.LatLng(36.477852, 127.249886)
          },
          {
              title: '첫마을 6단지',
              latlng: new kakao.maps.LatLng(36.475618, 127.252225)
          },
          {
              title: '첫마을 7단지',
              latlng: new kakao.maps.LatLng(36.474186, 127.255057)
          },
          {
              title: '세종보 홍보관',
              latlng: new kakao.maps.LatLng(36.476774, 127.25951)
          },
          {
              title: '첫마을 (BRT정류장)',
              latlng: new kakao.maps.LatLng(36.481001, 127.261527)
          },
          {
              title: '도담동 주민센터',
              latlng: new kakao.maps.LatLng(36.515895, 127.262853)
          },
          {
              title: '도시통합정보센터',
              latlng: new kakao.maps.LatLng(36.493845, 127.256103)
          },
          {
              title: '종합민원실 (BRT정류장)',
              latlng: new kakao.maps.LatLng(36.504611, 127.261738)
          },
          {
              title: '고용노동부 (BRT정류장)',
              latlng: new kakao.maps.LatLng(36.501559, 127.260176)
          },
          {
              title: '성남중학교',
              latlng: new kakao.maps.LatLng(36.497462, 127.255843)
          },
          {
              title: '문화체육관광부',
              latlng: new kakao.maps.LatLng(36.498175, 127.26442)
          },
          {
              title: '국무조정실 (대통령 기록관)',
              latlng: new kakao.maps.LatLng(36.502481, 127.272106)
          },
          {
              title: '호수공원 (정부세종컨벤션센터)',
              latlng: new kakao.maps.LatLng(36.499384, 127.269759)
          },
          {
              title: '호수공원 (제1주차장)',
              latlng: new kakao.maps.LatLng(36.492559, 127.269245)
          },
          {
              title: '한솔유치원',
              latlng: new kakao.maps.LatLng(36.477965, 127.25215)
          },
          {
              title: '범지기마을 10단지',
              latlng: new kakao.maps.LatLng(36.516017, 127.25105)
          },
          {
              title: '아름동 주민센터',
              latlng: new kakao.maps.LatLng(36.511962, 127.247877)
          },
          {
              title: '가재마을 9단지',
              latlng: new kakao.maps.LatLng(36.501754, 127.250707)
          },
          {
              title: '가재마을 11단지',
              latlng: new kakao.maps.LatLng(36.504826, 127.250465)
          },
          {
              title: '도램마을 (BRT 정류장)',
              latlng: new kakao.maps.LatLng(36.514855, 127.258498)
          },
          {
              title: '한뜰마을 2단지 (세종1번가)',
              latlng: new kakao.maps.LatLng(36.504509, 127.270131)
          },
          {
              title: '국책연구단지',
              latlng: new kakao.maps.LatLng(36.496194, 127.303916)
          },
          {
              title: '공정거래위원회(해양수산부)',
              latlng: new kakao.maps.LatLng(36.504866, 127.267261)
          },
          {
              title: '세종시청',
              latlng: new kakao.maps.LatLng(36.478848, 127.288719)
          },
          {
              title: '국세청',
              latlng: new kakao.maps.LatLng(36.484645, 127.259567)
          },
          {
              title: '한국개발연구원 (KDI)',
              latlng: new kakao.maps.LatLng(36.482502, 127.310611)
          },
          {
              title: '시외버스터미널',
              latlng: new kakao.maps.LatLng(36.469003, 127.274106)
          },
          {
              title: '가락마을 21단지',
              latlng: new kakao.maps.LatLng(36.517472, 127.240872)
          },
          {
              title: '가락마을 13단지',
              latlng: new kakao.maps.LatLng(36.514074, 127.229691)
          },
          {
              title: '가락마을 8단지',
              latlng: new kakao.maps.LatLng(36.50699, 127.239403)
          },
          {
              title: '가락마을 6단지',
              latlng: new kakao.maps.LatLng(36.504237, 127.237826)
          },
          {
              title: '범지기마을 3단지',
              latlng: new kakao.maps.LatLng(36.516182, 127.245477)
          },
          {
              title: '범지기마을 4단지',
              latlng: new kakao.maps.LatLng(36.509161, 127.24998)
          },
          {
              title: '가재마을 4단지',
              latlng: new kakao.maps.LatLng(36.505489, 127.245045)
          },
          {
              title: '종촌종합복지센터',
              latlng: new kakao.maps.LatLng(36.502145, 127.246821)
          },
          {
              title: '도램마을 14단지',
              latlng: new kakao.maps.LatLng(36.511224, 127.26509)
          },
          {
              title: '도램마을 1단지',
              latlng: new kakao.maps.LatLng(36.508096, 127.25776)
          },
          {
              title: '가락마을 15단지',
              latlng: new kakao.maps.LatLng(36.517332, 127.237483)
          },
          {
              title: '가락마을 11단지',
              latlng: new kakao.maps.LatLng(36.510545, 127.229927)
          },
          {
              title: '가락마을 4단지',
              latlng: new kakao.maps.LatLng(36.506684, 127.237095)
          },
          {
              title: '범지기마을 11단지',
              latlng: new kakao.maps.LatLng(36.511452, 127.252059)
          },
          {
              title: '범지기마을 1단지',
              latlng: new kakao.maps.LatLng(36.508934, 127.242006)
          },
          {
              title: '가재마을 7단지',
              latlng: new kakao.maps.LatLng(36.506402, 127.249654)
          },
          {
              title: '도램마을 10단지',
              latlng: new kakao.maps.LatLng(36.512775, 127.261354)
          }
      ];

      // 마커 이미지의 이미지 주소입니다
      var imageSrc = "https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/markerStar.png"; 
          
      for (var i = 0; i < positions.length; i ++) {
          
          // 마커 이미지의 이미지 크기 입니다
          var imageSize = new kakao.maps.Size(24, 35); 
          
          // 마커 이미지를 생성합니다    
          var markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize); 
          
          // 마커를 생성합니다
          var marker = new kakao.maps.Marker({
              map: map, // 마커를 표시할 지도
              position: positions[i].latlng, // 마커를 표시할 위치
              title : positions[i].title, // 마커의 타이틀, 마커에 마우스를 올리면 타이틀이 표시됩니다
              image : markerImage // 마커 이미지 
          });
      }
      
      
      
      </script>







</body>
</html>
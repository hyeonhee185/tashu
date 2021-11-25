<%@page import="kr.or.ddit.member.vo.MemberVO"%>
<%@page import="kr.or.ddit.station.vo.StationVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>대여소 조회</title>
<link rel="icon" href="images/logo.png">
<link rel="stylesheet" href="/Tashu/css/stationMap2.css">
    <style>
    .wrap {position: absolute;left: 50%;bottom: 40px;width: 288px;height: 132px;margin-left: -144px;text-align: left;overflow: hidden;font-size: 13px;font-family: "Open Sans", "Noto Sans KR", sans-serif;line-height: 1.5;}
    .wrap * {padding: 0;margin: 0;}
    .wrap .info {width: 288px;height: 120px;border-radius: 5px;border-bottom: 2px solid #ccc;border-right: 1px solid #ccc;overflow: hidden;background: #fff;}
    .wrap .info:nth-child(1) {border: 0;box-shadow: 0px 1px 2px #888;}
    .info .title {padding: 5px 0 0 10px;height: 30px;background: #eee;border-bottom: 1px solid #ddd;font-size: 16px;font-weight: bold;}
    .info .close {position: absolute;top: 10px;right: 10px;color: #888;width: 17px;height: 17px;background: url('https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/overlay_close.png');}
    .info .close:hover {cursor: pointer;}
    .info .body {position: relative;overflow: hidden;}
    .info .desc {position: relative;margin: 13px 0 0 90px;height: 75px;}
    .desc .ellipsis {overflow: hidden;text-overflow: ellipsis;white-space: nowrap;}
    .desc .jibun {font-size: 13px;color: #888; margin-top: -2px;}
    .info .img {position: absolute;top: 6px;left: 5px;width: 73px;height: 71px;border: 1px solid #ddd;color: #888;overflow: hidden;}
    .info:after {content: '';position: absolute;margin-left: -12px;left: 50%;bottom: 0;width: 22px;height: 12px;background: url('https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/vertex_white.png')}
    .info .link {color: #5085BB;}
</style>

<meta name="viewport" content="width=device-width, initial-scale=1.0">
<script type="text/javascript" src="<%=request.getContextPath()%>/js/jquery-3.6.0.min.js"></script>
<script type="text/javascript">

$(function(){
   <%-- var dong = $("select[name='dong']").val();
   location.href = "<%=request.getContextPath()%>/stationMap.do"; --%>
   
   $('#area').change(function(){
      var area=$(this).val();
      var $target=$("select[name='dong']");
      $.ajax({
         url : "<%=request.getContextPath()%>/station/stationArea.do",
         data : {"area" : area},
         dataType : "json",
         async : false,
         success : function(result){
            console.log(result);
            $('#dong').children('option:not(:first)').remove();
            $.each(result, function(i,v){
               $target.append("<option value='"+v.station_dong+"'>"+v.station_dong+"</option>")
            });
         },
         error : function(xhr){
            alert(xhr.status);
         }
      });
   });
   
    // dong에 해당하는 station 
    $('#check').on("click",function(){
        var dong = $("select[name='dong']").val();
         
       $.ajax({
            url : "<%=request.getContextPath()%>/station/dong.do?dong="+dong,
            data : {"dong" : dong},
            dataType : "json",
            async : false,
            success : function(result){
                console.log(result);
                
               // 마커를 생성할 객체 배열
            var positions = [];
            $.each(result, function(i,v){
               var ele = {};
               ele.title = v.station_name;
               ele.latlng = new kakao.maps.LatLng(v.station_y_pos, v.station_x_pos);
               positions.push(ele);
            });
            
            console.log(positions);
            // 전체 리스트 지도 삭제
            $("#map").empty();
         
            // "동"을 출력할 map 새로 만들기
            var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
             mapOption = { 
               //------------------정류장에 해당하는 위도, 경도를 넣어주면 그 위치로 이동됨
                center: new kakao.maps.LatLng(positions[0].latlng.Ma, positions[0].latlng.La), 
                level: 3 // 지도의 확대 레벨
             };
            
            // 지도를 표시할 div와  지도옵션으로  지도를 생성합니다
            var map = new kakao.maps.Map(mapContainer, mapOption); 
            setMyPosition(positions, map);
           
            
            //
         /*    var overlay = new kakao.maps.CustomOverlay({
                content: content,
                map: map,
                position: marker.getPosition()       
            }); */
         },
         error : function(xhr){
            alert(xhr.status);
         }
      });
   
   }); 
 
});

</script>
<style>
   body {
      margin: 0px; /* 지도 스크롤 없애기 */
   }
    #map {
      
      /* width: 70vw; */
    /* height: 80vh; */
    /* min-height: 500px; */
    width: 860px;
    height: 800px;
    /* min-height: 500px; */
    margin: 0 auto;
    margin-bottom: 100px;
    margin-left: 631px;
    /* padding-left: 100px; */
    /* padding-right: 100px;
   } 
/*   #map {
      
      width: 70vw;
      height: 80vh;
      min-height: 500px;
     width: 1300px; 
       height: 800px; 
       min-height: 500px; 
      margin: 0 auto; 
      margin-bottom: 100px;
   }  */
</style>
</head>

<body>
  <header>
    <div class="headUtil"> 
      <div class="fr">
           <a href="<%=request.getContextPath() %>/main.jsp">HOME</a>
<%
           HttpSession ssion = request.getSession();
           MemberVO mem = (MemberVO)ssion.getAttribute("member");
           if(mem==null){
%>              
           <a href="login.do">로그인</a>
           <a href="<%=request.getContextPath() %>/member/join.do">회원가입</a>
<%           
           }else{
%>
         <a href="<%=request.getContextPath() %>/logout.do">로그아웃</a> 
<%
           }
%>
           
      </div>
    </div>
  </header>

  <nav id="menu">
    <ul>
      <li> 
        <a href="<%=request.getContextPath() %>/subex.jsp" class="x">타슈란</a>
        <ul class="y">

          <li><a href="<%=request.getContextPath() %>/subex.jsp">타슈소개</a></li>
          <li><a href="<%=request.getContextPath() %>/use.html">이용방법</a></li>

        </ul>
      </li>
      <li> 
        <a href="<%=request.getContextPath() %>/stationMap.do" class="x1">대여소 조회</a>
        <ul class="y">
          <li><a href="<%=request.getContextPath() %>/stationMap.do">대여소 조회</a></li>
<%
           if(mem==null){
%>              
          <li><a href="<%=request.getContextPath() %>/station/memStationList.do">대여소 목록</a></li>
<%           
           }else if(mem.getStatus()==1 || mem.getStatus()==2){
%>
          <li><a href="<%=request.getContextPath() %>/station/memStationList.do">대여소 목록</a></li>
<%
           }else if(mem.getStatus()==0){
%>
       <li><a href="<%=request.getContextPath() %>/stationList_admin.do">대여소 목록</a></li>
<%
           }
%>
        </ul>
      </li>
      
      <li> 
        <a href="<%=request.getContextPath() %>/paymentReady.do" class="x2">이용권 결제</a>
        <ul class="y1">
          <li><a href="<%=request.getContextPath() %>/paymentReady.do">이용권 결제</a></li>
        </ul>
      </li>
      <li> 
        <a href="<%=request.getContextPath() %>/course/redirect.do" class="x3">코스</a>
        <ul class="y1">
          <li><a href="<%=request.getContextPath() %>/course/redirect.do">추천코스</a></li>
        </ul>
      </li>
      <li> 
        <a href="<%=request.getContextPath() %>/checkAnswer.do" class="x4">코칭</a>
        <ul class="y1">
          <li><a href="<%=request.getContextPath() %>/checkAnswer.do">코칭</a></li>
        </ul>
      </li>
      <li> 
        <a href="<%=request.getContextPath() %>/notice/redirect.do" class="x5">공지사항</a>
        <ul class="y1">
          <li><a href="<%=request.getContextPath() %>/notice/redirect.do">공지사항</a></li>
        </ul>
      </li>


      <li> 
<%           
           if(mem==null || mem.getStatus()==1 || mem.getStatus()==2){
%>
        <a href="<%=request.getContextPath() %>/myTashu.do" class="x6">회원정보</a>
<%
           }else if(mem.getStatus()==0){
%>
       <a href="<%=request.getContextPath() %>/member/memberList.do" class="x6">회원정보</a>
<%
           }
%>
        <ul class="y2">
<%           
           if(mem==null || mem.getStatus()==1 || mem.getStatus()==2){
%>
           <li><a href="<%=request.getContextPath() %>/myTashu.do">회원정보</a></li>
<%
           }else if(mem.getStatus()==0){
%>
          <li><a href="<%=request.getContextPath() %>/member/memberList.do">회원정보</a></li>
<%
           }
%>
          <li><a href="<%=request.getContextPath() %>/payment/paymentList.do">결제이력</a></li>
          <li><a href="<%=request.getContextPath() %>/rental/rentList.do">대여이력</a></li>
        </ul>
      </li>
      
    </ul>
  </nav>


<div id="subCont">
    <div class="scont_wrap">
    
      <div id="sublocation">
       <div id="subTashu" class="sub" style="display: block;">
         <h2>
           대여소 조회
           <span>TA-SHU Introduction</span>
         </h2>
         <ul class="link">
           <li id="depth_1" class="on">
             <a href="<%=request.getContextPath() %>/stationMap.do">
                대여소 조회
             </a>
           </li>
           <li id="depth_2">
           
           <%
           if(mem==null){
%>              
         <a href="<%=request.getContextPath() %>/station/memStationList.do">대여소 목록</a>
<%           
           }else if(mem.getStatus()==1 || mem.getStatus()==2){
%>
        <a href="<%=request.getContextPath() %>/station/memStationList.do">대여소 목록</a>
<%
           }else if(mem.getStatus()==0){
%>
       <a href="<%=request.getContextPath() %>/stationList_admin.do">대여소 목록</a>
<%
           }
%>
   
   
           </li>
         </ul>
       </div>
     </div>  
     
          
     <div class="subcontents">
       <div id="location">
         <h2>대여소 조회</h2>
       </div>
       <div id="cont_wrap">
         <div class="mytashuArea">
         
           <h2 class="tashu_h4">대여소 조회<h2>
                     
               
                     <select name="area" id="area">
                           <option>생활권을 선택해주세요</option>
                           <option value="1생활권">1생활권</option>
                           <option value="2생활권">2생활권</option>
                           <option value="3생활권">3생활권</option>
                      </select>
                      <select name="dong" id="dong">
                      <option>원하는 동을 선택해주세요</option><br><br> 
                      </select>
                       
                      <!-- <input type="button" value="확인"  onClick="panTo()" name="check" id="check"><br><br> -->
                      <input type="button" value="확인" onClick="panTo()" name="check" id="check"><br><br>
                      <div id="result"> </div>
               
                     <!-- 지도를 표시할 div 입니다 ------------------------------------------------------------------------------------>

         
         
         
         
         </div>
         </div>
     </div>
   </div>
<!--    <div id="map"></div> -->
                    <div id="map"></div>
                  
                     <script type="text/javascript"
                        src="//dapi.kakao.com/v2/maps/sdk.js?appkey=6a565fe5be54a82849d0d5e2fa1514b6">
                     </script>
                     
               <%
                  //동기방식(ajax없이)
                 
                  List<StationVO> stationList = (List<StationVO>)request.getAttribute("stationList");
                  List<StationVO> stationList_bike = (List<StationVO>)request.getAttribute("stationList_bike");
               
               %>
                     <script>
                     function setMyPosition(positions, map){
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
                               console.log(positions);
                        
                             var content = '<div class="wrap">' + 
                             '    <div class="info">' + 
                             '        <div class="title">' + 
                                       positions[i].title + 
                             '            <div class="close" onclick="closeOverlay()" title="닫기"></div>' + 
                             '        </div>' + 
                             '        <div class="body">' + 
                             '            <div class="img">' +
                             '                <img src="<%=request.getContextPath() %>/images/logo.png" width="80" height="70">' +
                             
                             '           </div>' + 
                             '            <div class="desc">' + 
                              '                <div class="ellipsis"> 대여가능 자전거 : '+ (bicycles[i].station_locker-bicycles[i].station_cnt) +' 대</div>' +    
                             '            </div>' + 
                             '        </div>' + 
                             '    </div>' +    
                             '</div>';
                             
                             var overlay = new kakao.maps.CustomOverlay({
                                 content: content,
                                 map: map,
                                 position: marker.getPosition()       
                             });
                             
                             //console.log(content);
                            // console.log(bicycles);
                             kakao.maps.event.addListener(marker, 'click', function() {
                                 overlay.setMap(map);
                             });
               
                             // 커스텀 오버레이를 닫기 위해 호출되는 함수입니다 
                             function closeOverlay() {
                                 overlay.setMap(null);     
                             }
                          }// for문 엔드
                     } 
                     
                     var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
                         mapOption = { 
                             center: new kakao.maps.LatLng(36.499384,127.269759), // 지도의 중심좌표 : 세종시
                             level: 3 // 지도의 확대 레벨
                         };
                     
                     // 지도를 표시할 div와  지도옵션으로  지도를 생성합니다
                     var map = new kakao.maps.Map(mapContainer, mapOption); 
                     
                     // 마커를 표시할 위치와 title 객체 배열입니다 
                           var positions = [];
                           <%
                           for(StationVO stvo : stationList) {
                           %>
                              var ele = 
                               {
                                   title: '<%=stvo.getStation_name()%>', 
                                   latlng: new kakao.maps.LatLng(<%=stvo.getStation_y_pos()%>, <%=stvo.getStation_x_pos()%>)
                               };
                              positions.push(ele);
                           <%
                           } //for문 end   
                           %>
                           
                           // 대여 반납 정보를 표시할..
                           var bicycles = [];
                           <%
                           for(StationVO bike_info : stationList_bike){
                           %>
                              var ele =
                                 {
                                    station_id : '<%=bike_info.getStation_id()%>',
                                    station_locker : '<%=bike_info.getStation_locker()%>',
                                    station_name : '<%=bike_info.getStation_name()%>',
                                    station_cnt : '<%=bike_info.getCnt()%>'
                                 };
                              bicycles.push(ele);
                           <%
                           }// for문 end
                           %>
                           
                     // 대여소 전체 출력
                     // 마커 이미지의 이미지 주소
                     var imageSrc = "https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/markerStar.png"; 
                     setMyPosition(positions, map); 
                     
                   
                     </script>
   
   
</div> 





































  <div id="footer">
    <div class="footCont">
      <div class="footAddr">
        <address>
          <span>대전광역시 (35242) 대전광역시 서구 둔산로 100(둔산동) / 대표자 : 허태정 / 사업자등록번호 : 305-83-00024 </span>
          <span>대전광역시 시설관리공단 (34123) 대전광역시 유성구 엑스포로 326(원촌동) / 대표자 : 설동승 / 사업자등록번호 : 314-82-07247</span>
          <span>콜센터: 1899-2282 &nbsp; &nbsp; 팩스: (042)610-1829  </span>
        </address>
        <p class="copy">Copyright &copy; 2012 대전광역시, 대전광역시시설관리공단. All Rights Reserved.</p>
      </div>
    </div>
  </div>









</body>
</html>
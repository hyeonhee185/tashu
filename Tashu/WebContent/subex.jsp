<%@page import="kr.or.ddit.member.vo.MemberVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>타슈란</title>
<link rel="icon" href="images/logo.png">
<link rel="stylesheet" href="subex.css">
<script src="../js/jquery-3.6.0.min.js"></script>

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
	        <a href="<%=request.getContextPath() %>/login.do">로그인</a>
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
          <li><a href="<%=request.getContextPath() %>/use.html">서비스 안내</a></li>
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
	        타슈란
	        <span>TA-SHU Introduction</span>
	      </h2>
	      <ul class="link">
	        <li id="depth_1" class="on">
	          <a href="<%=request.getContextPath() %>/subex.jsp">
	          	타슈소개
	          </a>
	        </li>
	        <li id="depth_2">
	          <a href="<%=request.getContextPath() %>/use.html">서비스 안내</a>
	        </li>
	      </ul>
	    </div>
	  </div>  
	  
	  
	  
	  <div class="subcontents">
	    <div id="location">
	      <h2>타슈소개</h2>
	    </div>
	    <div id="cont_wrap">
	      <div class="mytashuArea">
	        <h4 class="tashu_h4">시민 공영자전거 타슈</h4>
	        <p>타슈 공영자전거시스템의 대여와 반납이 이루어지는 자전거 정류장을 스테이션이라고 합니다. <br>
	           스테이션은 무인으로 대여와 반납이 이루어지며, 임의의 스테이션에서 '대여'하여 임의의 스테이션에서 '반납'하는
	           일종의 대중교통 수단입니다. 
	        </p>
	        <h4 class="tashu_h4">저탄소 녹색성장자전거 이용활성화</h4> 
	        <p>대전광역시는 국가 시책에 따라 시민 여러분들이 자전거를 안전하고 편리하게 이용할 수 있도록 자전거도로의 안전시설을 확충·정비 하면서<br>
	           시민공영자전거를 운영하였습니다. 또한, 대전 시민 전체를 대상으로 하는 자전거 보험을 가입하고, 자전거 전용차로 개념을 도입하는 등 <br>
	           자전거 타는 문화를 확산시켜 대전을 자전거 타기 제일 좋은 녹색 환경 교통도시로 조성해 나가고 있습니다.
	        </p>
	        <h4 class="tashu_h4">자전거 스테이션 안내</h4>
	        
	        
	        
	        <div class="bikeStation">
	          <div class="stationBox">
	            <div class="bike_box stationTitle">
	              <a href="" id="pop_smartlocker">
	                <span>
	                  <img src="images/smartlocker.jpg" alt="스마트락">
	                </span>
	              </a>
	            </div>
	            <div class="bike_box stationCont">
	              <h2>스마트락</h2>
	              <p>스마트락은 자전거의 뒷바퀴에 부착하는 잠금장치이며 스마트폰 및 서비스 서버와의 통신을<br>
	                 통하여 승인된 사용자인 경우 위 부분에 있는 QR코드로 스마트폰을 이용한 대여기능을<br> 지원합니다.
	              </p>
	            </div>
	          </div>
	        </div>
	        
	        
	        <div class="bikeStation">
	          <div class="stationBox">
	            <div class="bike_box stationTitle">
	              <a href="" id="pop_smartlocker">
	                <span>
	                  <img src="images/station_kiosk1.gif" alt="키오스크">
	                </span>
	              </a>
	            </div>
	            <div class="bike_box stationCont">
	              <h2>키오스크</h2>
	              <p>관리자를 대신하여 자전거 대여와 반납을 담당하는 장치를 키오스크라고 합니다.<br>
	                 공영자전거 정회원일 경우 교통카드로 사용 가능한 신용카드는 회원카드로 등록할 수<br> 
	                 있으며 티머니 선불형 교통카드로 일일권을 결제할 수 있습니다.
	              </p>
	            </div>
	          </div>
	        </div>
	        
	        
	        <div class="bikeStation">
	          <div class="stationBox">
	            <div class="bike_box stationTitle">
	              <a href="" id="pop_smartlocker">
	                <span>
	                  <img src="images/station_bike1.gif" alt="공영자전거">
	                </span>
	              </a>
	            </div>
	            <div class="bike_box stationCont">
	              <h2>공영자전거</h2>
	              <p>공영자전거는 누구나 편리하게 이용할 수 있도록 설계되었으며, 가볍고 내구성이 <br>
	              강한 소재를 적용하여 안전과 편의성을 최대한 반영하였습니다.
	              </p>
	            </div>
	          </div>
	        </div>
	        
	        <div class="bikeStation">
	          <div class="stationBox">
	            <div class="bike_box stationTitle">
	              <a href="" id="pop_smartlocker">
	                <span>
	                  <img src="images/station_holder1.gif" alt="거치대">
	                </span>
	              </a>
	            </div>
	            <div class="bike_box stationCont">
	              <h2>거치대</h2>
	              <p>거치대는 자전거를 결혹해주는 잠금장치가 부착되어 있어 자전거 강제 탈거가 불가능<br>합니다.<br>
	                 거치대 위 부분에 있는 QR코드는 스마트폰을 이용한 대여기능을 지원하며 대여카드를<br>
	                 이용한 대여기능도 지원합니다.<br>
	                 사용자는 키오스크 및 스마트폰으로 대여완료 후 잠금장치가 열리면 자전거를 앞으로 땅겨
	                 분리한 후 이용할 수 있습니다.
	              </p>
	            </div>
	          </div>
	        </div>
	        
	        
	        
	        
	        
	      </div>
	    </div>
	  </div>
    </div>
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
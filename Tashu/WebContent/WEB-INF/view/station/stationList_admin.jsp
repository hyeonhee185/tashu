<%@page import="kr.or.ddit.member.vo.MemberVO"%>
<%@page import="kr.or.ddit.station.vo.StationVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html> 
<html>
<head>
<meta charset="UTF-8">
<title>대여소 관리 페이지 (관리자)</title>
<link rel="icon" href="images/logo.png">
<link rel="stylesheet" href="/Tashu/css/stationList_admin.css">
<script type="text/javascript" src="<%=request.getContextPath()%>/js/jquery-3.6.0.min.js"></script>
<script type="text/javascript">

//팝업창 open 함수
function popup(){
	var url = "<%=request.getContextPath()%>/station/newStation.do";
	var name = "popup test";
	var option = "width = 600, height = 500, top = 100, left = 200, location = no"
	window.open(url, name, option);
}
	
$(function(){
	$("#addStationBtn").on("click", function(){
		// 팝업창 오픈 --> 서블릿 호출, jsp페이지 호출됨
		popup();
	});
	
	
	$(".deleteStationBtn").on("click", function(){

		var deleteStationBtn = $(this);
		var tr = deleteStationBtn.parent().parent();
		var td = tr.children();
		var stationName = td.eq(0).text();
		
 		location.href="<%=request.getContextPath()%>/station/deleteStation.do?stationName="+stationName;
 		
	});
	
});
</script>

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
          <li><a href="<%=request.getContextPath() %>/tashuService.do">이용방법</a></li>

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
	          <a href="<%=request.getContextPath() %>/stationList_admin.do" id="use">대여소 목록</a>
	        </li>
	      </ul>
	    </div>
	  </div>  
	 
	  <div class="subcontents">
	    <div id="location">
	      <h2>대여소 목록</h2>
	    </div>
	    <div id="cont_wrap">
	      <div class="mytashuArea">
	      
	      
			<h2 class="tashu_h4">대여소 관리 페이지 (관리자)<h2>
			<%
				List<StationVO> sationList = (List<StationVO>)request.getAttribute("stationList");
			%>
			<input type="button" id="addStationBtn" value="대여소 추가" ><br><br>

			<table border="1">
			<tr>
				<th>정류소 이름</th><th>생활권</th><th>구</th><th>동</th><th>도로명주소</th><th>라커 개수</th><th>위도</th><th>경도</th><th>관리</th>
			</tr>
			<%
				for(StationVO stationVo : sationList) {
			%>
			<tr class = 't1'>
				<td id="stname"><%=stationVo.getStation_name()%></td> 
				<td><%=stationVo.getStation_area()%></td>
				<td><%=stationVo.getStation_gu()%></td>
				<td><%=stationVo.getStation_dong()%></td>
				<td><%=stationVo.getStation_addr()%></td>
				<td><%=stationVo.getStation_locker()%></td>
				
				<td><%=stationVo.getStation_y_pos()%></td>
				<td><%=stationVo.getStation_x_pos()%></td>
			
				<td>&nbsp;&nbsp;<input type="button" class="deleteStationBtn" value="삭제">&nbsp;</td>
			</tr>
			<% 		
				}
			%>	
			</table>
			
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
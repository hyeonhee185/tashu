<%@page import="kr.or.ddit.member.vo.MemberVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8"> 
<title>대전 시민공영자전거 타슈</title> 
<link rel="icon" href="images/logo.png">
<link rel="stylesheet" href="../css/outstyle.css">
<link rel="stylesheet" href="main.css">
<script src="../js/jquery-3.6.0.min.js"></script>

<script type="text/javascript">
	function rent(url){
		window.open(url,"rent","width=600, height=920");
	}
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
  <div class="conBox01">
    <p class="mainCont">
      <img src="images/main_title.png" alt="언제,어디서나,자유롭게">
    </p>
    <ul>
      <li>
        <a href="javascript:rent('rental/rentMain.do')">
          <span>
            <img src="images/main_box1.png" alt="대여/반납">
          </span>
          <p>대여/반납</p>
        </a>
      </li>
      <li>
        <a href="<%=request.getContextPath() %>/checkAnswer.do">
          <span>
            <img src="images/main_box2.png" alt="코칭">
          </span>
          <p>코칭</p>
        </a>
      </li>
      <li>
        <a href="<%=request.getContextPath() %>/stationMap.do">
          <span>
            <img src="images/main_box3.png" alt="대여소조회">
          </span>
          <p>대여소 조회</p>
        </a>
      </li>
    </ul>
  </div>
  
  <div class="conBox02">
    <div class="mainArea">
      <h2>저탄소 녹색성장 1등 도시 대전</h2>
      <div class="center">
        <ul>
          <li class="health">
            <p>건강한 자전거 도시</p>
            <span>자전거 이용의 생활화를 통한<br>시민건강 증진 실현</span>
          </li>
          <li class="clean">
            <p>깨끗한 자전거 도시</p>
            <span>자전거 교통수단 분담률을 향상시켜<br>CO2 발생 감소실현</span>
          </li>
          <li class="city">
            <p>녹색 성장 선도 도시</p>
            <span>국가 비전인 "저탄소 녹색성장" 실현</span>
          </li>        
        </ul>
      </div>
    </div>
  </div>
  
  <div class="conBox03">

				<div class="wrapper">
				        <h2>대여소 안내</h2>
				  <div class="cols">
				      <div class="col" ontouchstart="this.classList.toggle('hover');">
				        <div class="container">
				<!--           <div class="front" style="background-image: url(https://unsplash.it/500/500/)"> -->
				          <div class="front">
				            <div class="inner">
				              <span><img src="images/rental_icon1.png" alt="지도"></span>
				<!--               <p>Diligord</p> -->
				            </div>
				          </div>
				          <div class="back" style="background-image: url(images/dae.jpg); background-size:cover; background-position: center;">
				            <div class="inner">
				<!--               <p>지하철 출입구, 버스정류장, 주택단지, 관공서, 학교, 은행 등 생활 내 통행장소를 중심으로 -->
				<!-- 			  설치되어 운영중에 있습니다. </p> -->
				            </div>
				          </div>
				        </div>
				      </div>
				      <div class="col" ontouchstart="this.classList.toggle('hover');">
				        <div class="container">
				          <div class="front">
				<!--           <div class="front" style="url(https://unsplash.it/511/511/)"> -->
				            <div class="inner">
				              <span><img src="images/rental_icon2.png" alt="자전거대여소"></span>
				            </div>
				          </div>
				          <div class="back"  style="background-image: url(images/dae2.jpg); background-size:cover; background-position: center;">
				            <div class="inner">
				<!--               <p>자전거 대여와 반납이 무인으로 이루어지는 정류장 형태의 공간을 대여소라고 합니다. </p> -->
				            </div>
				          </div>
				        </div>
				      </div>
				      <div class="col" ontouchstart="this.classList.toggle('hover');">
				        <div class="container">
				          <div class="front">
				            <div class="inner">
				              <span><img src="images/rental_icon3.png" alt="하트"></span>
				            </div>
				          </div>
				          <div class="back" style="background-image: url(images/dae3.jpg); background-size:cover; background-position: center;">
				            <div class="inner">
				<!--               <p>대여소는 주변 생활시설에 접근 및 시민들의 이용이 편리한 장소를 중심으로 설치되어 운영 중에 있습니다.</p> -->
				            </div>
				          </div>
				        </div>
				      </div>
				      <div class="col" ontouchstart="this.classList.toggle('hover');">
				        <div class="container">
				          <div class="front">
				            <div class="inner">
				              <span><img src="images/rental_icon4.png" alt="대여"></span>
				            </div>
				          </div>
				          <div class="back" style="background-image: url(images/dae4.jpg); background-size:cover; background-position: center;">
				            <div class="inner">
				<!--               <p>장소에 구애받지 않고 대여소가 설치된 곳이면 어디에서나 자전거를 대여하고 반납할 수 있습니다. </p> -->
				            </div>
				          </div>
				        </div>
				      </div>
				    </div>
				 </div>
  
  
  </div>  
  <div class="conBox04">
      <ul>
      <li>
        <div>
          <span>
          <p>지하철 출입구, 버스정류장,<br>주택단지, 관공서, 학교, 은행 등<br>
          생활 내 통행장소를 중심으로<br>설치되어 운영중에 있습니다.</p>
          </span>
        </div>
      </li>
      <li>
        <div>
          <span>
          <p>자전거 대여와 반납이<br>무인으로 이루어지는<br>
		  정류장 형태의 공간을<br>대여소라고 합니다.</p>
          </span>
        </div>
      </li>
      <li>
        <div>
          <span>
          <p>대여소는 주변 생활시설에<br>접근 및 시민들의 이용이<br>
          편리한 장소를 중심으로<br>설치되어 운영 중에 있습니다.</p>
          </span>
        </div>
      </li>
      <li>
        <div>
          <span>
          <p>장소에 구애받지 않고<br>대여소가 설치된 곳이면<br>
          어디에서나 자전거를 대여하고<br>반납할 수 있습니다.</p>
          </span>
        </div>
      </li>
    </ul>
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
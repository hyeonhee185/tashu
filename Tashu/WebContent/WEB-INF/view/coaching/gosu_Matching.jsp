<%@page import="kr.or.ddit.member.vo.MemberVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>코칭</title>
<link rel="icon" href="images/logo.png">
<link rel="stylesheet" href="/Tashu/css/gosu_Matching.css">
<script type="text/javascript" src="<%=request.getContextPath()%>/js/jquery-3.6.0.min.js"></script>
<script type="text/javascript">

$(function(){
	$.ajax({
		url : "<%=request.getContextPath()%>/coaching/matchingNorMem.do",
		dataType : "json",
		async : false,
		success : function(result){
			var str ="";
			
			if (result.length != 0) {
			/* 	str += "<h1>코칭 요청한 회원</h1>"; */
				str +="<table border='1'>";
				str +="<tr><th>사진</th><th>회원 아이디</th><th>기간</th><th>코칭속도</th><th>배우는이유</th></tr>";
					
				$.each(result, function(i,v){
		
					str += '<tr style="text-align : center">';
					str +="<td><img class = 'pimg' src='<%=request.getContextPath() %>/images/person.png'></td>";
					str += '<td>' + v.mem_id + '</td>';
					str += '<td>' + v.ansc_4 + '</td>';
					str += '<td>' + v.ansc_5 + '</td>';
					str += '<td>' + v.ansc_6 + '</td>';
					str += '</tr>';
					
				})
				str += "</table>";
			} else {
				//alert('매칭 회원이 없습니다.');
				
				str+='<img src="<%=request.getContextPath() %>/images/img_search_nothing.jpg"><br>';
				str+="매칭된 회원이 없습니다.";	
				
				<%-- location.href="<%=request.getContextPath()%>/main.jsp"; --%>
			}
		
			$("#normalMemList").html(str);
		},
		error : function(xhr){
			alert(xhr.status);
		}
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
	        코칭
	        <span>TA-SHU Coaching</span>
	      </h2>
	      <ul class="link">
	        <li id="depth_1" class="on">
	          <a href="<%=request.getContextPath() %>/checkAnswer.do">
	          	코칭
	          </a>
	        </li>
	      </ul>
	    </div>
	  </div>  
	  
	  <div class="subcontents">
 <div id="location">
<h2>코칭</h2>
</div>
	    <div id="cont_wrap">
	    <div class="mytashuArea">
	    
	    <h2 class="tashu_h4">회원 신청 List<h2>
	    <br><br>
<div id="normalMemList"></div>
</div>
</div>
	  </div>
    </div>
  </div>
 
<div id="footer">
		<div class="footCont">
			<div class="footAddr">
				<address>
					<span>대전광역시 (35242) 대전광역시 서구 둔산로 100(둔산동) / 대표자 : 허태정 /
						사업자등록번호 : 305-83-00024 </span> <span>대전광역시 시설관리공단 (34123) 대전광역시
						유성구 엑스포로 326(원촌동) / 대표자 : 설동승 / 사업자등록번호 : 314-82-07247</span> <span>콜센터:
						1899-2282 &nbsp; &nbsp; 팩스: (042)610-1829 </span>
				</address>
				<p class="copy">Copyright &copy; 2012 대전광역시, 대전광역시시설관리공단. All
					Rights Reserved.</p>
			</div>
		</div>
	</div>

			
</body>
</html>
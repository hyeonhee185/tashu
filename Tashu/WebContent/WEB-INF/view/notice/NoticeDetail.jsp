<%@page import="kr.or.ddit.member.vo.MemberVO"%>
<%@page import="kr.or.ddit.notice.vo.NoticeVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%
	NoticeVO vo = (NoticeVO)request.getAttribute("vo");
%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="icon" href="../images/logo.png">
<title>공지사항</title>
<link rel="stylesheet" href="/Tashu/css/NoticeList3.css">
<script src = "<%=request.getContextPath() %>/js/jquery-3.6.0.min.js"></script>
<script src = "<%=request.getContextPath() %>/js/bootstrap.min.js"></script>
<script src = "<%=request.getContextPath() %>/js/board.js"></script>
<script>
<%-- $(function(){
	
	NoticeReplyList(<%=vo.getBno()%>);
	
	$('#saveabtn').on('click',function(){
		savenoticeanswer(<%=vo.getBno()%>,$(this).prev().val(),'귀찮아','test'); //<!-- 댓글작성자 이름 들어갈것임-->,id 들어갈것
	});
}); --%>

// $("#deleteBtn").on("click", function(){
<%--     $("#boardForm").attr("action", "<%=request.getContextPath() %>/notice/BoardDelete.do"); --%>
//     $("#boardForm").submit();
//  })
 
//  $(function(){
	 
// 	 $("#boardForm").click(function(){
// 		alert("실행은됨") 
// 	 });
//  });
 

</script>
<style>
#t1{
	width : 300px;
}
#t2{
	font-size: 0.7em;
}

#ealist1{
	border-bottom: 1px solid black;
}
#ealist2{
	font-size : 5px;
}
#ealist3{
	border-bottom: 1px solid black;
}
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
		 <li><a href="stationList_admin.do">대여소 목록</a></li>
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
		 <a href="member/memberList.do" class="x6">회원정보</a>
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
		 	<li><a href="member/memberList.do">회원정보</a></li>
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
	        공지사항
	        <span>Customer Center</span>
	      </h2>
	      <ul class="link">
	        <li id="depth_1" class="on">
	          <a href="<%=request.getContextPath() %>/notice/redirect.do">
	          	공지사항
	          </a>
	        </li>

	    </div>
	  </div>  
	  
			 
	  <div class="subcontents">
	    <div id="location">
	      <h2>공지사항</h2>
	    </div>
	    <div id="cont_wrap">
	      <div class="mytashuArea">
	      
	        <h2 class="tashu_h4">공지사항</h2>
				<form id="boardForm">
				<input type="hidden" name="bno" id="bno" value="<%=vo.getBno() %>">
				
				<table border = "1">
					<tr>
						<td id = "t1">제목 : <%=vo.getTitle() %></td>
					
						<td id = "t2">작성자 : <%=vo.getWriter() %>, 작성일 : <%=vo.getRegdate() %>, 조회수 : <%=vo.getViewcnt() %></td>
					</tr>
					<tr>
						<td colspan = "3"><%=vo.getContent() %></td>
					</tr>
				</table>
				<div class ="btnBox">
					<input class="btn" type = "button" value = "목록으로" onclick = "location.href='/Tashu/notice/redirect.do'">
						<%
						
					        if(mem==null || mem.getStatus()==1 || mem.getStatus()==2){
				%>
				<%
					        }else if(mem.getStatus()==0){
				%>
					<input class="btn"type="button" value="삭제하기" onclick = "location.href='/Tashu/notice/BoardDelete.do?bno=<%=vo.getBno() %>'">
					
				<%
					        }
				%>
					</div>
					
					
					
				</form>
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
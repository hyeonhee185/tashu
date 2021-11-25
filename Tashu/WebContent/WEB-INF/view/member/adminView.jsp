<%@page import="kr.or.ddit.member.vo.MemberVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="/Tashu/css/adminView.css">
<script type="text/javascript" src="<%=request.getContextPath()%>/js/jquery-3.6.0.min.js"></script>
<script>
$(function(){


$("#memUpdateBtn").on("click", function(){
	      $("#memberForm").attr("action", "<%=request.getContextPath()%>/member/adminUpdateForm.do");
	      $("#memberForm").submit(); // 
	   });

	   $("#memDeleteBtn").on("click", function(){
	      $("#memberForm").attr("action", "<%=request.getContextPath()%>/member/adminDelete.do");
	      $("#memberForm").submit(); // 
	   });
	   $("#memList").on("click", function(){
			location.href="<%=request.getContextPath() %>/member/memberList.do";
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
						회원정보 <span>Membership Lounge</span>
					</h2>
					<ul class="link">
											<%	        
	        if(mem==null || mem.getStatus()==1 || mem.getStatus()==2){
%>
        <li id="depth_1" class="on"><a id="use" href="<%=request.getContextPath() %>/myTashu.do" class="x6">회원정보</a></li>
<%
	        }else if(mem.getStatus()==0){
%>
		<li id="depth_1" class="on"> <a id="use" href="<%=request.getContextPath() %>/member/memberList.do" class="x6">회원정보</a></li>
<%
	        }
%>
						<li id="depth_1" class="on"><a href="<%=request.getContextPath() %>/payment/paymentList.do"> 결제이력 </a></li>
						<li id="depth_1" class="on"><a href="<%=request.getContextPath() %>/rental/rentList.do"> 대여이력 </a></li>
					</ul>
				</div>
			</div>
  
	<%
		MemberVO memvo = (MemberVO)request.getAttribute("memberVO");
	%>
	
	
	<div class="subcontents">
	<div id="location">
	<h2>회원 정보 조회</h2>
	 </div>
	<form id="memberForm">
		<input type="hidden" name="mem_id" id="mem_id" value="<%=memvo.getMem_id()%>">
		<table id="table">
			<tbody>
				<tr>
					<td>회원ID</td>
					<td><%=memvo.getMem_id()%></td>
				</tr>
				<tr>
					<td>비밀번호</td>
						<td><%=memvo.getMem_pass()%></td>
				</tr>
				
				<tr>
					<td>회원이름</td>
						<td><%=memvo.getMem_name()%></td>
				</tr>
				<tr>
					<td>전화번호</td>
					<td><%=memvo.getMem_tel()%></td>
				</tr>
				<tr>
					<td>우편번호</td>
					<td><%=memvo.getMem_zip()%></td>
				</tr>
				<tr>
					<td>주소</td>
					<td><%=memvo.getMem_add1()%></td>
				</tr>
				<tr>
					<td>주소2</td>
					<td><%= memvo.getMem_add2()%></td>
				</tr>
				<tr>
					<td colspan="2" style="text-align: center;">
						<input class="btn" type="button" value="수정" id="memUpdateBtn">
						<input class="btn" type="button" value="탈퇴" id="memDeleteBtn">
						<input class="btn" type="button" value="목록보기" id="memList">
					</td>
				</tr>

			</tbody>
		</table>
	</form>
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
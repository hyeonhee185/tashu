<%@page import="kr.or.ddit.member.vo.MemberVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원정보</title>
<link rel="icon" href="images/logo.png">
<link rel="stylesheet" href="/Tashu/css/myTashu.css">
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<script type="text/javascript" src="<%=request.getContextPath()%>/js/jquery-3.6.0.min.js"></script>
<script src="../../js/jquery-3.6.0.min.js"></script>

<script>
$(function(){


	$("#memUpdateBtn").on("click", function(){
	      $("#memberForm").attr("action", "<%=request.getContextPath()%>/member/memberUpdateForm.do");
	      $("#memberForm").submit(); // 
	   });

	   $("#memDeleteBtn").on("click", function(){
	      $("#memberForm").attr("action", "<%=request.getContextPath()%>/memberDelete.do");
	      $("#memberForm").submit(); //
	   });
	});
</script>

<title>마이페이지</title>
<link rel="stylesheet" href="/Tashu/css/myTashu.css">
</head> 
<body>
	<%
	 HttpSession ssion = request.getSession();
		MemberVO memVo = (MemberVO)ssion.getAttribute("member");
	

	%>
<header>
	<div class="headUtil">
		<div class="fr">
			<a href="<%=request.getContextPath() %>/main.jsp">HOME</a> <a href="<%=request.getContextPath() %>/logout.do">로그아웃</a>

		</div>
	</div>
	</header>
<nav id="menu">
    <ul>
      <li> 
        <a href="<%=request.getContextPath() %>/subex.jsp" class="x">타슈란</a>
        <ul class="y">

          <li><a href="<%=request.getContextPath() %>/subex.jsp">타슈소개</a></li>
          <li><a href="<%=request.getContextPath() %>/tashuService.do">서비스 안내</a></li>

        </ul>
      </li>
      <li> 
        <a href="<%=request.getContextPath() %>/stationMap.do" class="x1">대여소 조회</a>
        <ul class="y">
          <li><a href="<%=request.getContextPath() %>/stationMap.do">대여소 조회</a></li>
<%
	        if(memVo==null){
%>	        	
          <li><a href="<%=request.getContextPath() %>/station/memStationList.do">대여소 목록</a></li>
<%	        
	        }else if(memVo.getStatus()==1 || memVo.getStatus()==2){
%>
          <li><a href="<%=request.getContextPath() %>/station/memStationList.do">대여소 목록</a></li>
<%
	        }else if(memVo.getStatus()==0){
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
	        if(memVo==null || memVo.getStatus()==1 || memVo.getStatus()==2){
%>
        <a href="<%=request.getContextPath() %>/myTashu.do" class="x6">회원정보</a>
<%
	        }else if(memVo.getStatus()==0){
%>
		 <a href="member/memberList.do" class="x6">회원정보</a>
<%
	        }
%>
        <ul class="y2">
<%	        
	        if(memVo==null || memVo.getStatus()==1 || memVo.getStatus()==2){
%>
        	<li><a href="<%=request.getContextPath() %>/myTashu.do">회원정보</a></li>
<%
	        }else if(memVo.getStatus()==0){
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
						회원정보 <span>Membership Lounge</span>
					</h2>
					<ul class="link">
											<%	        
	        if(memVo==null || memVo.getStatus()==1 || memVo.getStatus()==2){
%>
        <li id="depth_1" class="on"><a id="use" href="<%=request.getContextPath() %>/myTashu.do" class="x6">회원정보</a></li>
<%
	        }else if(memVo.getStatus()==0){
%>
		<li id="depth_1" class="on"> <a id="use" href="member/memberList.do" class="x6">회원정보</a></li>
<%
	        }
%>
						<li id="depth_1" class="on"><a href="<%=request.getContextPath() %>/payment/paymentList.do"> 결제이력 </a></li>
						<li id="depth_1" class="on"><a href="<%=request.getContextPath() %>/rental/rentList.do"> 대여이력 </a></li>
					</ul>
				</div>
			</div>
	
			


	 <div class="subcontents">
	   <div id="location">
		<h2>회원 정보 조회</h2>
	 </div>
	    <div id="cont_wrap">
	 <div class="mytashuArea">
	 <div id="cont_wrap" >
	 <div class="loginArea">
	 <form id="memberForm">
	 <table id="table">
	 <tr>
	<td class="td1">
          아이디</td>
    <td>
    
     <%=memVo.getMem_id() %>
     </td>
</tr>
<tr>
          <td class="td1"> 이름</td>
          <td><%=memVo.getMem_name()%></td>
</tr>
<tr>
        <td class="td1">비밀번호</td>
        <td><%=memVo.getMem_pass() %></td>
</tr>      
<tr>
     <td class="td1">핸드폰</td>
     <td><%=memVo.getMem_tel() %></td>
</tr>
<tr>
      <td class="td1">우편번호</td>
      <td><%=memVo.getMem_zip() %></td>    
</tr>        
<tr>
     <td class="td1">주소</td>
     <td><%=memVo.getMem_add1() %></td>      
</tr>        
<tr>
     <td class="td1">상세주소</td>
     <td><%=memVo.getMem_add2() %></td>
</tr>
      </table>
     
     
     </form>	
         <br><br>
         
         
			<div class="btn_myT">
					<td colspan="2" style="text-align: center;">
						<input type="button" value="수정" id="memUpdateBtn">
						<input type="button" value="탈퇴" id="memDeleteBtn">
					</td>
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
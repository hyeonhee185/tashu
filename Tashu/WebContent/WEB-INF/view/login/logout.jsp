<%-- <%@page import="kr.or.ddit.member.vo.MemberVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<!-- <script>
 alert("로그아웃 완료. 이용해주셔서 감사합니다.");
 location.href="main.html";
</script> -->
<title>로그아웃</title>
</head>
<body>

 <form method="post" action="<%=request.getContextPath()%>/logout.do">


<script type="text/javascript">
		$(document).ready(function() {
			alert("로그아웃 완료. 이용해주셔서 감사합니다.");
			location.href = "main.html"
		});
	</script>
	
	 </form>
</body>
</html> --%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

    <%
    	session.invalidate();
    %>
    
    <script>
    alert('로그아웃 되었습니다.');
    location.href="main.html";
    
    </script>
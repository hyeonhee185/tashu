<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Session 로그인 폼 페이지</title>
</head>
<body>
<%
	//Jsp문서에서 세션은 'session'이라는 이름으로 저장되어있다.
	
	//로그인이 성공되면 해당 로그인한 사람의 id값이 'userId'라는 키값으로 세션에 저장한다.
	String mem_id=(String)session.getAttribute("mem_id");
	
%>
<%
	if(mem_id==null){	//해당 세션값이 없으면...
%>
		<form method = "post" 
			action="<%=request.getContextPath()%>/sessionLogin.do">
	
		<table style="border : 1px solid black; margin:0 auto;">
			<tr>
				<td>ID : </td>
				<td><input type="text"  name="mem_id"  placeholder="ID를 입력하세요"></td>
			</tr>
			<tr>
				<td>PASS : </td>
				<td><input type="text" name="pass" placeholder="Password를 입력하세요"></td>
			</tr>
			<tr>
				<td colspan="2" style="text-align:center;">
					<input type="submit" name="button" value="Login">
				</td>
			</tr>
		</table>
		</form>
<%
	}else{ //세션에 값이 있을때.. (즉, 로그인을 성공했을때)
%>
		<%=mem_id %>님 반갑습니다.<br><br>
		<a href="<%=request.getContextPath() %>/payment/paymentRent.do">대여</a>
		<a href="<%=request.getContextPath() %>/rental/checkRent.do">반납</a>
		<a href="<%=request.getContextPath() %>/rental/rentList.do">대여이력</a>
		<a href="<%=request.getContextPath() %>/payment/paymentList.do">결제이력</a>
		
		
		
<%
	}
%>
</body>
</html>
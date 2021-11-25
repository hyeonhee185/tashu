<%@page import="kr.or.ddit.member.vo.MemberVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원정보</title>
<link rel="icon" href="../images/logo.png">
<link rel="stylesheet" href="/Tashu/css/memberList.css">
<script type="text/javascript" src="<%=request.getContextPath()%>/js/jquery-3.6.0.min.js"></script>
<script type="text/javascript">


$(function(){
	$.ajax({
		url : "<%=request.getContextPath()%>/member/memberListAdmin.do",
		dataType : "json",
		/* async : false, */
		success : function(result){
		
			var str ="";
			str +="<table border='1'>";
			str +="<tr><th>회원 아이디</th><th>회원 이름</th><th>회원 구분</th></tr>";
			$.each(result, function(i,v){
				var st='';
				if (v.status==0) {st = '관리자'} else if(v.status==1){st = '일반'} 
				else if(v.status==2){st = '고수'}else{st = '탈퇴'};
				str += '<tr><td>';
				str += '<a href = "<%=request.getContextPath()%>/member/adminView.do?mem_id='+ v.mem_id +'">';
				str += v.mem_id+'</a></td>';
				str += '<td>' + v.mem_name + '</td>';
				str += '<td>' +st + '</td></tr>';
			})
			str += "</table>";
			$("#result").html(str);
		},
		error : function(xhr){
			alert(xhr.status);
		}
		
	});
		

  	 $('#check').on("click",function(){
		 var status = $("select[name='status']").val();
		 $.ajax({
			url : "<%=request.getContextPath()%>/member/statusMember.do",
			data : {"status" : status},
			dataType : "json",
			async : false,
			success : function(result){
				
				var str ="";
				str +="<table border='1'>";
				str +="<tr><th>회원 아이디</th><th>회원 이름</th><th>회원 구분</th></tr>";
				$.each(result, function(i,v){
					var st='';
					if (v.status==0) {st = '관리자'} else if(v.status==1){st = '일반'} 
					else if(v.status==2){st = '고수'}else{st = '탈퇴'};
					str += '<tr><td>';
					str += '<a href = "<%=request.getContextPath()%>/member/adminView.do?mem_id='+ v.mem_id +'">'
					str += v.mem_id+'</td>';
					str += '<td>' + v.mem_name + '</td>';
					str += '<td>' +st + '</td></tr>';
				})
				str += "</table>";
				$("#result").html(str);
			},
			error : function(xhr){
				alert(xhr.status);
			}
				
		});
	}); 
	$("#home").on("click", function(){
		location.href="<%=request.getContextPath() %>/main.jsp";
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
			
			
<div class="subcontents">
	    <div id="location">
	<h2>회원 리스트</h2>
	 </div>
	  <div id="cont_wrap">
	  <div class="mytashuArea">
	  <h2 class="tashu_h4">회원 관리 페이지 (관리자)<h2>
<select name="status" id="status">
	<option>구분을 선택해주세요</option>
	<option value="0">관리자</option>
	<option value="1">일반</option>
	<option value="2">고수</option>
	<option value="3">탈퇴</option>
</select>
<input type="button" value="확인" name="check" id="check">
<br><br>
<div id="result"></div>
<br><br>
<input type="button" id="home" value="첫화면으로">

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

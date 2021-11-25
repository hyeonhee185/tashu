<%@page import="kr.or.ddit.member.vo.MemberVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>코칭</title>
<link rel="icon" href="images/logo.png">
<link rel="stylesheet" href="/Tashu/css/mem_Matching.css">
<script type="text/JavaScript" src="https://developers.kakao.com/sdk/js/kakao.min.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/js/jquery-3.6.0.min.js"></script>
<script type="text/javascript">


$(function(){
	$.ajax({
		url : "<%=request.getContextPath()%>/coaching/matching.do",
		dataType : "json",
		async : false,
		success : function(result){
			var str ="";
			console.log(result.match);
			if(result.match=="no"){
				var data = result.data;
				if (data.length != 0) {
				/* 	str = "<h1>강습가능한 고수 리스트</h1>"; */
					str +="<table border='1'>";
					str +="<tr><th>사진</th><th>고수 아이디</th><th>신청하기</th></tr>";
					console.log(result.data);
						
					$.each(data, function(i,v){
					
						str += "<tr style='text-align : center'>";
						str += "<td><img class= 'pimg' src='<%=request.getContextPath() %>/images/person.png'></td><td>" + v + "</td>";
						str += '<td><input class="applyBtn" type="button" value="신청"></td></tr>';
	
					})
					str += "</table>";
					
				}else{
				
					str+='<img src="<%=request.getContextPath() %>/images/img_search_nothing.jpg"><br>';
					str+="매칭된 멘토가 없습니다.";	
					// 로그인 이동
					<%-- location.href="<%=request.getContextPath()%>/main.jsp"; --%>
					
				}
				$("#gosuList").html(str);
			}else{
				/* str = "<h1>매칭된 멘토회원</h1>"; */
				
				str +="<table border='1' >";
				str +="<tr><th>사진</th><th>고수 아이디</th><th>취소</th></tr>";
				str +="<tr style='text-align : center'><td><img src='<%=request.getContextPath() %>/images/person.png'></td><td>" +result.data+"</td><td><input class='deleteBtn' type='button' value='취소'></td></tr>";
				
				str += "</table>";
				
				$("#gosuList").html(str);
			}
		},
		
		error : function(xhr){
			alert(xhr.status);
		}
	});
	
	// 신청하기 버튼을 누르면, db에 인서트됨
	$('.applyBtn').on("click",function(){
		
		//현재 위치의 td값 
		var applyBtn = $(this);
		var tr = applyBtn.parent().parent(); 
		var td = tr.children();
		var gosuMemId = td.eq(1).text();

		 $.ajax({
			url : "<%=request.getContextPath()%>/coaching/gosuMatching.do",
			type : "get",
			data : {'gosuMemId' :gosuMemId},
			dataType : "json",
			async : false,
			success : function(result){ //result 전체, 그 중 key, value임
				
				var str ="";
				/* str +="<h1>매칭 결과</h1>"; */
				str +="<table border='1'>";
				str +="<tr><th>사진</th><th>고수 아이디</th><th>카카오톡 보내기</th></tr>";
					
					str += '<tr style="text-align : center">';
					str +="<tr style='text-align : center'><td><img src='<%=request.getContextPath() %>/images/person.png'></td><td>"+ result.gosuMemId + '</td>';
					str += '<td><input class="applyBtn"  onClick="sendLinkCustom();" type="button" value=" 카톡보내기"></td></tr>';
				
				str += "</table>";
				$("#gosuList").html(str);
			},
			error : function(xhr){
				alert(xhr.status);
			}
		}); 
		
	})
	
	// 취소 버튼을 누르면, db에 삭제
	$('.deleteBtn').on("click",function(){
		
		 $.ajax({
				url : "<%=request.getContextPath()%>/coaching/deleteMatchingResult.do",
				type : "get",
				async : false,
				success : function(result){ 
					
					var str ="";
					alert('취소 완료');
					location.href="<%=request.getContextPath()%>/checkAnswer.do";
				},
				error : function(xhr){
					alert(xhr.status);
				}
			}); 
	})
	
});
</script>

<script type="text/javascript">
    function sendLinkCustom() {
        Kakao.init("9ebb57d0a95ea8ff7a64c4c298d11050");
        Kakao.Link.sendCustom({
            templateId: 57618
        });
        alert('카카오톡 전송 완료');
        location.href="<%=request.getContextPath()%>/checkAnswer.do";
       
        
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
	      
	        <h2 class="tashu_h4">매칭된 고수회원 리스트<h2>
	        <br><br>
			
			
			  <div id="gosuList"></div>
			  <div id="gosuResult"></div>
			
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
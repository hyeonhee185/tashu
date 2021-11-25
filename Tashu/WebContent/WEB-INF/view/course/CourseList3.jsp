<%@page import="kr.or.ddit.member.vo.MemberVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>
<meta charset="UTF-8">
<link rel="icon" href="../images/logo.png">
<title>코스</title>
<script src = "<%=request.getContextPath() %>/js/jquery-3.6.0.min.js"></script>
<%-- <script src = "<%=request.getContextPath() %>../js/bootstrap.min.js"></script> --%>
<link rel="stylesheet" href="/Tashu/css/CourseList3.css">
<script src = "<%=request.getContextPath() %>/js/course.js"></script>
<script>
currentPage = 1; //전역변수

$(function(){
	listServer(1);
	
	$("#btn").on("click",function(){
		var a = $(".op:selected").val();		
		var b = $("#txt").val();
		console.log("검색데이터>>"+b);
		listServer(1,a,b);
	});
	
/* 	$("#btn").on("click",function(){
		var a = $(".op:selected").val();		
		var b = $("#txt").val();
		var c = 1;
		var param = "sel="+ a +"&dat=" + b + "&page=" + c;
		
		$.ajax({
			url : "/runningMate/event/searchEventList.do",
			type : "post",
			data : param,
			dataType : "json",
			success : function(res){
				code = '<table border = "1" id = "tb1">';
				code += '		<tr><td>번호</td><td>작성자</td><td>제목</td><td>날짜</td><td>조회수</td></tr>';
				$.each(res.datas, function(i,v){
					code += '		 <tr><td>' + v.no +'</td>';
					code += '		 	<td> ' + v.mname + '</td>';
					code += ' 			<td> ' + v.subject + '</td>';	
					code += '			<td> ' + v.date + '</td>';
					code += '			<td> ' + v.cnt + '</td></tr>';
				})	
				code += '</table>';
				$('#list').html(code);
				
				//페이지 리스트 - BS_pagination pager 활용
				pager = '<table border = "1" id = "tb2">';
				pager += '<tr class="pagination pager">';
				//이전버튼(Prev)
				if(res.sp>1){
					pager += '<td><a class="prev" href="#"><</a></td>';
				}
				//페이지 번호 출력
				for(i=res.sp; i<=res.ep;i++){
					if(currentPage == i){
						pager += '<td class="active" id = "a"><a class="paging" href="#">'+ i +'</a></td>';
					}else{
						pager += '<td id = "b"><a class="paging" href="#">'+ i +'</a></td>';
					}
				}
				//다음버튼(Next)
				if(res.ep < res.tp){
					pager += '<td><a class="next" href="#">></a></td>';
				}
				pager += '</tr>';
				pager += '</table>';
				$('#pagelist').html(pager);
			},
			error : function(xhr){
				alert(xhr.status);
			}
		})
	}); */
	
	//페이지 번호 클릭 이벤트 - delegate방식
	$('#pagelist').on('click', '.paging', function(){
		var a = $(".op:selected").val();		
		var b = $("#txt").val();
		currentPage = $(this).text().trim();
		listServer(currentPage,a,b);
	})
	
	//이전버튼 클릭 이벤트
	$('#pagelist').on('click', '.prev', function(){
		var a = $(".op:selected").val();		
		var b = $("#txt").val();
		vprev = $('.pagination .paging').first().text().trim();
		currentPage = vprev - 1;
		listServer(currentPage,a,b);
	})
			
	//다음버튼 클릭 이벤트
	$('#pagelist').on('click', '.next', function(){
		var a = $(".op:selected").val();		
		var b = $("#txt").val();
		vnext = $('.pagination .paging').last().text().trim();
		currentPage = parseInt(vnext) + 1;
		listServer(currentPage,a,b);
	})
	
})

</script>
<style>
#tb1{
	text-align: center;
	text-decoration: none;
}
#tb2{
	text-align: center;
}
#a, #b{
	width : 30px;
}
.paging, .prev, .next{
	text-decoration: none;
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
	        코스
	        <span>TA-SHU Course</span>
	      </h2>
	      <ul class="link">
	        <li id="depth_1" class="on">
	          <a href="<%=request.getContextPath() %>/course/redirect.do">
	          	추천코스
	          </a>
	        </li>
	      </ul>
	    </div>
	  </div>  



	  <div class="subcontents">
	    <div id="location">
	      <h2>코스</h2>
	    </div>
	    <div id="cont_wrap">
	      <div class="mytashuArea">
	      
	        <h2 class="tashu_h4">추천코스<h2>
	        
	        <div id="submit">
				      <form id="form">
				         <select style="width : 100px; padding : 10px; font-size : 15px">
				            <option class = "op" value = "c_title">제목</option>
				            <option class = "op" value = "c_writer">작성자</option>
				            <option class = "op" value = "c_content">글내용</option>
				         </select> 
				         <input style="width : 200px; padding : 10px; font-size : 15px" type="text" id = "txt"> 
				         <input style="width : 50px; padding : 7px; font-size : 15px" type = "button" id = "btn" class = "btn1" value = "검색">
				         <%
				 	 	HttpSession sion = request.getSession();
				 		MemberVO vo = (MemberVO)sion.getAttribute("member");
				         if(vo!=null){
				        	 if(vo.getStatus()==0){
				        %>
				         <input style="width : 60px; padding : 7px; font-size : 15px; text-align: right;" class = "btn1" type = "button" value = "글쓰기" onclick="location.href='/Tashu/course/CourseForm.do'">
				        
				        <%
				        	 }
				         }
				        %>
				      </form>
				   </div>		
	        
				  <!-- 리스트출력 -->
				    <div id="list"></div> <br>
				    
				    <!-- 페이징 -->
				    <div id="pagelist"></div>
				    
				    	
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
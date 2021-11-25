<%@page import="kr.or.ddit.member.vo.MemberVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>회원수정</title>
<link rel="icon" href="../images/logo.png">
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">

<script src="<%=request.getContextPath() %>/js/jquery-3.6.0.min.js"></script>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script src="../js/memberReg.js"></script>
<link rel="stylesheet" href="/Tashu/css/memberUpdateForm.css">


<script>
$(function(){
 
   /* 실시간체크  - 이름 */
   $('#name').on('keyup', function(){
      
      nameValue = $('#name').val().trim();
      
      //입력확인
      if(nameValue.length < 1){
         nopro(this, "이름을 입력하세요");
         return;
      }
      //글자수 체크
      if(nameValue.length < 2 || nameValue.length > 5){
         nopro(this, "2~5자 사이로 입력하세요");
         return;
      }
      //정규식- 한글만 입력하도록
      regName = /^[가-힣]{2,5}$/;
      
      if(regName.test(nameValue)){
         okpro(this);
      }else{
         nopro(this, "한글만 입력가능합니다(2~5자리)");
      }
   });
   
   
   // 우편번호 찾기
	   $('#search').on('click', function(){
	      new daum.Postcode({
	         oncomplete : function(data) {
	         
	            $('input[name=mem_zip]').val(data.zonecode);      // 우편번호(5자리)
	            $('input[name=mem_add1]').val(data.address);       // 기본주소
	            $('input[name=mem_add2]').val(data.buildingName);  // 건물명
	         }
	         
	      }).open();
	   });
      
 
   
	/* 실시간체크  - 비밀번호 */
	$('#pass').on('keyup', function(){
		
		passValue = $('#pass').val().trim();
		
		//입력확인
		if(passValue.length < 1){
			nopro(this, "비밀번호을 입력하세요");
			return;
		}
		//글자수 체크
		/* if(nameValue.length < 2 || nameValue.length > 5){
			nopro(this, "2~5자 사이로 입력하세요");
			return;
		} */
		
		//정규식- 영문대소문자, 특수문자, 숫자가 반드시 1개 이상 존재해야 함
		//전방탐색 : 찾을문자?=기준문자
		//  '.(dot)':임의의 문자 , '*?' : 적게 일치하는 (* 0개 이상, + 1개 이상)  
		regPass = /^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#$%^&*()-+]).{8,}$/;
		
		if(regPass.test(passValue)){
			okpro(this);
		}else{
			nopro(this, "대소문자,특수문자,숫자를 1개이상 입력해야 합니다(8자리 이상)");
		}
	});
	
	/* 실시간체크  - 휴대폰 */
	$('#hp').on('keyup', function(){
		
		hpValue = $('#hp').val().trim();
		
		//정규식- 010-111-2222 또는 010-3333-4444
		regHp = /^[0-9]{3}-[0-9]{3,4}-[0-9]{4}$/;
		
		if(regHp.test(hpValue)){
			okpro(this);
		}else{
			nopro(this, "올바른 형식이 아닙니다");
		}
	});
	

	/* $('#btn').on('click', function(){
				
		data = $('form').serialize();
		
		console.log(">>" + data);
		
		$.ajax({
			url : '/Tashu/member/join.do',
			type : 'post',
			data : data,
			success : function(res){
					
				if(res.sw == 'ok'){
					code = `${res.id}님 환영해요`;
				}else{
					code = `가입실패`;
				}
				$('#joinsp').html(code).css('color','red');	
			},
			error : function(xhr){
				alert(xhr.status);
			},
			dataType: 'json'
		});
		
	
	}); */
	
});
</script>
<link rel="stylesheet" href="/Tashu/css/memberUpdateForm.css">
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
	<h2>회원 정보 수정</h2>
	 </div>
    
      <!-- <form class="form-horizontal" > -->
      <div id="cont_wrap">
	  <div class="mytashuArea">
	  
	  
	  
       <form class="form-horizontal"  method="post" action="<%=request.getContextPath() %>/member/memberUpdate.do"> 
		<input type="hidden" name="mem_id" id="mem_id" value="<%=mem.getMem_id()%>">
        
         <table id="table">
         <tr class="tr1">
         <td class="td1"> 아이디</td>
         <td> <%=mem.getMem_id() %></td>
         </tr>
         <tr class="tr1">
         <td class="td1">이름</td>
         <td class="form-group">  <input class="form-control" id="name" name="mem_name" value="<%=mem.getMem_name() %>"><span class="sp"></span></td>
         </tr>
         <tr class="tr1">
         <td class="td1">비밀번호</td>
         <td class="form-group"> <input type="password" class="form-control" id="pass" name="mem_pass" value="<%=mem.getMem_pass() %>"><span class="sp"></span></td>
         </tr>
         <tr class="tr1">
         <td class="td1">핸드폰</td>
         <td class="form-group"><input class="form-control" id="hp" name="mem_tel" value="<%=mem.getMem_tel() %>"><span class="sp"></span></td>
         </tr>
         <tr class="tr1">
         <td class="td1">우편번호</td>
         <td>
         <input class="form-control" id="zip" name="mem_zip" value="<%=mem.getMem_zip() %>">
         <button type="button" id="search" class="btn btn-info">우편번호 검색</button>
         
         </td>
         </tr>
         <tr class="tr1">
         <td class="td1"> 주소</td>
         <td>
         <input class="form-control" id="add1" name="mem_add1" value="<%=mem.getMem_add1()%>">
         </td>
         </tr>
         <tr class="tr1">
         <td class="td1"> 상세주소</td>
         <td>
          <input class="form-control" id="add2" name="mem_add2" value="<%=mem.getMem_add2() %>">
         </td>
         </tr>
         
         </table>
		
         <div class="form-group">
            <div class="col-sm-offset-2 col-sm-10" id="btn">
               <button type="submit" id="submit"class="btn btn-primary">Submit</button>
              
            </div>
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
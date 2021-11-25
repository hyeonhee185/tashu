<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

    <!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
    <html>

    <head>

        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
<script type="text/javascript" src="https://service.iamport.kr/js/iamport.payment-1.1.5.js"></script>
        <title>결제페이지</title>
    </head>

    <body>

<%
	String voucher_id = (String)request.getAttribute("id");

	String price = (String)request.getAttribute("price");
%>

<script>
$(function(){
	var IMP = window.IMP; // 생략가능
    IMP.init('imp36034027'); 
   
    IMP.request_pay({
        pg: 'inicis', // version 1.1.0부터 지원.
       
        pay_method: 'card',
        
        merchant_uid: 'merchant_' + new Date().getTime(),
    
        name: '타슈 이용권', //결제권이름 
        //결제창에서 보여질 이름
        amount: <%=price%>,  //결제권 가격  
      
    
       
    }, function (rsp) {
        console.log(rsp);
        if (rsp.success) {
           $.ajax({
        	   url : "<%=request.getContextPath()%>/payment.do",
        	   data : {"voucher_id": <%=voucher_id %>},
        	   success : function(result){
        		   if (result =="OK") {
		            var msg = '결제가 완료되었습니다.';
		            alert(msg);
					location.href="<%=request.getContextPath()%>/main.jsp";
				}else{
					console.log("업데이트 실패");
					location.href="<%=request.getContextPath()%>/main.jsp";
				}
        	   },
        	   error : function(xhr){
        		  alert(xhr.staus);
        		  location.href="<%=request.getContextPath()%>/main.jsp";
        	   },
        	   dataType : "json"
        	   
        	   
           })
           	
           
           
        } else {
            var msg = '결제에 실패하였습니다.';
            msg += '에러내용 : ' + rsp.error_msg;
            alert(msg);
            location.href="<%=request.getContextPath()%>/main.jsp";
            
        }
    });
})

</script>
    </body>

    </html>






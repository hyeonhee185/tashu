<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
     String name = (String)request.getParameter("name");
     String id = (String)request.getParameter("id");
     String phone = (String)request.getParameter("phone");
     String mem = (String)request.getParameter("mem");
     String stotalPrice = (String)request.getParameter("totalPrice");
     int totalPrice = Integer.parseInt(stotalPrice);
     
     System.out.println(id);
     System.out.println(name);
 
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="js/jquery-3.6.0.min.js"></script>
<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js" ></script>
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>

<script>
IMP.init('imp32345523');

IMP.request_pay({
    pg : 'html5_inicis', // version 1.1.0부터 지원.
    pay_method : 'card',
    merchant_uid : 'merchant_' + new Date().getTime(),
    name : "<%=mem%>",
    amount : <%=totalPrice%>, //판매 가격
    buyer_name : "<%=name%>",
    buyer_tel : "<%=phone%>",
}, function(rsp) {
    if ( rsp.success ) {
            var msg = '결제가 완료되었습니다.';
       $.ajax({
           url : "<%=request.getContextPath()%>/paymentInsert.do",
           data : {"code" : rsp.imp_uid, 
                  "id" : "<%=id%>",
                 "amount" : rsp.paid_amount  
                    },   
           dataType : "json"
        })

        } else {
            var msg = '결제에 실패하였습니다.';
            msg += '에러내용 : ' + rsp.error_msg;
        }
    alert(msg);
});
</script>
</head>
<body>
</body>
</html>
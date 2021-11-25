<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset=UTF-8">
<title>Insert title here</title>
<style>

#border{
	border : 15px solid grey;
	border-top : 30px solid grey;
	border-bottom : 70px solid grey;
	border-radius : 10px;
	margin : 5px;
	
	height : 790px;
}
#mainP{
	border : 5px solid black;
	height : 785px;
	width : 540px;
}

#logo{
	position: fixed;
    top : 80px;
    left : 80px;
    width : 90px;
}
#ment1{
	position: fixed;
    top : 70px;
    left : 190px;
    height : 60px;
}
#ment2{
	position: fixed;
    top : 120px;
    left : 190px;
    height : 60px;
}
#use{
	position: fixed;
    top : 220px;
    left : 60px;
width : 350px;
}
#useD{
position: fixed;
    top : 200px;
    left : 55px;
width : 490px;
height : 360px;
	border : 2px dotted lightgrey;
}
#rent{
	border : 5px solid lightgrey;
border-radius : 10px;
	width : 180px;
	position: fixed;
    bottom : 120px;
    left : 80px;
}
#return{
	border : 5px solid lightgrey;
border-radius : 10px;
	width : 180px;
	position: fixed;
    bottom: 120px;
    right: 80px;
}
</style>
</head>
<body>
<div id="border">
	<div id="mainP">
	<img id= "logo" src="<%=request.getContextPath() %>/images/logo.png">
	<img id= "ment1" src="<%=request.getContextPath() %>/images/ment1.png">
	<img id= "ment2" src="<%=request.getContextPath() %>/images/ment2.png">
	<div id="useD">
	<img id= "use" src="<%=request.getContextPath() %>/images/use.PNG">
	</div>
	<a  href="<%=request.getContextPath() %>/rental/checkReturn.do">
	          <span>
	           <img id="rent" src="<%=request.getContextPath() %>/images/대여.jpg">
	          </span>
	        </a>
	 <a href="<%=request.getContextPath() %>/rental/checkRent.do">
	          <span>
	           <img id="return" src="<%=request.getContextPath() %>/images/반납.jpg">
	          </span>
	        </a>
	
	</div>
</div>
</body>
</html>
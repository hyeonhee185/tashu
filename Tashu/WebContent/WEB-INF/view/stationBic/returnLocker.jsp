<%@page import="kr.or.ddit.stationBic.vo.StationBicVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
function goBack(){
	location.replace("<%=request.getContextPath()%>/station/returnStationList.do");
}
function updateReturn(a,b){
		var result = confirm("자전거를 반납하시겠습니까?");
		if(result){
			location.replace("<%=request.getContextPath()%>/rental/returnUpdate.do?station_id="+a+"&locker_id="+b);
		}else{
			
		}
	
}

</script>
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
	width : 545px;
}

#logo{
	position: fixed;
    top : 80px;
    left : 80px;
    width : 90px;
}
#title{
	position: fixed;
    top : 90px;
    left : 190px;
    width : 230px;
}
.table{
border : 1px solid black; 
width : 50px; 
text-align : center; 
margin : 10px;
float : left;
}
.td1{
background-color : lightgrey; height : 50px;
}
.td2{
background-color : green; height : 50px; padding : 0px;
}
#content{
	position: fixed;
    top : 200px;
    left : 60px;
}
#back{
	border : 1px solid grey;
	border-radius : 10px;
	padding : 5px;
	position: fixed;
    bottom : 120px;
    left : 70px;
}
#btn{
margin : 0px;background-color : green; width : 45px; height : 52px;
}
</style>
</head>
<body>
<%
List<StationBicVO> stationList = (List<StationBicVO>)request.getAttribute("stationList");
%>
<div id="border">
	<div id="mainP">
		<img id= "logo" src="<%=request.getContextPath() %>/images/logo.png">
		<img id= "title" src="<%=request.getContextPath() %>/images/title.PNG">
		
<div id="content">
<%
int cnt=0;

for(StationBicVO bicVO : stationList){
	String nn = "";
	if(cnt%7==0){
		 nn = "style='clear:both'";
	}
	cnt++;
	
%>
	<table class="table" <%=nn %> style="border : 1px solid black; width : 50px; text-align : center; float : left; margin : 10px">
		<tr>
		<td><%=bicVO.getLocker_id() %></td>
		</tr>
	
		<tr>
<%
	if(bicVO.getBicycle_no()!=0){
%>	
		<td class="td1">	
		
<% 		
	}else{
%>
		<td class="td2">	
		<input type="button" id="btn" name="return" onclick="updateReturn(<%=bicVO.getStation_id() %>,<%=bicVO.getLocker_id() %>)" >
<%
	}
%>
		</td>
		</tr>
	</table>

<% 	
}
%>
		</div>
<input type="button" id="back" onclick="goBack()" value="뒤로가기">
	</div>
</div>
</body>
</html>
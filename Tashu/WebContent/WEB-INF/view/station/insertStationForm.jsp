<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>대여소 추가</title>
<link rel="icon" href="images/logo.png">
<link rel="stylesheet" href="/Tashu/css/insertStationForm.css">
<script type="text/javascript" src="<%=request.getContextPath()%>/js/jquery-3.6.0.min.js"></script>
<script type="text/javascript">
 

$(function(){
	//form에서 submit 이벤트 발생 시
	$("#stationForm").on("submit", function(){
		alert('대여소 추가완료');
		
		return true;
	});
})

</script>
</head>
<body>


<h1 id="insert"> 대여소 추가</h1>
<form id="stationForm" action="<%=request.getContextPath()%>/station/insertStation.do">
<table border="1">
<tr>
	<td class="sta">대여소 이름</td>
	<td><input type="text" name="station_name" id="station_name"></td>
</tr>
<tr>
	<td>생활권</td>
	<td><input type="text" name="station_area" id="station_area"></td>
</tr>
<tr>
	<td class="sta">구</td>
	<td><input type="text" name="station_gu" id="station_gu"></td>
</tr>
<tr>
	<td>동</td>
	<td><input type="text" name="station_dong" id="station_dong"></td>
</tr>
<tr>
	<td class="sta">도로명 주소</td>
	<td><input type="text" name="station_addr" id="station_addr"></td>
</tr>
<tr>
	<td>라커 수</td>
	<td><input type="text" name="station_locker" id="station_locker"></td>
</tr>
<tr>
	<td class="sta">위도</td>
	<td><input type="text" name="station_y_pos" id="station_y_pos"></td>
</tr>
<tr>
	<td>경도</td>
	<td><input type="text" name="station_x_pos" id="station_x_pos"></td>
</tr>
<tr>
	<td class="sta">상태</td>
	<td><input type="text" name="station_status" id="station_status"></td>
</tr>

</table>
<div class="btn123">
  <input type="submit" value="저장" class="btn12">
  <input type="button" value="닫기" onClick="window.close();" id="stationListBtn" class="btn12">
</div>
</form>











</body>
</html>
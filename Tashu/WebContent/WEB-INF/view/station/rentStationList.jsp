<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="<%=request.getContextPath()%>/js/jquery-3.6.0.min.js"></script>
<script type="text/javascript">

$(function(){
	<%-- $.ajax({
		url : "<%=request.getContextPath()%>/station/stationAllList.do",
		dataType : "json",
		async : false,
		success : function(result){
			var str ="";
			str +="<table border='1'>";
			str +="<tr><th>정류소 번호</th><th>정류소 이름</th><th>자전거 개수</th></tr>";
			$.each(result, function(i,v){
				str += '<tr><td>';
				str += '<a href = "<%=request.getContextPath()%>/stationBic/stationBic.do?station_id='+v.station_id+'">'
				str += +v.station_id+'</td>';
				str += '<td>' + v.station_name + '</td>';
				str += '<td>' + (v.station_locker-v.cnt)+' / '+v.station_locker + '</td></tr>';
			})
			str += "</table>";
			$("#result").html(str);
		},
		error : function(xhr){
			alert(xhr.status);
		}
		
	}); --%>
	$('#area').change(function(){
	
		var area=$(this).val();
		var $target=$("select[name='dong']");
		$.ajax({
			url : "<%=request.getContextPath()%>/station/stationArea.do",
			data : {"area" : area},
			dataType : "json",
			async : false,
			success : function(result){
				$('#dong').children('option:not(:first)').remove();
				
				$.each(result, function(i,v){
					
					$target.append("<option value='"+v.station_dong+"'>"+v.station_dong+"</option>")
				});
			},
			error : function(xhr){
				alert(xhr.status);
			}
			
		});
		
	});
	 $('#check').on("click",function(){
		 var dong = $("select[name='dong']").val();
		 $.ajax({
			url : "<%=request.getContextPath()%>/station/stationList.do",
			data : {"dong" : dong},
			dataType : "json",
			async : false,
			success : function(result){
				
				var str ="";
				str +="<table id='table' border='1'>";
				str +="<tr><th>정류소 번호</th><th>정류소 이름</th><th>자전거 개수</th></tr>";
					
				$.each(result, function(i,v){
					
					str += '<tr><td>';
					str += '<a href = "<%=request.getContextPath()%>/stationBic/stationBic.do?station_id='+v.station_id+'">'
					str += +v.station_id+'</td>';
					str += '<td>' + v.station_name + '</td>';
					str += '<td>' + (v.station_locker-v.cnt)+' / '+v.station_locker + '</td></tr>';
					
					
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
		//첫 화면으로
		location.href="<%=request.getContextPath()%>/rental/rentMain.do";
	});
});
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
#content{
	position: fixed;
    top : 200px;
    left : 60px;
}
#area{
	border-radius : 10px;
	padding: 5px;
}
#dong{
	border-radius : 10px;
	padding : 5px;
}
#check{
	border : 1px solid grey;
	border-radius : 10px;
	padding : 5px;
}
#home{
	border : 1px solid grey;
	border-radius : 10px;
	padding : 5px;
	position: fixed;
    bottom : 120px;
    left : 70px;
}
#table{
	margin : 10px;
	border-collapse : collapse;
}
#table td{
	padding : 5px;
}
#bic{
	border : 3px dotted lightgrey;
	border-radius : 10px;
	margin : 10px;
	width : 370px;
	padding : 30px;
	padding-right : 60px;
}
</style>
</head>
<body>
<div id="border">
	<div id="mainP">
		<img id= "logo" src="<%=request.getContextPath() %>/images/logo.png">
		<img id= "title" src="<%=request.getContextPath() %>/images/title.PNG">
		
		<div id="content">
			<select name="area" id="area">
				<option>생활권을 선택해주세요</option>
				<option value="1생활권">1생활권</option>
				<option value="2생활권">2생활권</option>
				<option value="3생활권">3생활권</option>
			</select>
			<select name="dong" id="dong">
			<option>원하는 동을 선택해주세요</option>
			
			</select>
			
			<input type="button" value="확인" name="check" id="check">
			<div id="result">
		<img id= "bic" src="<%=request.getContextPath() %>/images/bic2.jpg">
		
			</div>
			<input type="button" id="home" value="첫화면으로">
		
		</div>
	</div>
</div>
</body>
</html>
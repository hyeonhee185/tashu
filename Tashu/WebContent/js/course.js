/**
 * 
 */



// 리스트 출력
listServer = function(page,a,b) {
	var param = "sel=" + a + "&dat=" + b + "&page=" + page;
	$.ajax({
		url			: '/Tashu/course/SearchCourseList.do',
		type		: 'Post',
	    data		: param,
	    success		: function(res) {

	    	code = '<table border = "1" id = "tb1">';
			code += '		<tr><th>번호</th><th>제목</th><th>날짜</th><th>작성자</th><th>조회수</th></tr>';
			$.each(res.datas, function(i,v){
				code += '		 <tr onclick="location.href=\'/Tashu/course/ListDetail.do?no='+v.no+'\'"><td>' + v.no +'</td>';
				code += '		 	<td> ' + v.title + '</td>';
				code += ' 			<td> ' + v.date + '</td>';	
				code += '			<td> ' + v.writer + '</td>';
				code += '			<td> ' + v.cnt + '</td></tr>';
			})	
			code += '</table>';
			$('#list').html(code);
			
			//페이지 리스트 - BS_pagination pager 활용
			pager = '<table border = "1" id = "tb2">';
			pager += '<tr class="pagination pager">';
			//이전버튼(Prev)
			if(res.sp>1){
//				pager += '<tr class="pager">';
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
//				pager += '<tr class="pager">';
				pager += '<td><a class="next" href="#">></a></td>';
			}
			pager += '</tr>';
			pager += '</table>';
			$('#pagelist').html(pager);
		},
		error:function(xhr){
			alert(xhr.status);
		},
		dataType:'json'
	})
}


CourseReplyList = function(num){
	$.ajax({
		url : '/Tashu/course/ReplyList.do',
		data : {'cno' : num},
		type : 'get', 
		success : function(res){
			code = '<table>';
			code += '<tr><td id = "ealist1">댓글 : '+ res.acnt + '</td></tr>';
			console.log(res.memId);
			$.each(res.data,function(i,v){
				code += '<tr><td id = "ealist2">' + v.mname +'  '+ v.adate ;
				if (res.memId == v.mname) {					
					code += '<input type = "button" class = "delabtn" style = "float : right;	margin : 7px; padding : 7px; border-radius : 5px;" value = "삭제" onclick="location.href=\'/Tashu/course/ReplyDelete.do?rno='+v.rno+'&cno='+num+'\'">';
				}else if(res.memId=='admin'){
					code += '<input type = "button" class = "delabtn" style = "float : right;" value = "삭제" onclick="location.href=\'/Tashu/course/ReplyDelete.do?rno='+v.rno+'&cno='+num+'\'">';
					
				}
				code += '</td></tr>';
				code += '<tr id="tr1"><td id = "ealist3">' + v.acn + '</td></tr>';
			})
			code += '</table>';
			$('#reply').html(code);
		},
		error : function(xhr){
			alert(xhr.status);
		},
		dataType : 'json'
	})
}
SaveReply = function(num,cn,writer){
	var param = 'enum=' + num + '&acn=' + cn + '&writer=' + writer; 
	$.ajax({
		url : '/Tashu/course/SaveReply.do',
		data : param,
		type : 'post', 
		success : function(res){
			if(res.sw == 'no'){
				alert("댓글 등록에 실패하였습니다.");
				return false;
			}
			//성공시 댓글조회
			CourseReplyList(num);
		},
		error : function(xhr){
			alert(xhr.status);
		},
		dataType : 'json'
	})
}
<%@page import="kr.or.ddit.course.vo.CourseVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
List<CourseVO> list = (List<CourseVO>)request.getAttribute("list");

int sPage = (int)request.getAttribute("startPage");
int ePage = (int)request.getAttribute("endPage");
int ttPage = (int)request.getAttribute("totalPage");

%>

	{
	
		"sp" : "<%=sPage %>",
		"ep" : "<%=ePage %>",
		"tp" : "<%=ttPage %>",
		"datas" : [
<%
	for(int i = 0; i < list.size();	i++){
		CourseVO vo = list.get(i);
		if(i>0){
			out.print(",");
		}
%>
		{
			"no" : "<%=vo.getCno() %>",			
			"title" : "<%=vo.getC_title() %>",			
			"date" : "<%=vo.getC_regdate() %>",			
			"cont" : "<%=vo.getC_content() %>",			
			"writer" : "<%=vo.getC_writer() %>",			
			"cnt" : "<%=vo.getC_viewcnt() %>"			
			
		
		}
<%

}
%>		
		
		]
		
	}
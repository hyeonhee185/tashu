<%@page import="kr.or.ddit.notice.vo.NoticeVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
List<NoticeVO> list = (List<NoticeVO>)request.getAttribute("list");

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
		NoticeVO vo = list.get(i);
		if(i>0){
			out.print(",");
		}
%>
		{
			"no" : "<%=vo.getBno() %>",			
			"title" : "<%=vo.getTitle() %>",			
			"date" : "<%=vo.getRegdate() %>",			
			"cont" : "<%=vo.getContent() %>",			
			"writer" : "<%=vo.getWriter() %>",			
			"cnt" : "<%=vo.getViewcnt() %>"			
			
		
		}
<%

}
%>		
		
		]
		
	}
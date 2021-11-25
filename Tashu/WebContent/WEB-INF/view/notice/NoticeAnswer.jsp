<%-- <%@page import="kr.or.ddit.notice.vo.ReplyVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	List<ReplyVO> list = (List<ReplyVO>)request.getAttribute("list");
	System.out.println(list.size());
%>
	{
	 	"acnt" : "<%=list.size() %>",
		"data" : [
<%
	if(list != null && list.size() > 0){
		for(int i = 0; i < list.size(); i++){
			ReplyVO vo = list.get(i);
			if(i > 0){
				out.print(",");
			}
%>			
	{	
		"mname" : "<%=vo.getWriter() %>",
		"adate" : "<%=vo.getRegdate() %>",
		"acn" : "<%=vo.getConnent() %>"
	}			
			
<%
		}
	}
%>
]
} --%>
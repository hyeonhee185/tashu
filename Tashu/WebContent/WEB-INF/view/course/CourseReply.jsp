<%@page import="kr.or.ddit.member.vo.MemberVO"%>
<%@page import="kr.or.ddit.course.vo.ReplyVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>


<%
	List<ReplyVO> list = (List<ReplyVO>)request.getAttribute("list");
	System.out.println(list.size());
    HttpSession ssion = request.getSession();
    MemberVO memvo = (MemberVO) ssion.getAttribute("member");
    String mem_id = "";
    if(memvo==null){
	mem_id = "";    	
    }else{
    mem_id = memvo.getMem_id();
    	
    }
    // 아이디 정보 
    System.out.println(mem_id);
%>
	{
	 	"acnt" : "<%=list.size() %>",
	 	"memId" : "<%=mem_id %>",
		"data" : [
<%
	if(list != null && list.size() > 0){
		for(int i = 0; i < list.size(); i++){
			ReplyVO vo = list.get(i);
			System.out.println(vo.getRno());
			if(i > 0){
				out.print(",");
			}
%>			
	{	
		"rno" : "<%=vo.getRno() %>",
		"mname" : "<%=vo.getR_writer() %>",
		"adate" : "<%=vo.getR_regdate() %>",
		"acn" : "<%=vo.getR_content() %>"
		
		
	}			

<%
		}
	}
%>
]
}


package kr.or.ddit.member.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.ddit.member.service.IMemberService;
import kr.or.ddit.member.service.MemberServiceImpl;
import kr.or.ddit.member.vo.MemberVO;

/**
 * Servlet implementation class InsertServlet
 */
@WebServlet("/insert.do")
public class InsertServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("utf-8");
		
		String memId = request.getParameter("mem_id");
		String memName = request.getParameter("mem_name");
		String memPass = request.getParameter("mem_pass");
		String memTel = request.getParameter("mem_tel");
		String memZip = request.getParameter("mem_zip");
		String memAddr1 = request.getParameter("mem_add1");
		String memAddr2 = request.getParameter("mem_add2");
		
		
		
		MemberVO memvo = new MemberVO();
		memvo.setMem_id(memId);
		memvo.setMem_name(memName);
		memvo.setMem_pass(memPass);
		memvo.setMem_tel(memTel);
		memvo.setMem_zip(memZip);
		memvo.setMem_add1(memAddr1);
		memvo.setMem_add2(memAddr2);
		
		IMemberService service = MemberServiceImpl.getInstance();
		service.insertMember(memvo);
		
		response.sendRedirect(request.getContextPath() + "/main.html");
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		doGet(request, response);
	}

}

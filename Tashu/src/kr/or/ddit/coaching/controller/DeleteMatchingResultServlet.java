package kr.or.ddit.coaching.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kr.or.ddit.mem_answer.service.Member_AnswerServiceImpl;
import kr.or.ddit.member.vo.MemberVO;

/**
 * Servlet implementation class DeleteMatchingResultServlet
 */
@WebServlet("/coaching/deleteMatchingResult.do")
public class DeleteMatchingResultServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=UTF-8"); 
		
		// 세션에서 정보 가져오기
		HttpSession session = request.getSession();
		MemberVO vo = (MemberVO) session.getAttribute("member");
		// 아이디 정보 
		String mem_id = vo.getMem_id();
		System.out.println(mem_id);
		Member_AnswerServiceImpl service = Member_AnswerServiceImpl.getInstance();
		int cnt = service.deleteMatchingResult(mem_id);
		if (cnt>0) {
			System.out.println("성공");
		}else {
			System.out.println("실패");
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}

package kr.or.ddit.member.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kr.or.ddit.member.service.IMemberService;
import kr.or.ddit.member.service.MemberServiceImpl;
import kr.or.ddit.member.vo.MemberVO;

@WebServlet("/memberDelete.do")
public class MemberDeleteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");

		// 삭제할 데이터 받아오기
		HttpSession session = request.getSession();
		MemberVO vo = (MemberVO) session.getAttribute("member");

		String memId = vo.getMem_id();

		IMemberService service = MemberServiceImpl.getInstance();
		service.deleteMember(memId); // DB에 delete
		
		//세션 비우기
		session.invalidate();
		
		// 메인으로 돌아가기
		response.sendRedirect(request.getContextPath() + "/main.jsp");

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException { 
		doGet(request, response);
	}

}

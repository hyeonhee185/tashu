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

@WebServlet("/myTashu.do")
public class MemberViewServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");

		// 세션에서 정보 가져오기
	     HttpSession ssion = request.getSession();
	     MemberVO vo = (MemberVO) ssion.getAttribute("member");
	     if (vo==null) {
	    	 request.getRequestDispatcher("/login.do").forward(request, response);
		}else {
			String memId = vo.getMem_id();
			
			IMemberService service = MemberServiceImpl.getInstance();
			MemberVO memVo = (MemberVO)service.getMember(memId);
			
			request.setAttribute("memberVO", memVo);
			request.getRequestDispatcher("/WEB-INF/view/member/myTashu.jsp").forward(request, response);
			
		}
	      
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

}

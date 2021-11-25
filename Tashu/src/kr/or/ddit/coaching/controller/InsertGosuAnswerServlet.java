package kr.or.ddit.coaching.controller;

import java.io.IOException;
import java.util.HashMap;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kr.or.ddit.mem_answer.service.IMember_AnswerService;
import kr.or.ddit.mem_answer.service.Member_AnswerServiceImpl;
import kr.or.ddit.member.vo.MemberVO;

/**
 * Servlet implementation class InsertGosuAnswerServlet
 */
@WebServlet("/coaching/insertGosuAnswer.do")
public class InsertGosuAnswerServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=utf-8");
		
		// 세션 id가져오기
		HttpSession session = request.getSession();
		MemberVO vo = (MemberVO) session.getAttribute("member");
		String id = vo.getMem_id();
	
		// 라디오 value 값 가져오기
		String ans_1 = request.getParameter("day");
		String ans_2 = request.getParameter("time");
		String ans_3 = request.getParameter("area");
		
		HashMap<String,String> map = new HashMap<String,String>();
		map.put("mem_id", id);
		map.put("ans_1", ans_1);
		map.put("ans_2", ans_2);
		map.put("ans_3", ans_3);
		
		System.out.println(ans_1);
		System.out.println(ans_2);
		System.out.println(ans_3);
		
		IMember_AnswerService service = Member_AnswerServiceImpl.getInstance();
		service.insertGosuMember_Answer(map);
		
		// 고수회원의 매칭결과 조회 페이지
		request.getRequestDispatcher("/WEB-INF/view/coaching/gosu_Matching.jsp").forward(request, response);
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}

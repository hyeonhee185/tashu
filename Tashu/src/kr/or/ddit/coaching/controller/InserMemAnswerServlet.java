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

@WebServlet(name = "InserMemAnswerServlet", urlPatterns = { "/coaching/inserMemAnswer.do" })
public class InserMemAnswerServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 라디오버튼 값을 받아서 insert문에 넣어주기
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=utf-8");
	
		// 세션의 id 가져오기
		HttpSession session = request.getSession();
		MemberVO vo = (MemberVO) session.getAttribute("member");
		String mem_id = vo.getMem_id();
		
		String ans_1 = request.getParameter("day");
		String ans_2 = request.getParameter("time");
		String ans_3 = request.getParameter("area");
		String ans_4 = request.getParameter("term");
		String ans_5 = request.getParameter("speed");
		String ans_6 = request.getParameter("reason");
		
		// map생성, 값 넣어주기
		HashMap<String, String> map = new HashMap<>();
		map.put("mem_id", mem_id);
		map.put("ans_1", ans_1);
		map.put("ans_2", ans_2);
		map.put("ans_3", ans_3);
		map.put("ans_4", ans_4);
		map.put("ans_5", ans_5);
		map.put("ans_6", ans_6);
		
		IMember_AnswerService service = Member_AnswerServiceImpl.getInstance();
		service.insertMember_Answer(map);
		
		// 일반회원의 매칭결과 조회 페이지
		request.getRequestDispatcher("/WEB-INF/view/coaching/mem_Matching.jsp").forward(request, response);
		
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}

package kr.or.ddit.coaching.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.google.gson.Gson;

import kr.or.ddit.mem_answer.service.IMember_AnswerService;
import kr.or.ddit.mem_answer.service.Member_AnswerServiceImpl;
import kr.or.ddit.mem_answer.vo.Mem_AnswerVO;
import kr.or.ddit.member.vo.MemberVO;

/**
 * Servlet implementation class MatchingNorMemServlet
 */
@WebServlet("/coaching/matchingNorMem.do")
public class MatchingNorMemServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=UTF-8"); 
		
		//세션에서 id가져오기
		HttpSession session = request.getSession();
		MemberVO vo = (MemberVO) session.getAttribute("member");
		String mem_id = vo.getMem_id();		
		
		//matching결과 조회, 리스트로 받기
		IMember_AnswerService service = Member_AnswerServiceImpl.getInstance();
		List<Mem_AnswerVO> matchingList = new ArrayList<>();
		matchingList = service.normalMemresult(mem_id);
	
	
		
		Gson gson = new Gson();
		String jsonData = gson.toJson(matchingList);
		System.out.println("matchingList" + matchingList);
		
		PrintWriter out = response.getWriter();		
		out.write(jsonData);
		System.out.println("jsonData" + jsonData);
		response.flushBuffer();
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}

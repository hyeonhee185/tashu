package kr.or.ddit.coaching.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.HashMap;
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
import kr.or.ddit.member.vo.MemberVO;


@WebServlet("/coaching/matching.do")
public class MatchingServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=UTF-8"); 
		//System.out.println("서블릭확인");
		IMember_AnswerService service = Member_AnswerServiceImpl.getInstance();
		//세션에서 id가져오기
		HttpSession session = request.getSession();
		MemberVO vo = (MemberVO) session.getAttribute("member");
		String mem_id = vo.getMem_id();
		
		HashMap<String, Object> matchMap = new HashMap<>();
		
		String matchingResult = service.checkMemMatchingResult(mem_id);
		//System.out.println("뭐냐 :  " + result);
		
		if(matchingResult!=null) {
			
			matchMap.put("match", "yes");
			matchMap.put("data", matchingResult);
			
		}else {
	
			List<String> matchingList = new ArrayList<>();
			matchingList = service.MatchingGosu(mem_id);
			
			matchMap.put("match", "no");
			matchMap.put("data", matchingList);
			
		}
		
		Gson gson = new Gson();
		String jsonData = gson.toJson(matchMap);
	
		PrintWriter out = response.getWriter();		
		out.write(jsonData);
		response.flushBuffer();//---------------------------------------------------
	
	}
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}

package kr.or.ddit.coaching.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.google.gson.Gson;

import kr.or.ddit.coaching.service.CoachingServiceImpl;
import kr.or.ddit.coaching.service.ICoachingService;
import kr.or.ddit.member.vo.MemberVO;

@WebServlet(name = "GosuMatchingServlet", urlPatterns = { "/coaching/gosuMatching.do" })
public class GosuMatchingServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setContentType("application/json; charset=utf-8");
		
		// 세션에서 아이디 가져오기
		HttpSession session = request.getSession();
		MemberVO vo = (MemberVO) session.getAttribute("member");
		String normalMemId = vo.getMem_id();
		
		// jsp파일에서 서블릿으로 전달한 고수아이디 가져오기
		String gosuMemId = request.getParameter("gosuMemId");
		
		// 매칭결과를 넣을 map 객체 생성
		HashMap<String, String> map = new HashMap<>();
		map.put("normalMemId",normalMemId );
		map.put("gosuMemId",gosuMemId );
	
		// db에 매칭 값 저장
		ICoachingService service = CoachingServiceImpl.getInstance();
		service.insertMem(map);
		
		//json타입으로 변경, 매칭 결과 출력
		Gson gson = new Gson();
		String jsonData = gson.toJson(map);
		PrintWriter out = response.getWriter();		
		out.write(jsonData);
		response.flushBuffer();
		
		//request.getRequestDispatcher("/WEB-INF/view/coaching/gosu_Matching.jsp").forward(request, response);
		
		//System.out.println("map에 들어간 값 :"+map);
		//System.out.println("jsondata : "+jsonData);
		
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}

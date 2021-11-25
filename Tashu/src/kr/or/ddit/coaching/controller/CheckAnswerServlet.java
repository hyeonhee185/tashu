package kr.or.ddit.coaching.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kr.or.ddit.mem_answer.service.Member_AnswerServiceImpl;
import kr.or.ddit.member.vo.MemberVO;

@WebServlet("/checkAnswer.do")
public class CheckAnswerServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=UTF-8"); 
		
		// 세션에서 정보 가져오기
		HttpSession session = request.getSession();
		MemberVO vo = (MemberVO) session.getAttribute("member");
		if (vo==null) {
			request.getRequestDispatcher("/login.do").forward(request, response);
		}else {
			// 아이디 정보 
			String mem_id = vo.getMem_id();
			// status 정보
			int mem_status = vo.getStatus();
			
			Member_AnswerServiceImpl service = Member_AnswerServiceImpl.getInstance();

			// 회원의 답변이 있는지 확인하는 메서드
			String check = service.checkMemAnswer(mem_id);
			PrintWriter writer = response.getWriter();
			
			String matchingResult = service.checkMemMatchingResult(mem_id);
			System.out.println("matchingResult : " + matchingResult );
			
			// 회원이면서 답변x ==> 회원질문jsp
			if(mem_status==1 && check==null ) { 
				writer.println("<script>alert('자전거 고수 매칭을 위한 질문입니다.');</script>");
				request.getRequestDispatcher("/WEB-INF/view/coaching/mem_Question.jsp").forward(request, response);
				
			// 회원이면서 답변o ==> 매칭결과jsp
			} else if ( mem_status==1 && check!=null ) { 
				request.getRequestDispatcher("/WEB-INF/view/coaching/mem_Matching.jsp").forward(request, response);
			
			// 고수회원이면서 답변x ==> 고수질문jsp
			} else if ( mem_status==2 && check==null ) { 
				writer.println("<script>alert('일반회원 매칭을 위한 질문입니다.</script>");
				request.getRequestDispatcher("/WEB-INF/view/coaching/gosu_Question.jsp").forward(request, response);
			
			// 고수회원이면서 답변o ==> 매칭결과jsp
			} else {
				request.getRequestDispatcher("/WEB-INF/view/coaching/gosu_Matching.jsp").forward(request, response);
			}
			writer.close();
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}

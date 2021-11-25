package kr.or.ddit.jiaSession;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class SessionLogin
 */
@WebServlet("/sessionLogin.do")
public class SessionLoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	//로그인 처리는 post방식에서만 처리하고, 
	//만약 해당 서블릿을 get방식으로 요청하면 로그인 페이지로 이동하도록 한다.
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//그냥 실행했을때 로그인 됨
		response.sendRedirect(
				request.getContextPath()+"/jiaTest.jsp");
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		String mem_id= request.getParameter("mem_id");
		String pass = request.getParameter("pass");
		
		HttpSession session = request.getSession();
		
		if (mem_id.equals("2")&& pass.equals("2")) {
			//로그인에 성공한 id값을 세션에 저장
			session.setAttribute("mem_id", mem_id); 
		}
		
		RequestDispatcher rd = 
				request.getRequestDispatcher("/jiaTest.jsp");
		//contextPath 쓰면 못찾아감
		rd.forward(request, response);
		
	}

}
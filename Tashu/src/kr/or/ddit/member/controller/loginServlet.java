package kr.or.ddit.member.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kr.or.ddit.member.dao.MemberDaoImpl;
import kr.or.ddit.member.vo.MemberVO;

@WebServlet("/login.do")
public class loginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.getRequestDispatcher("/WEB-INF/view/login/login.jsp").forward(request, response);

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=UTF-8"); 

	
		String memId = request.getParameter("userid");
		String memPass = request.getParameter("pass");
	/*	int status = Integer.parseInt(request.getParameter("status"));*/

		MemberDaoImpl dao = MemberDaoImpl.getInstance();

		MemberVO memvo = new MemberVO();
		memvo.setMem_id(memId);
		memvo.setMem_pass(memPass);
		//memvo.setStatus(1);

		MemberVO result = dao.login(memvo);

		HttpSession session = request.getSession();
		PrintWriter writer = response.getWriter();
		
		if (result != null) {
		
		
			if(result.getStatus()==1 || result.getStatus()==2) {
				session.setAttribute("member", result);
				response.sendRedirect(request.getContextPath()+"/main.jsp");
				
			}else if(result.getStatus()==0){
				session.setAttribute("member", result);
				response.sendRedirect(request.getContextPath()+"/main.jsp");
				
			}else {
				writer.println("<script>");
		        writer.println("alert('아이디와 비밀번호를 확인해주세요.');");
		        writer.println("</script>");
		        writer.println("<script>location.replace(\"/Tashu/login.do\");</script>"); 
		         
		        
			}
			
		}else {
			writer.println("<script>");
	        writer.println("alert('아이디와 비밀번호를 확인해주세요.');");
	        writer.println("</script>");
	        writer.println("<script>location.replace(\"/Tashu/login.do\");</script>"); 
			
		}
		
		
	
	}

}

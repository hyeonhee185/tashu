package kr.or.ddit.member.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kr.or.ddit.member.service.IMemberService;
import kr.or.ddit.member.service.MemberServiceImpl;
import kr.or.ddit.member.vo.MemberVO;

/**
 * Servlet implementation class MemberUpdate
 */
@WebServlet("/member/memberUpdate.do")
public class MemberUpdate extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		request.setCharacterEncoding("utf-8");
		
		String mem_id = request.getParameter("mem_id");
		String mem_name = request.getParameter("mem_name");
		String mem_pass = request.getParameter("mem_pass");
		String mem_tel = request.getParameter("mem_tel");
		String mem_zip = request.getParameter("mem_zip");
		String mem_add1 = request.getParameter("mem_add1");
		String mem_add2 = request.getParameter("mem_add2");
		
		HttpSession ssion = request.getSession();
		MemberVO mem = (MemberVO)ssion.getAttribute("member");
		int status = mem.getStatus();
		
		
		MemberVO memvo = new MemberVO();
		memvo.setMem_id(mem_id);
		memvo.setMem_name(mem_name);
		memvo.setMem_pass(mem_pass);
		memvo.setMem_tel(mem_tel);
		memvo.setMem_zip(mem_zip);
		memvo.setMem_add1(mem_add1);
		memvo.setMem_add2(mem_add2);
		memvo.setStatus(status);
		
		IMemberService service = MemberServiceImpl.getInstance();
		int cnt = service.updateMember(memvo);
		if (cnt>0) {
			System.out.println("업데이트 완료");
			ssion.setAttribute("member", memvo);
		}else {
			System.out.println("업데이트 실패");
		}
        
		if(memvo==null || memvo.getStatus()==1 || memvo.getStatus()==2){
			response.sendRedirect(request.getContextPath() + "/myTashu.do");
		 }else if(memvo.getStatus()==0){
			 response.sendRedirect(request.getContextPath() + "/member/memberList.do");
		 }
		
		/*HttpSession session = request.getSession();
		MemberVO vo = (MemberVO)session.getAttribute("member");
		
		if (vo==null) {
			response.sendRedirect(request.getContextPath() + "/login.do");
		}else {
			session.invalidate();
			response.sendRedirect(request.getContextPath() + "/login.do");
		}*/
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}

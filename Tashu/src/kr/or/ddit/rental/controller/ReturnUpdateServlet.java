package kr.or.ddit.rental.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kr.or.ddit.member.vo.MemberVO;
import kr.or.ddit.rental.service.IRentalService;
import kr.or.ddit.rental.service.RentalServiceImpl;

/**
 * Servlet implementation class RentUpdateServlet
 */
@WebServlet("/rental/returnUpdate.do")
public class ReturnUpdateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=utf-8");
		String station_id = request.getParameter("station_id");
		String locker_id = request.getParameter("locker_id"); 
		String bicycle_no = request.getParameter("bicycle_no");
		
		HttpSession session = request.getSession();
		MemberVO member = (MemberVO)session.getAttribute("member");
		String mem_id = member.getMem_id();
		
		System.out.println(mem_id);
		System.out.println(station_id);
		System.out.println(locker_id);

		Map<String, String> paramMap = new HashMap<String, String>();
		paramMap.put("station_id", station_id);
		paramMap.put("locker_id", locker_id);
		paramMap.put("mem_id", mem_id);
		
		IRentalService service = RentalServiceImpl.getInstance();
		int cnt = service.updateReturn(paramMap);
		if (cnt>0) {
			response.setContentType("text/html; charset=UTF-8"); 
			PrintWriter writer = response.getWriter(); 
			writer.println("<script>alert('반납이 완료되었습니다.'); location.replace(\"/Tashu/rental/rentMain.do\");</script>"); 
			writer.close();
		}else {
			response.setContentType("text/html; charset=UTF-8"); 
			PrintWriter writer = response.getWriter(); 
			writer.println("<script>alert('반납이 실패했습니다.'); location.replace(\"/Tashu/rental/rentMain.do\");</script>"); 
			writer.close();
		}

		
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}

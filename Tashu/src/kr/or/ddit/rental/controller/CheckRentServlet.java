package kr.or.ddit.rental.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.google.gson.Gson;

import kr.or.ddit.member.vo.MemberVO;
import kr.or.ddit.rental.service.RentalServiceImpl;
import kr.or.ddit.station.service.StationServiceImpl;
import kr.or.ddit.station.vo.StationVO;

/**
 * Servlet implementation class CheckRentServlet
 */
@WebServlet("/rental/checkRent.do")
public class CheckRentServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		RentalServiceImpl service = RentalServiceImpl.getInstance();
		HttpSession ssion = request.getSession();
		MemberVO member = (MemberVO)ssion.getAttribute("member");
		String mem_id = member.getMem_id();
		
		String check = service.checkRent(mem_id);
		response.setContentType("text/html; charset=UTF-8"); 
		PrintWriter writer = response.getWriter(); 
		if (check==null) {
			writer.println("<script>alert('대여이력이 없습니다.');</script>"); 
			writer.println("<script>location.replace(\"/Tashu/rental/rentMain.do\");</script>");
		}else{
			writer.println("<script>location.replace(\"/Tashu/station/returnStationList.do\");</script>"); 
			
		}
		writer.close();
		
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}

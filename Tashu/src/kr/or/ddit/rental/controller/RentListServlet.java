package kr.or.ddit.rental.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.google.gson.Gson;

import kr.or.ddit.member.vo.MemberVO;
import kr.or.ddit.rental.service.RentalServiceImpl;
import kr.or.ddit.rental.vo.RentalVO;
import kr.or.ddit.station.service.StationServiceImpl;
import kr.or.ddit.station.vo.StationVO;

/**
 * Servlet implementation class RentListServlet
 */
@WebServlet("/rental/rentList.do")
public class RentListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		response.setContentType("application/json; charset=utf-8");
		RentalServiceImpl service = RentalServiceImpl.getInstance();

		HttpSession session = request.getSession();
		MemberVO member = (MemberVO)session.getAttribute("member");
		if (member==null) {
			RequestDispatcher rd = request.getRequestDispatcher("/login.do");
			rd.forward(request, response);
		}else {
			String mem_id = member.getMem_id();
			
			List<RentalVO> rentList = service.getAllRent(mem_id);
			request.setAttribute("rentList", rentList);
			RequestDispatcher rd = request.getRequestDispatcher("/WEB-INF/view/rental/rentList.jsp");
			rd.forward(request, response);
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

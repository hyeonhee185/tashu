package kr.or.ddit.stationBic.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.ddit.stationBic.service.IStationBicService;
import kr.or.ddit.stationBic.service.StationBicServiceImpl;
import kr.or.ddit.stationBic.vo.StationBicVO;

/**
 * Servlet implementation class StationBicServlet
 */
@WebServlet("/stationBic/returnBic.do")
public class ReturnBicServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		int stationId = Integer.parseInt(request.getParameter("station_id"));
		IStationBicService service = StationBicServiceImpl.getInstance();
		List<StationBicVO> stationList = service.getStationLocker(stationId);
		
		request.setAttribute("stationList", stationList);
		
		request
		.getRequestDispatcher("/WEB-INF/view/stationBic/returnLocker.jsp")
		.forward(request, response);
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}

package kr.or.ddit.station.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.ddit.station.service.IStationService;
import kr.or.ddit.station.service.StationServiceImpl;

/**
 *  정류소를 삭제하면 됨!
 */
@WebServlet("/station/deleteStation.do")
public class DeleteStationServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		request.setCharacterEncoding("utf-8");
		response.setContentType("application/json; charset=utf-8");
	
		String stationName = request.getParameter("stationName");
		System.out.println(stationName);
		
		IStationService service = StationServiceImpl.getInstance();
		service.deleteStation(stationName);
	
		request.getRequestDispatcher("/stationList_admin.do").forward(request, response);
	}
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}

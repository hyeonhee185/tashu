package kr.or.ddit.station.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.ddit.station.service.IStationService;
import kr.or.ddit.station.service.StationServiceImpl;
import kr.or.ddit.station.vo.StationVO;

/**
 * Servlet implementation class StationList_admin
 */
@WebServlet("/stationList_admin.do")
public class StationList_admin extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		IStationService service = StationServiceImpl.getInstance();
		
		List<StationVO> stationList = service.getAllStation2();
		
		request.setAttribute("stationList", stationList);

		request.getRequestDispatcher("/WEB-INF/view/station/stationList_admin.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}

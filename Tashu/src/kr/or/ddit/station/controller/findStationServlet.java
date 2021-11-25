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
 * "동"에 해당하는 jsp파일을 호출하는 서블릿
 */
@WebServlet(name = "FindStationServlet", urlPatterns = { "/station/findStation.do" })
public class findStationServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
  
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		response.setContentType("application/json; charset=utf-8");
		
		IStationService service = StationServiceImpl.getInstance();
		
		String dong = request.getParameter("dong");
		List<StationVO> stationList = service.getStationArea(dong);
		
		request
		.getRequestDispatcher("/WEB-INF/view/station/stationMap_dong.jsp")
		.forward(request, response);
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}

package kr.or.ddit.station.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;

import kr.or.ddit.station.service.IStationService;
import kr.or.ddit.station.service.StationServiceImpl;
import kr.or.ddit.station.vo.StationVO;

/**
 * Servlet implementation class StationMapServlet
 */
@WebServlet("/stationMap.do")
public class StationMapServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		response.setContentType("application/json; charset=utf-8");
		
		// station정보
		IStationService service = StationServiceImpl.getInstance();
		List<StationVO> stationList = service.getAllStation2();
		
		// 대여반납 정보 가져오자!
		StationServiceImpl ss = StationServiceImpl.getInstance();
		List<StationVO> stationList_bike = ss.getStationList2();
		
		request.setAttribute("stationList", stationList);
		request.setAttribute("stationList_bike", stationList_bike);
		request.getRequestDispatcher("/WEB-INF/view/station/stationMap2.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}

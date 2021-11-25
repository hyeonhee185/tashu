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
 * Servlet implementation class DongServlet
 */
@WebServlet("/station/dong.do")
public class DongServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		response.setContentType("application/json; charset=utf-8");
			
		IStationService service = StationServiceImpl.getInstance();
		String dong = request.getParameter("dong");
		//
		request.getAttribute("stationList2");
		System.out.println("동이 나올까?"+dong);
		
		List<StationVO> stationList = service.selectDongStation(dong);
		
		Gson gson = new Gson();
		String jsonData = gson.toJson(stationList);
		PrintWriter out = response.getWriter();		
		out.write(jsonData);
		response.flushBuffer();

		

		//request.setAttribute("stationList", stationList);
		// request.getRequestDispatcher("/WEB-INF/view/station/stationMap2.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}

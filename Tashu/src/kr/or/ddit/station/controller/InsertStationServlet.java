package kr.or.ddit.station.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.ddit.station.service.IStationService;
import kr.or.ddit.station.service.StationServiceImpl;
import kr.or.ddit.station.vo.StationVO;

@WebServlet("/station/insertStation.do")
public class InsertStationServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		
		String stationName = request.getParameter("station_name");
		String stationArea = request.getParameter("station_area");
		String stationGu = request.getParameter("station_gu");
		String stationDong = request.getParameter("station_dong");
		String stationAddr = request.getParameter("station_addr");
		String stationLocker = request.getParameter("station_locker");
		String stationYpos = request.getParameter("station_y_pos");
		String stationXpos = request.getParameter("station_x_pos");
		String stationStatus = request.getParameter("station_status");
		
		StationVO stationVo = new StationVO(); 
		stationVo.setStation_name(stationName);
		stationVo.setStation_area(stationArea);
		stationVo.setStation_gu(stationGu);
		stationVo.setStation_dong(stationDong);
		stationVo.setStation_addr(stationAddr);
		stationVo.setStation_locker(stationLocker);
		stationVo.setStation_y_pos(stationYpos);
		stationVo.setStation_x_pos(stationXpos);
		stationVo.setStation_status(stationStatus);
		
		IStationService service = StationServiceImpl.getInstance();
		service.insertStation(stationVo);
		
		PrintWriter writer = response.getWriter();
		
		writer.println("<script>opener.parent.location.reload();</script>"); 
        writer.println("<script>self.close();</script>"); 
        
		}
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}

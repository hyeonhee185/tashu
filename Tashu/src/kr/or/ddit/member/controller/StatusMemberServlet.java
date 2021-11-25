package kr.or.ddit.member.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;

import kr.or.ddit.member.service.MemberServiceImpl;
import kr.or.ddit.member.vo.MemberVO;
import kr.or.ddit.station.service.StationServiceImpl;
import kr.or.ddit.station.vo.StationVO;

/**
 * Servlet implementation class StatusMemberServlet
 */
@WebServlet("/member/statusMember.do")
public class StatusMemberServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		response.setContentType("application/json; charset=utf-8");
		MemberServiceImpl service = MemberServiceImpl.getInstance();
		String statusS = request.getParameter("status");
		int status = Integer.parseInt(statusS);
		List<MemberVO> statusMember = service.statusMember(status);
		Gson gson = new Gson();
		
		String jsonData = gson.toJson(statusMember);
		PrintWriter out = response.getWriter();		
		
		out.write(jsonData);
		response.flushBuffer();
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}

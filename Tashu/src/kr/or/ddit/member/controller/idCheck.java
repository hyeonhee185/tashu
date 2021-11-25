package kr.or.ddit.member.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;

import kr.or.ddit.member.service.IMemberService;
import kr.or.ddit.member.service.MemberServiceImpl;

/**
 * Servlet implementation class idCheck
 */
@WebServlet("/member/idCheck.do")
public class idCheck extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		//요청데이터 받기
		String mId = request.getParameter("mId");
		System.out.println(mId);
		//service객체 얻어오기
		IMemberService service = MemberServiceImpl.getInstance();
				
		//service 메소드 호출 - 값 얻기
		int idCheck = service.idCheck(mId);
		
		Gson gson = new Gson();
		
		String jsonData = gson.toJson(idCheck);
		
		PrintWriter out = response.getWriter();		
		out.write(jsonData);
		response.flushBuffer();
		
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}

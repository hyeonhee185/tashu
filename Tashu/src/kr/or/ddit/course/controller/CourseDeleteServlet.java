package kr.or.ddit.course.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.ddit.course.service.CourseServiceImpl;
import kr.or.ddit.course.service.ICourseService;

/**
 * Servlet implementation class CourseDeleteServlet
 */
@WebServlet("/course/CourseDelete.do")
public class CourseDeleteServlet extends HttpServlet {
	   private static final long serialVersionUID = 1L;
		// TODO Auto-generated constructor stub


	   protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	      
	      // 삭제할 게시글 번호 받아오기
	      int boardNum = Integer.parseInt(request.getParameter("cno"));
	      System.out.println("번호"+boardNum);
	      
	      ICourseService service = CourseServiceImpl.getInstance();
	      service.DeleteCourse(boardNum);
	      
	      response.sendRedirect(request.getContextPath() + "/course/redirect.do");
	      
		}
}
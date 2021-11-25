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
 * Servlet implementation class ReplyDelete
 */
@WebServlet("/course/ReplyDelete.do")
public class ReplyDelete extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		// 삭제할 게시글 번호 받아오기
		int rno = Integer.parseInt(request.getParameter("rno"));
		System.out.println("번호" + rno);
		int cno = Integer.parseInt(request.getParameter("cno"));
		ICourseService service = CourseServiceImpl.getInstance();
		service.DeleteReply(rno);
		
		response.sendRedirect(request.getContextPath() + "/course/ListDetail.do?no="+cno);

	}
}
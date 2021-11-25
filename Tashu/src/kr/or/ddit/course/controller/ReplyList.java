package kr.or.ddit.course.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.ddit.course.service.CourseServiceImpl;
import kr.or.ddit.course.service.ICourseService;
import kr.or.ddit.course.vo.ReplyVO;
/**
 * Servlet implementation class AnswerList
 */
@WebServlet("/course/ReplyList.do")
public class ReplyList extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int cno = Integer.parseInt(request.getParameter("cno"));
		
		ICourseService service = CourseServiceImpl.getInstance();
		
		List<ReplyVO> list = service.ReplyList(cno);
		
		request.setAttribute("list", list);
		System.out.println(list);
		request.getRequestDispatcher("/WEB-INF/view/course/CourseReply.jsp").forward(request, response);
	}


}

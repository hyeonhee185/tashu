package kr.or.ddit.course.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.ddit.course.service.CourseServiceImpl;
import kr.or.ddit.course.service.ICourseService;
import kr.or.ddit.course.vo.ReplyVO;



/**
 * Servlet implementation class SaveAnswer
 */
@WebServlet("/course/SaveReply.do")
public class SaveReply extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		
		
		ReplyVO vo = new ReplyVO();
		
		vo.setCno(Integer.parseInt(request.getParameter("enum")));
		vo.setR_content(request.getParameter("acn").replace("\r", "").replace("\n", "<br>"));
		vo.setR_writer(request.getParameter("writer"));
		
		ICourseService service = CourseServiceImpl.getInstance();
		int seq = service.SaveReply(vo);
		System.out.println(seq);
		request.setAttribute("seq", seq);
		request.getRequestDispatcher("/WEB-INF/view/course/saveResult.jsp").forward(request, response);
	}

}

package kr.or.ddit.course.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.ddit.course.service.CourseServiceImpl;
import kr.or.ddit.course.service.ICourseService;
import kr.or.ddit.course.vo.CourseVO;



/**
 * Servlet implementation class ListDetail
 */
@WebServlet("/course/ListDetail.do")
public class ListDetail extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String no = request.getParameter("no");
		
		int cno = Integer.parseInt(no);
		System.out.println("이상하냐?>>>"+cno);
		
		ICourseService service = CourseServiceImpl.getInstance();
		
		int chk = service.UpdateShowedCourse(cno);
		
		if(chk == 0) {
			System.exit(0);
		}
		
		CourseVO vo = service.ShowSelectedCourse(cno);
		if(vo == null) {
			System.out.println("메메메ㅔㅁ");
		}
		request.setAttribute("vo", vo);
		
		request.getRequestDispatcher("/WEB-INF/view/course/CourseDetail.jsp").forward(request, response);
		
	}


}

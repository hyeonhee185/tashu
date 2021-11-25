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




@WebServlet("/course/Insert.do")
public class BoardInsert extends HttpServlet {
   private static final long serialVersionUID = 1L;

   protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

      request.setCharacterEncoding("utf-8");
      
      // writeForm.jsp에서 입력한 데이터 받아오기
      String c_title = request.getParameter("title");
      String c_content = request.getParameter("content");
      String c_writer = request.getParameter("writer");
      
      System.out.println(c_title);

      
      
      // 받아온 데이터를 VO객체에 담기
      CourseVO courseVO = new CourseVO();
      courseVO.setC_title(c_title);
      courseVO.setC_content(request.getParameter("content").replace("\r", "").replace("\n", "<br>"));
      courseVO.setC_writer(c_writer);

      
      ICourseService service = CourseServiceImpl.getInstance();
      service.InsertCourse(courseVO);
      
      // 게시글 목록으로 이동하기
      response.sendRedirect(request.getContextPath() + "/course/redirect.do");
   }

   protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
      // TODO Auto-generated method stub
      doGet(request, response);
   }

}
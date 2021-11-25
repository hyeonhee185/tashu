package kr.or.ddit.notice.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.ddit.notice.service.INoticeService;
import kr.or.ddit.notice.service.NoticeServiceImpl;
import kr.or.ddit.notice.vo.NoticeVO;



@WebServlet("/notice/insert.do")
public class BoardInsert extends HttpServlet {
   private static final long serialVersionUID = 1L;

   protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

      request.setCharacterEncoding("utf-8");
      
      // writeForm.jsp에서 입력한 데이터 받아오기
      String title = request.getParameter("title");
      String content = request.getParameter("content");
      String writer = request.getParameter("writer");

      
      
      // 받아온 데이터를 VO객체에 담기
      NoticeVO noticeVO = new NoticeVO();
      noticeVO.setTitle(title);
      noticeVO.setContent(request.getParameter("content").replace("\r", "").replace("\n", "<br>"));
      noticeVO.setWriter(writer);


      
      INoticeService service = NoticeServiceImpl.getInstance();
      service.insertBoard(noticeVO);
      
      // 게시글 목록으로 이동하기
      response.sendRedirect(request.getContextPath() + "/notice/redirect.do");
   }

   protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
      // TODO Auto-generated method stub
      doGet(request, response);
   }

}
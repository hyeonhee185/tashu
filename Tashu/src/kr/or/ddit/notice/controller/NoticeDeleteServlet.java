package kr.or.ddit.notice.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.ddit.notice.service.INoticeService;
import kr.or.ddit.notice.service.NoticeServiceImpl;

/**
 * Servlet implementation class NoticeDeleteServlet
 */
@WebServlet("/notice/BoardDelete.do")
public class NoticeDeleteServlet extends HttpServlet {
	   private static final long serialVersionUID = 1L;
		// TODO Auto-generated constructor stub


	   protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	      
	      // 삭제할 게시글 번호 받아오기
	      int boardNum = Integer.parseInt(request.getParameter("bno"));
	      System.out.println("번호"+boardNum);
	      
	      INoticeService service = NoticeServiceImpl.getInstance();
	      service.deleteNotice(boardNum);
	      
	      response.sendRedirect(request.getContextPath() + "/notice/redirect.do");
	      
		}
}
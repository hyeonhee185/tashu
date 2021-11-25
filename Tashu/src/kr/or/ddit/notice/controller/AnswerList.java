package kr.or.ddit.notice.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.ddit.notice.service.INoticeService;
import kr.or.ddit.notice.service.NoticeServiceImpl;

/**
 * Servlet implementation class AnswerList
 */
@WebServlet("/notice/ReplyList")
public class AnswerList extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int bno = Integer.parseInt(request.getParameter("no"));
		
		INoticeService service = NoticeServiceImpl.getInstance();
		
//		List<ReplyVO> list = service.ReplyList(bno);
		
//		request.setAttribute("list", list);
		
		request.getRequestDispatcher("/WEB-INF/view/notice/noticeReply.jsp").forward(request, response);
	}


}

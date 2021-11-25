//package kr.or.ddit.notice.controller;
//
//import java.io.IOException;
//import javax.servlet.ServletException;
//import javax.servlet.annotation.WebServlet;
//import javax.servlet.http.HttpServlet;
//import javax.servlet.http.HttpServletRequest;
//import javax.servlet.http.HttpServletResponse;
//
//import kr.or.ddit.notice.service.INoticeService;
//import kr.or.ddit.notice.service.NoticeServiceImpl;
//import kr.or.ddit.notice.vo.ReplyVO;
//
//
///**
// * Servlet implementation class SaveAnswer
// */
//@WebServlet("/notice/SaveAnswer")
//public class SaveAnswer extends HttpServlet {
//	private static final long serialVersionUID = 1L;
//
//	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//		request.setCharacterEncoding("utf-8");
//		
//		
//		ReplyVO vo = new ReplyVO();
//		
//		vo.setBno(Integer.parseInt(request.getParameter("enum")));
//		vo.setAnswer_cn(request.getParameter("acn").replace("\r", "").replace("\n", "<br>"));
//		vo.setMem_name(request.getParameter("aname"));
//		vo.setMem_id(request.getParameter("id"));
//		
//		INoticeService service = NoticeServiceImpl.getInstance();
//		int seq = service.saveAnswer(vo);
//		System.out.println(seq);
//		request.setAttribute("seq", seq);
//		request.getRequestDispatcher("/WEB-INF/view/notice/saveResult.jsp").forward(request, response);
//	}
//
//}

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


/**
 * Servlet implementation class ListDetail
 */
@WebServlet("/notice/ListDetail")
public class ListDetail extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String no = request.getParameter("no");
		
		int bno = Integer.parseInt(no);
		System.out.println("이상하냐?>>>"+bno);
		
		INoticeService service = NoticeServiceImpl.getInstance();
		
		int chk = service.updateShowedNotice(bno);
		
		if(chk == 0) {
			System.exit(0);
		}
		
		NoticeVO vo = service.showSelectedNotice(bno);
		if(vo == null) {
			System.out.println("메메메ㅔㅁ");
		}
		request.setAttribute("vo", vo);
		
		request.getRequestDispatcher("/WEB-INF/view/notice/NoticeDetail.jsp").forward(request, response);
		
	}


}

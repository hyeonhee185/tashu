package kr.or.ddit.notice.controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.ddit.notice.service.INoticeService;
import kr.or.ddit.notice.service.NoticeServiceImpl;
import kr.or.ddit.notice.vo.NoticeVO;

/**
 * Servlet implementation class searchEventListServlet
 */
@WebServlet("/notice/searchNoticeList.do")
public class searchNoticeListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("utf-8");
		
		int spage = 1;
		spage = Integer.parseInt(request.getParameter("page"));
		
		int perPage = 10;
		
		int perList = 10;
		
		String keyword = request.getParameter("sel");
		String data = request.getParameter("dat");
		
		System.out.println(keyword);
		System.out.println(data);
		
		INoticeService service = NoticeServiceImpl.getInstance();
		
		int count = 0;
		NoticeVO vo = new NoticeVO();
		
		if(keyword.equals("undefined") || data.equals("undefined") || data.equals("") ){
			count = service.CountNoticeList();
		}else{
			if(keyword.equals("writer")){
				vo.setWriter(data);
				count = service.countSearchNotice(vo);
			}else if (keyword.equals("title")){
				vo.setTitle(data);
				count = service.countSearchNotice(vo);
			}else if(keyword.equals("content")){
				vo.setContent(data);
				count = service.countSearchNotice(vo);
			}
		}
		
		
		
		int totalPage = (int)Math.ceil((double)count/(double)perList);
		
		//각 페이지 별 게시글의 start, end
				//현재 한페이지의 개시글(perList) 갯수 : 5
				//if 현재 페이지 1일때 : (1-1)*10 + 1= 1
				//if 현재 페이지 2일때 : (2-1)*10 + 1= 11
				//if 현재 페이지 3일때 : 21 / 4일때 16 / 5일때 21 ...
		int start = (spage-1)*perList + 1;
		
		int end = start + perList -1;
		if(end>count) {
			end = count;
		}
		//페이지의 번호
				//if 현재 페이지 1일때 : ((1-1)/10*10)+1 = 1
				//if 현재 페이지 2일때 : ((2-1)/10*10)+1 = 1
				//if 현재 페이지 3일때 : ((3-1)/10*10)+1 = 1
				//if 현재 페이지 4일때 : ((4-1)/10*10)+1 = 1 ...
				//if 현제페이지 11일때 : ((11-1)/10*10)+1 = 11
		int startPage = ((spage-1)/perPage * perPage)+1;
		
		int endPage = startPage + perPage -1;
		if(endPage>totalPage) {
			endPage = totalPage;
		}
		
		
		List<NoticeVO> list = null;
		Map<String, String>map = new HashMap<>();
		map.put("start", Integer.toString(start));
		map.put("end",Integer.toString(end));
		
		
		if(keyword.equals("undefined") || data.equals("undefined") || data.equals("")){
			list = service.noticeList(map);
		}else{
			if(keyword.equals("writer")){
				map.put("writer", data);
				list = service.searchNotice(map);
			}else if (keyword.equals("title")){
				map.put("title", data);
				list = service.searchNotice(map);
			}else if(keyword.equals("content")){
				map.put("content", data);
				list = service.searchNotice(map);
			}
		}
		
		
		request.setAttribute("list", list);
		
		
		request.setAttribute("startPage", startPage);
		request.setAttribute("endPage", endPage);
		request.setAttribute("totalPage", totalPage);
		
		request.getRequestDispatcher("/WEB-INF/view/notice/NoticeList2.jsp").forward(request, response);
	}

}

package kr.or.ddit.course.controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.ddit.course.service.CourseServiceImpl;
import kr.or.ddit.course.service.ICourseService;
import kr.or.ddit.course.vo.CourseVO;


/**
 * Servlet implementation class searchEventListServlet
 */
@WebServlet("/course/SearchCourseList.do")
public class searchCourseListServlet extends HttpServlet {
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
		
		ICourseService service = CourseServiceImpl.getInstance();
		
		int count = 0;
		CourseVO vo = new CourseVO();
		
		if(keyword.equals("undefined") || data.equals("undefined") || data.equals("") ){
			count = service.CountCourseList();
		}else{
			if(keyword.equals("c_writer")){
				vo.setC_writer(data);
				count = service.CountSearchCourse(vo);
			}else if (keyword.equals("c_title")){
				vo.setC_title(data);
				count = service.CountSearchCourse(vo);
			}else if(keyword.equals("c_content")){
				vo.setC_content(data);
				count = service.CountSearchCourse(vo);
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
		
		
		List<CourseVO> list = null;
		Map<String, String>map = new HashMap<>();
		map.put("start", Integer.toString(start));
		map.put("end",Integer.toString(end));
		
		
		if(keyword.equals("undefined") || data.equals("undefined") || data.equals("")){
			list = service.CourseList(map);
		}else{
			if(keyword.equals("c_writer")){
				map.put("c_writer", data);
				list = service.SearchCourse(map);
			}else if (keyword.equals("c_title")){
				map.put("c_title", data);
				list = service.SearchCourse(map);
			}else if(keyword.equals("c_content")){
				map.put("c_content", data);
				list = service.SearchCourse(map);
			}
		}
		
		
		request.setAttribute("list", list);
		
		
		request.setAttribute("startPage", startPage);
		request.setAttribute("endPage", endPage);
		request.setAttribute("totalPage", totalPage);
		
		request.getRequestDispatcher("/WEB-INF/view/course/CourseList2.jsp").forward(request, response);
	}

}

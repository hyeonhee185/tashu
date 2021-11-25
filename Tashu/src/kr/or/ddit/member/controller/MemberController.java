package kr.or.ddit.member.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.lang.reflect.InvocationTargetException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.beanutils.BeanUtils;

import com.google.gson.Gson;

import kr.or.ddit.member.service.IMemberService;
import kr.or.ddit.member.service.MemberServiceImpl;
import kr.or.ddit.member.vo.MemberVO;

/**
 * Servlet implementation class MemberController
 */
@WebServlet("/member/join.do")
public class MemberController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
//    /**
//     * @see HttpServlet#HttpServlet()
//     */
    public MemberController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//jsp로 값 전달하기 - forward
		RequestDispatcher disp = request.getRequestDispatcher("/WEB-INF/view/member/join.jsp");
		disp.forward(request, response);
		
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("utf-8");
		//요청데이터 받기 - 9개 data를 받아서 처리
		MemberVO vo = new MemberVO();
		try {
			BeanUtils.populate(vo, req.getParameterMap());
		} catch (IllegalAccessException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (InvocationTargetException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		//service객체 얻어오기
		IMemberService service = MemberServiceImpl.getInstance();

		//service 메소드 호출 - 값 얻기
//		String insert = service.insertMember(vo);
		int insert = service.insertMember(vo);
		if(insert == 1) {
			req.setAttribute("uId", vo.getMem_id());
			resp.sendRedirect(req.getContextPath() + "/login.do");
			//req.getRequestDispatcher("/WEB-INF/view/member/login.jsp").forward(req, resp);
		}else{
			req.setAttribute("uId", null);
		}
		//jsp로 값 전달하기 - forward

		
	}

}

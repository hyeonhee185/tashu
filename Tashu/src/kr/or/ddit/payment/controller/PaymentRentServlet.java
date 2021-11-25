package kr.or.ddit.payment.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kr.or.ddit.member.vo.MemberVO;
import kr.or.ddit.payment.service.PaymentImpl;

/**
 * Servlet implementation class PaymentRentServlet
 */
@WebServlet("/payment/paymentRent.do")
public class PaymentRentServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=UTF-8");
		
		PrintWriter writer = response.getWriter();
		HttpSession session = request.getSession();
		
		MemberVO member = (MemberVO)session.getAttribute("member");
		/*if (member==null) {
			writer.println("<script>");
			writer.println("alert('로그인 후 이용해주세요.');");
			writer.println("</script>");
			writer.println("<script>location.replace(\"/Tashu/WEB-INF/view/login/login.jsp\");</script>"); 
			
		}*/
		String mem_id = member.getMem_id();
		
		
		PaymentImpl service = PaymentImpl.getInstance();
		int check = service.getPaymentTime(mem_id);
		System.out.println(check);
		if (check!=0) {
			request.getRequestDispatcher("/WEB-INF/view/station/rentStationList.jsp").forward(request, response);
		}else {
			//request.getRequestDispatcher("/jiaTest.jsp").forward(request, response);
			writer.println("<script>");
			writer.println("alert('구매한 이용권이 없습니다.');");
			writer.println("</script>");
			writer.println("<script>location.replace(\"/Tashu/rental/rentMain.do\");</script>"); 
			
		}
		writer.close();
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}

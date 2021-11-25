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
 * Servlet implementation class PaymentSelectServlet
 */
@WebServlet("/payment/paymentSelect.do")
public class PaymentSelectServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=UTF-8");
		
		String select = request.getParameter("voucher_id");
		PaymentImpl ss = PaymentImpl.getInstance();
		String price = ss.getPrice(select);

		HttpSession ssion = request.getSession();
		MemberVO vo = (MemberVO)ssion.getAttribute("member");
		PrintWriter writer = response.getWriter();
		String mem_id = vo.getMem_id();
		int cnt = ss.getPaymentTime(mem_id);
		if (cnt==0) {
			request.setAttribute("id", select);
			request.setAttribute("price", price);
			request.getRequestDispatcher("/WEB-INF/view/payment/payment.jsp").forward(request, response);			
		}else {
			writer.println("<script>");
			writer.println("alert('이미 구매한 이용권이 있습니다.');");
			writer.println("</script>");
			writer.println("<script>location.replace(\"/Tashu/paymentReady.do\");</script>"); 
			
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}

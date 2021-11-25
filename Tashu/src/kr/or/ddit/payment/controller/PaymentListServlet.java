package kr.or.ddit.payment.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kr.or.ddit.member.vo.MemberVO;
import kr.or.ddit.payment.service.PaymentImpl;
import kr.or.ddit.payment.vo.PaymentVO;
import kr.or.ddit.rental.service.RentalServiceImpl;
import kr.or.ddit.rental.vo.RentalVO;

/**
 * Servlet implementation class PaymentListServlet
 */
@WebServlet("/payment/paymentList.do")
public class PaymentListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		response.setContentType("application/json; charset=utf-8");
		PaymentImpl service = PaymentImpl.getInstance();
		
		HttpSession session = request.getSession();
		MemberVO member = (MemberVO)session.getAttribute("member");
		if (member==null) {
			RequestDispatcher rd = request.getRequestDispatcher("/login.do");
			rd.forward(request, response);
		}else {
			String mem_id = member.getMem_id();
			List<PaymentVO> paymentList = service.paymentList(mem_id);
			request.setAttribute("paymentList", paymentList);
			RequestDispatcher rd = request.getRequestDispatcher("/WEB-INF/view/payment/paymentList.jsp");
			rd.forward(request, response);
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

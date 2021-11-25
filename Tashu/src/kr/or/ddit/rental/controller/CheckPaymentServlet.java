package kr.or.ddit.rental.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kr.or.ddit.rental.service.RentalServiceImpl;

/**
 * Servlet implementation class CheckPaymentServlet
 */
@WebServlet("/rental/checkPayment.do")
public class CheckPaymentServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		RentalServiceImpl service = RentalServiceImpl.getInstance();
		
		String paymentNo = request.getParameter("payment_no");
		
		List<String> check = service.getPayment(paymentNo);
		
		response.setContentType("text/html; charset=UTF-8"); 
		PrintWriter writer = response.getWriter(); 
		if (check.size()==0) {
			
			writer.println("<script>location.replace(\"/Tashu/payment/paymentCancel.do?paymentNo="+paymentNo+"\");</script>"); 
		}else{
			writer.println("<script>alert('대여이력이 있으면 결제를 취소할 수 없습니다.'); </script>"); 
			writer.println("<script>location.replace(\"/Tashu/paymentList.jsp\");</script>"); 
			
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

package kr.or.ddit.payment.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.google.gson.Gson;

import kr.or.ddit.member.vo.MemberVO;
import kr.or.ddit.payment.service.IPaymentService;
import kr.or.ddit.payment.service.PaymentImpl;
import kr.or.ddit.payment.vo.PaymentVO;
import kr.or.ddit.voucher.vo.VoucherVO;

@WebServlet("/payment.do")
public class PaymentServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		response.setContentType("application/json; charset=utf-8");
		
		// 세션에서 정보 가져오기
	      HttpSession session = request.getSession();
	      MemberVO vo = (MemberVO) session.getAttribute("member");
	      
	      // 아이디 정보 
	      String mem_id = vo.getMem_id();
	      
	      String voucher_id = request.getParameter("voucher_id");
	      int voucher = Integer.parseInt(voucher_id);
	      PaymentVO paymentvo = new PaymentVO();
	      paymentvo.setMem_id(mem_id);
	      paymentvo.setVaucher_id(voucher);
	      
	      PaymentImpl service = PaymentImpl.getInstance();
	      int cnt = service.insertPayment(paymentvo);
	      //System.out.println(cnt);
	      Gson gson = new Gson();
	      String result=null;
	      if (cnt>0) {
	    	  result=gson.toJson("OK");
		}else {
			result=gson.toJson("Fail");
		}
			response.getWriter().println(result);
			response.flushBuffer();
	      
	      

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}

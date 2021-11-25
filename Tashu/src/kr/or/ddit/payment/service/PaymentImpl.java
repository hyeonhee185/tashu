package kr.or.ddit.payment.service;

import java.util.List;

import kr.or.ddit.payment.dao.IPaymentDAO;
import kr.or.ddit.payment.dao.PaymentDaoImpl;
import kr.or.ddit.payment.vo.PaymentVO;

public class PaymentImpl implements IPaymentService {

	private static PaymentImpl service;

	private IPaymentDAO paymentDao;

	private PaymentImpl() {
		
		paymentDao = PaymentDaoImpl.getInstance();
	}


	public static PaymentImpl getInstance() {
		if (service == null)
			service = new PaymentImpl();
		return service;
	}

	@Override
	public int insertPayment(PaymentVO paymentVO) {
		return paymentDao.insertPayment(paymentVO);
	
	}


	@Override
	public List<PaymentVO> paymentList(String mem_id) {
		return paymentDao.paymentList(mem_id);
	}


	@Override
	public String getPrice(String voucher_id) {
		return paymentDao.getPrice(voucher_id);
	}


	@Override
	public int getPaymentTime(String mem_id) {
		return paymentDao.getPaymentTime(mem_id);
	}
	
	

}
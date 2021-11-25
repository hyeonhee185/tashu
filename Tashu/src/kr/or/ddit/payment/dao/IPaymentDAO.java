package kr.or.ddit.payment.dao;

import java.util.List;

import kr.or.ddit.payment.vo.PaymentVO;

public interface IPaymentDAO {

	/**
	 * 
	 * @param paymentVO
	 * @return
	 */
	public int insertPayment(PaymentVO paymentVO);
	
	/**
	 * 결제 이력 내역을 출력하는 메소드
	 * @param mem_id 해당 회원의 아이디
	 * @return 결제 이력
	 */
	public List<PaymentVO> paymentList(String mem_id);
	
	/**
	 * 결제 가격을 가져오는 메소드
	 * @param voucher_id 이용권 아이디
	 * @return 결제 가격
	 */
	public String getPrice(String voucher_id);
	
	
	/**
	 * 사용시간이 남은 결제번호 조회
	 * @param mem_id 해당 회원의 아이디
	 * @return 결제번호
	 */
	public int getPaymentTime(String mem_id);
}

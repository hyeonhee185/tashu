package kr.or.ddit.rental.service;

import java.util.List;
import java.util.Map;

import kr.or.ddit.rental.vo.RentalVO;

public interface IRentalService {
	public int insertRental(Map<String, String> paramMap);
	
	public int updateReturn(Map<String, String> paramMap);
	
	public String checkRent(String mem_id);
	
	/**
	 * db에 저장된 대여 이력을 전부 가져오는 메소드
	 * @param mem_id 회원 아이디
	 * @return 대여 이력
	 */
	public List<RentalVO> getAllRent(String mem_id);
	
	/**
	 * 결제 번호에서 대여 이력을 확인하는 메소드
	 * @param payment_no 결제 번호
	 * @return 대여 번호 리스트
	 */
	public List<String> getPayment(String payment_no);
}

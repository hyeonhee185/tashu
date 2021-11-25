package kr.or.ddit.rental.service;

import java.util.List;
import java.util.Map;

import kr.or.ddit.rental.dao.IRentalDAO;
import kr.or.ddit.rental.dao.RentalDaoImpl;
import kr.or.ddit.rental.vo.RentalVO;

public class RentalServiceImpl implements IRentalService{
	private static RentalServiceImpl service;
	private IRentalDAO dao;
	
	private RentalServiceImpl() {
		dao = RentalDaoImpl.getInstance();
	}
	
	public static RentalServiceImpl getInstance() {
		if (service==null) service = new RentalServiceImpl();
		return service;
	}

	@Override
	public int insertRental(Map<String, String> paramMap) {
		return dao.insertRental(paramMap);
	}

	@Override
	public int updateReturn(Map<String, String> paramMap) {
		return dao.updateReturn(paramMap);
	}

	@Override
	public String checkRent(String mem_id) {
		return dao.checkRent(mem_id);
	}

	@Override
	public List<RentalVO> getAllRent(String mem_id) {
		return dao.getAllRent(mem_id);
	}

	@Override
	public List<String> getPayment(String payment_no) {
		return dao.getPayment(payment_no);
	}
	
	
}

package kr.or.ddit.rental.dao;

import java.io.IOException;
import java.io.Reader;
import java.nio.charset.Charset;
import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import com.ibatis.common.resources.Resources;
import com.ibatis.sqlmap.client.SqlMapClient;
import com.ibatis.sqlmap.client.SqlMapClientBuilder;

import kr.or.ddit.rental.vo.RentalVO;

public class RentalDaoImpl implements IRentalDAO{
	private static RentalDaoImpl dao;
	private SqlMapClient smc;
	public RentalDaoImpl() {
		try {
			Charset charset = Charset.forName("UTF-8");
			Resources.setCharset(charset);
			Reader rd = Resources.getResourceAsReader("kr/or/ddit/config/sqlMapConfig.xml");
			smc = SqlMapClientBuilder.buildSqlMapClient(rd);
			rd.close();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	public static RentalDaoImpl getInstance(){
		if(dao==null) dao = new RentalDaoImpl();
		return dao;
	}
	
	@Override
	public int insertRental(Map<String, String> paramMap) {
		int cnt =0;
		try {
			cnt = smc.update("rental.insertRental",paramMap);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return cnt;
	}

	@Override
	public int updateReturn(Map<String, String> paramMap) {
		int cnt =0;
		try {
			cnt = smc.update("rental.updateReturn",paramMap);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return cnt;
	}

	@Override
	public String checkRent(String mem_id) {
		String check ="";
		try {
			check = (String)smc.queryForObject("rental.checkRent",mem_id);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return check;
	}

	@Override
	public List<RentalVO> getAllRent(String mem_id) {
		List<RentalVO> rentalList = null;
		try {
			rentalList = smc.queryForList("rental.getAllRent",mem_id);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return rentalList;
	}

	@Override
	public List<String> getPayment(String payment_no) {
		List<String> paymentList = null;
		try {
			paymentList = smc.queryForList("rental.getPayment",payment_no);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return paymentList;
	}

}

package kr.or.ddit.payment.dao;

import java.io.IOException;
import java.io.Reader;
import java.nio.charset.Charset;
import java.sql.SQLException;
import java.util.List;

import com.ibatis.common.resources.Resources;
import com.ibatis.sqlmap.client.SqlMapClient;
import com.ibatis.sqlmap.client.SqlMapClientBuilder;

import kr.or.ddit.payment.vo.PaymentVO;



public class PaymentDaoImpl implements IPaymentDAO {

	private static PaymentDaoImpl dao;
	private SqlMapClient smc;

	private PaymentDaoImpl() {
		try {
			Charset charset = Charset.forName("UTF-8");
			Resources.setCharset(charset);
			Reader rd = Resources.getResourceAsReader("kr/or/ddit/config/sqlMapConfig.xml");
			smc = SqlMapClientBuilder.buildSqlMapClient(rd);
			rd.close();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	public static PaymentDaoImpl getInstance() {
		if (dao == null)
			dao = new PaymentDaoImpl();
		return dao;
	}
	
	@Override
	public int insertPayment(PaymentVO paymentVO) {
		int cnt = 0;
		try {
			Object obj = smc.insert("payment.insertPayment", paymentVO);
			if (obj == null)
				cnt = 1;

		} catch (SQLException e) {
			cnt = 0;
			e.printStackTrace();
		}

		return cnt;
	}
	
	
	public List<PaymentVO> paymentList(String mem_id){
		List<PaymentVO> paymentList = null;
		try {
			paymentList = smc.queryForList("payment.getPaymentList",mem_id);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return paymentList;
	}

	@Override
	public String getPrice(String voucher_id) {
		String voucherPrice = null;
		try {
			voucherPrice=(String) smc.queryForObject("payment.getPrice",voucher_id);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return voucherPrice;
	}

	@Override
	public int getPaymentTime(String mem_id) {
		int payment_no = 0;
		try {
			payment_no = (int)smc.queryForObject("payment.getPaymentTime", mem_id);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return payment_no;
	}
	
	
}
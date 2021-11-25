package kr.or.ddit.coaching.dao;

import java.io.IOException;
import java.io.Reader;
import java.nio.charset.Charset;
import java.sql.SQLException;
import java.util.Map;

import com.ibatis.common.resources.Resources;
import com.ibatis.sqlmap.client.SqlMapClient;
import com.ibatis.sqlmap.client.SqlMapClientBuilder;

import kr.or.ddit.mem_answer.dao.Member_AnswerDaoImpl;


public class CoachingDAOImpl implements ICoachingDao {
	private static CoachingDAOImpl dao;
	private SqlMapClient smc;
	public CoachingDAOImpl() {
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
	
	public static CoachingDAOImpl getInstance(){
		if(dao==null) dao = new CoachingDAOImpl();
		return dao;
	}
	
	@Override
	public int insertMem(Map<String, String> paramMap) {
		int cnt = 0;
		try {
			smc.insert("coaching.insertMem", paramMap);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return cnt;
	}
	




}

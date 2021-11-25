package kr.or.ddit.mem_answer.dao;

import java.io.IOException;
import java.io.Reader;
import java.nio.charset.Charset;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import com.ibatis.common.resources.Resources;
import com.ibatis.sqlmap.client.SqlMapClient;
import com.ibatis.sqlmap.client.SqlMapClientBuilder;

import kr.or.ddit.mem_answer.vo.Mem_AnswerVO;
import kr.or.ddit.member.vo.MemberVO;
import kr.or.ddit.rental.dao.RentalDaoImpl;

public class Member_AnswerDaoImpl implements IMember_AnswerDAO {
	private static Member_AnswerDaoImpl dao;
	private SqlMapClient smc;
	public Member_AnswerDaoImpl () {
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
	
	public static Member_AnswerDaoImpl getInstance(){
		if(dao==null) dao = new Member_AnswerDaoImpl();
		return dao;
	}
	

	@Override
	public String checkMemAnswer(String mem_id) {
		String check="";
		try {
			check = (String)smc.queryForObject("mem_answer.checkMemAnswer",mem_id);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return check;
	}
	
	@Override
	public int insertMember_Answer(Map<String, String> paramMap) {
		int cnt = 0;
		try {
			smc.insert("mem_answer.insertMemAnswer", paramMap);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return cnt;
	}
	

	@Override
	public int insertGosuMember_Answer(Map<String, String> paramMap) {
		int cnt = 0;
		try {
			smc.insert("mem_answer.insertGosuAnswer", paramMap);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return cnt;
	}

	@Override
	public List<String> MatchingGosu(String mem_id) {
		List<String> gosuList = new ArrayList<>();
		
		try {
			gosuList = smc.queryForList("mem_answer.matchingGosu",mem_id);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return gosuList;
	}

	@Override
	public List<Mem_AnswerVO> normalMemresult(String teach_mem) {
		List<Mem_AnswerVO> memAnswerList = new ArrayList<>();
		try {
			memAnswerList = smc.queryForList("mem_answer.normalMemresult",teach_mem);
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return memAnswerList;
	}

	@Override
	public String checkMemMatchingResult(String mem_id) {
		String check="";
		try {
			check = (String)smc.queryForObject("mem_answer.checkMemMatchingResult",mem_id);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return check;
	}

	@Override
	public int deleteMatchingResult(String mem_id) {
		int cnt = 0;
		try {
			cnt = smc.delete("mem_answer.deleteMatchingResult", mem_id);
		} catch (SQLException e) {
			cnt = 0;
			e.printStackTrace();
		}
		return cnt;
	}





}

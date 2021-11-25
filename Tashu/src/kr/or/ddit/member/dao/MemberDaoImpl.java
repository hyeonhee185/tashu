package kr.or.ddit.member.dao;

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

import kr.or.ddit.member.vo.MemberVO;
import kr.or.ddit.member.vo.ZipVO;

public class MemberDaoImpl implements IMemberDAO {
	// 1번
	private static MemberDaoImpl dao;
	private SqlMapClient smc; // iBatis객체가 저장될 변수 선언

	// 2번

	private MemberDaoImpl() {
		// Dao의 생성자에서 iBatis환경 설정 및 iBatis 객체 생성
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

	// 3번
	public static MemberDaoImpl getInstance() {
		if (dao == null)
			dao = new MemberDaoImpl();
		return dao;
	}

	// 기존꺼에서 입력받고 이런거 말고 DB처리되는 부분만
/*	@Override
	public int insertMember(MemberVO memVO) {
		int cnt = 0;// 반환값이 저장될 변수
		try {
			Object obj = smc.insert("member.insertMember", memVO);
			if (obj == null) {
				cnt = 1;
			}
		} catch (SQLException e) {
			cnt = 0;
			e.printStackTrace();
		}
		return cnt;
	}*/
	@Override
	public int insertMember(MemberVO vo) {
		
		int cnt = 0;
		try {
			Object obj = smc.insert("member.insertMember", vo);
			if (obj == null)
				cnt = 1;

		} catch (SQLException e) {
			cnt = 0;
			e.printStackTrace();
		}

		return cnt;
	
		
	}

	@Override
	public int deleteMember(String memId) {
		int cnt = 0;
		try {
			cnt = smc.delete("member.deleteMember", memId);
		} catch (SQLException e) {
			cnt = 0;
			e.printStackTrace();
		}
		return cnt;
	}

	@Override
	public int updateMember(MemberVO memVO) {
		int cnt = 0;
		try {
			cnt = smc.update("member.updateMember", memVO);
		} catch (SQLException e) {
			cnt = 0;
			e.printStackTrace();
		}
		return cnt;
	}

	@Override
	public List<MemberVO> getAllMemberList() {
		List<MemberVO> memList = new ArrayList<>();
		try {
			memList = smc.queryForList("member.getAllMember");

		} catch (SQLException e) {
			e.printStackTrace();
		}
		return memList;
	}

	@Override
	public int getMemberCount(String memId) {

		int cnt = 0;

		try {
			cnt = (int) smc.queryForObject("member.getCnt", memId);
			// 항상 형변환
		} catch (SQLException e) {
			cnt = 0;
			e.printStackTrace();
		}
		return cnt;
	}

	@Override
	public int updateSelect(Map<String, String> paramMap) {

		int cnt = 0;
		try {
			cnt = smc.update("member.updateSelect", paramMap);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return cnt;
	}

	@Override
	public MemberVO getMember(String memId) {
		MemberVO memvo = null;

		try {
			memvo = (MemberVO) smc.queryForObject("member.getMember", memId);

		} catch (SQLException e) {
			e.printStackTrace();
		}

		return memvo;
	}

	@Override
	public MemberVO login(MemberVO memberVO) {
		MemberVO memvo = null; 

		try {
			memvo = (MemberVO) smc.queryForObject("member.login", memberVO);

		} catch (SQLException e) {
			e.printStackTrace();
		}

		return memvo;
	}

	@Override
	public int idCheck(String id) throws SQLException {
		return (int) smc.queryForObject("member.idCheck", id);
	}

	@Override
	public List<ZipVO> searchCode(String dong) throws SQLException {
		return smc.queryForList("member.searchCode", dong);
	}

	@Override
	public MemberVO adminLogin(MemberVO memberVO) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<MemberVO> statusMember(int status) {
		List<MemberVO> statusList = null;
		try {
			statusList = smc.queryForList("member.statusMember",status);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return statusList;
	}


	


	
}

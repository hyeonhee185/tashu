package kr.or.ddit.member.service;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import kr.or.ddit.member.dao.IMemberDAO;
import kr.or.ddit.member.dao.MemberDaoImpl;
import kr.or.ddit.member.vo.MemberVO;
import kr.or.ddit.member.vo.ZipVO;

public class MemberServiceImpl implements IMemberService {
	// 1번
	private static MemberServiceImpl service;

	// 2번
	private IMemberDAO memDao;

	private String memId;

	private MemberServiceImpl() {
		// memDao = new MemberDaoImpl();
		memDao = MemberDaoImpl.getInstance();
	}

	// 3번
	public static MemberServiceImpl getInstance() {
		if (service == null)
			service = new MemberServiceImpl();
		return service;
	}

	@Override
	public int insertMember(MemberVO memVO) {
		return memDao.insertMember(memVO);
	}

	@Override
	public int deleteMember(String memId) {
		return memDao.deleteMember(memId);
	}

	@Override
	public int updateMember(MemberVO memVO) {
		return memDao.updateMember(memVO);
	}

	@Override
	public List<MemberVO> getAllMemberList() {
		return memDao.getAllMemberList();

	}

	@Override
	public int getMemberCount(String memId) {
		return memDao.getMemberCount(memId);
	}

	@Override
	public int updateSelect(Map<String, String> paramMap) {
		return memDao.updateSelect(paramMap);
	}

	@Override
	public MemberVO getMember(String memId) {
		return memDao.getMember(memId);
	}

	@Override
	public MemberVO login(MemberVO memberVO) {
		return memDao.login(memberVO);
	}

	@Override
	public int idCheck(String id) {
		int mId = 0;
		try {
			mId = memDao.idCheck(id);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return mId;
	}

	@Override
	public List<ZipVO> searchCode(String dong) {
		List<ZipVO> list = null;
		
		try {
			list = memDao.searchCode(dong);
		} catch (Exception e) {
			// TODO: handle exception
		}
		return list;
	}

	@Override
	public List<MemberVO> statusMember(int status) {
		List<MemberVO> statusList = null;
		statusList = memDao.statusMember(status);
		return statusList;
	}


	
	
	
}

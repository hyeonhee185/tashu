package kr.or.ddit.notice.dao;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import com.ibatis.sqlmap.client.SqlMapClient;

import kr.or.ddit.config.BulidSqlMapClient;
import kr.or.ddit.notice.vo.NoticeVO;


public class NoticeDaoImpl implements INoticeDao {
	// 싱글톤
	
	private static NoticeDaoImpl dao;
	private SqlMapClient smc; // 아이바티스 객체가 저장될 변수
	
	private NoticeDaoImpl() {
		smc = BulidSqlMapClient.getSqlMapClient();
	}
	
	public static NoticeDaoImpl getInstance() {
		if(dao == null) dao = new NoticeDaoImpl();
		
		return dao;
	}
	
	
	
	@Override
	public List<NoticeVO> getAllNoticeList() {
		List<NoticeVO> list = null;
		
		try {
			list = smc.queryForList("notice.getAllEventList");
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return list;
	}

	@Override
	public int CountNoticeList() {
		int cnt = 0;
		
		try {
			cnt = (int)smc.queryForObject("notice.CountNoticeList");
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return cnt;
	}

	@Override
	public List<NoticeVO> noticeList(Map<String,String>map) {
		List<NoticeVO> list = null;
		
		try {
			list = smc.queryForList("notice.noticeList",map);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return list;
	}

	@Override
	public int countSearchNotice(NoticeVO vo) {
		int cnt = 0;
		
		try {
			cnt = (int)smc.queryForObject("notice.countSearchNotice",vo);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return cnt;
	}

	@Override
	public List<NoticeVO> searchNotice(Map<String,String> map) {
		List<NoticeVO> list = null;
		
		try {
			list = smc.queryForList("notice.searchNotice",map);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return list;
	}

	@Override
	public int updateShowedNotice(int bno) {
		int i = 0;
		
		try {
			i = smc.update("notice.updateShowedNotice",bno);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return i;
	}

	@Override
	public NoticeVO showSelectedNotice(int bno) {
		NoticeVO vo = null;
				
		try {
			vo = (NoticeVO) smc.queryForObject("notice.showSelectedNotice",bno);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return vo;
		
	}

	@Override
	public int insertBoard(NoticeVO noticeVO) {
		 int cnt = 0;
	      
	      try {
	         Object obj = smc.insert("notice.insertBoard", noticeVO);
	         if (obj == null) {
	            cnt = 1;
	         }
	         
	      } catch (SQLException e) {
	         e.printStackTrace();
	      }
	      return cnt;
	   }

	@Override
		public int deleteNotice(int bno){
		      int cnt = 0;
		      
		      try {
		         cnt = smc.delete("notice.deleteBoard", bno);
		      } catch (SQLException e) {
		         cnt = 0;
		         e.printStackTrace();
		      }
		      return cnt;
		   }

	}
	


//	@Override
//	public List<AnswerVO> eAnswerList(int bbsctt_no) {
//		List<AnswerVO> list = null;
//		
//		try {
//			list = smc.queryForList("eAnswer.eAnswerList",bbsctt_no);
//		} catch (SQLException e) {
//			// TODO Auto-generated catch block
//			e.printStackTrace();
//		}
//		
//		return list;
//	}
//
//	@Override
//	public int saveeAnswer(AnswerVO vo) {
//		int seq = 0;
//		try {
//			seq = (int)smc.insert("eAnswer.saveeAnswer",vo);
//		} catch (SQLException e) {
//			// TODO Auto-generated catch block
//			e.printStackTrace();
//		}
//		return 0;
//	}
//
//}

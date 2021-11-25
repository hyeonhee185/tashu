package kr.or.ddit.course.dao;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import com.ibatis.sqlmap.client.SqlMapClient;

import kr.or.ddit.config.BulidSqlMapClient;
import kr.or.ddit.course.vo.CourseVO;
import kr.or.ddit.course.vo.ReplyVO;
import kr.or.ddit.notice.vo.NoticeVO;


public class CourseDaoImpl implements ICourseDao {
	// 싱글톤
	
	private static CourseDaoImpl dao;
	private SqlMapClient smc; // 아이바티스 객체가 저장될 변수
	
	private CourseDaoImpl() {
		smc = BulidSqlMapClient.getSqlMapClient();
	}
	
	public static CourseDaoImpl getInstance() {
		if(dao == null) dao = new CourseDaoImpl();
		
		return dao;
	}
	
	
	
	@Override
	public List<CourseVO> getAllCourseList() {
		List<CourseVO> list = null;
		
		try {
			list = smc.queryForList("course.getAllCourseList");
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return list;
	}

	@Override
	public int CountCourseList() {
		int cnt = 0;
		
		try {
			cnt = (int)smc.queryForObject("course.CountCourseList");
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return cnt;
	}

	@Override
	public List<CourseVO> CourseList(Map<String,String>map) {
		List<CourseVO> list = null;
		
		try {
			list = smc.queryForList("course.CourseList",map);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return list;
	}

	@Override
	public int CountSearchCourse(CourseVO vo) {
		int cnt = 0;
		
		try {
			cnt = (int)smc.queryForObject("course.CountSearchCourse",vo);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return cnt;
	}

	@Override
	public List<CourseVO> SearchCourse(Map<String,String> map) {
		List<CourseVO> list = null;
		
		try {
			list = smc.queryForList("course.SearchCourse",map);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return list;
	}

	@Override
	public int UpdateShowedCourse(int cno) {
		int i = 0;
		
		try {
			i = smc.update("course.UpdateShowedCourse",cno);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return i;
	}

	@Override
	public CourseVO ShowSelectedCourse(int cno) {
		CourseVO vo = null;
				
		try {
			vo = (CourseVO) smc.queryForObject("course.ShowSelectedCourse",cno);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return vo;
		
	}

	@Override
	public int InsertCourse(CourseVO courseVO) {
		 int cnt = 0;
	      
	      try {
	         Object obj = smc.insert("course.InsertCourse", courseVO);
	         if (obj == null) {
	            cnt = 1;
	         }
	         
	      } catch (SQLException e) {
	         e.printStackTrace();
	      }
	      return cnt;
	   }
	


	@Override
	public List<ReplyVO> ReplyList(int cno) {
		List<ReplyVO> list = null;
		
		try {
			list = smc.queryForList("reply.ReplyList",cno);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return list;
	}

	@Override
	public int SaveReply(ReplyVO vo) {
		int seq = 0;
		try {
			seq = (int)smc.insert("reply.SaveReply",vo);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return 0;
	}

	@Override
	public int DeleteCourse(int cno){
	      int cnt = 0;
	      
	      try {
	         cnt = smc.delete("course.DeleteCourse", cno);
	      } catch (SQLException e) {
	         cnt = 0;
	         e.printStackTrace();
	      }
	      return cnt;
	   }
	
	
	@Override
	public int DeleteReply(int rno){
		int cnt = 0;
		
		try {
			cnt = smc.delete("reply.DeleteReply", rno);
		} catch (SQLException e) {
			cnt = 0;
			e.printStackTrace();
		}
		return cnt;
	}


	

}

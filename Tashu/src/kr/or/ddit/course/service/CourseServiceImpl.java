package kr.or.ddit.course.service;

import java.util.List;
import java.util.Map;

import kr.or.ddit.course.dao.CourseDaoImpl;
import kr.or.ddit.course.dao.ICourseDao;
import kr.or.ddit.course.vo.CourseVO;
import kr.or.ddit.course.vo.ReplyVO;
import kr.or.ddit.notice.dao.INoticeDao;
import kr.or.ddit.notice.dao.NoticeDaoImpl;
import kr.or.ddit.notice.vo.NoticeVO;



public class CourseServiceImpl implements ICourseService{

	private ICourseDao dao;
	
	private static CourseServiceImpl service;
	
	private CourseServiceImpl() {
		dao = CourseDaoImpl.getInstance();
	}
	
	public static CourseServiceImpl getInstance() {
		if(service == null) {
			service = new CourseServiceImpl();
		}
		return service;
	}
	

	@Override
	public List<CourseVO> getAllCourseList() {
		return dao.getAllCourseList();
	}

	@Override
	public int CountCourseList() {
		return dao.CountCourseList();
	}

	@Override
	public List<CourseVO> CourseList(Map<String, String> map) {
		return dao.CourseList(map);
	}

	@Override
	public int CountSearchCourse(CourseVO vo) {
		// TODO Auto-generated method stub
		return dao.CountSearchCourse(vo);
	}

	@Override
	public List<CourseVO> SearchCourse(Map<String, String> map) {
		// TODO Auto-generated method stub
		return dao.SearchCourse(map);
	}

	@Override
	public int UpdateShowedCourse(int cno) {
		// TODO Auto-generated method stub
		return dao.UpdateShowedCourse(cno);
	}

	@Override
	public CourseVO ShowSelectedCourse(int cno) {
		// TODO Auto-generated method stub
		return dao.ShowSelectedCourse(cno);
	}

	@Override
	public int InsertCourse(CourseVO courseVO) {
		// TODO Auto-generated method stub
		return dao.InsertCourse(courseVO);
	}

	@Override
	public int DeleteCourse(int cno) {
		// TODO Auto-generated method stub
		return dao.DeleteCourse(cno);
	}

	@Override
	public List<ReplyVO> ReplyList(int cno) {
		// TODO Auto-generated method stub
		return dao.ReplyList(cno);
	}

	@Override
	public int SaveReply(ReplyVO vo) {
		// TODO Auto-generated method stub
		return dao.SaveReply(vo);
	}

	@Override
	public int DeleteReply(int rno) {
		// TODO Auto-generated method stub
		return dao.DeleteReply(rno);
	}



	
}

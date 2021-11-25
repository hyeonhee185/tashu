package kr.or.ddit.notice.service;

import java.util.List;
import java.util.Map;

import kr.or.ddit.notice.dao.INoticeDao;
import kr.or.ddit.notice.dao.NoticeDaoImpl;
import kr.or.ddit.notice.vo.NoticeVO;



public class NoticeServiceImpl implements INoticeService{

	private INoticeDao dao;
	
	private static NoticeServiceImpl service;
	
	private NoticeServiceImpl() {
		dao = NoticeDaoImpl.getInstance();
	}
	
	public static NoticeServiceImpl getInstance() {
		if(service == null) {
			service = new NoticeServiceImpl();
		}
		return service;
	}
	
	@Override
	public List<NoticeVO> getAllNoticeList() {
		return dao.getAllNoticeList();
	}

	@Override
	public int CountNoticeList() {
		return dao.CountNoticeList();
	}

	@Override
	public List<NoticeVO> noticeList(Map<String, String>map) {
		return dao.noticeList(map);
	}

	@Override
	public int countSearchNotice(NoticeVO vo) {
		return dao.countSearchNotice(vo);
	}

	@Override
	public List<NoticeVO> searchNotice(Map<String,String> map) {
		return dao.searchNotice(map);
	}

	@Override
	public int updateShowedNotice(int notice_no) {
		return dao.updateShowedNotice(notice_no);
	}

	@Override
	public NoticeVO showSelectedNotice(int notice_no) {
		return dao.showSelectedNotice(notice_no);
	}

	@Override
	public int insertBoard(NoticeVO noticeVO) {
		// TODO Auto-generated method stub
		return dao.insertBoard(noticeVO);
	}

	@Override
	public int deleteNotice(int bno) {
		// TODO Auto-generated method stub
		return dao.deleteNotice(bno);
	}


//	@Override
//	public List<ReplyVO> eAnswerList(int bbsctt_no) {
//		return dao.eAnswerList(bbsctt_no);
//	}
//
//	@Override
//	public int saveeAnswer(ReplyVO vo) {
//		return dao.saveeAnswer(vo);
//	}
	
}

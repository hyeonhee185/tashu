package kr.or.ddit.notice.dao;

import java.util.List;
import java.util.Map;

import kr.or.ddit.notice.vo.NoticeVO;


public interface INoticeDao {
	/**
	 * DB의 이벤트게시판 테이블의 전체 레코드를 가져와서 List에 담아 반환하는 메소드
	 * @return 검색된 데이터가 저장된 List객체
	 */
	public List<NoticeVO> getAllNoticeList();
	
	/**
	 * DB의 이벤트 게시판 테이블의 전체 레코드 수를 가져와서 반환하는 메소드
	 * @return 전체 레코드 수
	 */
	public int CountNoticeList();
	
	/**
	 * 리스트를 페이징 처리하는 메소드
	 * @param map 게시판의 시작과 끝의 갯수가 들어갈 파라미터
	 * @return 페이징처리된 list들
	 */
	public List<NoticeVO> noticeList(Map<String,String>map);
	
	/**
	 * 검색된 데이터의 갯수를 db에서 가져오는 메소드
	 * @return 검색된 데이터의 갯수
	 */
	public int countSearchNotice(NoticeVO vo);
	
	/**
	 * vo에 포함된 데이터를 이용해서 db에서 반환해주는것
	 * @param vo 검색할 데이터가 들어간 vo
	 * @return 검색된 vo객체의 리스트
	 */
	public List<NoticeVO> searchNotice(Map<String,String>map);
	
	/**
	 * 해당 게시판의 조회수를 1 올려주는 메소드
	 * @param bbsctt_no 조회수를 올려줄 게시판의 번호
	 * @return 성공 1 실패 0
	 */
	public int updateShowedNotice(int bno);
	
	/**
	 * 글번호를 매개변수로 받아 db에서 검색된 게시글을 가져오는 메소드
	 * @param bbsctt_no 게시글의 번호
	 * @return 검색된 게시글의 내용이 저장될 객체
	 */
	public NoticeVO showSelectedNotice(int bno);


	public int insertBoard(NoticeVO noticeVO);

	public int deleteNotice(int bno);
	

}
	
//	/**
//	 * 해당 게시물의 번호를 받아 db에서 그 게시글의 댓글을 반환하는 메소드
//	 * @param bbsctt_no 댓글을 반환할 게시글의 번호
//	 * @return 댓글의 list객체
//	 */
//	public List<ReplyVO> eAnswerList(int bbsctt_no);
//	
//	/**
//	 * 댓글저장하는 메소드
//	 * @param vo 댓글이 저장될때 필요한 정보가 담긴 객체
//	 * @return 성공여부
//	 */
//	public int saveeAnswer(ReplyVO vo);
//}

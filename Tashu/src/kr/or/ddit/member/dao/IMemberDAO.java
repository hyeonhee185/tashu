package kr.or.ddit.member.dao;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import kr.or.ddit.member.vo.MemberVO;
import kr.or.ddit.member.vo.ZipVO;

public interface IMemberDAO {
	/**
	 * MemberVO에 담겨진 데이터를 DB에 insert하는 메서드
	 * @param memVO DB에 insert할 자료가 저장될 MemberVO객체
	 * @return 작업 성공 : 1 이상, 작업 실패 : 0
	 * @throws SQLException 
	 */
	public int insertMember(MemberVO memVO);
	
	/**
	 * 회원 ID를 매개변수로 받아서 해당 회원 정보를 삭제하는 메서드
	 * @param memId 삭제할 회원 ID
	 * @return 작업 성공 : 1, 작업 실패 : 0
	 */
	public int deleteMember(String memId); //데이터 하나면 직접 입력
	
	/**
	 * MemberVO 자료를 이용하여 DB에 update하는 메서드
	 * @param memVO update할 회원정보가 저장된 MemberVO 객체
	 * @return 작업 성공 : 1, 작업 실패 : 0
	 */
	public int updateMember(MemberVO memVO); 
	
	/**
	 * DB의 회원테이블의 전체 레코드를 가져와서 List에 담아서 반환하는 메서드
	 * @return 검색된 데이터가 저장된 List객체
	 */
	public List<MemberVO> getAllMemberList();
	
	
	
	/**
	 * 회원 ID를 매개변수로 받아서 해당 회원의 개수를 반환하는 메서드
	 * @param memId 검색할 회원 ID
	 * @return 검색된 회원의 개수
	 */
	public int getMemberCount(String memId);
	
	
	
	//public int updateSelect(String updateField, String memId, String updateData);
	/**
	 * Map의 정보를 이용하여 회원 정보 중 원하는 컬럼을 수정하는 메서드
	 * key값 정보==> 회원ID(memId), 수정할 컬럼명(field), 수정할 데이터(data)
	 * @param paramMap 회원ID, 수정할 컬럼명, 수정할 데이터가 저장된 Map객체
	 * @return 작업 성공 : 1, 작업 실패 : 0
	 */
	public int updateSelect(Map<String, String> paramMap);
	
   
   /**
    * 회원 id를 매개변수로 받아서 해당 회원id의 정보를 가져오는 메서드
    * @param memId 가져올 회원 id
    * @return 조건에 맞는 회원정보가 저장된 MemberVO객체
    */
	public MemberVO getMember(String memId);
	
	
	/**
	 * 회원ID와 PassWord를 갖고있는 MemberVO를 매개변수로 받아서 회원 정보를 가져오는 메서드
	 * @param memberVO 회원ID와 PassWord를 갖고있는 MemberVO
	 * @return 조건에 맞는 회원정보가 저장된 MemberVO객체
	 */
	public MemberVO login(MemberVO memberVO);
	
	
	//id 중복체크
    public int idCheck(String id) throws SQLException;

	List<ZipVO> searchCode(String dong) throws SQLException;

	/**
	 * 관리자ID와 PassWord를 갖고있는 MemberVO를 매개변수로 받아서 관리자 정보를 가져오는 메서드
	 * @param memberVO 관리자ID와 PassWord를 갖고있는 MemberVO
	 * @return 조건에 맞는 관리자정보가 저장된 MemberVO객체
	 */
	public MemberVO adminLogin(MemberVO memberVO);
	
	
	public List<MemberVO> statusMember(int status);
	
	

}

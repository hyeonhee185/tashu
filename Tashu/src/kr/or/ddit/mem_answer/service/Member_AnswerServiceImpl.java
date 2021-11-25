package kr.or.ddit.mem_answer.service;

import java.util.List;
import java.util.Map;

import kr.or.ddit.mem_answer.dao.IMember_AnswerDAO;
import kr.or.ddit.mem_answer.dao.Member_AnswerDaoImpl;
import kr.or.ddit.mem_answer.vo.Mem_AnswerVO;

public class Member_AnswerServiceImpl implements IMember_AnswerService{
	private static Member_AnswerServiceImpl service;
	private IMember_AnswerDAO dao;	
	
	private Member_AnswerServiceImpl() {
		dao = Member_AnswerDaoImpl.getInstance();
	}
	
	public static Member_AnswerServiceImpl getInstance(){
		if(service==null) service = new Member_AnswerServiceImpl();
		return service;
	}
	
	@Override
	public int insertMember_Answer(Map<String, String> paramMap) {
		return dao.insertMember_Answer(paramMap);
	}
	
	@Override
	public int insertGosuMember_Answer(Map<String, String> paramMap) {
		return dao.insertGosuMember_Answer(paramMap);
	}

	@Override
	public String checkMemAnswer(String mem_id) {
		return dao.checkMemAnswer(mem_id);
	}

	@Override
	public List<String> MatchingGosu(String mem_id) {
		return dao.MatchingGosu(mem_id);
	}

	@Override
	public List<Mem_AnswerVO> normalMemresult(String teach_mem) {
		return dao.normalMemresult(teach_mem);
	}

	@Override
	public String checkMemMatchingResult(String mem_id) {
		return dao.checkMemMatchingResult(mem_id);
	}

	@Override
	public int deleteMatchingResult(String mem_id) {
		return dao.deleteMatchingResult(mem_id);
	}



}

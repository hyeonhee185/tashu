package kr.or.ddit.mem_answer.service;

import java.util.List;
import java.util.Map;

import kr.or.ddit.mem_answer.vo.Mem_AnswerVO;

public interface IMember_AnswerService {
	
	public int insertMember_Answer(Map<String, String> paramMap);
	
	public int insertGosuMember_Answer(Map<String, String> paramMap);
	
	public String checkMemAnswer(String mem_id);
	
	public String checkMemMatchingResult(String mem_id);
	
	public List<String> MatchingGosu (String mem_id);

	public List<Mem_AnswerVO> normalMemresult (String teach_mem);
	
	public int deleteMatchingResult(String mem_id);

}

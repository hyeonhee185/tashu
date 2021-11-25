package kr.or.ddit.coaching.service;

import java.util.Map;

import kr.or.ddit.coaching.dao.CoachingDAOImpl;
import kr.or.ddit.coaching.dao.ICoachingDao;
import kr.or.ddit.mem_answer.service.Member_AnswerServiceImpl;

public class CoachingServiceImpl implements ICoachingService {
	private static CoachingServiceImpl service;
	private ICoachingDao dao;
	
	private CoachingServiceImpl() {
		dao =  CoachingDAOImpl.getInstance();
	}
	
	public static CoachingServiceImpl getInstance(){
		if(service==null) service = new CoachingServiceImpl();
		return service;
	}
	
	@Override
	public int insertMem(Map<String, String> paramMap) {
		return dao.insertMem(paramMap);
	}

}

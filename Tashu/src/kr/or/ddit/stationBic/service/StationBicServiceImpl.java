package kr.or.ddit.stationBic.service;

import java.util.List;

import kr.or.ddit.stationBic.dao.IStationBicDAO;
import kr.or.ddit.stationBic.dao.StationBicDaoImpl;
import kr.or.ddit.stationBic.vo.StationBicVO;



public class StationBicServiceImpl implements IStationBicService{
	private static StationBicServiceImpl service;
	private IStationBicDAO bicDao;
	public StationBicServiceImpl() {
		bicDao = StationBicDaoImpl.getInstance();
	}
	public static StationBicServiceImpl getInstance() {
		if (service == null) service = new StationBicServiceImpl();
		return service;
	}
	@Override
	public List<StationBicVO> getStationLocker(int station) {
		return bicDao.getStationLocker(station);
	}

}

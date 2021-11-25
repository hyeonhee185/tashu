package kr.or.ddit.station.service;

import java.util.List;

import kr.or.ddit.station.dao.IStationDAO;
import kr.or.ddit.station.dao.StationDaoImpl;
import kr.or.ddit.station.vo.StationVO;

public class StationServiceImpl implements IStationService{
	private static StationServiceImpl service;
	private IStationDAO stationDao;
	private StationServiceImpl() {
		stationDao = StationDaoImpl.getInstance();
	}
	public static StationServiceImpl getInstance() {
		if (service==null) service = new StationServiceImpl();
		return service;
	}
	@Override
	public List<StationVO> getStationArea(String area) {
		return stationDao.getStationArea(area);
	}
	@Override
	public List<StationVO> getAllStation() {
		return stationDao.getAllStation();
	}
	@Override
	public List<StationVO> getStation(String dong) {
		return stationDao.getStation(dong);
	}
	@Override
	public List<StationVO> getAllStation2() {
		return stationDao.getAllStation2();
	}

	@Override
	public int insertStation(StationVO staionVo) {
		return stationDao.insertStation(staionVo);
	}
	@Override
	public int deleteStation(String station_name) {
		return stationDao.deleteStation(station_name);
	}
	@Override
	public List<StationVO> selectDongStation(String dong) {
		return stationDao.selectDongStation(dong);
	}
	@Override
	public List<StationVO> getStationList() {
		return stationDao.getStationList();
	}
	@Override
	public List<StationVO> getStationList2() {
		return stationDao.getStationList2();
	}
	
}

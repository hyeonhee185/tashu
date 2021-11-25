package kr.or.ddit.station.service;

import java.util.List;

import kr.or.ddit.station.vo.StationVO;

public interface IStationService {
	
	public List<StationVO> getStationArea(String area);
	
	public List<StationVO> getStation(String dong);
	
	public List<StationVO> getAllStation();
	
	public List<StationVO> getStationList();
	
	public List<StationVO> getStationList2();
	
	public List<StationVO> getAllStation2();
	
	public int insertStation(StationVO staionVo);
	
	public int deleteStation(String station_name);
	
	public List<StationVO> selectDongStation (String dong);
}

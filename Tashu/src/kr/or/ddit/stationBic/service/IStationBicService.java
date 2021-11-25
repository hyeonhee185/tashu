package kr.or.ddit.stationBic.service;

import java.util.List;

import kr.or.ddit.stationBic.vo.StationBicVO;

public interface IStationBicService {
	public List<StationBicVO> getStationLocker(int station);
}

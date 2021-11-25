package kr.or.ddit.stationBic.dao;

import java.util.List;
import kr.or.ddit.stationBic.vo.StationBicVO;

public interface IStationBicDAO {
	public List<StationBicVO> getStationLocker(int station);
}

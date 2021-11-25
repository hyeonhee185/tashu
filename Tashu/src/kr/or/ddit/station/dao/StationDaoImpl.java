package kr.or.ddit.station.dao;

import java.io.IOException;
import java.io.Reader;
import java.nio.charset.Charset;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.ibatis.common.resources.Resources;
import com.ibatis.sqlmap.client.SqlMapClient;
import com.ibatis.sqlmap.client.SqlMapClientBuilder;

import kr.or.ddit.station.vo.StationVO;

public class StationDaoImpl implements IStationDAO{
	private static StationDaoImpl dao;
	private SqlMapClient smc;
	
	public StationDaoImpl() {
		try {
			Charset charset = Charset.forName("UTF-8");
			Resources.setCharset(charset);
			Reader rd = Resources.getResourceAsReader("kr/or/ddit/config/sqlMapConfig.xml");
			smc = SqlMapClientBuilder.buildSqlMapClient(rd);
			rd.close();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	public static StationDaoImpl getInstance() {
		if (dao==null) dao = new StationDaoImpl();
		return dao;
	}

	public List<StationVO> getStationArea(String area) {
		List<StationVO> stationList = new ArrayList<>();
		try {
			stationList = smc.queryForList("station.getStationArea", area);
		} catch (SQLException e) {
			
		}
		return stationList;
	}

	@Override
	public List<StationVO> getAllStation() {
		List<StationVO> stationListAll = new ArrayList<>();
		try {
			stationListAll = smc.queryForList("station.getAllStation");
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return stationListAll;
	}
	
	   @Override
	   public List<StationVO> getAllStation2() {
	      List<StationVO> stationListAll2 = new ArrayList<>();
	      try {
	         stationListAll2 = smc.queryForList("station.getAllStation2");
	      } catch (SQLException e) {
	         e.printStackTrace();
	      }
	      return stationListAll2;
	   }

	@Override
	public List<StationVO> getStation(String dong) {
	
		List<StationVO> stationList = new ArrayList<>();
		try {
			stationList = smc.queryForList("station.getStation", dong);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return stationList;
	}

	@Override
	public int insertStation(StationVO staionVo) {
		int cnt = 0;
		try {
			Object obj = smc.insert("station.insertStation", staionVo);
			if(obj==null) cnt = 1;
			
		} catch (SQLException e) {
			cnt = 0;
			e.printStackTrace();
		}
		return cnt;
	}

	@Override
	public int deleteStation(String station_name) {
		int cnt = 0;
		try {
			cnt = smc.delete("station.deleteStation",station_name);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return cnt;
	}

	@Override
	public List<StationVO> selectDongStation(String dong) {
	   List<StationVO> selectDongStation = new ArrayList<>();
	      try {
	    	  selectDongStation = smc.queryForList("station.selectDongStation", dong);
	      } catch (SQLException e) {
	         e.printStackTrace();
	      }
	      return selectDongStation;
	}

	@Override
	public List<StationVO> getStationList() {
		List<StationVO> stationList = new ArrayList<>();
		try {
			stationList = smc.queryForList("station.getStationList");
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return stationList;
	}

	@Override
	public List<StationVO> getStationList2() {
		List<StationVO> stationList2 = new ArrayList<>();
		try {
			stationList2 = smc.queryForList("station.getStationList2");
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return stationList2;
	}
	
	
}

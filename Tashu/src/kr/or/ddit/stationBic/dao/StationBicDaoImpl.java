package kr.or.ddit.stationBic.dao;

import java.io.IOException;
import java.io.Reader;
import java.nio.charset.Charset;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.ibatis.common.resources.Resources;
import com.ibatis.sqlmap.client.SqlMapClient;
import com.ibatis.sqlmap.client.SqlMapClientBuilder;

import kr.or.ddit.stationBic.vo.StationBicVO;

public class StationBicDaoImpl implements IStationBicDAO{
	private static StationBicDaoImpl dao;
	private SqlMapClient smc;
	
	public StationBicDaoImpl() {
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
	
	public static StationBicDaoImpl getInstance() {
		if (dao==null) dao = new StationBicDaoImpl();
		return dao;
	}

	@Override
	public List<StationBicVO> getStationLocker(int station) {
		List<StationBicVO> stationBicList = new ArrayList<>();
		try {
			stationBicList = smc.queryForList("stationBic.getStationLocker", station);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return stationBicList;
	}
	

}

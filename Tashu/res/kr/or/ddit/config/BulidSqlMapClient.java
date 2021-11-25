package kr.or.ddit.config;

import java.io.IOException;
import java.io.Reader;
import java.nio.charset.Charset;

import com.ibatis.common.resources.Resources;
import com.ibatis.sqlmap.client.SqlMapClient;
import com.ibatis.sqlmap.client.SqlMapClientBuilder;


public class BulidSqlMapClient {
	
	
	//mapper(xml파일, sql 실행 문장을 기술한 파일)에 접근하여 sql문장을 실행하기 위해서 필요한 객체
	private static SqlMapClient smc;
	
	static{
		
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
	
	public static SqlMapClient getSqlMapClient(){
		return smc;
	}
	

}

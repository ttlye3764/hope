package kr.or.ddit.iqStatistics.dao;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import kr.or.ddit.vo.IQstatisticsVO;

@Repository("iqStatisticsDAO")
public class IIQstatisticsDAOImpl implements IIQstatisticsDAO{
	
	@Resource
	private SqlSessionTemplate client;

	@Override
	public String insertIq(IQstatisticsVO iqInfo) throws Exception {
		return Integer.toString(client.insert("iq.insertIq", iqInfo));
	}

}

package kr.or.ddit.iqStatistics.service;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import kr.or.ddit.iqStatistics.dao.IIQstatisticsDAO;
import kr.or.ddit.vo.IQstatisticsVO;

@Service("iqStatisticsService")
public class IIQstatisticsServiceImpl implements IIQstatisticsService {
	@Autowired
	private IIQstatisticsDAO iqStatisticsDAO;

	@Override
	public String insertIq(IQstatisticsVO iqInfo) throws Exception {
		return iqStatisticsDAO.insertIq(iqInfo);
	}

}

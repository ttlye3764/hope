package kr.or.ddit.healthImageFile.dao;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import kr.or.ddit.vo.HealthFileVO;

@Repository
public class IHealthImageFileDAOImpl implements IHealthImageFileDAO{

	@Resource
	private SqlSessionTemplate client;
	
	@Override
	public void inserthealthFile(List<HealthFileVO> fileitemList) throws Exception {
		
		for(HealthFileVO fileItemInfo : fileitemList){
			client.insert("healthFile.inserthealthFile", fileItemInfo);
		}
	}

	@Override
	public HealthFileVO healthFileInfo(Map<String, String> param) throws Exception {
		return (HealthFileVO) client.selectOne("healthFile.healthFileInfo", param);
	}

	@Override
	public void updatehealthFile(List<HealthFileVO> fileitemList) throws Exception {
		
		for(HealthFileVO fileItemInfo : fileitemList){
			client.update("healthFile.updatehealthFile", fileItemInfo);
		}
	}

}

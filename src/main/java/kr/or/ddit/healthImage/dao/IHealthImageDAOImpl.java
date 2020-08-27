package kr.or.ddit.healthImage.dao;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import kr.or.ddit.vo.HealthImageVO;

@Repository("healthImageDAO")
public class IHealthImageDAOImpl implements IHealthImageDAO{

	@Resource
	private SqlSessionTemplate client;
	
	@Override
	public List<HealthImageVO> healthList(Map<String, String> params) throws Exception {
		return client.selectList("healthImage.healthImageList", params);
	}

	@Override
	public HealthImageVO healthInfo(Map<String, String> params) throws Exception {
		return client.selectOne("healthImage.healthImageInfo", params);
	}

	@Override
	public String insertHealth(HealthImageVO healthInfo) throws Exception {
		return Integer.toString(client.insert("healthImage.InsertHealth", healthInfo));
	}

	@Override
	public void updateHealth(HealthImageVO healthInfo) throws Exception {
		client.update("healthImage.updateHealth", healthInfo);
	}

	@Override
	public void deleteHealth(String healthImage_no) throws Exception {
		client.delete("healthImage.deleteHealth", healthImage_no);
		
	}
	
	@Override
	public String fileSequence() throws Exception {
		return client.selectOne("healthImage.fileSequence");
	}

}

package kr.or.ddit.pill.dao;



import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;
import kr.or.ddit.vo.MypillVO;
import kr.or.ddit.vo.PillVO;

@Repository("pillDAO")
public class IPilllDAOImpl implements IPillDAO {
	@Resource
	private SqlSessionTemplate client;
	
	
	@Override
	public List<PillVO> pillList() throws Exception {
		return client.selectList("pill.pillList"); 
	}


	@Override
	public String totalCount(Map<String, String> params) throws Exception {
		System.out.println(params);
		return client.selectOne("pill.totalCount",params);
	}


	@Override
	public List<PillVO> pillList(HashMap params) throws Exception {
		return client.selectList("pill.pillList", params);
	}

	
		
	

}

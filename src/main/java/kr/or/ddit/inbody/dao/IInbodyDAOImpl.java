package kr.or.ddit.inbody.dao;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import kr.or.ddit.vo.InbodyVO;

@Repository("inbodyDAO")
public class IInbodyDAOImpl implements IInbodyDAO{

	@Resource
	private SqlSessionTemplate client;
	
	@Override
	public List<InbodyVO> inbodyList(Map<String, String> params) throws Exception {
		return client.selectList("inbody.inbodyList", params);
	}

	@Override
	public InbodyVO inbodyInfo(Map<String, String> params) throws Exception {
		return client.selectOne("inbody.inbodyInfo", params);
	}

	@Override
	public String insertInbody(InbodyVO inbodyInfo) throws Exception {
		return Integer.toString(client.insert("inbody.insertInbody", inbodyInfo));
	}

	@Override
	public void updateInbody(InbodyVO inbodyInfo) throws Exception {
		client.update("inbody.updateInbody", inbodyInfo);
	}

	@Override
	public void deleteInbody(String inbody_no) throws Exception {
		client.delete("inbody.deleteInbody", inbody_no);
	}

}

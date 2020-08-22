package kr.or.ddit.knowledge.dao;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;


import kr.or.ddit.vo.KnowledgeVO;

@Repository("knowledgeDAO")
public class IKnowledgeDAOImpl implements IKnowledgeDAO {
	@Resource
	private SqlSessionTemplate client;
	
	@Override
	public String totalCount(Map<String, String> params) throws Exception {
		return (String) client.selectOne("knowledge.totalCount", params);
	}


	@Override
	public List<KnowledgeVO> knowledgeList(Map<String, String> params)
			throws Exception {
		return client.selectList("knowledge.knowledgeList", params);
	}


	@Override
	public String insertKnowledge(KnowledgeVO knowledgeInfo) throws Exception {
		return Integer.toString(client.insert("knowledge.insertKnowledge", knowledgeInfo));
	}


	@Override
	public void updateKnowledge(KnowledgeVO knowledgeInfo) throws Exception {
		client.update("knowledge.updateknowledge", knowledgeInfo);
	}


	@Override
	public KnowledgeVO knowledgeInfo(Map<String, String> params)
			throws Exception {
		return (KnowledgeVO) client.selectOne("knowledge.knowledgeInfo",params);
	}


	@Override
	public void deleteKnowledge(String k_no) throws Exception {
		client.delete("knowledge.deleteKnowledge", k_no);
	}


	@Override
	public String fileSequence() throws Exception {
		return client.selectOne("knowledge.fileSequence");
	}
}

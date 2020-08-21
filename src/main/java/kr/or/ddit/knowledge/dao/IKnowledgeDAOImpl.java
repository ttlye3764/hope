package kr.or.ddit.knowledge.dao;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ibatis.sqlmap.client.SqlMapClient;

import kr.or.ddit.vo.KnowledgeVO;

@Repository("knowledgeDAO")
public class IKnowledgeDAOImpl implements IKnowledgeDAO {
	//@Autowired
	private SqlMapClient client;
	

	@Override
	public String totalCount(Map<String, String> params) throws Exception {
		return (String) client.queryForObject("knowledge.totalCount", params);
	}


	@Override
	public List<KnowledgeVO> knowledgeList(Map<String, String> params)
			throws Exception {
		return client.queryForList("knowledge.knowledgeList", params);
	}


	@Override
	public String insertKnowledge(KnowledgeVO knowledgeInfo) throws Exception {
		return (String) client.insert("knowledge.insertKnowledge", knowledgeInfo);
	}


	@Override
	public void updateKnowledge(KnowledgeVO knowledgeInfo) throws Exception {
		client.update("knowledge.updateknowledge", knowledgeInfo);
	}


	@Override
	public KnowledgeVO knowledgeInfo(Map<String, String> params)
			throws Exception {
		return (KnowledgeVO) client.queryForObject("knowledge.knowledgeInfo",params);
	}


	@Override
	public void deleteKnowledge(String k_no) throws Exception {
		client.delete("knowledge.deleteKnowledge", k_no);
	}
}

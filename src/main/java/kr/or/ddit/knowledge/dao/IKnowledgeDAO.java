package kr.or.ddit.knowledge.dao;

import java.util.List;
import java.util.Map;

import kr.or.ddit.vo.KnowledgeVO;

public interface IKnowledgeDAO {
	
	// 문제 리스트
	public List<KnowledgeVO> knowledgeList(Map<String, String> params) throws Exception;
	
	// 문제 등록
	public String insertKnowledge(KnowledgeVO knowledgeInfo) throws Exception;

	// 문제 수정
	public void updateKnowledge(KnowledgeVO knowledgeInfo) throws Exception;
	
	// 문제 상세
	public KnowledgeVO knowledgeInfo(Map<String, String> params) throws Exception;
	
	// 문제 삭제
	public void deleteKnowledge(String k_no) throws Exception;
	
	// 페이지
	public String totalCount(Map<String, String> params) throws Exception;

}

package kr.or.ddit.knowledge.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import kr.or.ddit.fileitem.dao.IFileItemDAO;
import kr.or.ddit.knowledge.dao.IKnowledgeDAO;
import kr.or.ddit.utiles.AttachFileMapper;
import kr.or.ddit.vo.FileItemVO;
import kr.or.ddit.vo.KnowledgeVO;

@Service("knowledgeService")
public class IKnowledgeServiceImpl implements IKnowledgeService {
	@Autowired
	private IKnowledgeDAO knowledgeDAO;
	@Autowired
	private IFileItemDAO fileitemDAO;

	@Override
	public String totalCount(Map<String, String> params) throws Exception {
		return knowledgeDAO.totalCount(params);
	}

	@Override
	public List<KnowledgeVO> knowledgeList(Map<String, String> params)
			throws Exception {

		return knowledgeDAO.knowledgeList(params);
	}

	@Override
	public String insertKnowledge(KnowledgeVO knowledgeInfo, MultipartFile[] items) throws Exception {
		knowledgeDAO.insertKnowledge(knowledgeInfo);
		
		String fileSequence = knowledgeDAO.fileSequence();
		List<FileItemVO> fileItemList =AttachFileMapper.mapper(items, fileSequence);
		
	    fileitemDAO.insertFileItem(fileItemList);

		return fileSequence;
	}

	@Override
	public void updateKnowledge(KnowledgeVO knowledgeInfo , MultipartFile[] items) throws Exception {
		knowledgeDAO.updateKnowledge(knowledgeInfo);
		
		List<FileItemVO> fileItemList =AttachFileMapper.mapper(items, knowledgeInfo.getK_no());
		fileitemDAO.updateFileItem(fileItemList);

	}

	@Override
	public KnowledgeVO knowledgeInfo(Map<String, String> params)
			throws Exception {
		return knowledgeDAO.knowledgeInfo(params);
	}

	@Override
	public void deleteKnowledge(String k_no) throws Exception {
		knowledgeDAO.deleteKnowledge(k_no);

	}

}

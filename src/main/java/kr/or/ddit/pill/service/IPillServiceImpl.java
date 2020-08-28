package kr.or.ddit.pill.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import kr.or.ddit.fileitem.dao.IFileItemDAO;
import kr.or.ddit.medical.dao.IMedicalDAO;
import kr.or.ddit.medicalfile.dao.IMedicalFileDAO;
import kr.or.ddit.pill.dao.IPillDAO;
import kr.or.ddit.utiles.AttachFileMapper;
import kr.or.ddit.vo.FileItemVO;
import kr.or.ddit.vo.MypillFileVO;
import kr.or.ddit.vo.MypillVO;
import kr.or.ddit.vo.PillVO;

// 설정파일 : <bean name="iFreeboardServieImpl"
//				class="kr.or.ddit.freeboard.service.kr.or"
@Service("pillService")
public class IPillServiceImpl implements IPillService {
	@Autowired
	private IPillDAO dao;

	@Override
	public List<PillVO> pillList() throws Exception {
		return dao.pillList();
	}

	@Override
	public String totalCount(HashMap params) throws Exception {
		return dao.totalCount(params);
	}

	@Override
	public List<PillVO> pillList(HashMap params) throws Exception {
		return dao.pillList(params);
	}

	@Override
	public PillVO pillInfo(String pi_no) throws Exception {
		return dao.pillInfo(pi_no);
	}
	


}

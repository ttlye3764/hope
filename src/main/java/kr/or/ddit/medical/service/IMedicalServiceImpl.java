package kr.or.ddit.medical.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import kr.or.ddit.fileitem.dao.IFileItemDAO;
import kr.or.ddit.medical.dao.IMedicalDAO;
import kr.or.ddit.medicalfile.dao.IMedicalFileDAO;
import kr.or.ddit.utiles.AttachFileMapper;
import kr.or.ddit.vo.FileItemVO;
import kr.or.ddit.vo.MypillFileVO;
import kr.or.ddit.vo.MypillVO;

// 설정파일 : <bean name="iFreeboardServieImpl"
//				class="kr.or.ddit.freeboard.service.kr.or"
@Service("medicalService")
public class IMedicalServiceImpl implements IMedicalService {
	@Autowired
	private IMedicalDAO medicalDAO ;
	@Autowired
	private IMedicalFileDAO medicalFileDAO;
	
	@Transactional(propagation=Propagation.REQUIRED, rollbackFor={Exception.class})
    @Override
	public String insertMedicalInfo(MypillVO mypillInfo, MultipartFile[] items) throws Exception{
		  String bo_no = medicalDAO.insertMedicalInfo(mypillInfo);
	      
	      List<MypillFileVO> fileItemList =AttachFileMapper.medicalMapper(items, bo_no);
	      medicalFileDAO.insertFileItem(fileItemList);
	      return bo_no;
	}

}

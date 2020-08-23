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
	
    @Override
	public String insertMedicalInfo(MypillVO mypillInfo, MultipartFile[] items) throws Exception{
		 System.out.println("서비스 들어옴");
		  medicalDAO.insertMedicalInfo(mypillInfo);
		  String pill_no = medicalDAO.selectPill_no();
		  System.out.println(pill_no);
	      List<MypillFileVO> fileItemList =AttachFileMapper.medicalMapper(items, pill_no);
	      
	      medicalFileDAO.insertFileItem(fileItemList);
	      return pill_no;
	}

	@Override
	public List<MypillVO> medicalList(String mem_no) throws Exception {
		return medicalDAO.medicalList(mem_no);
	}

	@Override
	public void deleteMedicalInfo(String pill_no) throws Exception {
		medicalDAO.deleteMedicalInfo(pill_no);
	}

	@Override
	public MypillVO medicalInfo(String pill_no) throws Exception {
		return medicalDAO.medicalInfo(pill_no);
	}

	@Override
	public void updateMedicalInfo(MypillVO mypillInfo, MultipartFile[] items) throws Exception {
		//medicalDAO.updateMedicalInfo(mypillInfo);
		
		//파일업데이트문 
		List<MypillFileVO> fileItemList =AttachFileMapper.medicalMapper(items, mypillInfo.getPill_no());
		medicalFileDAO.updateFileItem(fileItemList);
	}


}

package kr.or.ddit.medical.service;

import java.util.List;
import java.util.Map;

import org.apache.commons.fileupload.FileItem;
import org.springframework.web.multipart.MultipartFile;

import kr.or.ddit.vo.FreeboardVO;
import kr.or.ddit.vo.MypillVO;

public interface IMedicalService {
	public String insertMedicalInfo(MypillVO mypillInfo, MultipartFile[] items)throws Exception;
}



package kr.or.ddit.pill.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.commons.fileupload.FileItem;
import org.springframework.web.multipart.MultipartFile;

import kr.or.ddit.vo.FreeboardVO;
import kr.or.ddit.vo.MypillFileVO;
import kr.or.ddit.vo.MypillVO;
import kr.or.ddit.vo.PillVO;

public interface IPillService {
	public List<PillVO> pillList() throws Exception;

	public String totalCount(HashMap params) throws Exception;

	public List<PillVO> pillList(HashMap params) throws Exception;



}



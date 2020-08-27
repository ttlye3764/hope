package kr.or.ddit.pill.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import kr.or.ddit.vo.FreeboardVO;
import kr.or.ddit.vo.MypillVO;
import kr.or.ddit.vo.PillVO;

public interface IPillDAO {
	public List<PillVO> pillList() throws Exception;

	public String totalCount(HashMap params) throws Exception;

	public List<PillVO> pillList(HashMap params) throws Exception;
}

package kr.or.ddit.inbody.service;

import java.util.List;
import java.util.Map;

import kr.or.ddit.vo.InbodyVO;

public interface IInbodyService {

	public List<InbodyVO> inbodyList(Map<String, String> params) throws Exception;

	public InbodyVO inbodyInfo(Map<String, String> params) throws Exception;
	
	public String insertInbody(InbodyVO inbodyInfo) throws Exception;
	
	public void updateInbody(InbodyVO inbodyInfo) throws Exception;
	
	public void deleteInbody(String inbody_no) throws Exception;

}

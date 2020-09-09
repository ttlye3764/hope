package kr.or.ddit.inbody.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import kr.or.ddit.inbody.dao.IInbodyDAO;
import kr.or.ddit.vo.InbodyVO;

@Service("inbodyService")
public class IInbodyServiceImpl implements IInbodyService {

	@Autowired
	private IInbodyDAO inbodyDAO;

	@Override
	public List<InbodyVO> inbodyList(Map<String, String> params) throws Exception {
		return inbodyDAO.inbodyList(params);
	}

	@Override
	public InbodyVO inbodyInfo(Map<String, String> params) throws Exception {
		return inbodyDAO.inbodyInfo(params);
	}

	@Override
	public String insertInbody(InbodyVO inbodyInfo) throws Exception {
		return inbodyDAO.insertInbody(inbodyInfo);
	}

	@Override
	public void updateInbody(InbodyVO inbodyInfo) throws Exception {
		inbodyDAO.updateInbody(inbodyInfo);
	}

	@Override
	public void deleteInbody(String inbody_no) throws Exception {
		inbodyDAO.deleteInbody(inbody_no);
	}

}

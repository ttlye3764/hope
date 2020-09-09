package kr.or.ddit.memberfile.dao;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import kr.or.ddit.vo.FileItemVO;
import kr.or.ddit.vo.MemberFileVO;

@Repository
public class IMemberFileDAOImpl implements IMemberFileDAO {

	@Resource
	private SqlSessionTemplate client;

	@Override
	public void insertFileItem(List<MemberFileVO> fileitemList) throws Exception {
		for (MemberFileVO fileItemInfo : fileitemList) {
			client.insert("memberfile.insertFileItem", fileItemInfo);
		}
	}

	@Override
	public MemberFileVO fileitemInfo(Map<String, String> params) throws Exception {
		return (MemberFileVO) client.selectOne("memberfile.fileitemInfo", params);
	}

	@Override
	public void updateFileItem(List<MemberFileVO> fileItemList) throws Exception {
		for (MemberFileVO fileItemInfo : fileItemList) {
			client.update("memberfile.updateFileItem", fileItemInfo);
		}
	}
}

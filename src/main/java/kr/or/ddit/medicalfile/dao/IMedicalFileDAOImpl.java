package kr.or.ddit.medicalfile.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;


import kr.or.ddit.vo.FileItemVO;
import kr.or.ddit.vo.MypillFileVO;

@Repository
public class IMedicalFileDAOImpl implements IMedicalFileDAO {
	//@Autowired
	private SqlSessionTemplate client;
	
	
	@Override
	public void insertFileItem(List<MypillFileVO> fileitemList) throws Exception {
		try{
			// iBatis 트랜잭션
			//	 Commit : startTransaction() => 쿼리 질의(전체 성공)
			//            => commitTransaction()
			//            => endTransaction();
			
			//	 Rollback : startTransaction() => 쿼리 질의(전체 성공)
			//             => endTransaction();
		
			for(MypillFileVO fileItemInfo : fileitemList){
				client.insert("medicalfile.insertFileItem", fileItemInfo);
			}
		}finally{
		}
	}

	@Override
	public MypillFileVO fileitemInfo(Map<String, String> params) throws Exception {
		return (MypillFileVO) client.selectOne("medicalfile.fileitemInfo", params);
	}

}

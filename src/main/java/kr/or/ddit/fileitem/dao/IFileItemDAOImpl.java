package kr.or.ddit.fileitem.dao;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ibatis.sqlmap.client.SqlMapClient;

import kr.or.ddit.vo.FileItemVO;

@Repository
public class IFileItemDAOImpl implements IFileItemDAO {
	//@Autowired
	private SqlMapClient client;
	
	
	@Override
	public void insertFileItem(List<FileItemVO> fileitemList) throws Exception {
		try{
			// iBatis 트랜잭션
			//	 Commit : startTransaction() => 쿼리 질의(전체 성공)
			//            => commitTransaction()
			//            => endTransaction();
			
			//	 Rollback : startTransaction() => 쿼리 질의(전체 성공)
			//             => endTransaction();
			client.startTransaction();
		
			for(FileItemVO fileItemInfo : fileitemList){
				client.insert("fileitem.insertFileItem", fileItemInfo);
			}
			client.commitTransaction();
		}finally{
			client.endTransaction();
		}
	}

	@Override
	public FileItemVO fileitemInfo(Map<String, String> params) throws Exception {
		return (FileItemVO) client.queryForObject("fileitem.fileitemInfo", params);
	}

}

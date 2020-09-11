package kr.or.ddit.pet.dao;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

@Repository
public class IPetDaoImpl implements IPetDao{
	@Resource
	private SqlSessionTemplate client;
	
}

package kr.or.ddit.pet.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.or.ddit.pet.dao.IPetDao;

@Service
public class IPetServiceImpl implements IPetService{
	@Autowired
	private IPetDao dao;

}

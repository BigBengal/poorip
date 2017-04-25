package com.poorip.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.poorip.repository.RequestDao;
import com.poorip.vo.RequestVo;

@Service
public class RequestService {

	@Autowired
	RequestDao requestDao;
	
	public boolean insertComments(RequestVo requestVo) {
		return requestDao.insert(requestVo);
	}
	

	
}

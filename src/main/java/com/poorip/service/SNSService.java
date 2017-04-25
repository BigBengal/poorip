package com.poorip.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.poorip.repository.SNSDao;
import com.poorip.vo.PostVo;
import com.poorip.vo.TravelInfoVo;

@Service
public class SNSService {

	@Autowired
	private SNSDao snsDao;
	
	public List<TravelInfoVo> getTravelInfo() {
		return snsDao.getTravelInfo();
	}
	public List<PostVo> getpostList() {
		return snsDao.getpostList();
	}

}

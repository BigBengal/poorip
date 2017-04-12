package com.poorip.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.poorip.repository.TravelInfoDao;
import com.poorip.vo.TravelInfoVo;

@Service
public class MainService {
	
	@Autowired
	TravelInfoDao dao;
	
	public List<TravelInfoVo> selectTravelInfo() {
		List<TravelInfoVo> travelInfoList = dao.getMainInfo();
		return travelInfoList;
	}
	
	public List<TravelInfoVo> selectTravelInfoByCity(int ctySeq) {
		List<TravelInfoVo> traveInfoList = dao.getInfo(ctySeq);
		return traveInfoList;
	}
	
	
}

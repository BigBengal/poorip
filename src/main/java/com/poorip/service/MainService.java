package com.poorip.service;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.poorip.controller.MainController;
import com.poorip.repository.TravelInfoDao;
import com.poorip.vo.ReviewVo;
import com.poorip.vo.TravelInfoVo;

@Service
public class MainService {
	
	private static final Logger logger = LoggerFactory.getLogger(MainService.class);

	
	@Autowired
	private TravelInfoDao travelInfoDao;
	
	public List<TravelInfoVo> selectTravelInfo() {
		
		List<TravelInfoVo> travelInfoList = travelInfoDao.getMainInfo();
		return travelInfoList;
	}
	
	public List<TravelInfoVo> selectTravelInfoByCity(int ctySeq) {
		List<TravelInfoVo> traveInfoList = travelInfoDao.getInfo(ctySeq);
		return traveInfoList;
	}
	
	public List<TravelInfoVo> getKwdData( String keyword ) {
		List<TravelInfoVo> travelInfoList = travelInfoDao.getKwdData( keyword );
		logger.info("travelInfoList:"+travelInfoList.toString());
		return travelInfoList;
	}
	
	public List<ReviewVo> selectReviewList(int trvSeq) {
		List<ReviewVo> reviewList = travelInfoDao.getReviews(trvSeq);
		return reviewList;
	}
		
}

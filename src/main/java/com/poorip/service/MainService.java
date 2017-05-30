package com.poorip.service;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.poorip.repository.CityDao;
import com.poorip.repository.TravelInfoDao;
import com.poorip.repository.TravelInfoPicDao;
import com.poorip.vo.CityVo;
import com.poorip.vo.ReviewVo;
import com.poorip.vo.TravelInfoPicVo;
import com.poorip.vo.TravelInfoVo;

@Service
public class MainService {
	
	private static final Logger logger = LoggerFactory.getLogger(MainService.class);

	
	@Autowired
	private TravelInfoDao travelInfoDao;
	
	@Autowired
	private TravelInfoPicDao travelInfoPicDao;
	
	@Autowired
	private CityDao cityDao;
	
	public List<TravelInfoVo> selectTravelInfo() {
		
		List<TravelInfoVo> travelInfoList = travelInfoDao.getMainInfo();
		return travelInfoList;
	}

	public List<TravelInfoVo> selectTop12CityInfo() {
		return travelInfoDao.getTop12CityInfo();
	}
	
	public List<TravelInfoVo> selectTravelInfoByCity(int ctySeq) {
		List<TravelInfoVo> travelInfoList = travelInfoDao.getInfo(ctySeq);
		return travelInfoList;
	}
	
	public List<TravelInfoPicVo> selectTravelInfoPics(int trvSeq) {
		return travelInfoPicDao.getInfoPic(trvSeq);
	}
	
	public List<TravelInfoVo> getKwdData( String keyword ) {
		List<TravelInfoVo> travelInfoList = travelInfoDao.getKwdData( keyword );
//		logger.info("travelInfoList:"+travelInfoList.toString());
		return travelInfoList;
	}
	
	public List<ReviewVo> selectReviewList(int trvSeq) {
		List<ReviewVo> reviewList = travelInfoDao.getReviews(trvSeq);
		return reviewList;
	}
	
	public int getCitySeq( String cityName ) {
		return travelInfoDao.getCitySeq(cityName);
	}
	
	public List<ReviewVo> selectReviewPics(int postSeq) {
		List<ReviewVo> picsList = travelInfoDao.getReviewPics(postSeq);
		return picsList;
	}
	
	public List<ReviewVo> getReviewsByLikes(int trvSeq) {
		List<ReviewVo> reviewList = travelInfoDao.getReviewsByLikes(trvSeq);
		return reviewList;
	}
	
	public int selectPostLikeAjax(int postSeq) {
		return travelInfoDao.getPostLikeAjax(postSeq);
	}
		
	public CityVo getCityName(int ctySeq){
		return cityDao.getCity(ctySeq);
	}

}

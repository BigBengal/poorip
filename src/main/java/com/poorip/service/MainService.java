package com.poorip.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.poorip.repository.TravelInfoDao;
import com.poorip.vo.PostVo;
import com.poorip.vo.TravelInfoVo;

@Service
public class MainService {
	
	@Autowired
	TravelInfoDao traveldao;
	
	public List<TravelInfoVo> selectTravelInfo() {
		List<TravelInfoVo> travelInfoList = traveldao.getMainInfo();
		return travelInfoList;
	}
	
	public List<TravelInfoVo> selectTravelInfoByCity(int ctySeq) {
		List<TravelInfoVo> traveInfoList = traveldao.getInfo(ctySeq);
		return traveInfoList;
	}
	
	public List<PostVo> selectReviewList(int trvSeq) {
		List<PostVo> reviewList = traveldao.getReviews(trvSeq);
		return reviewList;
	}
	
	
}

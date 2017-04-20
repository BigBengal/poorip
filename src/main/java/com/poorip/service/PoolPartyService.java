package com.poorip.service;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.poorip.repository.PoolPartyDao;
import com.poorip.vo.CityVo;
import com.poorip.vo.PoolPartyVo;
import com.poorip.vo.TravelInfoVo;

@Service
public class PoolPartyService {
	
	private static final Logger logger = LoggerFactory.getLogger(MainService.class);
	
	@Autowired
	private PoolPartyDao poolPartyDao;

	public List<TravelInfoVo> getPoolKwd(String keyword) {
		List<TravelInfoVo> travelInfoList = poolPartyDao.getPoolKwd( keyword );
		logger.info("travelInfoList:"+travelInfoList.toString());
		return travelInfoList;
	}
	
	public List<PoolPartyVo> getPoolList(PoolPartyVo poolPartyVo) {
		List<PoolPartyVo> poolList = poolPartyDao.getPoolList(poolPartyVo);
		return poolList;
	}
	
	public List<CityVo> getCityNames(String ctyName) {
		return poolPartyDao.getCityNames(ctyName);
	}
	
}

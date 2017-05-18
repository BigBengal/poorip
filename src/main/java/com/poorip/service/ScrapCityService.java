package com.poorip.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.poorip.repository.ScrapCityDao;
import com.poorip.vo.ScrapCityVo;

@Service
public class ScrapCityService {
	
	@Autowired
	ScrapCityDao scrapCityDao;
	
	public List<ScrapCityVo> showCity(int usrSeq) {
		return scrapCityDao.showCity(usrSeq);
	}
	
	public boolean insertDate(ScrapCityVo scrapCityVo) {
		return scrapCityDao.insert(scrapCityVo);
	}
	
	public ScrapCityVo select(ScrapCityVo scrapCityVo) {
		return scrapCityDao.select(scrapCityVo);
	}
	
	public boolean updateDate(ScrapCityVo scrapCityVo) {
		return scrapCityDao.update(scrapCityVo);
	}
	
	public ScrapCityVo showTravelDuration(int usrSeq) {
		return scrapCityDao.showTravelDuration(usrSeq);
	}
	
	public boolean clearCityDate(ScrapCityVo scrapCityVo) {
		return scrapCityDao.clearDate(scrapCityVo);
	}
	public boolean updateCityOrder(int usrSeq, int[] ctySeq){
		int totalCount = ctySeq.length;
		boolean rtn = true;
		ScrapCityVo scrapCityvo = new ScrapCityVo();
		scrapCityvo.setUsrSeq(usrSeq);
		for(int i=0; i < totalCount; i++){
			scrapCityvo.setCtySeq(ctySeq[i]);
			if(scrapCityDao.select(scrapCityvo)==null)
				scrapCityDao.insertTravelOrder(scrapCityvo);
			rtn = rtn && scrapCityDao.updateCityOrder(usrSeq, ctySeq[i], i);
		}
		return rtn;
	}
}

package com.poorip.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.poorip.repository.ScrapDao;
import com.poorip.vo.ScrapVo;

@Service
public class ScrapService {

	@Autowired
	ScrapDao scrapDao;
	
	
	public void insertScrap(ScrapVo scrapVo) {
		scrapDao.addScrapByBall(scrapVo);
	}
	
	
	public int selectScrap(int trvSeq) {
		return scrapDao.selectScrap(trvSeq);
	}
	
	public boolean deleteScrap(ScrapVo scrapVo) {
		return scrapDao.delete(scrapVo);
	}
}

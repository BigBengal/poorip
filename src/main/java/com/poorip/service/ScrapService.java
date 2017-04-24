package com.poorip.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.poorip.repository.ScrapDao;
import com.poorip.vo.ReviewVo;
import com.poorip.vo.ScrapVo;

@Service
public class ScrapService {

	@Autowired
	ScrapDao scrapDao;
	
	
	public void insertScrap(ScrapVo scrapVo) {
		scrapDao.addScrapByBall(scrapVo);
	}
	
	
	public int selectScrap(ScrapVo scrapVo) {
		return scrapDao.selectScrap(scrapVo);
	}
	
	public boolean deleteScrap(ScrapVo scrapVo) {
		return scrapDao.delete(scrapVo);
	}
	
	public List<ReviewVo> showScraps(int usrSeq) {
		return scrapDao.showScraps(usrSeq);
	}
	

}

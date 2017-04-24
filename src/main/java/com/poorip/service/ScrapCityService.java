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
}

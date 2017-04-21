package com.poorip.repository;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.poorip.vo.ScrapVo;

@Repository
public class ScrapDao {
	
	@Autowired
	private SqlSession sqlSession;
	
	public boolean add(ScrapVo scrapVo){
		return 1 == sqlSession.insert("scrap.insert", scrapVo);
	}
	
	public boolean delete(ScrapVo scrapVo){
		return 1 == sqlSession.delete("scrap.delete",scrapVo);
	}
	
	public boolean addScrapByBall(ScrapVo scrapVo) {
		return 1 == sqlSession.insert("scrap.insertscrap", scrapVo);
	}
	
	public int selectScrap(int trvSeq) {
		return sqlSession.selectOne("scrap.selectScrap", trvSeq);
	}
	
	public boolean deleteScrap(ScrapVo scrapVo) {
		return 1==sqlSession.delete("scrap.delete", scrapVo);
	}
}

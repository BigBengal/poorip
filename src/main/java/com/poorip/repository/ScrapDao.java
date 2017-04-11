package com.poorip.repository;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.poorip.vo.ScrapVo;

@Repository
public class ScrapDao {
	
	@Autowired
	private SqlSession sqlSession;
	
	public boolean add(ScrapVo scrapvo){
		return 1 == sqlSession.insert("scrap.insert", scrapvo);
	}
	
	public boolean delete(ScrapVo scrapvo){
		return 1 == sqlSession.delete("scrap.delete",scrapvo);
	}
}

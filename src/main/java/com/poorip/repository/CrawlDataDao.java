package com.poorip.repository;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.poorip.vo.CrawlDataVo;

@Repository
public class CrawlDataDao {
	@Autowired
	private SqlSession sqlSession;
	
	public boolean insert( CrawlDataVo crawlDataVo ) {
		return 1 == sqlSession.insert( "crawldata.insert", crawlDataVo );
	}
	
}

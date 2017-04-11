package com.poorip.repository;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.poorip.vo.CountryVo;

@Repository
public class CountryDao {
	
	@Autowired
	private SqlSession sqlSession;
	
	public boolean insert( CountryVo countryVo ) {
		return 1 == sqlSession.insert( "country.insert", countryVo );
	}
	
	public boolean delete( CountryVo countryVo ) {
		return 1 == sqlSession.delete( "country.delete", countryVo );
	}
	
	public boolean update( CountryVo countryVo ) {
		return 1 == sqlSession.update( "country.update", countryVo );
	}
}

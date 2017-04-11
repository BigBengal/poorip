package com.poorip.repository;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.poorip.vo.CityVo;

@Repository
public class CityDao {
	
	@Autowired
	private SqlSession sqlSession;
	
	public boolean insert( CityVo cityVo ) {
		return 1 == sqlSession.insert( "city.insert", cityVo );
	}
	
	public boolean delete( CityVo cityVo ) {
		return 1 == sqlSession.delete( "city.delete", cityVo );
	}
	
	public boolean update( CityVo cityVo ) {
		return 1 == sqlSession.update( "city.update", cityVo );
	}
	
	public List<CityVo> getList( CityVo cityVo ) {
		return sqlSession.selectList( "city.getCityList", cityVo );
	}

}

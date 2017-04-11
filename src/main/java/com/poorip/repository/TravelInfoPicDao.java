package com.poorip.repository;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.poorip.vo.TravelInfoPicVo;

@Repository
public class TravelInfoPicDao {
	
	@Autowired
	private SqlSession sqlSession;
	
	public boolean insert( TravelInfoPicVo travelInfoPicVo ) {
		return 1 == sqlSession.insert( "travelInfoPic.insert", travelInfoPicVo);
	}
	
	public boolean delete( TravelInfoPicVo travelInfoPicVo ) {
		return 1 == sqlSession.delete( "travelInfoPic.delete", travelInfoPicVo );
	}
	
	public List<TravelInfoPicVo> getInfoPic(int trvSeq) {
		return sqlSession.selectList( "travelInfoPic.getInfoPic", trvSeq );
	}
}

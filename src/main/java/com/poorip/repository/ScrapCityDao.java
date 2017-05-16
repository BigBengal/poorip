package com.poorip.repository;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.poorip.vo.ScrapCityVo;

@Repository
public class ScrapCityDao {
	
	@Autowired
	private SqlSession sqlSession;
	
	
	public boolean insert(ScrapCityVo scrapCityvo){
		return 1 == sqlSession.insert("scrapcity.insert", scrapCityvo);
	}
	
	public boolean update(ScrapCityVo scrapCityvo){
		return 1 == sqlSession.delete("scrapcity.update",scrapCityvo);
	}
	
	public ScrapCityVo select(ScrapCityVo scrapCityvo) {
		ScrapCityVo vo = sqlSession.selectOne("scrapcity.selectbyseq", scrapCityvo);
		return vo;
	}
	
	public List<ScrapCityVo> showCity(int usrSeq) {
		return sqlSession.selectList("scrap.showCity", usrSeq);
	}
	
	public boolean updateDate(ScrapCityVo scrapCityvo) {
		return 1== sqlSession.update("scrapcity.update", scrapCityvo);
	}
	
	public ScrapCityVo showTravelDuration (int usrSeq) {
//		sqlSession.delete("scrapcity.deletetrvduration", usrSeq);
		return sqlSession.selectOne("scrapcity.selecttrvlduration", usrSeq);
	}
	
	public boolean clearDate(ScrapCityVo scrapCityVo) {
		return 1== sqlSession.delete("scrapcity.cleartrvdurationforcity", scrapCityVo);
	}
	
}

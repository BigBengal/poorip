package com.poorip.repository;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.poorip.vo.ReviewVo;
import com.poorip.vo.ScrapCityVo;
import com.poorip.vo.ScrapVo;

@Repository
public class ScrapDao {
	
	@Autowired
	private SqlSession sqlSession;
	
	public boolean add(ScrapVo scrapVo){
		return 1 == sqlSession.insert("scrap.insert", scrapVo);
	}
	
	public boolean delete(ScrapVo scrapVo){
		sqlSession.delete("scrap.delete",scrapVo);
		// 스크랩 삭제 시 스크랩 도시 정보가 한개도 없을 때는 삭제 처리( scrap 먼저 삭제 후 해야함)
		return 1 == sqlSession.delete("scrapcity.deletetrvduration", scrapVo.getUsrSeq()); 
	}
	
	public boolean addScrapByBall(ScrapVo scrapVo) {
		return 1 == sqlSession.insert("scrap.insertscrap", scrapVo);
	}
	
	public int selectScrap(ScrapVo scrapVo) {
		return sqlSession.selectOne("scrap.selectScrap", scrapVo);
	}
	
	public boolean deleteScrap(ScrapVo scrapVo) {
		return 1==sqlSession.delete("scrap.delete", scrapVo);
	}
	
	public List<ReviewVo> showScraps(int usrSeq) {
		return sqlSession.selectList("scrap.showScrap", usrSeq);
	}
	
	public boolean updateHit(int trvSeq) {
		return 1== sqlSession.update("travelInfo.updateHit", trvSeq);
	}
	
	
	
	
}

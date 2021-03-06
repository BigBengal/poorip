package com.poorip.repository;

import static org.junit.Assert.*;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.junit.Ignore;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.annotation.Rollback;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;

import com.poorip.vo.CategoryVo;

//spring-test안에 들어있는 클래스로, spring을 띄워주고 annotation들을 사용할수 있게 해준다.
@RunWith(SpringJUnit4ClassRunner.class)

//context configuration이다. mybatis와 spring securiry를 사용하는 경우 대부분 아래와 같을 것이다.
@ContextConfiguration(locations = {
   "file:src/main/webapp/WEB-INF/spring/appServlet/servlet-context.xml",
   "file:src/main/webapp/WEB-INF/spring/root-context.xml",
 })
//ServletContext 을 autowired하면 서블릿 설정들을 가져올수 있다.
//그러려면 @WebAppCongifuration 이 필요하다.
@WebAppConfiguration

public class CategoryDaoTest {

//	@Autowired
//	UserDao userdao;
//	@Inject
	
	@Inject
	private SqlSession sqlSession;
	
	@Test
	public void test() {
		// 실행값, 예상값 을 파라미터로 같으면 Junit 테스트가 성공, 다르면 실패한다.
		assertEquals(1, 1);
	}
	
	@Test
	@Rollback(false)
	public void testInsert() {
		CategoryVo categoryVo = new CategoryVo();
		categoryVo.setCatName("Hot한 도시의 여행지");
		assertEquals( sqlSession.insert( "category.insert", categoryVo ), 1);
	}
	
	@Ignore
	@Test
	@Rollback(false)
	public void testGetList() {
		
	}
	
	@Ignore
	@Test
	@Rollback(false)
	public void testDelete() {
		CategoryVo categoryVo = new CategoryVo();
		categoryVo.setCatSeq(1);
		assertEquals( sqlSession.delete( "category.delete", categoryVo ), 1);
	}

}

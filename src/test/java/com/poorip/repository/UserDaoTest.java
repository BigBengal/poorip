package com.poorip.repository;

import static org.junit.Assert.assertEquals;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.junit.Ignore;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.annotation.Rollback;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;

import com.poorip.vo.UserVo;

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
public class UserDaoTest {

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
//	@Rollback(false)
	public void isExist() {
		UserVo uservo = new UserVo();
		uservo.setUsrEmail("bengal@naver.com");
//		userdao.join(uservo);
		assertEquals((Integer)sqlSession.selectOne("user.isexistuser",uservo), new Integer(1));
	}
	
	@Ignore
	@Test
//	@Rollback(false)
	public void insert() {
		UserVo uservo = new UserVo();
		//uservo.setUsrEmail("teseUser2");
//		userdao.join(uservo);
		assertEquals(sqlSession.insert("user.insert",uservo), 1);
	}
	
	@Ignore
	@Test
//	@Rollback(false)	// 트랜젝션 commit을 일으킨다. Test 전체 트랜잭션을 야기한다.
	public void delete() {
		UserVo uservo = new UserVo();
		uservo.setUsrEmail("teseUser2");
//		userdao.delete(uservo);
		assertEquals(sqlSession.delete("user.delete", uservo), 1);
	}
	@Ignore
	@Test
	@Rollback(false)	// 트랜젝션 commit을 일으킨다. Test 전체 트랜잭션을 야기한다.
	public void update() {
		UserVo uservo = new UserVo();
		uservo.setUsrEmail("teseUser2");
//		userdao.delete(uservo);
		assertEquals(sqlSession.update("user.updatelogin", uservo), 1);
	}
	@Ignore
	@Test
	@Rollback(false)	// 트랜젝션 commit을 일으킨다. Test 전체 트랜잭션을 야기한다.
	public void updateProfile() {
		UserVo uservo = new UserVo();
		uservo.setUsrEmail("test");
		uservo.setUsrInfo("자기소개3");
		uservo.setUsrHashtag("해쉬태그3");
//		userdao.delete(uservo);
		assertEquals(sqlSession.update("user.updateprofile", uservo), 1);
	}
	
	@Ignore
	@Test
	@Rollback(false)	// 트랜젝션 commit을 일으킨다. Test 전체 트랜잭션을 야기한다.
	public void updateNoti() {
		UserVo uservo = new UserVo();
		uservo.setUsrEmail("test");
		uservo.setUsrNoti("Y");
//		userdao.delete(uservo);
		assertEquals(sqlSession.update("user.updatenoti", uservo), 1);
	}
	
	@Ignore
	@Test
	@Rollback(false)	// 트랜젝션 commit을 일으킨다. Test 전체 트랜잭션을 야기한다.
	public void updateBlackYN() {
		UserVo uservo = new UserVo();
		uservo.setUsrEmail("test");
		uservo.setUsrBlackYN("Y");
//		userdao.delete(uservo);
		assertEquals(sqlSession.update("user.updateblack", uservo), 1);
	}
	
	
	@Ignore
	@Test
	@Rollback(false)	// 트랜젝션 commit을 일으킨다. Test 전체 트랜잭션을 야기한다.
	public void select() {
		UserVo uservo = new UserVo();
		uservo.setUsrEmail("teseUser2");
//		userdao.delete(uservo);
		assertEquals(sqlSession.selectOne("user.selectbyemail", uservo), uservo);
	}
	

}

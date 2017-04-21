package com.poorip.repository;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertNotNull;

import org.junit.Before;
import org.junit.Ignore;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;

import com.poorip.vo.PostVo;

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

public class PostDaoTest {
	
	@Autowired
	public PostDao dao;
	
	private PostVo vo;
	
	@Before
	public void setUp() {
		vo = new PostVo();
		vo.setTitle("Title");
		vo.setContents("contents");
		vo.setReviewPubYn("Y");
		vo.setUsrSeq(1);
		vo.setTrvSeq(2);
	}
	
	@Test
	public void testWrite() {
		assertEquals(dao.write(vo), true);
	}
	
	@Ignore
	@Test
	public void testSelect() {
		assertNotNull(dao.select(2));
	}
	
	@Ignore
	@Test
	public void testDelete() {
		vo.setPostSeq(2);
		assertEquals(dao.delete(vo), true);
	}

}

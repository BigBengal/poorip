package com.poorip.repository;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertNotNull;

import org.junit.Before;
import org.junit.Ignore;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.mockito.MockitoAnnotations;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.annotation.Rollback;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;
import org.springframework.test.web.servlet.MockMvc;
import org.springframework.test.web.servlet.setup.MockMvcBuilders;
import org.springframework.web.context.WebApplicationContext;

import com.poorip.vo.PoolPartyVo;
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
public class PoolPartyDaoTest {
	

	@Autowired
	WebApplicationContext wac;

	MockMvc mockMvc;
	  
//	@Mock
//	SqlSession seqSession;
	
	@Autowired
	public PoolPartyDao poolpartydao;
	
	private PoolPartyVo poolpartyvo;
	
	@Before
	public void setUp() {
		MockitoAnnotations.initMocks(this);
		mockMvc = MockMvcBuilders.standaloneSetup(poolpartydao).build();
//		mockMvc = MockMvcBuilders.webAppContextSetup(wac).build();
		
		poolpartyvo = new PoolPartyVo();
		poolpartyvo.setPoolName("Test");
		poolpartyvo.setPoolComment("Comment");
		poolpartyvo.setPoolPublicYn("Y");
		poolpartyvo.setPoolPic("poolPic.png");
		poolpartyvo.setManagerEmail("ManagerEmail");
		poolpartyvo.setCtySeq(1);
	}
	
	@Rollback(false)
	@Test
	public void testJoin() {
		assertEquals(poolpartydao.join(poolpartyvo), true);
	}

	@Ignore
	@Test
	public void testSelect() {
		assertNotNull(poolpartydao.select(2));
	}

	@Ignore
	@Test
	public void testUpdate() {
		poolpartyvo.setPoolSeq(30);
		assertEquals(poolpartydao.update(poolpartyvo), true);
	}

	@Ignore
	@Test
	public void testDelete() {
		poolpartyvo.setPoolSeq(30);
		assertEquals(poolpartydao.delete(poolpartyvo), true);
	}

}

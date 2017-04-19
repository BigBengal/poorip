package com.poorip.controller;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.poorip.dto.JSONResult;
import com.poorip.service.MainService;
import com.poorip.service.PoolPartyService;
import com.poorip.vo.CityVo;
import com.poorip.vo.PoolPartyVo;
import com.poorip.vo.TravelInfoVo;

@Controller
@RequestMapping("/poolparty")
public class PoolPartyController {
	
	private static final Logger logger = LoggerFactory.getLogger(MainController.class);
	
	@Autowired
	private PoolPartyService poolPartyService;
	
	@RequestMapping("/search")
	public String searchPool() {
		
		return "/mainpage/poolMain";
	}

	
	@ResponseBody
	@RequestMapping("/poolsearch")
	public JSONResult searchPoolForm(@RequestParam( value="kwd", required=true, defaultValue="" ) String keyword,
								  Model model ) {
		
		logger.debug("텍스트창에 입력된 단어 : " + keyword);
		
		List<TravelInfoVo> list = poolPartyService.getPoolKwd( keyword );
		if ( list.isEmpty() )
			return JSONResult.fail("No-DATA");
		
		return JSONResult.success(list);
	}
	
	
	@ResponseBody
	@RequestMapping("/poolsearchtest")
	public JSONResult searchPool(@ModelAttribute PoolPartyVo poolPartyVo) {
		System.out.println(poolPartyVo);
		List<PoolPartyVo> poolList = poolPartyService.getPoolList(poolPartyVo);
		System.out.println("POOLLIST" + poolList);
		return JSONResult.success(poolList);
	}
	
	

}

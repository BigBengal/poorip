package com.poorip.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import com.poorip.service.PoolPartyService;
import com.poorip.vo.CityVo;

@Controller
@RequestMapping("/poolparty")
public class PoolPartyController {
	
	@Autowired
	private PoolPartyService poolPartyService;
	
	@RequestMapping("/poolsearchForm")
	public String searchPoolView( @ModelAttribute CityVo cityVo) {
		return "/mainpage/searchForm";
	}
	

}

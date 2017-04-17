package com.poorip.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import com.poorip.dto.JSONResult;
import com.poorip.service.AdminService;
import com.poorip.vo.TravelInfoVo;

@Controller("adminAPI")
@RequestMapping("/api/admin")
public class AdminAJAXController {
	
	@Autowired
	private AdminService adminService;
	
	@RequestMapping( "/list/{page}" )
	public JSONResult list( @PathVariable( "page" ) int page ) {
		List<TravelInfoVo> list = adminService.getTravelList( page );
		return JSONResult.success( list );
	}

}

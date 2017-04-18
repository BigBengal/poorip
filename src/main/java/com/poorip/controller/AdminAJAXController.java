package com.poorip.controller;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.poorip.dto.JSONResult;
import com.poorip.service.AdminService;
import com.poorip.vo.TravelInfoVo;

@Controller
@RequestMapping("/adminAJAX")
public class AdminAJAXController {
	
	private static final Logger logger = LoggerFactory.getLogger(AdminAJAXController.class);
	
	@Autowired
	private AdminService adminService;
	
	@ResponseBody
	@RequestMapping( "/list" )
	public JSONResult list() {
		List<TravelInfoVo> list = adminService.getTravelList();
		return JSONResult.success( list );
	}
	
	@RequestMapping( "/addInfo" )
	public JSONResult addInfo( @ModelAttribute TravelInfoVo travelInfoVo,
						   @RequestParam("file") MultipartFile multipartFile) {
		adminService.addInfo(travelInfoVo, multipartFile);
		travelInfoVo = adminService.getMessage( travelInfoVo.getTrvSeq() );
		return JSONResult.success(travelInfoVo);
	}
	
	@ResponseBody
	@RequestMapping( "/deleteInfo" )
	public JSONResult deleteInfo(
			@ModelAttribute TravelInfoVo travelInfoVo ){
		logger.info("/deleteInfo");
		boolean result = adminService.deleteInfo( travelInfoVo );
		if (result)
			return JSONResult.success( travelInfoVo.getTrvSeq());
		else
			return JSONResult.fail("DB error");
	}
	
	
	

}

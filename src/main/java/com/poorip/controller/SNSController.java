package com.poorip.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.poorip.dto.JSONResult;
import com.poorip.security.Auth;
import com.poorip.security.AuthUser;
import com.poorip.service.SNSService;
import com.poorip.vo.PostPicVo;
import com.poorip.vo.PostVo;
import com.poorip.vo.ReviewVo;
import com.poorip.vo.UserVo;

@Controller
@RequestMapping("/sns")
public class SNSController {
	
	@Autowired SNSService snsService;
	
	@Auth
	@ResponseBody
	@RequestMapping("/main/{page}")
	public JSONResult mySNS( @AuthUser UserVo userVo,
							 @PathVariable ( "page" ) Integer page,
							  Model model ) {
		int usrSeq = userVo.getUsrSeq();
		page = page * 3;
		List<ReviewVo> post = snsService.getpostList(usrSeq, page);
		Map<Integer, Object> picMap = new HashMap<Integer, Object>();
		for(int i=0; i < post.size(); i++) {
			int postSeq = post.get(i).getPostSeq();
			picMap.put(postSeq , snsService.getpostPicList(postSeq));
			 
		}
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put( "postPic", picMap);
		map.put( "post", post);
		System.out.println(map);
		
		System.out.println(page);
		return JSONResult.success( map );
	}
	
	
	@Auth
	@RequestMapping("/post/upload")
	public String mySNSadd( @AuthUser UserVo userVo,
							@ModelAttribute ReviewVo reviewVo,
							MultipartHttpServletRequest request,			
							Model model ) throws IOException {
		
		reviewVo.setUsrSeq( userVo.getUsrSeq() );
		List<MultipartFile> postUploadFiles = request.getFiles( "file" );
		snsService.addPost( reviewVo, postUploadFiles );
		
		return "redirect:/sns";
	}

}

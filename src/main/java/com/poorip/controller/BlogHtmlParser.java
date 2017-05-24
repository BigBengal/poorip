package com.poorip.controller;

import java.io.File;
import java.io.IOException;
import java.text.ParseException;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.select.Elements;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.poorip.repository.CrawlDataDao;
import com.poorip.vo.CrawlDataVo;

@Controller
public class BlogHtmlParser {
	
	@Autowired
	private CrawlDataDao crawlDataDao;
	
	@ResponseBody
	@RequestMapping("/insertCrawlData")
	public String insertCrawlData() throws IOException, ParseException {

		for (int i = 200; i < 750; i++) {

			Document doc = Jsoup.parse(new File("C:/phantomjs-javascript/Interlaken-Food/swiss-restaurant-" + i + ".html"), "UTF-8");
			
			
			Elements elements = doc.select(".se_editView.se_title");
			Elements elements01 = doc.select(".tit_h3");
			Elements elements2 = doc.select(".se_paragraph.default");
			Elements elements201 = doc.select(".post_ct");
			Elements elements3 = doc.select(".se_date");
			Elements elements301 = doc.select(".dsc.num");
			/* Elements elements2 = doc.select("#commentArea"); */

			String title = elements.text();
			if(title.equals("") || title == null) {
				title = elements01.text();
			}
			String content = elements2.text();
			if(content.equals("") || content == null) {
				content = elements201.text();
			}
			String text3 = elements3.text();
			if(content.equals("") || content == null) {
				text3 = elements301.text();
			}
			String pubDate = text3.replaceAll("\\s+","");
			String pubDate2 = pubDate.replaceAll("[.]","/");
			/* String text2 = elements2.text(); */
			CrawlDataVo crawlDataVo = new CrawlDataVo();
			
			
			
			
			crawlDataVo.setTitle(title);
			crawlDataVo.setCtrSeq(3);
			crawlDataVo.setCtySeq(44);
			crawlDataVo.setCatSeq(2);
			crawlDataVo.setContent(content);
			crawlDataVo.setPubDate(pubDate2);
			
			crawlDataDao.insert(crawlDataVo);
		
			
		}
		return "Data Inserting ......";
	}
}

package com.poorip.controller;

import java.io.File;
import java.io.IOException;
import java.text.ParseException;
import java.util.concurrent.TimeUnit;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.select.Elements;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.cloud.translate.Translate;
import com.google.cloud.translate.Translate.TranslateOption;
import com.google.cloud.translate.TranslateOptions;
import com.google.cloud.translate.Translation;
import com.poorip.repository.CrawlDataDao;
import com.poorip.vo.CrawlDataVo;

@Controller
public class BlogHtmlParsers {
	
	@Autowired
	private CrawlDataDao crawlDataDao;
	
	@ResponseBody
	@RequestMapping("/insertCrawlData")
	public String insertCrawlData() throws IOException, ParseException, InterruptedException {

		for (int i = 631; i < 750; i++) {

			TimeUnit.SECONDS.sleep(1);

			Document doc = Jsoup.parse(new File("C:/phantomjs-javascript/Austria1/Vienna-restaurant/Vienna-restaurant-" + i + ".html"), "UTF-8");
			
			System.out.println(i);
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
			
			String key = "AIzaSyBt-xzhDPM3uWf7-Lgh3Ob5vN570QYKH4s";
	
		
			
		Translate translate = TranslateOptions.getDefaultInstance().getService();
			
			Translation translation =
			        translate.translate(
			            content.replaceAll("ㅋ",""),
			            TranslateOption.sourceLanguage("ko"),
			            TranslateOption.targetLanguage("en"));
			content = translation.getTranslatedText().replaceAll("[^\\w\\s-']"," ");
			
			
			crawlDataVo.setTitle(title);
			crawlDataVo.setCtrSeq(5);
			crawlDataVo.setCtySeq(47);
			crawlDataVo.setCatSeq(2);
			crawlDataVo.setContent(content.replaceAll("39", "'"));
			crawlDataVo.setPubDate(pubDate2);
			
			
			System.out.println(content.replaceAll("39", "'"));
			crawlDataDao.insert(crawlDataVo);
		
			
		}
		return "Data Inserting ......";
	}
	

}

package com.poorip.crawling;

import java.io.File;
import java.io.IOException;
import java.text.ParseException;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.select.Elements;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import com.poorip.repository.CrawlDataDao;
import com.poorip.vo.CrawlDataVo;

@Controller
public class BlogHtmlParser {
	@Autowired
	private static CrawlDataDao crawlDataDao;
	
	public static void main(String[] args) throws IOException, ParseException {

		for (int i = 0; i < 100; i++) {

			Document doc = Jsoup.parse(new File("C:/phantomjs-javascript/Swiss-Food/swiss-restaurant-" + i + ".html"), "UTF-8");

			Elements elements = doc.select(".se_editView.se_title");
			Elements elements2 = doc.select(".se_paragraph.default");
			Elements elements3 = doc.select(".se_date");
			/* Elements elements2 = doc.select("#commentArea"); */

			String title = elements.text();
			String content = elements2.text();
			String text3 = elements3.text();
			String pubDate = text3.replaceAll("\\s+","");
			String pubDate2 = pubDate.replaceAll("[.]","/");
			/* String text2 = elements2.text(); */
			CrawlDataVo crawlDataVo = new CrawlDataVo();
			crawlDataVo.setTitle(title);
			crawlDataVo.setContent(content);
			crawlDataVo.setPubDate(pubDate2);
			
			crawlDataDao.insert(crawlDataVo);
		}
	}
}

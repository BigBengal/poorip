package com.poorip.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import com.google.cloud.translate.Translate;
import com.google.cloud.translate.Translate.TranslateOption;
import com.google.cloud.translate.TranslateOptions;
import com.google.cloud.translate.Translation;

@Controller
public class SocketController {
	
	
	@RequestMapping("/chat")
	public void viewChattingPage() {
	
		// Instantiates a client
		 Translate translate = TranslateOptions.getDefaultInstance().getService();
		

	    // The text to translate
	    String text = "Hello, world!";

	    // Translates some text into Russian
	    Translation translation =
	        translate.translate(
	            text,
	            TranslateOption.sourceLanguage("en"),
	            TranslateOption.targetLanguage("ko"));


	    System.out.printf("Text: %s%n", text);
	    System.out.printf("Translation: %s%n", translation.getTranslatedText());  
	  }
	
}


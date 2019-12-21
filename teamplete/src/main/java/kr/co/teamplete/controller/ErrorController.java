package kr.co.teamplete.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class ErrorController {
	
	
	@RequestMapping(value="/error/browser", method=RequestMethod.GET)
	public String ErrorBrowser() {		
		return "error/browser";
	}

}

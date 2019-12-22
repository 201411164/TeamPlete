package kr.co.teamplete.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.co.teamplete.dto.RequestVO;
import kr.co.teamplete.service.RequestService;

@Controller
public class RequestController {
	
	@Autowired
	private RequestService service;
	
	@RequestMapping(value="/team/request", method = RequestMethod.POST)
	@ResponseBody
	public RequestVO requestTeam(@RequestBody RequestVO request) {
		
		service.insertRequest(request);
		
		return request;
	}

}

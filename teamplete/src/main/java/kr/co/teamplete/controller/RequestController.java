package kr.co.teamplete.controller;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
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
	
	// insert request
	@RequestMapping(value="/team/request", method = RequestMethod.POST)
	@ResponseBody
	public void requestTeam(@RequestBody RequestVO request) {
		
		service.insertRequest(request);
		
	}

	// delete request
	@RequestMapping(value = "/request/delete/{teamId}/{memberid:.+}", method = RequestMethod.DELETE)
	public void deleteRequest(@PathVariable("teamId") int teamId, @PathVariable("memberid") String memberid) {
		
		Map<String, Object> hm = new HashMap<>();
		
		hm.put("teamId", teamId);
		hm.put("reqMemberid", memberid);
		
		service.deleteRequest(hm);
	}
}

package com.san.dong.search.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class SearchController {
	
	@RequestMapping("gosSarchHouseMain.search")
	public String goSearchHouseMainPage() {
		
		return "searchHouse";
	}
	
}

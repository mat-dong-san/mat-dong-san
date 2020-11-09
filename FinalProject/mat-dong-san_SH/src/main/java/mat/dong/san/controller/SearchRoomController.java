package mat.dong.san.controller;

import java.text.DateFormat;
import java.util.Date;
import java.util.Locale;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class SearchRoomController {

	@RequestMapping(value = "gosSarchHomeMain.search", method = RequestMethod.GET)
	public String goSearchRoomMainPage() {
		
		return "searchRoomMainPage";
	}
	
	@RequestMapping(value = "searchRoomDetailPage.search", method = RequestMethod.GET)
	public String goSearchRoomDetailPage() {
		
		return "searchRoomDetailPage";
	}
}

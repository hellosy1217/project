package com.web.blueballoon.user.board;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class BoardController {

	@RequestMapping(value = "board_list", method = RequestMethod.GET)
	public String list() {
		return "user/board/list";
	}
	
}

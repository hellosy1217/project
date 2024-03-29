package com.web.blueballoon.util;

import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;

@Service
public class ControllerMessage {
	
	public ModelAndView resMassege(int res, String[] msg, String[] url) {
		String [] title = {"성공!","실패!"};
		String [] type = {"success","warning"};
		ModelAndView mav = new ModelAndView();
		if(res>0) {
			mav.addObject("msg",msg[0]);
			mav.addObject("url",url[0]);
			mav.addObject("title",title[0]);
			mav.addObject("type", type[0]);
		}else {
			mav.addObject("msg",msg[1]);
			mav.addObject("url",url[1]);
			mav.addObject("title",title[1]);
			mav.addObject("type", type[1]);
		}
		mav.setViewName("admin/message");
		return mav;
	}
}

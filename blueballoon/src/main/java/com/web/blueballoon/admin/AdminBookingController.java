package com.web.blueballoon.admin;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.web.blueballoon.admin.service.AdminMapper;
import com.web.blueballoon.util.ControllerMessage;

@Controller
public class AdminBookingController {
	
	@Autowired
	private AdminMapper adminMapper;
	@Autowired
	private ControllerMessage cm;
	
	ModelAndView mav = new ModelAndView();
	
	@RequestMapping(value="BB_booking_list")
	public ModelAndView viewBookingList() {
		//아직 보여줄 값이 미완 보여줄 부분 의논 필요
		mav.setViewName("admin/booking/BB_booking_list");
		return mav;
	}
}

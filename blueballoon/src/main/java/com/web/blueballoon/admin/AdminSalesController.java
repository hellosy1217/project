package com.web.blueballoon.admin;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.web.blueballoon.admin.service.AdminMapper;

@Controller
public class AdminSalesController {

	@Autowired
	private AdminMapper adminMapper;
	ModelAndView mav = new ModelAndView();
	
	@RequestMapping(value="BB_sales_list")
	public ModelAndView salesList() {
		//보여줄 부분 결재랑 결합해서 생각해야 함.
		mav.setViewName("admin/sales/BB_sales_list");
		return mav;
	}
}

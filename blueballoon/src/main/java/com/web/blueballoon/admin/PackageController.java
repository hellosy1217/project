package com.web.blueballoon.admin;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;
import com.web.blueballoon.admin.service.AdminMapper;
import com.web.blueballoon.util.ControllerMessage;

@Controller
public class PackageController {
	
	private ModelAndView mav = new ModelAndView();
	@Autowired
	private ControllerMessage cm;
	@Autowired
	private AdminMapper adminMapper;
	
	@RequestMapping(value="BB_pack_list")
	public ModelAndView	viewPackaageList() {
		//table에서 아직 불러오지 않음.
		mav.addObject("packageList");
		mav.setViewName("admin/package/BB_pack_list"); return mav;
	}
	
	@RequestMapping(value="BB_pack_insert",  method=RequestMethod.GET)
	public ModelAndView viewPackageInsert() {
		//table에서 불러와야함.
		mav.addObject("productList");
		mav.setViewName("admin/package/BB_pack_insert"); return mav;
	}
	
}

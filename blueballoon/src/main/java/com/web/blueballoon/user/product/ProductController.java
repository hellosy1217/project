package com.web.blueballoon.user.product;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.web.blueballoon.admin.service.AdminMapper;
import com.web.blueballoon.model.BBCategoryDTO;

@Controller
public class ProductController {

	@Autowired
	private AdminMapper ProductMapper;

	private ModelAndView mav = new ModelAndView();
	
	@RequestMapping(value = "main", method = RequestMethod.GET)
	public String main() {
		return "home";
	}

	@RequestMapping(value = "product_list", method = RequestMethod.GET)
	public ModelAndView list() {
		List<BBCategoryDTO> list = ProductMapper.listBBCategoryDTO();

		mav.addObject("listCate", list);
		mav.setViewName("user/product/list");

		return mav;
	}

	@RequestMapping(value = "product_content", method = RequestMethod.GET)
	public String content() {
		return "user/product/content";
	}

	@RequestMapping(value = "product_booking", method = RequestMethod.GET)
	public String booking() {
		return "user/product/booking";
	}
}

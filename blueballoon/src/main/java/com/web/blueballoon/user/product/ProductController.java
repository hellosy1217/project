package com.web.blueballoon.user.product;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class ProductController {
	
	@RequestMapping(value = "product_list", method = RequestMethod.GET)
	public String list() {
		return "user/product/list";
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

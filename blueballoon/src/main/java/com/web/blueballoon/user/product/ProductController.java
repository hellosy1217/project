package com.web.blueballoon.user.product;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class ProductController {
	
	@RequestMapping(value = "product/list", method = RequestMethod.GET)
	public String list() {
		return "user/product/list";
	}
	
	@RequestMapping(value = "product/content", method = RequestMethod.GET)
	public String content() {
		return "user/product/content";
	}
}

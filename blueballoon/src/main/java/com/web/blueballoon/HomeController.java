package com.web.blueballoon;

import java.util.Locale;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class HomeController {

	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);

	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Locale locale, Model model) {
		logger.info("Welcome home! The client locale is {}.", locale);

		return "home";
	}

	@RequestMapping(value = "home", method = RequestMethod.GET)
	public ModelAndView blueballoon(HttpServletRequest arg0, HttpServletResponse arg1) {
		int member_num;
		try {
			member_num = (Integer) arg0.getSession().getAttribute("member_num");
		} catch (NullPointerException e) {
			member_num = 0;
		}
		return new ModelAndView("home", "member_num", member_num);
	}
}

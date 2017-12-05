package com.web.blueballoon.user.member;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class MemberController {

	private static final Logger logger = LoggerFactory.getLogger(MemberController.class);

	private ModelAndView mav = new ModelAndView();

	@RequestMapping(value = "member_login", method = RequestMethod.GET)
	public String login() {
		return "user/member/login";
	}

	@RequestMapping(value = "member_login", method = RequestMethod.POST)
	public ModelAndView loginPro(HttpServletRequest arg0) {

		// 채워야 함

		return mav;
	}

	@RequestMapping(value = "member_join", method = RequestMethod.GET)
	public String join() {
		return "user/member/join";
	}

	@RequestMapping(value = "member_join", method = RequestMethod.POST)
	public ModelAndView joinPro(HttpServletRequest arg0) {

		// 채워야 함

		return mav;
	}

	@RequestMapping(value = "member_find", method = RequestMethod.GET)
	public String find() {
		return "user/member/find";
	}

	@RequestMapping(value = "member_find", method = RequestMethod.POST)
	public ModelAndView findPro(HttpServletRequest arg0) {

		// 채워야 함

		return mav;
	}

	@RequestMapping(value = "member_edit", method = RequestMethod.GET)
	public String edit() {
		return "user/member/edit";
	}

	@RequestMapping(value = "member_edit", method = RequestMethod.POST)
	public ModelAndView editPro(HttpServletRequest arg0) {

		// 채워야 함

		return mav;
	}

}

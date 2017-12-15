package com.web.blueballoon.user.member;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;
import com.web.blueballoon.user.service.MemberMapper;
import com.web.blueballoon.model.MemberDBBean;

@Controller
public class MemberController {
	@Autowired
	private MemberMapper memberMapper;

	private static final Logger logger = LoggerFactory.getLogger(MemberController.class);

	private ModelAndView mav = new ModelAndView();

	@RequestMapping(value = "member_login", method = RequestMethod.GET)
	public String login() {
		return "user/member/login_us";
	}

	@RequestMapping(value = "member_login", method = RequestMethod.POST)
	public ModelAndView checkUser(MemberDBBean dto, HttpSession session, HttpServletRequest req) {
		dto = memberMapper.checkUser(dto);
		boolean isLogin = false;
		if (dto == null)
			isLogin = true;

		ModelAndView mav = new ModelAndView();
		if (isLogin) {
			// login.jsp로 이동
			mav.addObject("msg", "failure");
			mav.addObject("url", "member_login");
			mav.setViewName("user/member/message");

		} else { // 로그인 성공
			// main.jsp로 이동
			session = req.getSession();

			session.setAttribute("member_num", dto.getMember_num());
			session.setAttribute("member_email", dto.getMember_email());
			mav.addObject("msg", "success");
			mav.addObject("url", "home");
			mav.setViewName("user/member/message");
		}
		return mav;
	}

	@RequestMapping(value = "member_join", method = RequestMethod.GET)
	public String join() {
		return "user/member/join";
		
	}

	@RequestMapping(value = "member_join", method = RequestMethod.POST)
	public ModelAndView joinPro(HttpServletRequest arg0, @ModelAttribute MemberDBBean dto, BindingResult result) {

		int res = memberMapper.joinMember(dto);
		ModelAndView mav = new ModelAndView();
		if (res > 0) {
			mav.setViewName("user/member/login_us");
		} else {
			mav.addObject("msg", "회원가입 실패!!");
			mav.addObject("url", "member_list");
			mav.setViewName("user/member/message");
		}

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

	@RequestMapping(value = "member_test", method = RequestMethod.GET)
	public String test() {
		return "user/member/test";
	}

}

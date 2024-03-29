package com.web.blueballoon;

import java.util.Collections;
import java.util.Comparator;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.web.blueballoon.model.BBCategoryDTO;
import com.web.blueballoon.model.BBPackageDTO;
import com.web.blueballoon.user.service.MemberMapper;
import com.web.blueballoon.user.service.PackageMapper;
import com.web.blueballoon.user.service.ProductMapper;

@Controller
public class HomeController {

	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);

	@Autowired
	private MemberMapper memberMapper;

	@Autowired
	private ProductMapper ProductMapper;

	@Autowired
	private PackageMapper PackageMapper;

	@RequestMapping(value = "/", method = RequestMethod.GET)
	public ModelAndView home(HttpServletRequest arg0, HttpServletResponse arg1) {
		ModelAndView mav = new ModelAndView();
		int member_num;
		String member_email;
		char member_name;
		try {
			member_num = (Integer) arg0.getSession().getAttribute("member_num");
			member_email = (String) arg0.getSession().getAttribute("member_email");
			member_name = (Character) arg0.getSession().getAttribute("member_name");

			mav.addObject("member_num", member_num);
			mav.addObject("member_email", member_email);
			mav.addObject("member_name", member_name);
		} catch (NullPointerException e) {
			member_num = 0;
			member_email = null;
		}

		List<BBCategoryDTO> listCate = ProductMapper.listCate();
		mav.addObject("listCate", listCate);
		List<BBPackageDTO> listPack = PackageMapper.listPack();
		mav.addObject("listPack", listPack);
		arg0.getSession().setAttribute("listCate", listCate);
		mav.setViewName("home");
		return mav;
	}

	@RequestMapping(value = "main", method = RequestMethod.GET)
	public ModelAndView blueballoon(HttpServletRequest arg0, HttpServletResponse arg1) {
		ModelAndView mav = new ModelAndView();
		int member_num;
		String member_email;
		char member_name;
		try {
			member_num = (Integer) arg0.getSession().getAttribute("member_num");
			member_email = (String) arg0.getSession().getAttribute("member_email");
			member_name = (Character) arg0.getSession().getAttribute("member_name");

			mav.addObject("member_num", member_num);
			mav.addObject("member_email", member_email);
			mav.addObject("member_name", member_name);
		} catch (NullPointerException e) {
			member_num = 0;
			member_email = null;
		}

		List<BBCategoryDTO> listCate = ProductMapper.listCate();
		mav.addObject("listCate", listCate);

		List<BBPackageDTO> listPack = PackageMapper.listPack();
		mav.addObject("listPack", listPack);
		mav.setViewName("home");
		return mav;
	}

}
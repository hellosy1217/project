package com.web.blueballoon.user.member;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import com.web.blueballoon.user.service.MemberMapper;
import com.web.blueballoon.util.AmazonFileUtils;
import com.web.blueballoon.model.BBLikeDTO;
import com.web.blueballoon.model.BBMemberDTO;

@Controller
public class MemberController {
	@Autowired
	private MemberMapper memberMapper;
	@Autowired
	private AmazonFileUtils amazonUtil;

	private ModelAndView mav = new ModelAndView();

	@RequestMapping(value = "member_login", method = RequestMethod.GET)
	public String login() {
		return "user/member/login";
	}

	// 로그인
	@RequestMapping(value = "member_login", method = RequestMethod.POST)
	public ModelAndView checkUser(BBMemberDTO dto, HttpSession session, HttpServletRequest req) {
		dto = memberMapper.checkUser(dto);
		boolean isLogin = false;
		if (dto == null)
			isLogin = true;
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
			session.setAttribute("member_name", dto.getMember_name().toUpperCase().charAt(0));
			mav.setViewName("redirect:/main");
		}
		return mav;
	}

	@RequestMapping(value = "member_join", method = RequestMethod.GET)
	public String join() {
		return "user/member/join";
	}

	// 회원 가입
	@RequestMapping(value = "member_join", method = RequestMethod.POST)
	public ModelAndView joinPro(HttpServletRequest arg0, @ModelAttribute BBMemberDTO dto, BindingResult result) {

		int res = memberMapper.joinMember(dto);
		if (res > 0) {
			mav.setViewName("user/member/login");
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

	// 멤버 찾기
	@RequestMapping(value = "member_find", method = RequestMethod.POST)
	public ModelAndView findPro(HttpServletRequest arg0) {
		// 채워야 함
		return mav;
	}

	// 멤버 수정 페이지 보여주기.
	@RequestMapping(value = "member_edit", method = RequestMethod.GET)
	public ModelAndView updateFormMember(HttpServletRequest arg0, HttpSession session, HttpServletResponse arg1)
			throws Exception {
		session = arg0.getSession();
		String member_email = (String) session.getAttribute("member_email");
		BBMemberDTO dto = memberMapper.getMember(member_email);
		return new ModelAndView("user/member/edit", "getMember", dto);
	}

	// 멤버 정보 수정.
	@RequestMapping(value = "member_edit", method = RequestMethod.POST)
	public ModelAndView updateProMember(@ModelAttribute BBMemberDTO dto,
			@RequestParam("userpick") MultipartFile multipartFiles, BindingResult result) throws Exception {

		BBMemberDTO editDTO = memberMapper.getMember(dto.getMember_email());

		String file = null;
		String newFileName = multipartFiles.getOriginalFilename();

		if (editDTO.getMember_str_img() != null) { // 1. 검색 할 때(기존 파일 있을 때) / DB내에 str 이미지가 있으면 amazon검색 해주기.
			boolean existFile = amazonUtil.existFile("bb_member", dto.getMember_str_img());
			if (existFile && newFileName != null) {// -1 .기존 파일 있고 새로운 파일 있을 때.
				amazonUtil.deleteFile("bb_member", dto.getMember_str_img());
				file = amazonUtil.one_FileUpload("bb_member", multipartFiles);
				dto.setMember_org_img(newFileName);
				dto.setMember_str_img(file);
				System.out.println("1-1 : org / str : " + dto.getMember_org_img() + " / " + dto.getMember_str_img());
			} else if (existFile && newFileName == null) {// -2. 기존 파일 있고 새로운 파일 없을 때.
				dto.setMember_org_img(editDTO.getMember_org_img());
				dto.setMember_str_img(editDTO.getMember_str_img());
				System.out.println("1-2 : org / str : " + dto.getMember_org_img() + " / " + dto.getMember_str_img());
			}
		} else if (editDTO.getMember_str_img() == null) {// 2. 검색 안할 때 (기존 파일 없을 때) / 새로운 파일이 있으면 생성해주기. amazon검색 불필요.
			if (newFileName != null) { // -1. 새로운 파일 있을 때.
				file = amazonUtil.one_FileUpload("bb_member", multipartFiles);
				dto.setMember_org_img(newFileName);
				dto.setMember_str_img(file);
				System.out.println("2-1 : org / str : " + dto.getMember_org_img() + " / " + dto.getMember_str_img());
			} else if (newFileName == null) {// -2. 새로운 파일 없을 떄.
				dto.setMember_org_img(null);
				dto.setMember_str_img(null);
				System.out.println("2-2 : org / str : " + dto.getMember_org_img() + " / " + dto.getMember_str_img());
			}
		}
		int res = 0;
		try {
			res = memberMapper.editMember(dto);
		} catch (NullPointerException ne) {
			ne.printStackTrace();
			dto.setMember_org_img(null);
			dto.setMember_str_img(null);
			dto.setMember_email(null);
		}
		if (res > 0) {
			mav.setViewName("user/member/member_edit");
		} else {
			mav.addObject("msg", "회원정보 수정 실패!!");
			mav.addObject("url", "home");
			mav.setViewName("user/member/message");
		}

		return mav;
	}

	@RequestMapping(value = "member_profile", method = RequestMethod.GET)
	public ModelAndView profile(HttpServletRequest arg0, HttpSession session) {
		session = arg0.getSession();
		if(session == null) {
			mav.addObject("msg","로그인이 필요한 페이지입니다. 로그인해주세요.");
			mav.addObject("url","member_login");
			mav.setViewName("user/member/message"); return mav;
		}
		String member_email = (String) session.getAttribute("member_email");
		System.out.println("member_email : "+member_email);
		BBMemberDTO dto = memberMapper.getMember(member_email);
		mav.addObject("myMember",dto);
		mav.setViewName("user/member/profile");
		return mav;
	}

	@RequestMapping(value = "member_likelist", method = RequestMethod.GET)
	public ModelAndView likelist(HttpServletRequest arg0) {
		int member_num = (Integer) arg0.getSession().getAttribute("member_num");
		String member_email = (String) arg0.getSession().getAttribute("member_email");
		
		List<BBLikeDTO> likeList = memberMapper.listProducts(member_num);
		
		mav.addObject("member_num", member_num);
		mav.addObject("member_email", member_email);
		mav.setViewName("user/member/likelist");
		return mav;
	}

	@RequestMapping(value = "member_logout", method = RequestMethod.GET)
	public String logout(HttpServletRequest arg0) {
		arg0.getSession().removeAttribute("member_num");
		arg0.getSession().removeAttribute("member_email");
		return "redirect:/main";
	}
}

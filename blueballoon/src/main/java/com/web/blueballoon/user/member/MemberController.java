package com.web.blueballoon.user.member;

import java.util.List;
import java.util.UUID;

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

import com.web.blueballoon.model.BBCategoryDTO;
import com.web.blueballoon.model.BBLikeDTO;
import com.web.blueballoon.model.BBMemberDTO;
import com.web.blueballoon.model.BBPackageDTO;
import com.web.blueballoon.model.BBProductDTO;
import com.web.blueballoon.user.service.MemberMapper;
import com.web.blueballoon.user.service.ProductMapper;
import com.web.blueballoon.util.AmazonFileUtils;
import com.web.blueballoon.util.SendMessageUtil;

@Controller
public class MemberController {
	@Autowired
	private MemberMapper memberMapper;
	@Autowired
	private ProductMapper productMapper;
	@Autowired
	private AmazonFileUtils amazonUtil;
	@Autowired
	private SendMessageUtil sendMessage;

	private ModelAndView mav = new ModelAndView();

	@RequestMapping(value = "member_login", method = RequestMethod.GET)
	public String login() {
		return "user/member/login";
	}

	// 로그인
	@RequestMapping(value = "member_login", method = RequestMethod.POST)
	public ModelAndView checkUser(BBMemberDTO dto, HttpServletRequest req) {
		boolean isLogin = memberMapper.checkUser(dto); // true값이 성공

		if (isLogin) {
			BBMemberDTO login = memberMapper.getMember(dto.getMember_email());
			if (login.getMember_num() == 1) {
				mav.setViewName("redirect:/admin_index");
			} else {
				req.getSession().setAttribute("member_num", login.getMember_num());
				req.getSession().setAttribute("member_email", login.getMember_email());
				req.getSession().setAttribute("member_name", login.getMember_name().toUpperCase().charAt(0));
				mav.setViewName("redirect:/main");
			}
		} else {
			mav.addObject("msg", "아이디/비밀번호를 확인해주세요.");
			mav.addObject("url", "member_login");
			mav.setViewName("user/member/message");
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
	public ModelAndView findPro(HttpServletRequest arg0, @RequestParam String member_email) {
		// 이메일 쏴주는 폼과 uuid 발송, 또한 그 해당 계정이 있는지 여부, 해당 계정 비번도 UUID로 바꿔줘야함.
		System.out.println(member_email);
		BBMemberDTO checkUser = null;
		if (member_email == null || member_email.trim().equals("")) {
			mav.addObject("msg", "잘못된 접근입니다.");
			mav.addObject("url", "member_find");
			mav.setViewName("user/member/message");
			return mav;
		}
		checkUser = memberMapper.getMember(member_email);
		try {
			if (checkUser.getMember_email() == null) {
			}
		} catch (NullPointerException ne) {
			mav.addObject("msg", "계정이 존재하지 않습니다.");
			mav.addObject("url", "member_find");
			mav.setViewName("user/member/message");
			return mav;
		}
		// 새로운 임시 비밀번호 생성
		String newPasswd = UUID.randomUUID().toString();
		// 임시 비밀번호 DTO에 담아서 DB에 전송 준비
		checkUser.setMember_passwd(newPasswd.substring(0, 19));

		System.out.println(checkUser.getMember_passwd());

		int res = memberMapper.changePasswd(checkUser);
		if (res < 0) {
			mav.addObject("msg", "DB 문제 발생 관리자에게 문의하세요. (blueballoonteam@gmail.com)");
			mav.addObject("url", "member_find");
			mav.setViewName("user/member/message");
			return mav;
		}
		// DB 값이 바꼈으면 이메일 전송
		sendMessage.findToEmail(checkUser.getMember_email(), checkUser.getMember_passwd());
		mav.addObject("msg", "메일이 발송 되었습니다. 새로운 비밀번호로 로그인 해주세요.");
		mav.addObject("url", "member_login");
		mav.setViewName("user/member/message");

		return mav;
	}

	// 멤버 수정 페이지 보여주기.
	@RequestMapping(value = "member_edit", method = RequestMethod.GET)
	public ModelAndView updateFormMember(HttpServletRequest arg0, HttpSession session, HttpServletResponse arg1)
			throws Exception {
		mav.clear();
		session = arg0.getSession();
		String member_email = (String) session.getAttribute("member_email");
		BBMemberDTO dto = memberMapper.getMember(member_email);
		String pwlen = "";
		for (int i = 0; i < dto.getMember_passwd().length(); i++) {
			pwlen += "●";
		}
		mav.addObject("pwlen", pwlen);
		mav.addObject("getMember", dto);
		mav.setViewName("user/member/edit");
		return mav;
	}

	// 멤버 정보 수정.
	@RequestMapping(value = "member_edit", method = RequestMethod.POST)
	public ModelAndView updateProMember(@ModelAttribute BBMemberDTO dto,
			@RequestParam("userpick") MultipartFile multipartFiles, BindingResult result, HttpSession session)
			throws Exception {
		mav.clear();
		BBMemberDTO editDTO = memberMapper.getMember(dto.getMember_email());
		int check = (int) multipartFiles.getSize();

		String file = null;
		String newFileName = multipartFiles.getOriginalFilename();
		try {
			if (editDTO.getMember_str_img() == null) {// 기존 파일 없으면 catch로 넘어감
			} else if (editDTO.getMember_str_img() != null) {// 기존 파일 있으면 실행
				if (check > 0) {// 새로운 파일 들어옴
					amazonUtil.deleteFile("bb_member", dto.getMember_str_img());
					file = amazonUtil.one_FileUpload("bb_member", multipartFiles);
					dto.setMember_org_img(newFileName);
					dto.setMember_str_img(file);
				} else if (check <= 0 || check == 0) {// 새로운 파일 없음
					dto.setMember_org_img(editDTO.getMember_org_img());
					dto.setMember_str_img(editDTO.getMember_str_img());
				}
			}
		} catch (NullPointerException ne) {
			if (check > 0) {// 파일 있을 경우
				file = amazonUtil.one_FileUpload("bb_member", multipartFiles);
				dto.setMember_org_img(newFileName);
				dto.setMember_str_img(file);
			} else if (check == 0 || check <= 0) {
				dto.setMember_org_img(null);
				dto.setMember_str_img(null);
			}
		}
		int res = 0;
		try {
			if (check > 0) {// 파일 있으면 기존 업데이트로
				res = memberMapper.editMember(dto);
			} else {// 파일 없으면 img 수정 빠진 업데이트로
				res = memberMapper.editMemberForNull(dto);
			}
		} catch (NullPointerException ne) {
			ne.printStackTrace();
			dto.setMember_org_img(null);
			dto.setMember_str_img(null);
			dto.setMember_email(null);
		}
		if (res > 0) {
			session.setAttribute("member_name", dto.getMember_name().toUpperCase().charAt(0));
			mav.setViewName("redirect:/member_profile");
		} else {
			mav.addObject("msg", "회원정보 수정 실패!");
			mav.addObject("url", "member_edit");
			mav.setViewName("user/member/message");
		}
		return mav;
	}

	@RequestMapping(value = "member_profile", method = RequestMethod.GET)
	public ModelAndView profile(HttpServletRequest arg0, HttpSession session) {
		session = arg0.getSession();
		if (session == null) {
			mav.addObject("msg", "로그인이 필요한 페이지입니다. 로그인해주세요.");
			mav.addObject("url", "member_login");
			mav.setViewName("user/member/message");
			return mav;
		}
		String member_email = (String) session.getAttribute("member_email");
		int member_num = (Integer) session.getAttribute("member_num");
		int count=0;
		List<BBLikeDTO> likeList = productMapper.likeList();
		for (int i = 0; i < likeList.size(); i++) {
			if (likeList.get(i).getMember_num() == member_num)
				count++;
		}
		mav.addObject("likeCount",count);
		System.out.println("member_email : " + member_email);
		BBMemberDTO dto = memberMapper.getMember(member_email);
		mav.addObject("myMember", dto);
		mav.setViewName("user/member/profile");
		return mav;
	}

	@RequestMapping(value = "member_likelist", method = RequestMethod.GET)
	public ModelAndView likelist(HttpServletRequest arg0) {
		int member_num = (Integer) arg0.getSession().getAttribute("member_num");
		String member_email = (String) arg0.getSession().getAttribute("member_email");
		char member_name = (Character) arg0.getSession().getAttribute("member_name");
		mav.addObject("member_name", member_name);

		List<BBLikeDTO> likeList = memberMapper.listLikeProducts(member_num);
		List<BBProductDTO> prodList = productMapper.listProd();

		// 상품 이미지 관련 해서 list에 추가
		for (BBLikeDTO tmp : likeList) {
			if (tmp.getProd_num() != 0) {
				BBProductDTO dto = memberMapper.getProduct(tmp.getProd_num());
				tmp.setProd_str_img(dto.getProd_str_img());
				tmp.setProd_pick(dto.getProd_pick());
			} else if (tmp.getPack_num() != 0) {
				BBPackageDTO packDTO = memberMapper.getPackage(tmp.getPack_num());
				tmp.setPack_str_img(packDTO.getPack_str_img());
			}
		}
		for (int i = 0; i < likeList.size(); i++) {
			if (likeList.get(i).getProd_num() == prodList.get(i).getProd_num()) {
				likeList.get(i).setProd_name(prodList.get(i).getProd_name());
			}
		}

		List<BBCategoryDTO> listCate = productMapper.listCate();
		mav.addObject("listCate", listCate);
		mav.addObject("likeList", likeList);
		mav.addObject("member_email", member_email);
		mav.addObject("member_num", member_num);
		mav.setViewName("user/member/likelist");
		return mav;
	}

	@RequestMapping(value = "member_logout", method = RequestMethod.GET)
	public String logout(HttpServletRequest arg0) {
		if (arg0.getSession() != null) {
			arg0.getSession().removeAttribute("member_num");
			arg0.getSession().removeAttribute("member_email");
		}
		return "redirect:/main";
	}

	@RequestMapping(value = "member_contact_us", method = RequestMethod.GET)
	public ModelAndView contact_us(HttpServletRequest arg0, HttpSession session) {
		mav.clear();
		try {
			int member_num = (Integer) arg0.getSession().getAttribute("member_num");
			String member_email = (String) arg0.getSession().getAttribute("member_email");
			mav.addObject("member_num", member_num);
			mav.addObject("member_email", member_email);
			mav.setViewName("user/member/contact_us");
		} catch (NullPointerException e) {
			mav.addObject("req", "close");
			mav.addObject("msg", "로그인이 필요한 페이지입니다. 로그인해주세요.");
			mav.addObject("url", "member_login");
			mav.setViewName("user/member/contact_us");
		}
		return mav;
	}

	@RequestMapping(value = "member_contact_us", method = RequestMethod.POST)
	public ModelAndView contact_us_pro(HttpSession session, @RequestParam String email_title,
			@RequestParam String email_content) {
		mav.clear();
		if (email_content == null || email_content.trim().equals("") || email_title == null
				|| email_title.trim().equals("")) {
			mav.addObject("msg", "잘못 된 접근입니다. 메인 페이지로 이동합니다.");
			mav.addObject("url", "main");
			mav.setViewName("user/member/message");
		}

		String clientEmail = (String) session.getAttribute("member_email");

		boolean res = sendMessage.sendToEmail(clientEmail, "blueballoonteam@gmail.com", email_title, email_content);
		// 채워야함
		if (res) {
			mav.addObject("msg", "전송 완료!");
			mav.addObject("req", "close"); // 팝업창 닫기
			mav.addObject("url", "main");
			mav.setViewName("user/member/contact_us");
		} else {
			mav.addObject("msg", "전송 실패! 관리자(070-8282-1004로 문의주세요!!");
			mav.addObject("req", "main");
			mav.setViewName("user/member/contact_us");
		}
		return mav;
	}

	@RequestMapping(value = "member_change_passwd", method = RequestMethod.POST)
	public ModelAndView changePasswd(HttpSession session, @RequestParam String newPasswd1,
			@RequestParam String newPasswd2) {

		if (newPasswd1 == null || newPasswd1.trim().equals("") || newPasswd2 == null || newPasswd2.trim().equals("")) {
			mav.addObject("msg", "잘못된 접근입니다. ");
			mav.addObject("url", "member_edit");
			mav.setViewName("user/member/message");
		}
		String clientEmail = (String) session.getAttribute("member_email");
		BBMemberDTO dto = memberMapper.getMember(clientEmail);
		int res = 0;
		if (newPasswd1.equals(newPasswd2)) {
			dto.setMember_passwd(newPasswd1);
			res = memberMapper.changePasswd(dto);
		}
		if (res > 0) {
			mav.addObject("msg", "비밀번호 변경 성공!");
			mav.addObject("req", "close"); // 팝업창 닫기
			mav.addObject("url", "member_edit");
			mav.setViewName("user/member/profile");
		} else {
			mav.addObject("msg", "비밀번호 변경 실패!");
			mav.addObject("url", "member_edit");
			mav.setViewName("user/member/message");
		}
		return mav;
	}
}

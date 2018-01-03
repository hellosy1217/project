package com.web.blueballoon.user.member;

import java.util.Date;
import java.util.List;
import java.util.UUID;
import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
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
	@Autowired
	private JavaMailSender mailSender;

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
			mav.addObject("msg", "아이디/비밀번호를 확인해주세요.");
			mav.addObject("url", "member_login");
			mav.setViewName("user/member/message");
		} else { // 로그인 성 공 
			// main.jsp로 이동
			if (dto.getMember_num() == 1) {
				mav.setViewName("redirect:/admin_index");
			} else {
				session = req.getSession();
				session.setAttribute("member_num", dto.getMember_num());
				session.setAttribute("member_email", dto.getMember_email());
				session.setAttribute("member_name", dto.getMember_name().toUpperCase().charAt(0));
				mav.setViewName("redirect:/main");
			}
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
		System.out.println("오니??");
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
		}catch (NullPointerException ne) {
			mav.addObject("msg", "계정이 존재하지 않습니다.");
			mav.addObject("url", "member_find");
			mav.setViewName("user/member/message");
			return mav;
		}
		
		String newPasswd = UUID.randomUUID().toString();
		checkUser.setMember_passwd(newPasswd.substring(0, 19));

		System.out.println(checkUser.getMember_passwd());

		int res = memberMapper.changePasswd(checkUser);
		if (res < 0) {
			mav.addObject("msg", "DB 문제 발생 관리자에게 문의하세요. (blueballoonteam@gmail.com)");
			mav.addObject("url", "member_find");
			mav.setViewName("user/member/message");
			return mav;
		}

		try {
			MimeMessage message = mailSender.createMimeMessage();
			MimeMessageHelper messageHelper = new MimeMessageHelper(message, true, "UTF-8");
			Date today = new Date();
			System.out.println(today);
			String setfrom = "blueballoonteam@gmail.com";
			String title = "BlueBalloon에서 고객님의 요청에 따른 메일 수신드립니다.(비번찾기 관련)";
			String content = "고객님의 요청으로 새로운 비밀번호를 전송해 드립니다. \n " + "새로운 비밀 번호 : " + checkUser.getMember_passwd()
					+ "\n 정상적으로 BlueBalloon 서비스를 이용하실 수 있습니다. \n 감사합니다. \n" + today + "Blue Balloon 드림";
			messageHelper.setFrom(setfrom); // 보내는사람 생략하거나 하면 정상작동을 안함
			messageHelper.setTo(member_email); // 받는사람 이메일
			messageHelper.setSubject(title); // 메일제목은 생략이 가능하다
			messageHelper.setText(content); // 메일 내용

			mailSender.send(message);

			mav.addObject("msg", "메일이 발송 되었습니다. 새로운 비밀번호로 로그인 해주세요.");
			mav.addObject("url", "member_login");
			mav.setViewName("user/member/message");

		} catch (Exception e) {
			System.out.println(e);
		}
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
		
		System.out.println("들어오는 값 찍기 phone : "+dto.getMember_phone());
		System.out.println("gender : "+dto.getMember_gender());
		System.out.println("email : "+dto.getMember_email());
		System.out.println("birth : "+dto.getMember_birth());
		
		BBMemberDTO editDTO = memberMapper.getMember(dto.getMember_email());
		int check = (int)multipartFiles.getSize();

		String file = null;
		String newFileName = multipartFiles.getOriginalFilename();
		try {
			if(editDTO.getMember_str_img() ==null) {//기존 파일 없으면 catch로 넘어감
			}else if(editDTO.getMember_str_img() != null) {//기존 파일 있으면 실행
				if(check > 0) {// 새로운 파일 들어옴
					amazonUtil.deleteFile("bb_member", dto.getMember_str_img());
					file = amazonUtil.one_FileUpload("bb_member", multipartFiles);
					dto.setMember_org_img(newFileName);
					dto.setMember_str_img(file);
				}else if(check <= 0 || check ==0) {//새로운 파일 없음
					dto.setMember_org_img(editDTO.getMember_org_img());
					dto.setMember_str_img(editDTO.getMember_str_img());
				}
			}
		}catch(NullPointerException ne) {
			if(check > 0) {//파일 있을 경우
				file = amazonUtil.one_FileUpload("bb_member", multipartFiles);
				dto.setMember_org_img(newFileName);
				dto.setMember_str_img(file);
			}else if(check == 0 || check <= 0) {
				dto.setMember_org_img(null);
				dto.setMember_str_img(null);
			}
		}
		
		int res = 0;
		try {
			if (check >0 ) {//파일 있으면 기존 업데이트로
				res = memberMapper.editMember(dto);
			} else {//파일 없으면 img 수정 빠진 업데이트로
				res = memberMapper.editMemberForNull(dto);
			}
		} catch (NullPointerException ne) {
			ne.printStackTrace();
			dto.setMember_org_img(null);
			dto.setMember_str_img(null);
			dto.setMember_email(null);
		}
		
		if (res > 0) {
			mav.addObject("msg", "회원정보 수정 성공!!");
		} else {
			mav.addObject("msg", "회원정보 수정 실패!!");
		}
		
		mav.addObject("url", "admin/member/edit");
		mav.setViewName("user/member/message");
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

		List<BBLikeDTO> likeList = memberMapper.listProducts(member_num);

		mav.addObject("member_num", member_num);
		mav.addObject("member_email", member_email);
		mav.setViewName("user/member/likelist");
		return mav;
	}

	@RequestMapping(value = "member_logout", method = RequestMethod.GET)
	public String logout(HttpServletRequest arg0, HttpSession session) {
		session = arg0.getSession();
		if (session != null) {
			arg0.getSession().removeAttribute("member_num");
			arg0.getSession().removeAttribute("member_email");
		}
		return "redirect:/main";
	}
}

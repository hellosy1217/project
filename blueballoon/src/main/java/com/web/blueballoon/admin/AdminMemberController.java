package com.web.blueballoon.admin;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.ServletRequestUtils;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;
import com.web.blueballoon.admin.service.AdminMapper;
import com.web.blueballoon.model.FileNameDTO;
import com.web.blueballoon.model.MemberDBBean;
import com.web.blueballoon.util.ControllerMessage;
import com.web.blueballoon.util.FileUtils;

@Controller
public class AdminMemberController {

	private ModelAndView mav = new ModelAndView();

	@Autowired
	private AdminMapper adminMapper;
	@Autowired
	private ControllerMessage cm;

	// ==============멤버 리스트 관련========================
	@RequestMapping(value = "travel_member_list")
	public ModelAndView list_Member() {
		List<MemberDBBean> list = adminMapper.listMember();
		mav.addObject("listMember", list);
		mav.setViewName("admin/travel_member_list");
		return mav;
	}

	// 멤버 삭제 (일정 시간이 지나야만 삭제 될 수 있도록 구현하기...)

	@RequestMapping(value = "/travel_member_delete", method = RequestMethod.GET)
	public String deleteFormMember() {
		return "admin/travel_member_deleteForm";
	}

	@RequestMapping(value = "/travel_member_delete", method = RequestMethod.POST)
	public ModelAndView memberDelete(HttpServletRequest arg0, @ModelAttribute MemberDBBean dto,
			BindingResult result)  throws Exception {
		HttpSession session = arg0.getSession();
		String realPasswd = adminMapper.getMember(dto.getMember_num()).getMember_passwd();
		ModelAndView mav = new ModelAndView();
		if (dto.getMember_passwd().equals(realPasswd)) {
			String member_str_img = adminMapper.getMember(dto.getMember_num()).getMember_str_img();
			String upPath = session.getServletContext().getRealPath("/resources/files");
			boolean isDelete = FileUtils.fileDelete(upPath, member_str_img);
			adminMapper.deleteMember(dto.getMember_num(), dto.getMember_passwd());
			mav.addObject("msg", "삭제성공 !!");
		} else {
			mav.addObject("msg", "삭제실패!!");
		}
		mav.addObject("url", "travel_member_list");
		mav.setViewName("admin/message");
		return mav;
	}

	@RequestMapping(value = "/member_passwd", method = RequestMethod.GET)
	public ModelAndView updateFormMember(HttpServletRequest arg0, HttpServletResponse arg1) throws Exception {
		int member_num = ServletRequestUtils.getIntParameter(arg0, "member_num");
		MemberDBBean dto = adminMapper.getMember(member_num);
		return new ModelAndView("admin/travel_member_editForm", "getMember", dto);
	}

	@RequestMapping(value = "/member_passwd", method = RequestMethod.POST)
	public ModelAndView updateMember(HttpServletRequest arg0, HttpServletResponse arg1) throws Exception {
		int member_num = ServletRequestUtils.getIntParameter(arg0, "member_num");
		String member_passwd = arg0.getParameter("member_passwd");
		String realPasswd = adminMapper.getMember(member_num).getMember_passwd();
		if (member_passwd.equals(realPasswd)) {
			MemberDBBean dto = adminMapper.getMember(member_num);
			return new ModelAndView("admin/travel_member_edit", "getMember", dto);
		} else {
			ModelAndView mav = new ModelAndView();
			mav.addObject("msg", "비밀번호가 틀렸습니다!");
			mav.addObject("url", "member_passwd?member_num=" + member_num);
			mav.setViewName("admin/message");
			return mav;
		}
	}

	// 멤버 정보 수정(고객 요청시에만)
	@RequestMapping(value = "/travel_member_edit", method = RequestMethod.POST)
	protected ModelAndView updateProBoard(HttpServletRequest arg0, @ModelAttribute MemberDBBean dto,
			BindingResult result) throws Exception {

		HttpSession session = arg0.getSession();
		String realPasswd = adminMapper.getMember(dto.getMember_num()).getMember_passwd();

		ModelAndView mav = new ModelAndView();
		if (dto.getMember_passwd().equals(realPasswd)) {
			String member_str_img = adminMapper.getMember(dto.getMember_num()).getMember_str_img();
			String upPath = session.getServletContext().getRealPath("/resources/files");
			boolean isDelete = FileUtils.fileDelete(upPath, member_str_img);

			FileNameDTO filedto = FileUtils.fileUpload(arg0);

			try {
				dto.setMember_org_img(filedto.getMember_org_img());
				dto.setMember_str_img(filedto.getMember_str_img());
			} catch (NullPointerException e) {
				dto.setMember_org_img(null);
				dto.setMember_str_img(null);
			}

			adminMapper.editMember(dto);
			mav.addObject("msg", "수정성공");
		} else {
			mav.addObject("msg", "수정실패");
		}
		mav.addObject("url", "travel_member_list");
		mav.setViewName("admin/message");
		return mav;
	}

}
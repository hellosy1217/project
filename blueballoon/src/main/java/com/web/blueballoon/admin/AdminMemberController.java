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
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import com.web.blueballoon.admin.service.AdminMapper;
import com.web.blueballoon.model.BBMemberDTO;
import com.web.blueballoon.util.AmazonFileUtils;
import com.web.blueballoon.util.ControllerMessage;

@Controller
public class AdminMemberController {

	private ModelAndView mav = new ModelAndView();

	@Autowired
	private AdminMapper adminMapper;
	@Autowired
	private ControllerMessage cm;
	@Autowired
	private AmazonFileUtils amazonUtil;

	// ==============멤버 리스트 관련========================
	@RequestMapping(value = "BB_member_list")
	public ModelAndView list_Member() {
		List<BBMemberDTO> list = adminMapper.listMember();
		mav.addObject("listMember", list);
		mav.setViewName("admin/member/BB_member_list");
		return mav;
	}

	// 멤버 삭제 (일정 시간이 지나야만 삭제 될 수 있도록 구현하기...)

	@RequestMapping(value = "/BB_member_delete", method = RequestMethod.GET)
	public String deleteFormMember() {
		return "admin/member/BB_member_deleteForm";
	}

	@RequestMapping(value = "/BB_member_delete", method = RequestMethod.POST)
	public ModelAndView memberDelete(HttpServletRequest arg0, @ModelAttribute BBMemberDTO dto, BindingResult result)
			throws Exception {
		HttpSession session = arg0.getSession();
		BBMemberDTO pastDTO = adminMapper.getMember(dto.getMember_num());
		String realPasswd = pastDTO.getMember_passwd();
		ModelAndView mav = new ModelAndView();
		if (dto.getMember_passwd().equals(realPasswd)) {
			if(pastDTO.getMember_str_img() != null) {
				boolean existFile = amazonUtil.existFile("bb_member", pastDTO.getMember_str_img());
				if(existFile) {
					amazonUtil.deleteFile("bb_member", pastDTO.getMember_str_img());
				}
			}
			adminMapper.deleteMember(dto.getMember_num(), dto.getMember_passwd());
			mav.addObject("msg", "삭제성공 !!");
		} else {
			mav.addObject("msg", "삭제실패!!");
		}
		mav.addObject("url", "BB_member_list");
		mav.setViewName("admin/message");
		return mav;
	}

	@RequestMapping(value = "/member_passwd", method = RequestMethod.GET)
	public ModelAndView updateFormMember(HttpServletRequest arg0, HttpServletResponse arg1) throws Exception {
		int member_num = ServletRequestUtils.getIntParameter(arg0, "member_num");
		BBMemberDTO dto = adminMapper.getMember(member_num);
		return new ModelAndView("admin/member/BB_member_editForm", "getMember", dto);
	}

	@RequestMapping(value = "/member_passwd", method = RequestMethod.POST)
	public ModelAndView updateMember(HttpServletRequest arg0, HttpServletResponse arg1) throws Exception {
		int member_num = ServletRequestUtils.getIntParameter(arg0, "member_num");
		String member_passwd = arg0.getParameter("member_passwd");
		String realPasswd = adminMapper.getMember(member_num).getMember_passwd();
		if (member_passwd.equals(realPasswd)) {
			BBMemberDTO dto = adminMapper.getMember(member_num);
			return new ModelAndView("admin/member/BB_member_edit", "getMember", dto);
		} else {
			ModelAndView mav = new ModelAndView();
			mav.addObject("msg", "비밀번호가 틀렸습니다!");
			mav.addObject("url", "member_passwd?member_num=" + member_num);
			mav.setViewName("admin/message");
			return mav;
		}
	}

	// 멤버 정보 수정(고객 요청시에만)
	@RequestMapping(value = "/BB_member_edit", method = RequestMethod.POST)
	public ModelAndView updateProBoard(HttpServletRequest arg0,
			@RequestParam("member_org_img") MultipartFile multipartFiles, @ModelAttribute BBMemberDTO dto,
			BindingResult result) {
		String realPasswd = adminMapper.getMember(dto.getMember_num()).getMember_passwd();
		String edit_img = multipartFiles.getOriginalFilename();
		if (dto.getMember_passwd().equals(realPasswd)) {
			String key = null;
			BBMemberDTO pastDTO = adminMapper.getMember(dto.getMember_num());
			String member_str_img =pastDTO.getMember_str_img();
			String member_org_img = pastDTO.getMember_org_img();
			if (member_str_img != null) {//1. 기존 이미지가 있을 때 (검색 O)
				if(edit_img !=null) {// -1. 새로운 파일 있을 때
					boolean existFile = amazonUtil.existFile("bb_member", member_str_img);
					if(existFile) {
						amazonUtil.deleteFile("bb_member", member_str_img);
					}else {
						System.err.println("기존 파일 존재하지 않음. DB확인 요망");
					}
					key = amazonUtil.one_FileUpload("bb_member", multipartFiles);
					dto.setMember_org_img(edit_img);
					dto.setMember_str_img(key);
				}else if(edit_img == null || edit_img.trim().equals("")) {// -2. 새로운 파일이 없을 때
					dto.setMember_org_img(member_org_img);
					dto.setMember_str_img(member_str_img);
				}
			} else if (member_str_img == null) {//2. 기존 이미지 없을 때. (검색X)
				if(edit_img != null) {// -1. 새로운 파일이 있을 때.
					key = amazonUtil.one_FileUpload("bb_member", multipartFiles);
					dto.setMember_org_img(edit_img);
					dto.setMember_str_img(key);	
				}else if(edit_img == null || edit_img.trim().equals("")) {//-2 새로운 파일이 없을 때.
					dto.setMember_org_img(member_org_img);
					dto.setMember_str_img(member_str_img);
				}
			}
			int res = 0;
			 try {
				 if(member_org_img == null || member_org_img.trim().equals("") 
					|| edit_img ==null || edit_img.trim().equals("")) {
					 res = adminMapper.editMemberForNull(dto);
				 }else {
					 res = adminMapper.editMember(dto);
				 }
			 }catch(NullPointerException ne) {
				 ne.printStackTrace();
				 dto.setMember_birth(null);
				 dto.setMember_phone(null);
				 dto.setMember_gender(null);
				 dto.setMember_birth(null);
				 dto.setMember_org_img(null);
				 dto.setMember_str_img(null);
			 }
			 
			if (res > 0) {
				mav.addObject("msg", "회원 정보 수정 성공");
			}else {
				mav.addObject("msg","회원 정보 수정 실패");
			}
		} else {
			mav.addObject("msg", "비밀번호 오류 , 수정실패");
		}
		mav.addObject("url", "BB_member_list");
		mav.setViewName("admin/message");
		return mav;
	}
}
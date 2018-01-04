package com.web.blueballoon.admin;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import com.web.blueballoon.admin.service.AdminMapper;
import com.web.blueballoon.model.BBPackageDTO;
import com.web.blueballoon.util.AmazonFileUtils;
import com.web.blueballoon.util.ControllerMessage;

@Controller
public class AdminPackageController {
	
	private ModelAndView mav = new ModelAndView();
	@Autowired
	private ControllerMessage cm;
	@Autowired
	private AdminMapper adminMapper;
	@Autowired
	private AmazonFileUtils amazon;
	
	@RequestMapping(value="BB_pack_list")
	public ModelAndView	viewPackaageList() {
		List<BBPackageDTO> list = adminMapper.listBBPackage();
		mav.addObject("packageList",list);
		mav.setViewName("admin/package/BB_pack_list"); return mav;
	}
	
	@RequestMapping(value="BB_pack_insert",  method=RequestMethod.GET)
	public String viewPackageInsert() {
		return "admin/package/BB_pack_insert";
	}
	
	@RequestMapping(value="BB_pack_insert",  method=RequestMethod.POST)
	public ModelAndView insertPackage(@ModelAttribute BBPackageDTO dto, BindingResult result, @RequestParam("pack_org_img") MultipartFile multipartFile) {
		if(dto.getPack_title()==null || dto.getPack_title().trim().equals("")) {
			mav.addObject("msg","잘못된 접근입니다. 패키지 등록 페이지로 이동합니다.");
			mav.addObject("url", "BB_pack_insert");
			mav.setViewName("admin/message"); return mav;
		}
		
		String filename = multipartFile.getOriginalFilename();
		
		if(filename ==null || filename.trim().equals("")) {
			dto.setPack_org_img(null);
		}else {
			String upload = amazon.one_FileUpload("bb_package", multipartFile);
			dto.setPack_org_img(filename);
			dto.setPack_str_img(upload);
		}
		int res = 0;
		try {
			res = adminMapper.insertBBPackage(dto);
		}catch (NullPointerException ne) {
			dto.setPack_email(null);
			dto.setPack_org_img(null);
			dto.setPack_str_img(null);
		}
		String[] msg = { "패키지 상품 등록 완료! 패키지 상품 목록 페이지로 이동합니다.", "패키지 상품 등록 실패! 패키지 상품 등록 페이지로 이동합니다." };
		String[] url = { "BB_pack_list", "BB_pack_insert" };
		return cm.resMassege(res, msg, url);
	}
	
	@RequestMapping(value="BB_pack_edit", method=RequestMethod.GET)
	public ModelAndView viewEditPackage(@RequestParam int pack_num) {
		BBPackageDTO dto = adminMapper.getBBPackageDTO(pack_num);
		//출발 횟수 계산해서 set 해주기
		String [] tmp = dto.getPack_start_date().split(",");
		for(String time : tmp) {//결과 확인
			System.out.println(time);
		}
		dto.setPack_times(tmp.length);
		
		mav.addObject("pack",dto);
		mav.setViewName("admin/package/BB_pack_edit");
		System.out.println("object 값 넘어감 !!!");
		return mav;
	}
	
	@RequestMapping(value="BB_pack_delete")
	public ModelAndView deletePackage(@RequestParam int pack_num) {
		BBPackageDTO dto = adminMapper.getBBPackageDTO(pack_num);
		if(dto.getPack_str_img() != null || !dto.getPack_str_img().trim().equals("")) {//기존 이미지 있는 경우
			boolean existFile = amazon.existFile("bb_package", dto.getPack_str_img());
			if(existFile) {
				amazon.deleteFile("package", dto.getPack_str_img());
				System.out.println("파일 삭제 완료");
			}
		}
		int res = adminMapper.deleteBBPackage(pack_num);
		String[] msg = {"패키지 상품 삭제 완료!", "패키지 상품 삭제 실패!"};
		String[] url = {"BB_pack_list","BB_pack_list"};
		return cm.resMassege(res, msg, url);
	}
	
}

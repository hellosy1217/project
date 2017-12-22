package com.web.blueballoon.admin;

import java.util.List;
import javax.servlet.http.HttpServletRequest;
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
import com.web.blueballoon.model.BBCategoryDTO;
import com.web.blueballoon.model.BBProductDTO;
import com.web.blueballoon.util.AmazonFileUtils;
import com.web.blueballoon.util.ControllerMessage;

@Controller
public class AdminProductController {

	@Autowired
	private AdminMapper adminMapper;
	@Autowired
	private ControllerMessage cm;
	@Autowired
	private AmazonFileUtils amazon;

	private ModelAndView mav = new ModelAndView();

	@RequestMapping(value = "admin_index")
	public String indexAdmin() {
		return "admin/admin_index";
	}

	@RequestMapping(value = "home")
	public String Home() {
		return "home";
	}

	// ==============<<<<여행 상품 관련>>>========================
	@RequestMapping(value = "BB_prod_insert", method = RequestMethod.GET)
	public ModelAndView viewBBProduct() {
		List<BBCategoryDTO> list = adminMapper.listBBCategoryDTO();
		mav.addObject("cateList", list);
		mav.setViewName("admin/product/BB_prod_insert");
		return mav;
	}

	// 여행 상품 등록
	@RequestMapping(value = "BB_prod_insert", method = RequestMethod.POST)
	public ModelAndView insertBBProduct(HttpServletRequest req,
			@RequestParam("prod_org_img") MultipartFile multipartFiles, @ModelAttribute BBProductDTO dto,
			BindingResult result) {
		if (dto.getProd_name() == null || dto.getProd_name().trim().equals("")) {
			mav.addObject("msg", "잘못된 접근입니다. 여행상품 등록으로 이동합니다.");
			mav.addObject("url", "BB_prod_insert");
			mav.setViewName("admin/message");
			return mav;
		}
		// 여행 상품 등록 파일 naming = bb_product+(prod_pick)
		String filename = multipartFiles.getOriginalFilename();
		System.out.println("filename : "+ filename);
		
		if (filename == null || filename.trim().equals("")) {
			// 사진을 올리지 않을 경우 거의 존재 하지 않음.
			dto.setProd_org_img("0");
		} else {
			// 아마존 업로드 이후 저장한 파일 이름 return 받아 저장해주기(str_file_name)
			String upload = amazon.one_FileUpload("bb_product" + dto.getProd_pick(), multipartFiles);
			dto.setProd_str_img(upload);
			dto.setProd_org_img(multipartFiles.getOriginalFilename());
		}
		// 그런 이후에 DB에 정보값 보내주기.
		int res = 0;
		try {
			res = adminMapper.insertBBProduct(dto);
		} catch (NullPointerException ne) { // not null 아닌 애들 값 안넣었을 때 에러처리
			dto.setProd_detail_address(null);
			dto.setProd_old_address(null);
			dto.setProd_email(null);
			dto.setProd_str_img(null);
		}

		String[] msg = { "여행상품 등록 완료! 여행상품 목록 페이지로 이동합니다.", "여행상품 등록 실패! 여행상품 등록 페이지로 이동합니다." };
		String[] url = { "BB_prod_list", "BB_prod_insert" };
		return cm.resMassege(res, msg, url);
	}

	// 여행 상품 삭제
	@RequestMapping(value = "BB_prod_delete")
	public ModelAndView deleteBBProduct(@RequestParam int prod_num) {
		BBProductDTO dto = adminMapper.getBBProduct(prod_num);

		boolean existFile = amazon.existFile("bb_product" + dto.getProd_pick(), dto.getProd_str_img());
		if (existFile) {
			amazon.deleteFile("bb_product" + dto.getProd_pick(), dto.getProd_str_img());
		}
		int res = adminMapper.deleteBBProduct(prod_num);
		String[] msg = { "여행상품 삭제 완료! 여행상품 목록 페이지로 이동합니다.", "여행상품 삭제 실패! 여행상품 목록 페이지로 이동합니다." };
		String[] url = { "BB_prod_list", "BB_prod_list" };
		return cm.resMassege(res, msg, url);
	}

	// 여행 상품 목록
	@RequestMapping(value = "BB_prod_list")
	public ModelAndView listBBProduct() {
		List<BBProductDTO> list = adminMapper.listBBProduct();
		mav.addObject("ProductList", list);
		mav.setViewName("admin/product/BB_prod_list");
		return mav;
	}

	// 여행 상품 수정 페이지 보여주기
	@RequestMapping(value = "BB_prod_edit", method = RequestMethod.GET)
	public ModelAndView viewBBProductEdit(@RequestParam int prod_num) {
		List<BBCategoryDTO> cateList = adminMapper.listBBCategoryDTO();
		BBProductDTO dto = adminMapper.getBBProduct(prod_num);
		mav.addObject("cateList", cateList);
		mav.addObject("getProduct", dto);
		mav.setViewName("admin/product/BB_prod_edit");
		return mav;
	}
	//여행 상품 수정 
	@RequestMapping(value = "BB_prod_edit", method = RequestMethod.POST)
	public ModelAndView BBProductEdit(@RequestParam("prod_org_img") MultipartFile mf, @ModelAttribute BBProductDTO dto,
			BindingResult result) {
		//비교를 위한 dto 값 불러오기.
		System.out.println(dto.getProd_org_img());
		System.out.println(dto.getProd_str_img());
		BBProductDTO editDTO = adminMapper.getBBProduct(dto.getProd_num());
		String prod_edit_img = mf.getOriginalFilename();
		System.out.println("prod_edit_img : "+prod_edit_img);
		
		String file = null;
		if(editDTO.getProd_str_img() != null) {//1. 기존 이지가 있을때 (검색 O)
			boolean existFile = amazon.existFile("bb_product"+editDTO.getProd_pick(),editDTO.getProd_str_img());
			if(existFile && prod_edit_img != null) {// -1. 새로운 파일이 있을 때.
				amazon.deleteFile("bb_product"+editDTO.getProd_pick(), editDTO.getProd_str_img());
				file = amazon.one_FileUpload("bb_product"+dto.getProd_pick(), mf);
				dto.setProd_org_img(prod_edit_img);
				dto.setProd_str_img(file);
				System.out.println("1-1 org / str : "+dto.getProd_org_img()+" / "+dto.getProd_str_img());
			}else if(existFile && prod_edit_img == null) {//-2. 새로운 파일 없을 때.
				dto.setProd_org_img(editDTO.getProd_org_img());
				dto.setProd_str_img(editDTO.getProd_str_img());
				System.out.println("1-2 org / str : "+dto.getProd_org_img()+" / "+dto.getProd_str_img());
			}
		}else if(editDTO.getProd_str_img() == null) {//2. 기존 이미지 없을 때 (검색 X) 그럴일 거의 없지만. 혹시라도.
			if(prod_edit_img != null) { // -1. 새로운 파일 있을 때.
				file = amazon.one_FileUpload("bb_product"+dto.getProd_pick(), mf);
				dto.setProd_org_img(prod_edit_img);
				dto.setProd_str_img(file);
				System.out.println("2-1 org / str : "+dto.getProd_org_img()+" / "+dto.getProd_str_img());
			}else if(prod_edit_img == null) { // -2. 새로운 파일 없을 때. 존재하면 안되지만 그럴 경우.
				dto.setProd_org_img(null);
				dto.setProd_str_img(null);
				System.out.println("2-2 org / str : "+dto.getProd_org_img()+" / "+dto.getProd_str_img());
			}
		}
		System.out.println("dto set property compeleted!!");
		System.out.println("prod_num : "+dto.getProd_num());
		System.out.println("prod_name : "+dto.getProd_name());
		System.out.println("prod_phone : "+dto.getProd_phone());
		System.out.println("prod_price : "+dto.getProd_price());
		System.out.println("prod_org_img :"+dto.getProd_org_img());
		System.out.println("prod_str_img : "+dto.getProd_str_img());
		System.out.println("prod_post_number : "+dto.getProd_post_number());
		System.out.println("prod_road_address : "+dto.getProd_road_address());
		System.out.println("prod_old_address : "+dto.getProd_old_address());
		System.out.println("prod_detail_address : "+dto.getProd_detail_address());
		System.out.println("prod_content : "+dto.getProd_content());
		System.out.println("prod_pick : "+dto.getProd_pick());
		
		int res = 0;
		try {
			res = adminMapper.editBBProduct(dto);
		} catch (NullPointerException ne) {
			ne.printStackTrace();
			dto.setProd_org_img(null);
			dto.setProd_str_img(null);
			dto.setProd_detail_address(null);
		}
		String[] msg = { "여행상품 수정 완료! 여행상품 목록 페이지로 이동합니다.", "여행상품 수정 실패! 여행상품 수정 페이지로 이동합니다." };
		String[] url = { "BB_prod_list", "BB_prod_edit?prod_num=" + dto.getProd_num() };
		return cm.resMassege(res, msg, url);
	}
}

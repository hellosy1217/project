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
		System.out.println("filename : " + filename);

		if (filename == null || filename.trim().equals("")) {
			// 사진을 올리지 않을 경우 거의 존재 하지 않음.
			dto.setProd_org_img(null);
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
			dto.setProd_org_img(null);
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

	// 여행 상품 수정
	@RequestMapping(value = "BB_prod_edit", method = RequestMethod.POST)
	public ModelAndView BBProductEdit(@RequestParam("prod_org_img") MultipartFile mf, @ModelAttribute BBProductDTO dto,
			BindingResult result) {
		
		boolean session = false; // 쿼리를 다르게 보내기 위한 구분.(이미지쿼리 손대지 X)
		// 비교를 위한 dto 값 불러오기.
		BBProductDTO editDTO = adminMapper.getBBProduct(dto.getProd_num());
		int check = (int) mf.getSize();
		System.out.println("먼저 찍어보자 !! File size : "+check);
		String file = null;
		if (editDTO.getProd_str_img() != null) {// 1. 기존 이지가 있을때 (검색 O)
			if (check > 0) {// -1. 새로운 파일이 있을 때.
				boolean existFile = amazon.existFile("bb_product" + editDTO.getProd_pick(), editDTO.getProd_str_img());
				if(existFile) {
					amazon.deleteFile("bb_product" + editDTO.getProd_pick(), editDTO.getProd_str_img());
				}else {
					System.err.println("기존 파일 존재하지 않음. DB확인 요망");
				}
				file = amazon.one_FileUpload("bb_product" + dto.getProd_pick(), mf);
				dto.setProd_org_img(mf.getOriginalFilename());
				dto.setProd_str_img(file);
				System.out.println("1-1. 기존 이미지 O, 새로운 이미지 O");
			} else if (check <= 0) {// -2. 새로운 파일 없을 때.
				dto.setProd_org_img(editDTO.getProd_org_img());
				dto.setProd_str_img(editDTO.getProd_str_img());
				System.out.println("1-2. 기존 이미지 O , 새로운 이미지 X");
				System.out.println("org_img :  "+dto.getProd_org_img());
				System.out.println("str_img : "+dto.getProd_str_img() );
				session = true;
			}
		} else if (editDTO.getProd_str_img() == null) {// 2. 기존 이미지 없을 때 (검색 X) 그럴일 거의 없지만. 혹시라도.
			if (check > 0) { // -1. 새로운 파일 있을 때.
				file = amazon.one_FileUpload("bb_product" + dto.getProd_pick(), mf);
				dto.setProd_org_img(mf.getOriginalFilename());
				dto.setProd_str_img(file);
				System.out.println("2-1. 접근. 기존 이미지 X, 새로운 이미지 O");
			} else if (check <= 0) { // -2. 새로운 파일 없을 때. 존재하면 안되지만 그럴 경우.
				dto.setProd_org_img(editDTO.getProd_org_img());
				dto.setProd_str_img(editDTO.getProd_str_img());
				System.out.println("2-2. 접근 . 기존 이미지 X, 새로운 이미지 X");
				session = true;
			}
		}
		int res = 0;
		try {
			if(session) {
				res = adminMapper.editBBProductForNull(dto);
			}else {
				res = adminMapper.editBBProduct(dto);
			}
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

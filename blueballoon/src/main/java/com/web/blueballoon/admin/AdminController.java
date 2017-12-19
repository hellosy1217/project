package com.web.blueballoon.admin;

import java.io.UnsupportedEncodingException;
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
import com.web.blueballoon.util.CategoryInput;
import com.web.blueballoon.util.ControllerMessage;

@Controller
public class AdminController {

	@Autowired
	private AdminMapper adminMapper;
	@Autowired
	private CategoryInput cateInput; //재 수정할 예정.
	private ModelAndView mav = new ModelAndView();
	@Autowired
	private ControllerMessage cm;
	@Autowired
	private AmazonFileUtils amazon;
	
	@RequestMapping(value="admin_index")
	public String indexAdmin() {
		return "admin/admin_index";
	}
	
	@RequestMapping(value="home")
	public String Home() {
		return "home";
	}
	
	//==============<<<여행 지역 카테고리 관련>>>======================== 
	@RequestMapping(value="BB_category_insert", method=RequestMethod.GET)
	public String viewBBCategoryDTO() {
		return "admin/category/BB_category_insert";
	}
	// 여행 지역 카테고리 등록
	@RequestMapping(value="BB_category_insert",method=RequestMethod.POST)
	public ModelAndView insertCategory(HttpServletRequest req, @ModelAttribute BBCategoryDTO dto) throws UnsupportedEncodingException {
		req.setCharacterEncoding("UTF-8");
		if(dto.getCate_state()==null || dto.getCate_state().trim().equals("") || dto.getCate_city()==null || dto.getCate_city().trim().equals("")) {
			return new ModelAndView("redirect:BB_category_insert");
		}
		// 도, 시가 추가될 시 util에 추가!
		String values = cateInput.configState(Integer.parseInt(dto.getCate_state()));
		dto.setCate_state(values);
		int res = adminMapper.insertBBCategoryDTO(dto);
		String [] msg = {"여행 카테고리 등록 완료! 여행 카테고리 목록 페이지로 이동합니다.","여행상품 등록 실패! 여행상품 등록 페이지로 이동합니다."};
		String [] url = {"BB_category_list","BB_category_insert"};
		return cm.resMassege(res, msg, url);
	}
	//여행 지역 카테고리 삭제
	@RequestMapping(value="BB_category_delete")
	public ModelAndView veiwDeleteBBCategoryDTO(@RequestParam String cate_num) {
		int res = adminMapper.deleteBBCategoryDTO(Integer.parseInt(cate_num));
		String [] msg = {"여행 카테고리 삭제 완료! 여행 카테고리 목록 페이지로 이동합니다.","여행상품 삭제 실패! 여행상품 목록 페이지로 이동합니다."};
		String [] url = {"BB_category_list","BB_category_list"};
		return cm.resMassege(res, msg, url);
	}
	//여행 지역 카테고리 수정
	@RequestMapping(value="BB_category_edit", method=RequestMethod.GET)
	public ModelAndView viewEditBBCategoryDTO(@RequestParam String cate_num) {
		System.out.println("cate_num : " + cate_num);
		BBCategoryDTO dto = adminMapper.getBBCategoryDTO(Integer.parseInt(cate_num));
		System.out.println("cate_state : "+ dto.getCate_state());
		int state = cateInput.decodeState(dto.getCate_state());
		dto.setCate_state(Integer.toString(state));
		System.out.println("state : " + state);
		if(state == -1) {
			return new ModelAndView("redirect:BB_category_list");
		}
		mav.addObject("getCategory",dto);
		mav.setViewName("admin/category/BB_category_edit"); return mav;
	}
	@RequestMapping(value="BB_category_edit", method=RequestMethod.POST)
	public ModelAndView editBBCategoryDTO(@ModelAttribute BBCategoryDTO dto, BindingResult result) {
		if(result.hasErrors()) {
		//고민중	
		}
		String value = cateInput.configState(Integer.parseInt(dto.getCate_state()));
		dto.setCate_state(value);
		int res = adminMapper.editBBCategoryDTO(dto);
		String [] msg = {"여행 카테고리 수정 완료! 여행 카테고리 목록 페이지로 이동합니다.","여행상품 수정 실패! 여행상품 수정 페이지로 이동합니다."};
		String [] url = {"BB_category_list","BB_category_edit?BB_cate_num="+dto.getCate_num()};
		return cm.resMassege(res, msg, url);
	}
	//여행지역 카테고리 목록
	@RequestMapping(value="BB_category_list")
	public ModelAndView listBBCategoryDTO() {
		List<BBCategoryDTO> list = adminMapper.listBBCategoryDTO();
		mav.addObject("BBCategory",list);
		mav.setViewName("admin/category/BB_category_list"); return mav;
	}
	
	//==============<<<<여행 상품  관련>>>======================== 
	@RequestMapping(value="BB_prod_insert", method=RequestMethod.GET)
	public ModelAndView viewBBProduct() {
		List<BBCategoryDTO> list = adminMapper.listBBCategoryDTO();
		mav.addObject("cateList", list);
		mav.setViewName("admin/product/BB_prod_insert"); return mav;
	}
	//여행 상품 등록 
		@RequestMapping(value="BB_prod_insert", method=RequestMethod.POST)
		public ModelAndView insertBBProduct(HttpServletRequest req,@RequestParam("prod_org_img") MultipartFile multipartFiles, @ModelAttribute BBProductDTO dto, BindingResult result) {
			if(dto.getProd_name()==null || dto.getProd_name().trim().equals("")) {
				mav.addObject("msg","잘못된 접근입니다. 여행상품 등록으로 이동합니다.");
				mav.addObject("url","BB_prod_insert");
				mav.setViewName("admin/message"); return mav;
			}
			//여행 상품 등록 파일 naming = bb_product+(prod_pick)
			String filename = multipartFiles.getOriginalFilename();
			if(filename == null || filename.trim().equals("")) {
				//사진을 올리지 않을 경우 거의 존재 하지 않음.
				dto.setProd_org_img("0");
			}else {
				//아마존 업로드 이후 저장한 파일 이름 return 받아 저장해주기(str_file_name) 
				String upload = amazon.one_FileUpload("bb_product"+dto.getProd_pick(), multipartFiles);
				dto.setProd_str_img(upload);
				dto.setProd_org_img(multipartFiles.getOriginalFilename());
			}
			//그런 이후에 DB에 정보값 보내주기.
			int res = adminMapper.insertBBProduct(dto);
			
			String [] msg = {"여행상품 등록 완료! 여행상품 목록 페이지로 이동합니다.","여행상품 등록 실패! 여행상품 등록 페이지로 이동합니다."};
			String [] url = {"BB_prod_list","BB_prod_insert"};
			return cm.resMassege(res, msg, url);
		}
	//여행 상품 삭제
	@RequestMapping(value="BB_prod_delete")
	public ModelAndView deleteBBProduct(@RequestParam int prod_num) {
		int res = adminMapper.deleteBBProduct(prod_num);
		String [] msg = {"여행상품 삭제 완료! 여행상품 목록 페이지로 이동합니다.","여행상품 삭제 실패! 여행상품 목록 페이지로 이동합니다."};
		String [] url = {"BB_prod_list","BB_prod_list"};
		return cm.resMassege(res, msg, url);
	}
	//여행 상품 목록
	@RequestMapping(value="BB_prod_list")
	public ModelAndView listBBProduct() {
		List<BBProductDTO> list = adminMapper.listBBProduct();
		mav.addObject("ProductList",list);
		mav.setViewName("admin/product/BB_prod_list");
		return mav;
	}
	//여행 상품 수정
	@RequestMapping(value="BB_prod_edit", method=RequestMethod.GET)
	public ModelAndView viewBBProductEdit(@RequestParam int prod_num) {
		BBProductDTO dto = adminMapper.getBBProduct(prod_num);
		mav.addObject("getProduct",dto);
		mav.setViewName("admin/product/BB_prod_edit");
		return mav;
	}
	@RequestMapping(value="BB_prod_edit", method=RequestMethod.POST)
	public ModelAndView BBProductEdit(@ModelAttribute BBProductDTO dto, BindingResult result) {
		if(result.hasErrors()) {
			//고민중...
		}
		int res = adminMapper.editBBProduct(dto);
		String [] msg = {"여행상품 수정 완료! 여행상품 목록 페이지로 이동합니다.","여행상품 수정 실패! 여행상품 수정 페이지로 이동합니다."};
		String [] url = {"BB_prod_list","BB_prod_edit?prod_num="+dto.getProd_num()};
		return cm.resMassege(res, msg, url);
	}
	
}

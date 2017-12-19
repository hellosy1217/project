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
import org.springframework.web.servlet.ModelAndView;
import com.web.blueballoon.admin.service.AdminMapper;
import com.web.blueballoon.model.BBCategoryDTO;
import com.web.blueballoon.util.CategoryInput;
import com.web.blueballoon.util.ControllerMessage;

@Controller
public class AdminCategoryController {
	@Autowired
	private AdminMapper adminMapper;
	@Autowired
	private CategoryInput cateInput; //재 수정할 예정.
	@Autowired
	private ControllerMessage cm;
	private ModelAndView mav = new ModelAndView();
	
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
}

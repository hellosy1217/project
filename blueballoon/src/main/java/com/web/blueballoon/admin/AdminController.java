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
import com.web.blueballoon.model.TravelCategory;
import com.web.blueballoon.model.TravelProductDTO;
import com.web.blueballoon.service.AdminMapper;
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
	
	@RequestMapping(value="admin_index")
	public String indexAdmin() {
		return "admin/admin_index";
	}
	
	//==============<<<여행 지역 카테고리 관련>>>======================== 
	@RequestMapping(value="travel_category_insert", method=RequestMethod.GET)
	public String viewTravelCategory() {
		return "admin/travel_category_insert";
	}
	// 여행 지역 카테고리 등록
	@RequestMapping(value="travel_category_insert",method=RequestMethod.POST)
	public ModelAndView insertCategory(HttpServletRequest req, @RequestParam String state, @RequestParam String city) throws UnsupportedEncodingException {
		if(state==null || state.trim().equals("") || city==null || city.trim().equals("")) {
			return new ModelAndView("redirect:travel_category_insert");
		}
		// 도, 시가 추가될 시 util에 추가!
		String [] values = cateInput.configCategory(Integer.parseInt(state), city);
		TravelCategory dto = new TravelCategory();
		dto.setCate_state(values[0]);
		dto.setCate_city(values[1]);
		int res = adminMapper.insertTravelCategory(dto);
		String [] msg = {"여행 카테고리 등록 완료! 여행 카테고리 목록 페이지로 이동합니다.","여행상품 등록 실패! 여행상품 등록 페이지로 이동합니다."};
		String [] url = {"travel_category_list","travel_category_insert"};
		return cm.resMassege(res, msg, url);
	}
	//여행 지역 카테고리 삭제
	@RequestMapping(value="travel_category_delete")
	public ModelAndView veiwDeleteTravelCategory(@RequestParam String cate_num) {
		int res = adminMapper.deleteTravelCategory(Integer.parseInt(cate_num));
		String [] msg = {"여행 카테고리 삭제 완료! 여행 카테고리 목록 페이지로 이동합니다.","여행상품 삭제 실패! 여행상품 목록 페이지로 이동합니다."};
		String [] url = {"travel_category_list","travel_category_list"};
		return cm.resMassege(res, msg, url);
	}
	//여행 지역 카테고리 수정
	@RequestMapping(value="travel_category_edit", method=RequestMethod.GET)
	public ModelAndView viewEditTravelCategory(@RequestParam String cate_num) {
		TravelCategory dto = adminMapper.getTravelCategory(Integer.parseInt(cate_num));
		int state = cateInput.decodeCategory(dto.getCate_state());
		dto.setCate_state(Integer.toString(state));
		if(state == -1) {
			return new ModelAndView("redirect:travel_category_list");
		}
		mav.addObject("getCategory",dto);
		mav.setViewName("admin/travel_category_edit"); return mav;
	}
	@RequestMapping(value="travel_category_edit", method=RequestMethod.POST)
	public ModelAndView editTravelCategory(@ModelAttribute TravelCategory dto, BindingResult result) {
		if(result.hasErrors()) {
		//고민중	
		}
		String [] values = cateInput.configCategory(Integer.parseInt(dto.getCate_state()),dto.getCate_city());
		dto.setCate_state(values[0]);
		dto.setCate_city(values[1]);
		int res = adminMapper.editTravelCategory(dto);
		String [] msg = {"여행 카테고리 수정 완료! 여행 카테고리 목록 페이지로 이동합니다.","여행상품 수정 실패! 여행상품 수정 페이지로 이동합니다."};
		String [] url = {"travel_category_list","travel_category_edit?travel_cate_num="+dto.getCate_num()};
		return cm.resMassege(res, msg, url);
	}
	//여행지역 카테고리 목록
	@RequestMapping(value="travel_category_list")
	public ModelAndView listTravelCategory() {
		List<TravelCategory> list = adminMapper.listTravelCategory();
		mav.addObject("travelCategory",list);
		mav.setViewName("admin/travel_category_list"); return mav;
	}
	
	//==============<<<<여행 상품  관련>>>======================== 
	@RequestMapping(value="travel_prod_insert", method=RequestMethod.GET)
	public String viewTravelProduct() {
		return "admin/travel_product";
	}
	//여행 상품 등록 
	@RequestMapping(value="travel_prod_insert", method=RequestMethod.POST)
	public ModelAndView insertTravelProduct(TravelProductDTO dto) {
		if(dto.getProd_name()==null || dto.getProd_name().trim().equals("")) {
			mav.addObject("msg","잘못된 접근입니다. 여행상품 등록으로 이동합니다.");
			mav.addObject("url","travel_prod_insert");
			mav.setViewName("message"); return mav;
		}
		int res = adminMapper.insertTravelProduct(dto);
		String [] msg = {"여행상품 등록 완료! 여행상품 목록 페이지로 이동합니다.","여행상품 등록 실패! 여행상품 등록 페이지로 이동합니다."};
		String [] url = {"travel_prod_list","travel_prod_insert"};
		return cm.resMassege(res, msg, url);
	}
	//여행 상품 삭제
	@RequestMapping(value="travel_prod_delete")
	public ModelAndView deleteTravelProduct(@RequestParam int prod_num) {
		int res = adminMapper.deleteTravelProduct(prod_num);
		String [] msg = {"여행상품 삭제 완료! 여행상품 목록 페이지로 이동합니다.","여행상품 삭제 실패! 여행상품 목록 페이지로 이동합니다."};
		String [] url = {"travel_prod_list","travel_prod_list"};
		return cm.resMassege(res, msg, url);
	}
	//여행 상품 목록
	@RequestMapping(value="travel_prod_list")
	public ModelAndView listTravelproduct() {
		List<TravelProductDTO> list = adminMapper.listTravelProduct();
		mav.addObject("ProductList",list);
		mav.setViewName("admin/travel_prod_list");
		return mav;
	}
	//여행 상품 수정
	@RequestMapping(value="travel_prod_edit", method=RequestMethod.GET)
	public ModelAndView viewTravelProductEdit(@RequestParam int prod_num) {
		TravelProductDTO dto = adminMapper.getTravelProduct(prod_num);
		mav.addObject("getProduct",dto);
		mav.setViewName("admin/travel_prod_edit");
		return mav;
	}
	@RequestMapping(value="travel_prod_edit", method=RequestMethod.POST)
	public ModelAndView TravelProductEdit(@ModelAttribute TravelProductDTO dto, BindingResult result) {
		if(result.hasErrors()) {
			//고민중...
		}
		int res = adminMapper.editTravelProduct(dto);
		String [] msg = {"여행상품 수정 완료! 여행상품 목록 페이지로 이동합니다.","여행상품 수정 실패! 여행상품 수정 페이지로 이동합니다."};
		String [] url = {"travel_prod_list","travel_prod_edit?prod_num="+dto.getProd_num()};
		return cm.resMassege(res, msg, url);
	}
}

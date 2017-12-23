package com.web.blueballoon.admin;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import com.web.blueballoon.admin.service.AdminMapper;
import com.web.blueballoon.model.BBProductDTO;
import com.web.blueballoon.util.AmazonFileUtils;
import com.web.blueballoon.util.ControllerMessage;

@Controller
public class AdminRoomController {
	
	@Autowired
	private AdminMapper adminMapper;
	@Autowired
	private ControllerMessage cm;
	@Autowired
	private AmazonFileUtils amazon;
	
	private ModelAndView mav = new ModelAndView();
	
	@RequestMapping(value="BB_lodging_list")
	public ModelAndView veiwRoomList() {
		List<BBProductDTO> productList = adminMapper.listBBProductForRoom();
		mav.addObject("productList", productList);
		mav.setViewName("admin/room/BB_lodging_list");
		return mav;
	}
	
	@RequestMapping(value="BB_lodging_content")
	public ModelAndView contentLodging(@RequestParam String prod_num) {
		if(prod_num == null || prod_num.trim().equals("")) {
			mav.addObject("msg","잘못된 접근입니다. 숙소 예약 목록 페이지로 이동합니다. ");
			mav.addObject("url","BB_lodging_list");
			mav.setViewName("admin/message"); return mav;
		}
		BBProductDTO dto = adminMapper.getBBProduct(Integer.parseInt(prod_num));
		mav.addObject("getProduct",dto);
		mav.setViewName("admin/room/BB_lodging_content"); return mav;
	}
	
	@RequestMapping(value="BB_room_insert", method=RequestMethod.GET)
	public String view_insertBBRoom() {
		return "admin/room/BB_room_insert";
	}
}


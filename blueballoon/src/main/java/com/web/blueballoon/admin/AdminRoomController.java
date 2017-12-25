package com.web.blueballoon.admin;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import com.web.blueballoon.admin.service.AdminMapper;
import com.web.blueballoon.model.BBProductDTO;
import com.web.blueballoon.model.BBRoomDTO;
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
		List<BBRoomDTO> list = adminMapper.listBBRoom(Integer.parseInt(prod_num));
		mav.addObject("getProduct",dto);
		mav.addObject("roomList",list);
		mav.setViewName("admin/room/BB_lodging_content"); return mav;
	}
	
	@RequestMapping(value="BB_room_insert", method=RequestMethod.GET)
	public ModelAndView view_insertBBRoom(@RequestParam int prod_num) {
		mav.addObject("prod_num", prod_num);
		mav.setViewName("admin/room/BB_room_insert");
		return mav;
	}
	
	@RequestMapping(value="BB_room_insert", method=RequestMethod.POST)
	public ModelAndView insertBBRoom(@ModelAttribute BBRoomDTO dto) {
		if(dto.getRoom_name() ==null || dto.getRoom_name().trim().equals("")) {
			mav.addObject("msg","잘못된 접근입니다. 방 등록 페이지로 이동합니다.");
			mav.addObject("url","BB_room_insert");
			mav.setViewName("admin/message"); return mav;
		}
		System.out.println("prod_num : "+dto.getProd_num());
		int res = 0;
		try {
			res = adminMapper.insertBBRoom(dto);
		}catch(NullPointerException ne) {
			ne.printStackTrace();
		}
		System.out.println("prod_num : "+dto.getProd_num());
		String [] msg = {"룸 등록 성공 완료! 목록 페이지로 이동합니다!", "룸 등록 성공 실패! 등록 페이지로 이동합니다."};
		String [] url = {"BB_lodging_content?prod_num="+dto.getProd_num(),"BB_room_insert"};
		return cm.resMassege(res, msg, url);
	}
	
	@RequestMapping(value ="BB_room_delete")
	public ModelAndView deleteBBRoom(@RequestParam int room_num, @RequestParam int prod_num) {
		if(room_num == 0) {
			mav.addObject("msg","잘못된 접근입니다. 숙소 리스트 페이지로 이동합니다.");
			mav.addObject("url","BB_room_list?prod_num="+prod_num);
			mav.setViewName("admin/message"); return mav;
		}
		int res = 0;
		try { 
			res = adminMapper.deleteBBRoom(room_num);
		}catch (NullPointerException e) {
			e.printStackTrace();
		}
		String [] msg = {"룸 삭제 성공 완료! 목록 페이지로 이동합니다!", "룸 등록 성공 실패! 등록 페이지로 이동합니다."};
		String [] url = {"BB_room_list?prod_num="+prod_num,"BB_room_list?prod_num="+prod_num};
		return cm.resMassege(res, msg, url);
	}
}


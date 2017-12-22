package com.web.blueballoon.admin;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
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
	
	@RequestMapping(value="BB_room_list")
	public ModelAndView veiwRoomList() {
		List<BBProductDTO> productList = adminMapper.listBBProductForRoom();
		mav.addObject("productList", productList);
		mav.setViewName("admin/room/BB_room_list");
		return mav;
	}
	
	@RequestMapping(value="BB_room_insert", method=RequestMethod.GET)
	public String view_insertBBRoom() {
		return "admin/room/BB_room_insert";
	}
}


package com.web.blueballoon.user.product;

import java.util.ArrayList;
import java.util.Collections;
import java.util.List;
import java.util.StringTokenizer;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.ServletRequestUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.web.blueballoon.model.BBBookingRoomDTO;
import com.web.blueballoon.model.BBCategoryDTO;
import com.web.blueballoon.model.BBRoomDTO;
import com.web.blueballoon.user.service.ProductMapper;

@Controller
public class ProductController {

	@Autowired
	private ProductMapper ProductMapper;

	private ModelAndView mav = new ModelAndView();

	@RequestMapping(value = "product_list", method = RequestMethod.GET)
	public ModelAndView list(HttpServletRequest arg0, HttpServletResponse arg1) throws Exception {

		// 총 페이지 수
		int pageNum = ProductMapper.countList();
		if (pageNum % 9 != 0) {
			pageNum = pageNum / 9 + 1;
		}
		mav.addObject("pageNum", pageNum);
		System.out.println("pageNum" + pageNum);

		// 현재 페이지 번호
		int currentPage;
		try {
			currentPage = ServletRequestUtils.getIntParameter(arg0, "currentPage");
		} catch (NullPointerException e) {
			currentPage = 1;
		}
		mav.addObject("currentPage", currentPage);
		System.out.println("current" + currentPage);

		// 시작 페이지 번호
		int startPage = 1;
		if (currentPage > 9) {
			if (currentPage % 10 != 0)
				startPage = currentPage - (currentPage % 10);
			else
				startPage = currentPage;
		}
		mav.addObject("startPage", startPage);
		System.out.println("start" + startPage);

		// 페이지 끝 번호
		int endPage;
		if (startPage != 1) {
			endPage = startPage + 9;
			if (endPage > pageNum) {
				endPage = pageNum;
			}
		} else {
			endPage = 9;
		}
		mav.addObject("endPage", endPage);
		System.out.println("end" + endPage);

		// 카테고리 목록
		List<BBCategoryDTO> list = ProductMapper.listCate();
		mav.addObject("listCate", list);

		mav.setViewName("user/product/list");

		return mav;
	}

	@RequestMapping(value = "product_content", method = RequestMethod.GET)
	public String content() {
		return "user/product/content";
	}

	@RequestMapping(value = "product_booking", method = RequestMethod.GET)
	public ModelAndView booking(HttpServletRequest arg0, HttpServletResponse arg1) throws Exception {
		try {
			int prod_num = ServletRequestUtils.getIntParameter(arg0, "prod_num");

			// 숙소 내 모든 방 목록
			List<BBRoomDTO> listRoom = ProductMapper.listRoom(prod_num);
			mav.addObject("listRoom", listRoom);

			// 숙소 내 예약된 방 목록
			List<BBBookingRoomDTO> listBookingRoom = ProductMapper.listBookingRoom(prod_num);
			mav.addObject("listBookingRoom", listBookingRoom);

			// 최소 인원, 최대 인원
			List<Integer> min_people = new ArrayList<Integer>();
			List<Integer> max_people = new ArrayList<Integer>();

			for (int i = 0; i < listRoom.size(); i++) {
				StringTokenizer str = new StringTokenizer(listRoom.get(i).getRoom_person(), "-");
				min_people.add(Integer.parseInt(str.nextToken()));
				max_people.add(Integer.parseInt(str.nextToken()));
			}
			mav.addObject("min_person", Collections.min(min_people));
			mav.addObject("max_person", Collections.max(max_people));

			mav.setViewName("user/product/booking");
		} catch (NullPointerException e) {
			// 나중에 오류 메세지로 처리

		}
		return mav;
	}
}

package com.web.blueballoon.user.product;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Collections;
import java.util.Comparator;
import java.util.Date;
import java.util.List;
import java.util.StringTokenizer;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.ServletRequestUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.web.blueballoon.HomeController;
import com.web.blueballoon.model.BBBookRoomDTO;
import com.web.blueballoon.model.BBCategoryDTO;
import com.web.blueballoon.model.BBLikeDTO;
import com.web.blueballoon.model.BBMemberDTO;
import com.web.blueballoon.model.BBProductDTO;
import com.web.blueballoon.model.BBRoomDTO;
import com.web.blueballoon.model.BookDateDTO;
import com.web.blueballoon.user.service.ProductMapper;

@Controller
public class ProductController {

	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);

	@Autowired
	private ProductMapper ProductMapper;

	private ModelAndView mav = new ModelAndView();

	@RequestMapping(value = "product_list", method = RequestMethod.GET)
	public ModelAndView list(HttpServletRequest arg0, HttpServletResponse arg1) throws Exception {
		int member_num;
		String member_email;
		char member_name;
		try {
			member_num = (Integer) arg0.getSession().getAttribute("member_num");
			member_email = (String) arg0.getSession().getAttribute("member_email");
			member_name = (Character) arg0.getSession().getAttribute("member_name");

			mav.addObject("member_num", member_num);
			mav.addObject("member_email", member_email);
			mav.addObject("member_name", member_name);
		} catch (NullPointerException e) {
			member_num = 0;
			member_email = null;
		}

		// 총 페이지 수
		int pageNum = ProductMapper.countList();
		if (pageNum % 9 != 0) {
			pageNum = pageNum / 9 + 1;
		}
		mav.addObject("pageNum", pageNum);

		// 현재 페이지 번호
		int currentPage;
		try {
			currentPage = ServletRequestUtils.getIntParameter(arg0, "currentPage");
		} catch (NullPointerException e) {
			currentPage = 1;
		}
		mav.addObject("currentPage", currentPage);

		// 시작 페이지 번호
		int startPage = 1;
		if (currentPage > 9) {
			if (currentPage % 10 != 0)
				startPage = currentPage - (currentPage % 10);
			else
				startPage = currentPage;
		}
		mav.addObject("startPage", startPage);

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

		// 카테고리 목록
		List<BBCategoryDTO> listCate = ProductMapper.listCate();
		mav.addObject("listCate", listCate);

		// 카테고리 목록
		List<BBProductDTO> listProd = ProductMapper.listProd();
		mav.addObject("listProd", listProd);

		mav.setViewName("user/product/list");

		return mav;
	}

	@RequestMapping(value = "product_content", method = RequestMethod.GET)
	public ModelAndView content(HttpServletRequest arg0, HttpServletResponse arg1) throws Exception {

		int prod_num = ServletRequestUtils.getIntParameter(arg0, "prod_num");
		BBProductDTO dto = ProductMapper.getProd(prod_num);
		int likeCount = ProductMapper.likeCount(prod_num);
		mav.addObject("likeCount", likeCount);
		try {
			int member_num = (Integer) arg0.getSession().getAttribute("member_num");
			String member_email = (String) arg0.getSession().getAttribute("member_email");
			char member_name = (Character) arg0.getSession().getAttribute("member_name");

			mav.addObject("member_num", member_num);
			mav.addObject("member_email", member_email);
			mav.addObject("member_name", member_name);

			BBLikeDTO likedto = new BBLikeDTO();
			likedto.setProd_num(prod_num);
			likedto.setMember_num(member_num);
			try {
				int result = ProductMapper.like(likedto);
				mav.addObject("like", "Y");
			} catch (NullPointerException e1) {
				mav.addObject("like", "N");
			}
		} catch (NullPointerException e2) {
			mav.addObject("like", "N");
		}
		mav.addObject("getProd", dto);
		mav.setViewName("user/product/content");
		return mav;
	}

	// 좋아요 기능
	@RequestMapping(value = "product_like", method = RequestMethod.GET)
	public ModelAndView like(HttpServletRequest arg0, HttpServletResponse arg1, HttpSession session) throws Exception {
		int prod_num = ServletRequestUtils.getIntParameter(arg0, "prod_num");
		mav.addObject("prod_num", prod_num);
		try {
			int member_num = (Integer) arg0.getSession().getAttribute("member_num");
			System.out.println("member_num = " + member_num);
			BBLikeDTO dto = new BBLikeDTO();
			dto.setProd_num(prod_num);
			dto.setMember_num(member_num);
			try {
				int result = ProductMapper.like(dto);
				mav.addObject("msg", "이미 좋아요를 눌렀습니다.");
			} catch (NullPointerException e1) {
				ProductMapper.insertLike(dto);
				mav.setViewName("product_content");
				return mav;
			}
			mav.addObject("url", "product_content");
		} catch (NullPointerException e) {
			mav.addObject("msg", "로그인을 해주세요..");
			mav.addObject("url", "member_login");
		}
		mav.setViewName("/message");
		return mav;
	}

	@RequestMapping(value = "product_booking", method = RequestMethod.GET)
	public ModelAndView booking(HttpServletRequest arg0, HttpServletResponse arg1) throws Exception {
		try {
			int prod_num = ServletRequestUtils.getIntParameter(arg0, "prod_num");
			mav.addObject("prod_num", prod_num);

			// 숙소 내 모든 방 목록
			List<BBRoomDTO> listRoom = ProductMapper.listRoom(prod_num);
			mav.addObject("listRoom", listRoom);

			// 전체 최소 인원, 최대 인원
			List<Integer> min_people = new ArrayList<Integer>();
			List<Integer> max_people = new ArrayList<Integer>();

			for (int i = 0; i < listRoom.size(); i++) {
				StringTokenizer str = new StringTokenizer(listRoom.get(i).getRoom_person(), ",");
				min_people.add(Integer.parseInt(str.nextToken()));
				max_people.add(Integer.parseInt(str.nextToken()));
			}
			mav.addObject("min_person", Collections.min(min_people));
			mav.addObject("max_person", Collections.max(max_people));

			// 전체 예약 가능 일
			List<BookDateDTO> book_date = new ArrayList<BookDateDTO>();

			// 모든 날짜
			for (int i = 0; i < listRoom.size(); i++) {
				listRoom.get(i).getRoom_period();
				StringTokenizer str = new StringTokenizer(listRoom.get(i).getRoom_period(), ",");
				SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
				Date begin_date = formatter.parse(str.nextToken());
				Date end_date = formatter.parse(str.nextToken());

				long diff = end_date.getTime() - begin_date.getTime();
				long diffDays = diff / (24 * 60 * 60 * 1000);
				for (int j = 0; j <= diffDays; j++) {
					Calendar cal = Calendar.getInstance();
					cal.setTime(begin_date);
					cal.add(Calendar.DATE, j);
					StringTokenizer str2 = new StringTokenizer(formatter.format(cal.getTime()), "-");
					BookDateDTO dto = new BookDateDTO();
					dto.setRoom_num(listRoom.get(i).getRoom_num());
					dto.setYear(Integer.parseInt(str2.nextToken()));
					dto.setMonth(Integer.parseInt(str2.nextToken()));
					dto.setDay(Integer.parseInt(str2.nextToken()));
					dto.setAvailable("Y");
					book_date.add(dto);
				}
			}

			// 불가능한 날짜
			List<BBBookRoomDTO> listBookRoom = ProductMapper.listBookingRoom(prod_num);
			for (int i = 0; i < listBookRoom.size(); i++) {
				int room_num = listBookRoom.get(i).getRoom_num();
				StringTokenizer str = new StringTokenizer(listBookRoom.get(i).getRoom_date(), "-");
				int year = Integer.parseInt(str.nextToken());
				int month = Integer.parseInt(str.nextToken());
				int day = Integer.parseInt(str.nextToken());

				for (int j = 0; j < book_date.size(); j++) {
					if (room_num == book_date.get(j).getRoom_num() && day == book_date.get(j).getDay()
							&& month == book_date.get(j).getMonth() && year == book_date.get(j).getYear()) {
						book_date.get(j).setAvailable("N");
					}
				}
			}
			Collections.sort(book_date, new Comparator<BookDateDTO>() {
				@Override
				public int compare(BookDateDTO o1, BookDateDTO o2) {
					return o1.getMonth() < o2.getMonth() ? -1 : o1.getMonth() > o2.getMonth() ? 1 : 0;
				}
			});

			Collections.sort(book_date, new Comparator<BookDateDTO>() {
				@Override
				public int compare(BookDateDTO o1, BookDateDTO o2) {
					return o1.getYear() < o2.getYear() ? -1 : o1.getYear() > o2.getYear() ? 1 : 0;
				}
			});

			mav.addObject("book_date", book_date);

			String date = null;
			date = book_date.get(0).getYear() + "-";
			if (book_date.get(0).getMonth() < 10) {
				date += "0";
			}
			date += book_date.get(0).getMonth() + "-";
			if (book_date.get(0).getDay() < 10) {
				date += "0";
			}
			date += book_date.get(0).getDay();
			mav.addObject("selectedDate", date);

			mav.setViewName("user/product/booking");
		} catch (NullPointerException e) {
			// 나중에 오류 메세지로 처리
		}
		return mav;
	}
}
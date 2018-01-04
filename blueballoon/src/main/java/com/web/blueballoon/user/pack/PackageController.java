package com.web.blueballoon.user.pack;

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
import com.web.blueballoon.model.BBPackageBookDTO;
import com.web.blueballoon.model.BBPackageDTO;
import com.web.blueballoon.model.BBProductDTO;
import com.web.blueballoon.model.BBRoomDTO;
import com.web.blueballoon.model.BookDateDTO;
import com.web.blueballoon.user.service.PackageMapper;
import com.web.blueballoon.user.service.ProductMapper;

@Controller
public class PackageController {
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);

	@Autowired
	private PackageMapper PackageMapper;

	private ModelAndView mav = new ModelAndView();

	@RequestMapping(value = "package_list", method = RequestMethod.GET)
	public ModelAndView list(HttpServletRequest arg0, HttpServletResponse arg1) throws Exception {
		int member_num;
		String member_email;
		char member_name;
		try {
			member_num = (Integer) arg0.getSession().getAttribute("member_num");
			member_email = (String) arg0.getSession().getAttribute("member_email");
			member_name = (Character) arg0.getSession().getAttribute("member_name");

			mav.addObject("member_email", member_email);
			mav.addObject("member_name", member_name);
		} catch (NullPointerException e) {
			member_num = 0;
			member_email = null;
		}
		mav.addObject("member_num", member_num);

		// 카테고리 목록
		mav.addObject("listCate", arg0.getSession().getAttribute("listCate"));

		// 상품 목록
		List<BBPackageDTO> listPack = PackageMapper.listPack();

		// 총 페이지 수
		int pageNum = listPack.size();
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
			endPage = pageNum;
		}
		mav.addObject("endPage", endPage);

		mav.addObject("listPack", listPack);
		mav.setViewName("user/product/list");

		return mav;
	}

	@RequestMapping(value = "package_booking", method = RequestMethod.GET)
	public ModelAndView booking(HttpServletRequest arg0, HttpServletResponse arg1) throws Exception {
		mav.clear();
		int member_num;
		String member_email;
		try {
			member_num = (Integer) arg0.getSession().getAttribute("member_num");
			member_email = (String) arg0.getSession().getAttribute("member_email");
		} catch (NullPointerException e) {
			member_num = 0;
			member_email = null;
		}
		mav.addObject("member_num", member_num);
		mav.addObject("member_email", member_email);

		try {
			int pack_num = ServletRequestUtils.getIntParameter(arg0, "pack_num");
			BBPackageDTO getPack = PackageMapper.getPack(pack_num);
			mav.addObject("getPack", getPack);

			// 전체 최소 인원, 최대 인원
			mav.addObject("min_person", 1);
			mav.addObject("max_person", getPack.getPack_person());

			// 전체 예약 가능 일
			List<BookDateDTO> book_date = new ArrayList<BookDateDTO>();

			StringTokenizer str = new StringTokenizer(getPack.getPack_period(), ",");

			SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
			Date begin_date = formatter.parse(str.nextToken());
			Date end_date = formatter.parse(str.nextToken());

			long diff = end_date.getTime() - begin_date.getTime();
			long diffDays = diff / (24 * 60 * 60 * 1000);
			for (int j = 0; j <= diffDays; j++) {
				Calendar cal = Calendar.getInstance();
				cal.setTime(begin_date);
				cal.add(Calendar.DATE, j);
				BookDateDTO dto = new BookDateDTO();
				dto.setBook_date(formatter.format(cal.getTime()));
				book_date.add(dto);
			}

			List<BBPackageBookDTO> listPackBook = new ArrayList<BBPackageBookDTO>();

			for (int i = 0; i < listPackBook.size(); i++) {
				for(int j=0;j<book_date.size();j++) {
				if(listPackBook.get(i).getBook_date().equals("")) {
					
				}
				}
			}
//			// 불가능한 날짜
//			List<BBBookRoomDTO> listBookRoom = ProductMapper.listBookingRoom(prod_num);
//			for (int i = 0; i < listBookRoom.size(); i++) {
//				int room_num = listBookRoom.get(i).getRoom_num();
//
//				StringTokenizer str = new StringTokenizer(listBookRoom.get(i).getRoom_date(), ",");
//				SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
//				Date begin_date = formatter.parse(str.nextToken());
//				Date end_date = null;
//				if (str.hasMoreTokens()) {
//					end_date = formatter.parse(str.nextToken());
//
//					long diff = end_date.getTime() - begin_date.getTime();
//					long diffDays = diff / (24 * 60 * 60 * 1000);
//
//					for (int j = 0; j <= diffDays; j++) {
//						Calendar cal = Calendar.getInstance();
//						cal.setTime(begin_date);
//						cal.add(Calendar.DATE, j);
//						String room_date = formatter.format(cal.getTime());
//
//						for (int k = 0; k < book_date.size(); k++) {
//							if (room_num == book_date.get(k).getRoom_num()
//									&& room_date.equals(book_date.get(k).getBook_date())) {
//								book_date.remove(k);
//							}
//						}
//					}
//				} else {
//					for (int k = 0; k < book_date.size(); k++) {
//						String room_date = formatter.format(begin_date);
//						if (room_num == book_date.get(k).getRoom_num()
//								&& room_date.equals(book_date.get(k).getBook_date())) {
//							book_date.remove(k);
//						}
//					}
//
//				}
//
//			}
//			Collections.sort(book_date, new Comparator<BookDateDTO>() {
//				public int compare(BookDateDTO o1, BookDateDTO o2) {
//					return o1.getBook_date().compareTo(o2.getBook_date());
//				}
//			});

			mav.addObject("beginDate", book_date.get(0).getBook_date());
			mav.addObject("endDate", book_date.get(book_date.size() - 1).getBook_date());
			mav.addObject("book_date", book_date);

			mav.setViewName("user/package/booking");
		} catch (

		NullPointerException e) {
			// 나중에 오류 메세지로 처리
		}
		return mav;
	}

}

package com.web.blueballoon.user.pack;

import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
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
import com.web.blueballoon.model.BBBookDateDTO;
import com.web.blueballoon.model.BBCategoryDTO;
import com.web.blueballoon.model.BBLikeDTO;
import com.web.blueballoon.model.BBPackageBookDTO;
import com.web.blueballoon.model.BBPackageDTO;
import com.web.blueballoon.user.service.PackageMapper;
import com.web.blueballoon.user.service.ProductMapper;

@Controller
public class PackageController {
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);

	@Autowired
	private PackageMapper PackageMapper;

	@Autowired
	private ProductMapper ProductMapper;

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
		List<BBCategoryDTO> listCate = ProductMapper.listCate();
		mav.addObject("listCate", listCate);

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
		mav.setViewName("user/package/list");

		return mav;
	}

	@RequestMapping(value = "package_content", method = RequestMethod.GET)
	public ModelAndView content(HttpServletRequest arg0, HttpServletResponse arg1) throws Exception {
		mav.clear();
		int pack_num = ServletRequestUtils.getIntParameter(arg0, "pack_num");
		BBPackageDTO dto = PackageMapper.getPack(pack_num);
		int likeCount = PackageMapper.likeCount(pack_num);
		mav.addObject("likeCount", likeCount);
		try {
			int member_num = (Integer) arg0.getSession().getAttribute("member_num");
			String member_email = (String) arg0.getSession().getAttribute("member_email");
			char member_name = (Character) arg0.getSession().getAttribute("member_name");

			mav.addObject("member_num", member_num);
			mav.addObject("member_email", member_email);
			mav.addObject("member_name", member_name);

			BBLikeDTO likedto = new BBLikeDTO();
			likedto.setPack_num(pack_num);
			likedto.setMember_num(member_num);
			try {
				int result = PackageMapper.like(likedto);
				mav.addObject("like", "Y");
			} catch (NullPointerException e1) {
				mav.addObject("like", "N");
			}
		} catch (NullPointerException e2) {
			mav.addObject("like", "N");
			mav.addObject("member_num", 0);
		}
		List<BBCategoryDTO> listCate = ProductMapper.listCate();
		mav.addObject("listCate", listCate);
		mav.addObject("getPack", dto);
		mav.setViewName("user/package/content");
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

			// 전체 예약 가능 (시작)일
			List<BBBookDateDTO> book_date = new ArrayList<BBBookDateDTO>();

			StringTokenizer str = new StringTokenizer(getPack.getPack_start_date(), ",");

			while (str.hasMoreTokens()) {
				BBBookDateDTO dto = new BBBookDateDTO();
				dto.setBook_date(str.nextToken());
				dto.setPack_person(getPack.getPack_person());
				dto.setBook_person(0);
				book_date.add(dto);
			}

			List<BBPackageBookDTO> listPackBook = PackageMapper.listPackBook();
			for (int i = 0; i < listPackBook.size(); i++) {
				for (int j = 0; j < book_date.size(); j++) {
					if (listPackBook.get(i).getPack_num() == pack_num
							&& listPackBook.get(i).getBook_date().equals(book_date.get(j).getBook_date())) {
						book_date.get(j).setBook_person(
								book_date.get(j).getBook_person() + listPackBook.get(i).getBook_person());
					}
				}
			}

			for (int i = book_date.size(); i >= 0; i++) {
				if (book_date.get(i).getBook_person() == getPack.getPack_person()) {
					book_date.remove(i);
				}
			}

			Collections.sort(book_date, new Comparator<BBBookDateDTO>() {
				public int compare(BBBookDateDTO o1, BBBookDateDTO o2) {
					return o1.getBook_date().compareTo(o2.getBook_date());
				}
			});

			String date = "";
			String person = "";
			for (int i = 0; i < book_date.size(); i++) {
				date += book_date.get(i).getBook_date();
				person += (getPack.getPack_person() - book_date.get(i).getBook_person());
				if (i != book_date.size() - 1) {
					date += ",";
					person += ",";
				}
			}

			StringTokenizer str2 = new StringTokenizer(getPack.getPack_period(), ",");
			mav.addObject("beginDate", str2.nextToken());
			mav.addObject("endDate", str2.nextToken());
			mav.addObject("date", date);
			mav.addObject("person", person);

			mav.setViewName("user/package/booking");
		} catch (NullPointerException e) {
			// 나중에 오류 메세지로 처리
		}
		return mav;
	}

}

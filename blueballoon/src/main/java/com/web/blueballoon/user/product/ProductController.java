package com.web.blueballoon.user.product;

import java.util.Collections;
import java.util.Comparator;
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
import com.web.blueballoon.model.BBCategoryDTO;
import com.web.blueballoon.model.BBLikeDTO;
import com.web.blueballoon.model.BBProductDTO;
import com.web.blueballoon.user.service.ProductMapper;

@Controller
public class ProductController {

	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);

	@Autowired
	private ProductMapper ProductMapper;

	private ModelAndView mav = new ModelAndView();

	@RequestMapping(value = "product_list", method = RequestMethod.GET)
	public ModelAndView list(HttpServletRequest arg0, HttpServletResponse arg1) throws Exception {
		mav.clear();
		// 로그인 여부
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

		// 상품 목록
		List<BBProductDTO> listProd = ProductMapper.listProd();
		try {
			String cate_state = ServletRequestUtils.getStringParameter(arg0, "cate_state");
			mav.addObject("cate_state", cate_state);
			if (cate_state != null) {
				for (int i = listProd.size() - 1; i >= 0; i--) {
					StringTokenizer str = new StringTokenizer(listProd.get(i).getProd_cate(), "-");
					if (!str.nextToken().equals(cate_state)) {
						listProd.remove(i);
					}
				}
			}
		} catch (NullPointerException e) {
		}

		try {
			String cate_city = ServletRequestUtils.getStringParameter(arg0, "cate_city");
			mav.addObject("cate_city", cate_city);
			if (cate_city != null) {
				for (int i = listProd.size() - 1; i >= 0; i--) {
					StringTokenizer str = new StringTokenizer(listProd.get(i).getProd_cate(), "-");
					String state = str.nextToken();
					if (!str.nextToken().equals(cate_city)) {
						listProd.remove(i);
					}
				}
			}
		} catch (NullPointerException e) {
		}

		try {
			int prod_pick = ServletRequestUtils.getIntParameter(arg0, "prod_pick");
			mav.addObject("prod_pick", prod_pick);
			if (prod_pick != 0) {
				for (int i = listProd.size() - 1; i >= 0; i--) {
					if (listProd.get(i).getProd_pick() != prod_pick) {
						listProd.remove(i);
					}
				}
			}
		} catch (NullPointerException e) {
			mav.addObject("prod_pick", 0);
		}

		try {
			String sort = ServletRequestUtils.getStringParameter(arg0, "sort");
			if (!sort.equals(null) || !sort.equals("")) {
				mav.addObject("sort", sort);
				List<BBLikeDTO> likeList = ProductMapper.likeList();
				if (sort.equals("인기순")) {
					for (int i = 0; i < listProd.size(); i++) {
						for (int j = 0; j < likeList.size(); j++) {
							if (listProd.get(i).getProd_num() == likeList.get(j).getProd_num()) {
								listProd.get(i).setProd_likeCount(listProd.get(i).getProd_likeCount() + 1);
							}
						}
					}
					Collections.sort(listProd, new Comparator<BBProductDTO>() {
						public int compare(BBProductDTO o1, BBProductDTO o2) {
							return o1.getProd_likeCount() > o2.getProd_likeCount() ? -1
									: o1.getProd_likeCount() < o2.getProd_likeCount() ? 1 : 0;
						}
					});
				}
			}
		} catch (NullPointerException e) {
			mav.addObject("sort", "최신순");
		}

		// 총 페이지 수
		int pageNum = listProd.size();
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

		// 9개만 보내기
		for (int i = listProd.size() - 1; i >= 0; i--) {
			if (i < currentPage * 9 - 9 || i > currentPage * 9 - 1) {
				listProd.remove(i);
			}
		}
		List<BBCategoryDTO> listCate = ProductMapper.listCate();
		mav.addObject("listCate", listCate);
		mav.addObject("listProd", listProd);
		mav.setViewName("user/product/list");

		return mav;
	}

	@RequestMapping(value = "product_content", method = RequestMethod.GET)
	public ModelAndView content(HttpServletRequest arg0, HttpServletResponse arg1) throws Exception {
		mav.clear();
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
			mav.addObject("member_num", 0);
		}
		List<BBCategoryDTO> listCate = ProductMapper.listCate();
		mav.addObject("listCate", listCate);
		mav.addObject("getProd", dto);
		mav.setViewName("user/product/content");
		return mav;
	}

	// 좋아요 기능
	@RequestMapping(value = "product_like", method = RequestMethod.GET)
	public ModelAndView like(HttpServletRequest arg0, HttpServletResponse arg1, HttpSession session) throws Exception {
		mav.clear();
		int prod_num = ServletRequestUtils.getIntParameter(arg0, "prod_num");
		mav.addObject("prod_num", prod_num);
		try {
			int member_num = (Integer) arg0.getSession().getAttribute("member_num");
			BBLikeDTO dto = new BBLikeDTO();
			dto.setProd_num(prod_num);
			dto.setMember_num(member_num);
			try {
				int result = ProductMapper.like(dto);
				mav.addObject("msg", "이미 좋아요를 눌렀습니다.");
			} catch (NullPointerException e1) {
				ProductMapper.insertLike(dto);
				mav.setViewName("redirect:/product_content?prod_num=" + prod_num);
				return mav;
			}
			mav.addObject("url", "product_content");
		} catch (NullPointerException e) {
			mav.addObject("msg", "로그인을 해주세요.");
			mav.addObject("url", "member_login");
		}
		mav.setViewName("user/product/message");
		return mav;
	}

}
package com.web.blueballoon.user.board;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.web.blueballoon.model.BBBoardDTO;
import com.web.blueballoon.user.service.BoardMapper;
import com.web.blueballoon.user.service.BoardPager;

@Controller
public class BoardController {

	@Autowired
	private BoardMapper boardMapper;

	ModelAndView mav = new ModelAndView();

	@RequestMapping(value = "board_list", method = RequestMethod.GET)
	// @RequestParam(defaultValue="") ==> 기본값 할당 : 현재페이지를 1로 초기화
	public ModelAndView boardlist(@RequestParam(defaultValue = "1") int curPage) {
		// 게시글 갯수 계산
		int count = boardMapper.countBoard();

		// 페이지 나누기 관련 처리
		BoardPager boardPager = new BoardPager(count, curPage);
		int start = boardPager.getPageBegin();
		int end = boardPager.getPageEnd();

		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("start", start);
		map.put("end", end);
		List<BBBoardDTO> boardList = boardMapper.boardList(map);

		// 데이터를 맵에 저장
		HashMap<String, Object> Listmap = new HashMap<String, Object>();
		Listmap.put("boardList", boardList);
		Listmap.put("count", count);
		Listmap.put("boardPager", boardPager);

		mav.addObject("Listmap", Listmap);
		mav.setViewName("user/board/list");

		return mav;
	}

	@RequestMapping(value = "board_write", method = RequestMethod.GET)
	public ModelAndView boardWrite() {
		
		mav.setViewName("user/board/write");
		return mav;
	}

}

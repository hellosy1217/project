package com.web.blueballoon.user.board;

import java.io.File;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.UUID;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.web.blueballoon.model.BBBoardDTO;
import com.web.blueballoon.model.BBMemberDTO;
import com.web.blueballoon.model.ImageDTO;
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
	public ModelAndView boardWriteForm(@RequestParam int pnum, @RequestParam int prod_pick) {
		System.out.println("pnum ="+ pnum);
		System.out.println("prod_pick = "+ prod_pick);
		if(prod_pick == 1 || prod_pick == 2 || prod_pick == 3) {
		}else {
			prod_pick = 0;
		}
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("pnum", pnum);
		map.put("prod_pick", prod_pick);
		
		mav.addObject("map",map);
		mav.setViewName("user/board/writeForm");
		return mav;
	}

	@RequestMapping(value="board_write", method = RequestMethod.POST)
	public ModelAndView boardWritePro(HttpServletRequest req, @ModelAttribute BBBoardDTO boarddto,
			@RequestParam int pnum, BindingResult result) {
		//게시판을 DB에 저장해서 board_num을 꺼내오기
		String star = req.getParameter("star");
		System.out.println("star =" + star);
		System.out.println("board_content =" + boarddto.getBoard_content());
		System.out.println("board_title = " + boarddto.getBoard_title());
		if(boarddto.getProd_pick() == 1 || boarddto.getProd_pick() == 2 || boarddto.getProd_pick() == 3) {
			//상품인 경우
			boarddto.setProd_num(pnum);
			boarddto.setProd_score(Integer.parseInt(star));
			boarddto.setPack_num(0);
			boarddto.setPack_score(0);
		}else {
			//패키지인 경우
			boarddto.setPack_num(pnum);
			boarddto.setPack_score(Integer.parseInt(star));
			boarddto.setProd_num(0);
			boarddto.setProd_score(0);
			boarddto.setProd_pick(0);
		}
		System.out.println("pack_num = " + boarddto.getPack_num());
		System.out.println("pack_score = "+ boarddto.getPack_score());
		System.out.println("prod_num = " + boarddto.getProd_num());
		System.out.println("prod_score = " + boarddto.getProd_score());
		System.out.println("prod_pick = " + boarddto.getProd_pick());
		//session에 저장된 member_email을 BBBoardDTO에 저장
		HttpSession session = req.getSession();
		String memberEmail = (String) session.getAttribute("member_email");
		boarddto.setMember_email(memberEmail);
		System.out.println("session에서 넘어온 member_email =" + boarddto.getMember_email());
		boarddto.setBoard_img(0);
		int res = boardMapper.insertBoard(boarddto);
		MultipartHttpServletRequest mr = (MultipartHttpServletRequest)req;
		MultipartFile mf = mr.getFile("org_img");
		if(mf.getSize() != 0) {
			//이미지가 있다면 이미지 처리
			int bnum = boardMapper.getBoardNum(boarddto);
			fileUpload(req, bnum);
			
			int imgCount = boardMapper.countFile(bnum);
			boarddto.setBoard_img(imgCount);
			HashMap<String, Object> map = new HashMap<String, Object>();
			map.put("bdtoimg", boarddto.getBoard_img());
			map.put("bnum", bnum);
			int boardImage = boardMapper.boardImgUpdate(map);
		}
		//추후 리뷰쓴 상품페이지를 보여주고 리뷰가 작성되셨습니다 확인하시겠습니까?를 띄어줘도 될듭
		return new ModelAndView("redirect:board_list");
	}
	protected void fileUpload(HttpServletRequest req, int bnum) {
		//경로 지정하기
		HttpSession session = req.getSession();
		String upPath = session.getServletContext().getRealPath("/resources/user/board/files");
		
		//파일 받기
		MultipartHttpServletRequest mr = (MultipartHttpServletRequest)req;
		List<MultipartFile> mf = mr.getFiles("org_img");
		if(mf.size() == 1 && mf.get(0).getOriginalFilename().equals("")) {
		}else {
			for(int i = 0; i < mf.size() ; i++) {
				//본래 파일명
				String org_img = mf.get(i).getOriginalFilename();
				//파일 중복 처리, 뒤에 랜덤값 붙여서 중복 막기
				String originalFileExtension = org_img.substring(org_img.lastIndexOf("."));                     
				String str_img = UUID.randomUUID().toString().replaceAll("-", "")  + originalFileExtension;
				//서버에 파일 쓰기
				File file = new File(upPath, str_img);
				try {
					mf.get(i).transferTo(file);
				} catch (IllegalStateException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				} catch (IOException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
				int part = 5;
				int selected_num = bnum;
				
				int res = boardMapper.insertFile(part,selected_num,org_img,str_img);
			}
		}
	}
	
	@RequestMapping(value="board_content")
	public ModelAndView contentBoard(HttpServletRequest req, HttpServletResponse resp, 
			@RequestParam String board_num) {
		int boardNum = Integer.parseInt(board_num);
		//세션에 있는 이메일값 가져오기(글쓴이만 글수정과 삭제를 볼수 있게 해주기 위해)
		HttpSession session = req.getSession();
		String memberEmail = (String) session.getAttribute("member_email");
		//글번호에 맞춰 글내용 가져오기
		BBBoardDTO boarddto = boardMapper.getBoard(boardNum);
		//조회수
		System.out.println("session에서 넘어온 값 = " + memberEmail);
		System.out.println("원래 저장된 값 = " + boarddto.getMember_email());
		//cookie변수를 만들어서 값을 저장, 값이 있으면 조회수 증가 안됨
		int countCheck = 0;
		Cookie[] cookies = req.getCookies();
		if(cookies != null) {
			for(int i = 0; i < cookies.length; i++) {
				if(cookies[i].getName().equals(board_num)){
					//board_num쿠키가 있는 경우
					countCheck = 0;
					break;
				}else {
					Cookie c = new Cookie(board_num, board_num);
					c.setMaxAge(24*60*60);//하루 저장
					resp.addCookie(c);

					countCheck += 1;
				}
			}
		}
		//카운트 증가
		if(countCheck > 0) {
			int res = boardMapper.readcount(boardNum);
		}
		//회원 이름 가져오기
		BBMemberDTO memberdto = boardMapper.getMemberName(boarddto.getMember_email());
		String memberName = memberdto.getMember_name();
		int selected_num = boardNum;
		//저장된 사진 가져오기
		List<ImageDTO> imgList = boardMapper.getImage(selected_num);
		System.out.println("prod_score = "+ boarddto.getProd_score());
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("getBoard", boarddto);
		map.put("memberName", memberName);
		map.put("getImage", imgList);
		map.put("memberEmail", memberEmail);

		mav.addObject("map", map);
		mav.setViewName("user/board/content");
		return mav;
	}

	@RequestMapping(value="board_likecount")
	public ModelAndView likeCount(@RequestParam String board_num) throws Exception{
		int res = boardMapper.likecount(Integer.parseInt(board_num));
		return new ModelAndView("redirect:board_list");
	}

	@RequestMapping(value="board_delete")
	public ModelAndView deleteBoard(@RequestParam int board_num) {
		int res = boardMapper.deleteBoard(board_num);
		return new ModelAndView("redirect:board_list");
	}
	
	@RequestMapping(value="board_update", method=RequestMethod.GET)
	public String boardUpdateForm(HttpServletRequest req, @RequestParam String board_num) {
		BBBoardDTO dto = boardMapper.getBoard(Integer.parseInt(board_num));
		req.setAttribute("getBoard", dto);
		return "user/board/updateForm";
	}
	
	@RequestMapping(value="board_update",method = RequestMethod.POST)
	public ModelAndView boardUpdatePro(HttpServletRequest req, @ModelAttribute BBBoardDTO dto, BindingResult result) {
		String star = req.getParameter("star");
		if(star == null || star.trim().equals("")) {
		}else {
			//별점을 새로 받음
			if(dto.getProd_pick() == 1 || dto.getProd_pick() == 2 || dto.getProd_pick() == 3) {
				//상품인 경우
				dto.setProd_score(Integer.parseInt(star));
			}else {
				//패키지인 경우
				dto.setPack_score(Integer.parseInt(star));
			}
		}
		//사진을 받았다면 지우고 새로운 사진을 저장
		MultipartHttpServletRequest mr = (MultipartHttpServletRequest)req;
		MultipartFile mf = mr.getFile("org_img");
		if(mf.getSize() != 0) {
			//이미지가 있다면 이미지 처리
			int res = boardMapper.deleteImage(dto.getBoard_num());
			fileUpload(req, dto.getBoard_num());

			int imgCount = boardMapper.countFile(dto.getBoard_num());
			dto.setBoard_img(imgCount);
		}
		int res = boardMapper.updateBoard(dto);
		return new ModelAndView("redirect:board_list");
	}
}

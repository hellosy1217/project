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
import com.web.blueballoon.model.BBCommentDTO;
import com.web.blueballoon.model.BBMemberDTO;
import com.web.blueballoon.model.ImageDTO;
import com.web.blueballoon.user.service.BoardMapper;
import com.web.blueballoon.user.service.BoardPager;
import com.web.blueballoon.util.AmazonFileUtils;

@Controller
public class BoardController {

	@Autowired
	private BoardMapper boardMapper;

	@Autowired
	private AmazonFileUtils amazon;

	ModelAndView mav = new ModelAndView();

	@RequestMapping(value = "board_list", method = RequestMethod.GET)
	// @RequestParam(defaultValue="") ==> 기본값 할당 : 현재페이지를 1로 초기화
	public ModelAndView boardlist(HttpServletRequest req,@RequestParam(defaultValue = "1") int curPage) {
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

		//session에 있는 이메일값 넘겨주기
		HttpSession session = req.getSession();
		String memberEmail = (String) session.getAttribute("member_email");

		//좋아요 수로 best리뷰 뽑기
		List<BBBoardDTO> bestReview = boardMapper.bestReview();

		// 데이터를 맵에 저장
		HashMap<String, Object> Listmap = new HashMap<String, Object>();
		Listmap.put("boardList", boardList);
		Listmap.put("count", count);
		Listmap.put("boardPager", boardPager);
		Listmap.put("memberEmail", memberEmail);
		Listmap.put("bestReview", bestReview);

		mav.addObject("Listmap", Listmap);
		mav.setViewName("user/board/list");

		return mav;
	}

	@RequestMapping(value = "board_write")
	public ModelAndView boardWriteForm(@RequestParam int prod_num, HttpServletRequest req) {
		HttpSession session = req.getSession();
		String memberEmail = (String) session.getAttribute("member_email");
		mav.addObject("prod_num", prod_num);
		if(memberEmail == null) {
			mav.addObject("msg", "로그인을 해주세요");
			mav.addObject("url", "member_login");
			mav.setViewName("user/board/message");
			return mav;
		}
		mav.addObject("member_email", memberEmail);
		mav.setViewName("user/board/writeForm");
		return mav;
	}

	@RequestMapping(value="board_insert", method = RequestMethod.POST)
	public ModelAndView boardWritePro(HttpServletRequest req, @RequestParam("board_org_img") MultipartFile multipartFiles,
			@ModelAttribute BBBoardDTO dto, BindingResult result) {
		System.out.println("prod_num = "+ dto.getProd_num());
		System.out.println("memberEmail = " + dto.getMember_email());
		String star = req.getParameter("star");
		//		if(star == null || star.trim().equals("")) {
		//			mav.addObject("prod_num", dto.getProd_num());
		//			mav.addObject("member_email", dto.getMember_email());
		//			mav.addObject("msg", "별점을 선택하세요");
		//			mav.addObject("url", "board_write");
		//			mav.setViewName("user/board/message");
		//			return mav; 
		//		}
		//		if(dto.getBoard_title() == null || dto.getBoard_title().trim().equals("")) {
		//			mav.addObject("prod_num", dto.getProd_num());
		//			mav.addObject("member_email", dto.getMember_email());
		//			mav.addObject("msg", "제목을 입력하세요");
		//			mav.addObject("url", "board_write");
		//			mav.setViewName("user/board/message");
		//			return mav;
		//		}
		//		if(dto.getBoard_content() == null || dto.getBoard_content().trim().equals("")) {
		//			mav.addObject("prod_num", dto.getProd_num());
		//			mav.addObject("member_email", dto.getMember_email());
		//			mav.addObject("msg", "내용을 입력하세요");
		//			mav.addObject("url", "board_write");
		//			mav.setViewName("user/board/message");
		//			return mav;
		//		}
		System.out.println("star =" + star);
		//별점 저장
		dto.setBoard_score(Integer.parseInt(star));
		//태그 문자 처리 & 공백 문자 처리& 줄바꿈 문자처리
		String title = dto.getBoard_title();
		String content = dto.getBoard_content();
		// *태그문자 처리 (< ==> &lt; > ==> &gt;)
		title = title.replace("<", "&lt;");
		title = title.replace(">", "&gt;");
		// *공백문자 처리
		title = title.replace("  ",    "&nbsp;&nbsp;");
		// *줄바꿈 문자처리
		content = content.replace("\n", "<br>");
		dto.setBoard_title(title);
		dto.setBoard_content(content);
		//이미지 추가
		String filename = multipartFiles.getOriginalFilename();
		System.out.println("filename=" + filename);
		if(filename == null || filename.trim().equals("")) {
			dto.setBoard_org_img("0");
		}else {
			//아마존 업로드 이후 저장된 파일 이름 return 받아 저장해주기(str_file_name)
			String upload = amazon.one_FileUpload("bb_board", multipartFiles);
			dto.setBoard_str_img(upload);
			dto.setBoard_org_img(multipartFiles.getOriginalFilename());
		}
		System.out.println("filename = "+ dto.getBoard_org_img());
		int res = 0;
		try {
			boardMapper.insertBoard(dto);
		}catch(NullPointerException ne) { //not null 아닌 애들 값 안넣었을 때 에러처리
			dto.setBoard_org_img(null);
			dto.setBoard_str_img(null);
			dto.setBoard_score(0);
			dto.setProd_num(0);
		}
		return new ModelAndView("redirect:board_list");
	}

	@RequestMapping(value="board_content")
	public ModelAndView contentBoard(HttpServletRequest req, HttpServletResponse resp, 
			@RequestParam String board_num) {
		int boardNum = Integer.parseInt(board_num);
		//cookie변수를 만들어서 값을 저장, 값이 있으면 조회수 증가 안됨
		boolean isCheck = false;
		Cookie[] cookies = req.getCookies();
		if(cookies != null || cookies.length != 0) {
			for(int i = 0; i < cookies.length; i++) {
				if(cookies[i].getName().equals(board_num)){
					//board_num쿠키가 있는 경우
					isCheck = true;
					break;
				}
			}
		}
		if(!isCheck) {
			int res = boardMapper.readcount(boardNum);
			Cookie c = new Cookie(board_num, board_num);
			c.setMaxAge(24*60*60);//하루 저장
			resp.addCookie(c);
		}
		//세션에 있는 이메일값 가져오기(글쓴이만 글수정과 삭제를 볼수 있게 해주기 위해)
		HttpSession session = req.getSession();
		String memberEmail = (String) session.getAttribute("member_email");
		//글번호에 맞춰 글내용 가져오기
		BBBoardDTO boarddto = boardMapper.getBoard(boardNum);
		//회원 이름 가져오기(게시글)
		BBMemberDTO memberdto = boardMapper.getMemberName(boarddto.getMember_email());
		String memberName = memberdto.getMember_name();
		//댓글 정보 가져오기
		List<BBCommentDTO> getComment = boardMapper.commentList(boardNum);
		System.out.println("boardImg = "+ boarddto.getBoard_org_img());
		//이미지가 있으면 Y/이미지가 없으면 N을 보내기 (el이 board_org_img이름이 길어 에러나서)
		String existImg = "N";
		String org_img = boarddto.getBoard_org_img();
		if(org_img == null) {
			existImg = "N";
		}else if(!org_img.equals("0")) {
			existImg = "Y";
		}
		System.out.println("existImg = " + existImg);
		System.out.println("board_org_img =" + boarddto.getBoard_org_img());
		System.out.println("board_str_img =" + boarddto.getBoard_str_img());
		//모두 담기
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("getBoard", boarddto);
		map.put("memberName", memberName);
		map.put("memberEmail", memberEmail);
		map.put("getCommentList", getComment);
		map.put("existImg", existImg);

		mav.addObject("map", map);
		mav.setViewName("user/board/content");
		return mav;
	}

	@RequestMapping(value="board_likecount")
	public ModelAndView likeCount(HttpServletRequest req,HttpServletResponse resp,@RequestParam String board_num) throws Exception{
		//cookie변수를 만들어서 값을 저장, 값이 있으면 조회수 증가 안됨
		boolean isCheck = false;
		Cookie[] cookies = req.getCookies();
		if(cookies != null || cookies.length != 0) {
			for(int i = 0; i < cookies.length; i++) {
				if(cookies[i].getName().equals("like"+board_num)){
					//board_num쿠키가 있는 경우
					isCheck = true;
					mav.addObject("board_num", Integer.parseInt(board_num));
					mav.addObject("msg", "이미 좋아요를 눌렀습니다.");
					mav.addObject("url", "board_content");
					mav.setViewName("user/board/message");
					break;
				}
			}
		}
		if(!isCheck) {
			int res = boardMapper.likecount(Integer.parseInt(board_num));
			Cookie c = new Cookie("like"+board_num, board_num);
			c.setMaxAge(24*60*60);//하루 저장
			resp.addCookie(c);
		}
		return new ModelAndView("redirect:board_content?board_num="+board_num);
	}

	@RequestMapping(value="board_delete")
	public ModelAndView deleteBoard(@RequestParam int board_num) {
		BBBoardDTO dto = boardMapper.getBoard(board_num);
		if(dto.getBoard_str_img() != null) {
			boolean existFile = amazon.existFile("bb_board", dto.getBoard_str_img());
			if(existFile) {
				amazon.deleteFile("bb_board",dto.getBoard_str_img());
			}
		}
		int res = boardMapper.deleteBoard(board_num);
		mav.addObject("msg", "삭제되었습니다.");
		mav.addObject("url", "board_list");
		mav.setViewName("user/board/message");
		return new ModelAndView("redirect:board_list"); 
	}

	@RequestMapping(value="board_update", method=RequestMethod.GET)
	public String boardUpdateForm(HttpServletRequest req, @RequestParam String board_num) {
		BBBoardDTO dto = boardMapper.getBoard(Integer.parseInt(board_num));
		req.setAttribute("getBoard", dto);
		return "user/board/updateForm";
	}

	@RequestMapping(value="board_update",method = RequestMethod.POST)
	public ModelAndView boardUpdatePro(HttpServletRequest req, 
			@RequestParam("board_org_img") MultipartFile mf,@ModelAttribute BBBoardDTO dto, BindingResult result) {
		//태그 문자 처리 & 공백 문자 처리& 줄바꿈 문자처리
		String title = dto.getBoard_title();
		String content = dto.getBoard_content();
		// *태그문자 처리 (< ==> &lt; > ==> &gt;)
		title = title.replace("<", "&lt;");
		title = title.replace(">", "&gt;");
		// *공백문자 처리
		title = title.replace("  ",    "&nbsp;&nbsp;");
		// *줄바꿈 문자처리
		content = content.replace("\n", "<br>");
		dto.setBoard_title(title);
		dto.setBoard_content(content);
		BBBoardDTO bdto = boardMapper.getBoard(dto.getBoard_num());
		String star = req.getParameter("star");
		if(star == null) {
			dto.setBoard_score(bdto.getBoard_score());
		}else{
			dto.setBoard_score(Integer.parseInt(star));
		}
		//사진을 받았다면 지우고 새로운 사진을 저장
		System.out.println("bdto_org =" + bdto.getBoard_org_img());
		System.out.println("bdto_str = " + bdto.getBoard_str_img());
		String board_edit_img = mf.getOriginalFilename();
		System.out.println("board_edit = "+ board_edit_img);
		String file = null;
		if(bdto.getBoard_str_img() != null) {
			//insert때 이미지 있음
			if(board_edit_img != null) { // 이부분이 에러난다.
				//기존 이미지가 있을때 
				boolean existFile = amazon.existFile("bb_board", bdto.getBoard_str_img());
				if(existFile) {
					amazon.deleteFile("bb_board", bdto.getBoard_str_img());
				}
				file = amazon.one_FileUpload("bb_board", mf);
				dto.setBoard_org_img(board_edit_img);
				dto.setBoard_str_img(file);
			}
			if(board_edit_img == null || board_edit_img.trim().equals("")) {
				//새로운 파일 없을 때
				System.out.println("board_org = " + bdto.getBoard_org_img());
				dto.setBoard_org_img(bdto.getBoard_org_img());
				System.out.println("board_org_img ="+ dto.getBoard_org_img());
				dto.setBoard_str_img(bdto.getBoard_str_img());			
				System.out.println("board_str =" + dto.getBoard_str_img());
			}
		} else if(bdto.getBoard_str_img() == null) {
			//기존 이미지 없을 때
			if(board_edit_img != null) {
				//새로운 파일이 있을때
				file = amazon.one_FileUpload("bb_board", mf);
				dto.setBoard_str_img(file);
				dto.setBoard_org_img(board_edit_img);
			}
			if(board_edit_img == null || board_edit_img.trim().equals("")) {
				dto.setBoard_org_img("0");
				System.out.println("사진없고 수정에도 없다 이건 org이미지 = " + dto.getBoard_org_img());
			}
		}
		System.out.println("title = "+ dto.getBoard_title());
		System.out.println("cotent =" + dto.getBoard_content());
		System.out.println("예전org_img = " + bdto.getBoard_org_img());
		System.out.println("org_img = " + dto.getBoard_org_img());
		System.out.println("str_img = " + dto.getBoard_str_img());
		System.out.println("board_score ="+ dto.getBoard_score());
		int res = 0; 
		try {
			boardMapper.updateBoard(dto);
		} catch(NullPointerException ne) {
			ne.printStackTrace();
			dto.setBoard_org_img(null);
			dto.setBoard_str_img(null);
		}
		return new ModelAndView("redirect:board_list");
	}

	@RequestMapping(value="comment_write", method = RequestMethod.POST)
	public ModelAndView commentWritePro(HttpServletRequest req,
			@ModelAttribute BBCommentDTO dto, BindingResult result) {
		HttpSession session = req.getSession();
		String memberEmail = (String) session.getAttribute("member_email");
		if(memberEmail == null) {
			mav.addObject("board_num", dto.getBoard_num());
			mav.addObject("msg", "로그인을 해주세요");
			mav.addObject("url", "member_login");
			mav.setViewName("user/board/message");
			return mav;
		}
		dto.setMember_email(memberEmail);
		if(dto.getComment_content() == null || dto.getComment_content().trim().equals("")) {
			mav.addObject("board_num",dto.getBoard_num());
			mav.addObject("msg", "내용을 입력해주세요");
			mav.addObject("url", "board_content");
			mav.setViewName("user/board/message");
			return mav;
		}
		//태그 문자 처리 & 공백 문자 처리& 줄바꿈 문자처리
		String content = dto.getComment_content();
		// *줄바꿈 문자처리
		content = content.replace("\n", "<br>");
		dto.setComment_content(content);
		//session에 저장된 member_email을 BBBoardDTO에 저장
		int res = boardMapper.insertComment(dto);
		return new ModelAndView("redirect:board_content?board_num="+dto.getBoard_num());
	}

	@RequestMapping(value="comment_delete")
	public ModelAndView deleteComment(@RequestParam int comment_num) {
		System.out.println("댓글 번호 = "+ comment_num);
		int res = boardMapper.deleteComment(comment_num);
		mav.addObject("msg", "삭제되었습니다.");
		mav.addObject("url", "board_list");
		mav.setViewName("user/board/message");
		return mav; 
	}
}

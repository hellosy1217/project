package com.web.blueballoon.user.service;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.web.blueballoon.model.BBBoardDTO;
import com.web.blueballoon.model.BBCommentDTO;
import com.web.blueballoon.model.BBMemberDTO;
import com.web.blueballoon.model.ImageDTO;

@Service
public class BoardMapper {

	@Autowired
	private SqlSession sqlSession;
	
	//List
	public List<BBBoardDTO> boardList(HashMap<String, Object> map){
		return sqlSession.selectList("boardList", map);
	}
	
	public int countBoard() {
		return sqlSession.selectOne("countBoard");
	}
	
	public List<BBBoardDTO> bestReview(){
		return sqlSession.selectList("bestReview");
	}
	
	//Write
	public int insertBoard(BBBoardDTO dto) {
		return sqlSession.insert("insertBoard", dto);
	}
	
	public int getBoardNum(BBBoardDTO dto) {
		return sqlSession.selectOne("getBoardNum", dto);
	}
	
	public int countFile(int bnum) {
		return sqlSession.selectOne("countFile", bnum);
	}
	
	public int boardImgUpdate(HashMap<String, Object> map) {
		return sqlSession.update("boardImgUpdate", map);
	}
	
	public int insertFile(int part,int selected_num,String org_img, String str_img) {
		HashMap<Object, Object> hm = new HashMap<Object, Object>();
		hm.put("part", part);
		hm.put("selected_num", selected_num);
		hm.put("org_img", org_img);
		hm.put("str_img", str_img);
		return sqlSession.insert("insertFile",hm);
	}
	
	//get
	public int readcount(int board_num) {
		return sqlSession.update("readcount", board_num);
	}
	
	public BBBoardDTO getBoard(int board_num) {
		return sqlSession.selectOne("getBoard", board_num);
	}
	
	public List<ImageDTO> getImage(int selected_num){
		return sqlSession.selectList("getImage", selected_num);
	}
	
	public BBMemberDTO getMemberName(String memberEmail) {
		return sqlSession.selectOne("getMemberName", memberEmail);
	}
	
	//likecount
	public int likecount(int board_num) {
		return sqlSession.update("likecount", board_num);
	}
	
	//delete
	public int deleteBoard(int board_num) {
		return sqlSession.delete("deleteBoard", board_num);
	}
	
	//update
	public int updateBoard(BBBoardDTO dto) {
		return sqlSession.update("updateBoard", dto);
	}
	
	public int deleteImage(int board_num) {
		return sqlSession.delete("deleteImage", board_num);
	}
	//comment- insert
	public int insertComment(BBCommentDTO dto) {
		return sqlSession.insert("insertComment", dto);
	}
	
	//comment- list
	public List<BBCommentDTO> commentList(int board_num){
		return sqlSession.selectList("commentList", board_num);
	}
	
	//comment- delete
	public int deleteComment(int comment_num) {
		return sqlSession.delete("deleteComment", comment_num);
	}
}

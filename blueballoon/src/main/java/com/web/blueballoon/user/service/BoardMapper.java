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
	
	public List<BBBoardDTO> boardListSearch(HashMap<String, Object> map){
		return sqlSession.selectList("boardListSearch", map);
	}
	
	public int countBoardSearch(HashMap<String, Object> map) {
		return sqlSession.selectOne("countBoardSearch", map);
	}
	
	public List<BBBoardDTO> bestReview(){
		return sqlSession.selectList("bestReview");
	}
	
	//Write
	public int insertBoard(BBBoardDTO dto) {
		return sqlSession.insert("insertBoard", dto);
	}
	
	//get
	public int readcount(int board_num) {
		return sqlSession.update("readcount", board_num);
	}
	
	public BBBoardDTO getBoard(int board_num) {
		return sqlSession.selectOne("getBoard", board_num);
	}
	
	public BBMemberDTO getMemberName(String memberEmail) {
		return sqlSession.selectOne("getMemberName", memberEmail);
	}
	
	public List<BBMemberDTO> commentMember(){
		return sqlSession.selectList("commentMember");
	}
	
	//likecount
	public int likecount(int board_num) {
		return sqlSession.update("likecount", board_num);
	}
	
	//delete
	public int deleteBoard(int board_num) {
		return sqlSession.delete("deleteBoard", board_num);
	}
	
	public int deleteBoardComments(int board_num) {
		return sqlSession.delete("deleteBoardComments", board_num);
	}
	
	//update
	public int updateBoard(BBBoardDTO dto) {
		return sqlSession.update("updateBoard", dto);
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

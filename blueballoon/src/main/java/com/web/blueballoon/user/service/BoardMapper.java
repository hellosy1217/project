package com.web.blueballoon.user.service;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.web.blueballoon.model.BBBoardDTO;

@Service
public class BoardMapper {

	@Autowired
	private SqlSession sqlSession;
	
	public List<BBBoardDTO> boardList(HashMap<String, Object> map){
		return sqlSession.selectList("boardList", map);
	}
	
	public int countBoard() {
		return sqlSession.selectOne("countBoard");
	}
}

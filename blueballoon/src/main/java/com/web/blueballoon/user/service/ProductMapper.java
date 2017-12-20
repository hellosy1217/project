package com.web.blueballoon.user.service;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.web.blueballoon.model.BBBookingRoomDTO;
import com.web.blueballoon.model.BBCategoryDTO;
import com.web.blueballoon.model.BBRoomDTO;

@Service
public class ProductMapper {

	@Autowired
	private SqlSession sqlSession;

	public int countList() {
		return sqlSession.selectOne("countList");
	}

	public List<BBCategoryDTO> listCate() {
		return sqlSession.selectList("listCate");
	}

	public List<BBRoomDTO> listRoom(int prod_num) {
		return sqlSession.selectList("listRoom", prod_num);
	}

	public List<BBBookingRoomDTO> listBookingRoom(int prod_num) {
		return sqlSession.selectList("listBookingRoom", prod_num);
	}
}

package com.web.blueballoon.user.service;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.web.blueballoon.model.BBBookRoomDTO;
import com.web.blueballoon.model.BBCategoryDTO;
import com.web.blueballoon.model.BBLikeDTO;
import com.web.blueballoon.model.BBProductDTO;
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

	public List<BBProductDTO> listProd() {
		return sqlSession.selectList("listProd");
	}

	public int like(BBLikeDTO dto) {
		return sqlSession.selectOne("like", dto);
	}

	public int likeCount(int prod_num) {
		return sqlSession.selectOne("likeCount", prod_num);
	}

	public List<BBLikeDTO> likeList() {
		return sqlSession.selectList("likeList");
	}

	public void insertLike(BBLikeDTO dto) {
		sqlSession.insert("insertLike", dto);
	}

	public List<BBRoomDTO> listRoom(int prod_num) {
		return sqlSession.selectList("listRoom", prod_num);
	}

	public List<BBBookRoomDTO> listBookingRoom(int prod_num) {
		return sqlSession.selectList("listBookingRoom", prod_num);
	}

	public BBProductDTO getProd(int num) {
		return sqlSession.selectOne("getProd", num);
	}

}

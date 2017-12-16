package com.web.blueballoon.user.service;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.web.blueballoon.model.BBCategoryDTO;

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

}

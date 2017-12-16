package com.web.blueballoon.user.service;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;

import com.web.blueballoon.model.BBCategoryDTO;

public class ProductMapper {

	@Autowired
	private SqlSession sqlSession;

	public List<BBCategoryDTO> listCate() {
		return sqlSession.selectList("listCate");
	}

}

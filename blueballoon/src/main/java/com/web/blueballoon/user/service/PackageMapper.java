package com.web.blueballoon.user.service;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.web.blueballoon.model.BBLikeDTO;
import com.web.blueballoon.model.BBPackageBookDTO;
import com.web.blueballoon.model.BBPackageDTO;

@Service
public class PackageMapper {

	@Autowired
	private SqlSession sqlSession;

	public List<BBPackageDTO> listPack() {
		return sqlSession.selectList("listPack");
	}

	public BBPackageDTO getPack(int pack_num) {
		return sqlSession.selectOne("getPack",pack_num);
	}

	public int packLike(BBLikeDTO dto) {
		return sqlSession.selectOne("packLike", dto);
	}

	public int packLikeCount(int pack_num) {
		return sqlSession.selectOne("packLikeCount", pack_num);
	}
	
	public List<BBLikeDTO> packLikeList() {
		return sqlSession.selectList("packLikeList");
	}

	public List<BBPackageBookDTO> listPackBook() {
		return sqlSession.selectList("listPackBook");
	}

}

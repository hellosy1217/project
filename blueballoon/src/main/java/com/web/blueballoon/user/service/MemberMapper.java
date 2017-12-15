package com.web.blueballoon.user.service;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.web.blueballoon.model.MemberDBBean;

@Service
public class MemberMapper {

	@Autowired
	private SqlSession sqlSession;

	public int joinMember(MemberDBBean dto) {
		return sqlSession.insert("joinMember", dto);
	}
	public int checkEmail(MemberDBBean dto) {
		// TODO Auto-generated method stub
		int isEmailExist = sqlSession.selectOne("checkEmail", dto);

		return isEmailExist;

	}

	public MemberDBBean checkUser(MemberDBBean check) {
		java.util.Map<String, String> map = new java.util.HashMap<String, String>();
		map.put("member_email", check.getMember_email());
		map.put("member_password", check.getMember_passwd());
		MemberDBBean dto =  sqlSession.selectOne("checkUser", map);
	/*	if(dto==null) return true;
		return false;*/
		return dto;
	}
}

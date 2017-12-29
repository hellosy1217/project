package com.web.blueballoon.user.service;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.web.blueballoon.model.BBLikeDTO;
import com.web.blueballoon.model.BBMemberDTO;


@Service
public class MemberMapper {

	@Autowired
	private SqlSession sqlSession;

	public int joinMember(BBMemberDTO dto) {
		return sqlSession.insert("joinMember", dto);
	}

	public int checkEmail(BBMemberDTO dto) {
		int isEmailExist = sqlSession.selectOne("checkEmail", dto);
		return isEmailExist;
	}

	public BBMemberDTO checkUser(BBMemberDTO check) {
		java.util.Map<String, String> map = new java.util.HashMap<String, String>();
		map.put("member_email", check.getMember_email());
		map.put("member_password", check.getMember_passwd());
		BBMemberDTO dto = sqlSession.selectOne("checkUser", map);
		/*
		 * if(dto==null) return true; return false;
		 */
		return dto;
	}
	public  int editMember(BBMemberDTO dto) {
		int res = 0;
		BBMemberDTO dto2 =  sqlSession.selectOne("getLoginedMember", dto.getMember_email());
			if (dto2.getMember_passwd().equals(dto.getMember_passwd())) {
				res = sqlSession.update("editMember", dto);
			}
			return res;
	}

	public BBMemberDTO getMember(String member_email) {		
		return sqlSession.selectOne("getLoginedMember", member_email);
	}
	
	 public List<BBLikeDTO> listProducts(int member_num){
		 return sqlSession.selectList("getLikeProducts",member_num);
	 }
}

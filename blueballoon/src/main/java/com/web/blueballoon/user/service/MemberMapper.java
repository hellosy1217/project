package com.web.blueballoon.user.service;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.web.blueballoon.model.BBLikeDTO;
import com.web.blueballoon.model.BBMemberDTO;
import com.web.blueballoon.model.BBProductDTO;


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

	public boolean checkUser(BBMemberDTO check) {
		boolean login = false;
		BBMemberDTO newDto =sqlSession.selectOne("checkUser", check);
		try {
			if(newDto.getMember_email()!=null) {//로그인이 값이 있을때 true! true가 성공
				login = true;
			}
		}catch(NullPointerException ne) {
			return login;
		}
		return login;
	}
	public  int editMember(BBMemberDTO dto) {
		return sqlSession.update("editMember", dto);
	}
	public int editMemberForNull(BBMemberDTO dto) {
		return sqlSession.update("editMemberForNull", dto);
	}
	public BBMemberDTO getMember(String member_email) {		
		return sqlSession.selectOne("getLoginedMember", member_email);
	}
	
	 public List<BBLikeDTO> listLikeProducts(int member_num){
		 return sqlSession.selectList("getLikeProducts",member_num);
	 }

	public int changePasswd(BBMemberDTO checkUser) {
		return sqlSession.update("changePasswd",checkUser);
	}

	public BBProductDTO getProduct(int prod_num) {
		return sqlSession.selectOne("getBBProduct", prod_num);
	}
}

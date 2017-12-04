package com.web.blueballoon.service;

import java.io.UnsupportedEncodingException;
import java.util.List;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.web.blueballoon.model.TravelCategory;
import com.web.blueballoon.model.TravelMemberDTO;
import com.web.blueballoon.model.TravelProductDTO;

@Service
public class AdminMapper {
	@Autowired
	private SqlSession sqlSession;
	//멤버리스트
	public List<TravelMemberDTO> listMember(){
		return sqlSession.selectList("listMember");
	}
	//getMember
	public TravelMemberDTO getMember(int member_num) {
		return sqlSession.selectOne("getMember",member_num);
	}
	//멤버 정보 수정
	public int editMember(TravelMemberDTO dto) {
		return sqlSession.update("editMember",dto);
	}
	//멤버 삭제!(이메일 인증과 시간 통과 후에만)
	public int deleteMember(int member_num) {
		return sqlSession.delete("deleteMember",member_num);
	}
	//멤버 예약 리스트
	/*public List<TravelBookingDTO> booking_list(int member_id){
		return sqlSession.selectList("booking_list",member_id);
	}*/
	//여행지역 카테고리 목록
	public List<TravelCategory> listTravelCategory(){
		return  sqlSession.selectList("listTravelCategory");
	}
	//여행지역 카테고리 등록
	public int insertTravelCategory(TravelCategory dto) {
		System.out.println("도: "+dto.getCate_state()+" / 시:"+dto.getCate_city());
		return sqlSession.insert("insertTravelCategory",dto);
	}
	//여행지역 카테고리 삭제
	public int deleteTravelCategory(int tCate_num) {
		return sqlSession.delete("deleteTravelCategory",tCate_num);
	}
	//getCategory
	public TravelCategory getTravelCategory(int tCate_num) {
		return sqlSession.selectOne("getTravelCategory",tCate_num);
	}
	//여행지역 카테고리 수정
	public int editTravelCategory(TravelCategory dto) {
		return sqlSession.update("editTravelCategory",dto);
	}
	//여행 상품 등록
	public int insertTravelProduct(TravelProductDTO dto) {
		return sqlSession.insert("insertTravelProduct",dto);
	}
	//여행 상품 삭제
	public int deleteTravelProduct(int prod_num) {
		return sqlSession.delete("deleteTravelProduct",prod_num);
	}
	//여행 상품 목록
	public List<TravelProductDTO> listTravelProduct(){
		return sqlSession.selectList("listTravelProduct");
	}
	//getTravelProduct
	public TravelProductDTO getTravelProduct(int prod_num) {
		return sqlSession.selectOne("getTravelProduct",prod_num);
	}
	//여행 상품 수정 
	public int editTravelProduct(TravelProductDTO dto) {
		return sqlSession.update("editTravelProduct",dto);
	}
	
}

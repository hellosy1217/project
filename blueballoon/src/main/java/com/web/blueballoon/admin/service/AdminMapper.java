package com.web.blueballoon.admin.service;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.web.blueballoon.model.BBCategoryDTO;
import com.web.blueballoon.model.BBProductDTO;
import com.web.blueballoon.model.BBRoomDTO;
import com.web.blueballoon.model.BBMemberDTO;
import com.web.blueballoon.model.BBPackageDTO;

@Service
public class AdminMapper {
	@Autowired
	private SqlSession sqlSession;
	//멤버리스트
		public List<BBMemberDTO> listMember(){
			return sqlSession.selectList("listMember");
		}
		//getMember
		public BBMemberDTO getMember(int member_num) {
			return sqlSession.selectOne("getMember",member_num);
		}
		//멤버 정보 수정
		public int editMember(BBMemberDTO dto) {
			int res = 0;
			BBMemberDTO dto2 = sqlSession.selectOne("getMember", dto.getMember_num());
			if (dto2.getMember_passwd().equals(dto.getMember_passwd())) {
				res = sqlSession.update("editMember", dto);
			}
			return res;
		}
		public int editMemberForNull(BBMemberDTO dto) {
			int res = 0;
			BBMemberDTO dto2 = sqlSession.selectOne("getMember", dto.getMember_num());
			if (dto2.getMember_passwd().equals(dto.getMember_passwd())) {
				res = sqlSession.update("editMemberForNull", dto);
			}
			return res;
		}
		//멤버 삭제!(이메일 인증과 시간 통과 후에만)
		public int deleteMember(int member_num, String member_passwd) {
			return sqlSession.delete("deleteMember", member_num);
		}
	//멤버 예약 리스트
	/*public List<TravelBookingDTO> booking_list(int member_id){
		return sqlSession.selectList("booking_list",member_id);
	}*/
	//여행지역 카테고리 목록
	public List<BBCategoryDTO> listBBCategoryDTO(){
		return  sqlSession.selectList("listBBCategoryDTO");
	}
	//여행지역 카테고리 등록
	public int insertBBCategoryDTO(BBCategoryDTO dto) {
		System.out.println("도: "+dto.getCate_state()+" / 시:"+dto.getCate_city());
		return sqlSession.insert("insertBBCategoryDTO",dto);
	}
	//여행지역 카테고리 삭제
	public int deleteBBCategoryDTO(int tCate_num) {
		return sqlSession.delete("deleteBBCategoryDTO",tCate_num);
	}
	//getCategory
	public BBCategoryDTO getBBCategoryDTO(int tCate_num) {
		return sqlSession.selectOne("getBBCategoryDTO",tCate_num);
	}
	//여행지역 카테고리 수정
	public int editBBCategoryDTO(BBCategoryDTO dto) {
		return sqlSession.update("editBBCategoryDTO",dto);
	}
	//여행 상품 등록
	public int insertBBProduct(BBProductDTO dto) {
		return sqlSession.insert("insertBBProduct",dto);
	}
	//여행 상품 삭제
	public int deleteBBProduct(int prod_num) {
		return sqlSession.delete("deleteBBProduct",prod_num);
	}
	//여행 상품 목록
	public List<BBProductDTO> listBBProduct(){
		return sqlSession.selectList("listBBProduct");
	}
	//getBBProduct
	public BBProductDTO getBBProduct(int prod_num) {
		return sqlSession.selectOne("getBBProduct",prod_num);
	}
	//여행 상품 수정 
	public int editBBProduct(BBProductDTO dto) {
		return sqlSession.update("editBBProduct",dto);
	}
	//수정 - 이미지 없을 때 들어오는 수정
	public int editBBProductForNull(BBProductDTO dto) {
		return sqlSession.update("editBBProductForNull", dto);
	}
	public List<BBProductDTO>listBBProductForRoom(){
		return sqlSession.selectList("listBBProductForRoom");
	}
	public int insertBBRoom(BBRoomDTO dto) {
		return sqlSession.insert("insertBBRoom",dto);
	}
	public List<BBRoomDTO> listBBRoom(int prod_num) {
		return sqlSession.selectList("listBBRoom",prod_num);
	}
	public int deleteBBRoom(int room_num) {
		return sqlSession.delete("deleteBBRoom",room_num);
	}
	public BBRoomDTO getBBRoom(int room_num) {
		return sqlSession.selectOne("getBBRoom",room_num);
	}
	public int editBBRoom(BBRoomDTO dto) {
		return sqlSession.update("editBBRoom",dto);
	}
	public int insertBBPackage(BBPackageDTO dto) {
		return sqlSession.insert("insertBBPackage",dto);
	}
	public List<BBPackageDTO> listBBPackage() {
		return sqlSession.selectList("listBBPackage");
	}
	public BBPackageDTO getBBPackageDTO(int pack_num) {
		return sqlSession.selectOne("getBBPackage",pack_num);
	}
	public int deleteBBPackage(int pack_num) {
		return sqlSession.delete("deleteBBPackage",pack_num);
	}
	public int editBBPackageDTO(BBPackageDTO dto) {
		return sqlSession.update("editBBPackage", dto);
	}
	public int editBBPackageDTOforNull(BBPackageDTO dto) {
		return sqlSession.update("editBBPackageForNull",dto);
	}
}

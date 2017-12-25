<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../top.jsp"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script type="text/javascript">
	function checkDel(room_num,prod_num){
		var isDel = confirm("정말로 삭제하시겠습니까?")
		if (isDel){
			location.href="BB_room_delete?room_num="+room_num+"&prod_num="+prod_num;
		}
	}
</script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<div align="center">
	<b>글내용 보기</b>
	<table border="1" width="500">
		<tr>
			<th width="15%">숙소 번호</th>
			<td align="center" width="35%">${getProduct.prod_num}</td>
			<th  width="15%">숙소 이름</th>
			<td align="center" width="35%">${getProduct.prod_name}</td>
		</tr>
		<tr>
			<th width="15%">담당자 메일</th>
			<td align="center" width="35%">${getProduct.prod_email}</td>
			<th width="15%">담당자 연락처</th>
			<td align="center" width="35%">${getProduct.prod_phone}</td>
		</tr>
		<tr>
			<th width="15%">숙소 주소</th>
			<td align="center" colspan="3">${getProduct.prod_road_address}</td>
			<td align="center" colspan="3">${getProduct.prod_detail_address}</td>
		</tr>
		<tr>
			<th  width="15%">숙소 최저가</th>
			<td align="center" colspan="3">${getProduct.prod_price}</td>
		</tr>
		<tr>
			<th width="15%" >이미지</th>
			<c:if test="${empty getProduct.prod_str_img}">
				<td colspan="3" align="center">"이미지가 없습니다."</td>
			</c:if>
			<c:if test="${not empty getProduct.prod_str_img}">
			<td colspan="3" align="center">
				<img src="https://s3.ap-northeast-2.amazonaws.com/bbproject2017/bb_product3/${getProduct.prod_str_img}" width="80" height="80">
			</td>
			</c:if>
		</tr>
		<tr>
			<th width="15%">상세 내용</th>
			<td colspan="3">${getProduct.prod_content}</td>
		</tr>
		</table>
	</div>
	<br>
<div align="center">
	<b>등록된 방 리스트</b>
	<table border="1" width="800">
	<tr>
			<th align="right" colspan="9"><a href="BB_room_insert?prod_num=${getProduct.prod_num}">추가</a></th>
		</tr>
		<tr>
			<th width="7%">방 이름</th>
			<th width="15%">기준 인원 - 최대 인원</th> 
			<th width="15%">성수기 가격</th>
			<th width="15%">비 성수기 가격</th>
			<th width="10%">주말 가격 증가율</th>
			<th width="10%">예약 가능기간</th>
			<th width="10%">할인율</th>
			<th width="20%">수정 | 삭제 </th>
		</tr>
		<tr>
		<c:if test="${empty roomList}">
			<td colspan="8">등록된 방이 없습니다.</td>
		</c:if>
		</tr>	
		<c:forEach var="dto" items="${roomList}">
		<tr>
			<td align="right"><a href="BB_room_content?room_num="${dto.room_num}>${dto.room_name}</a></td>
			<td align="center">${dto.room_person}</td>
			<td align="center">${dto.room_peak_price}</td>
			<td align="center">${dto.room_non_peak_price}</td>
			<td align="center">${dto.room_week_premium}%</td>
			<td align="center">${dto.room_period}</td>
			<td align="center">${dto.room_offer}%</td>
			<td align="center"><a href="BB_room_edit?room_num=${dto.room_num}&prod_num=${dto.prod_num}">수정</a>|<a href="javascript:checkDel('${dto.room_num},${dto.prod_num}')">삭제</a></td>
		</tr>
		</c:forEach>	
	</table>
</div>
<%@ include file="../bottom.jsp"%>
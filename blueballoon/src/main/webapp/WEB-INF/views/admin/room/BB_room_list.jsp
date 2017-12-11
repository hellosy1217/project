<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<%@ include file="../top.jsp"%>
<link href="https://s3.ap-northeast-2.amazonaws.com/hellosy1217.blueballoon/common/css/responsive.min.css" rel="stylesheet" />
<h2 align="center">숙소 예약 목록</h2>
<div align ="right">
<table border="0">
		<tr>
			<th align="right"><a href="BB_room_insert">숙소추가</a></th>
		</tr>
	</table>
</div>
<div align="center">
	<table border="1" width="700">
		<tr>
			<th width="10%">번호</th>
			<th width="15%">지역 카테고리</th> 
			<th width="20%">상품명</th>
			<th width="20%">연락처</th>
			<th width="15%">가격</th>
			<th width="10%">분류</th>
			<th width="20%">수정 | 삭제 </th>
		</tr>
		<tr>
		<c:if test="${empty RoomList}">
			<td colspan="7">등록된 카테고리목록이 없습니다.</td>
		</c:if>
		</tr>	
		<c:forEach var="dto" items="${RoomList}">
		<tr>
			<td align="right">${dto.prod_num}</td>
			<td align="center">${dto.prod_cate}</td>
			<td align="center">${dto.prod_name}</td>
			<td align="center">${dto.prod_hp}</td>
			<td align="center">${dto.prod_price}</td>
			<c:if test="${dto.prod_pick == 1}">
				<td align="center">지역</td>
			</c:if>
			<c:if test="${dto.prod_pick == 2}">
				<td align="center">맛집</td>
			</c:if>
			<c:if test="${dto.prod_pick == 3}">
				<td align="center">숙소</td>
			</c:if>
			<td><a href="BB_room_edit?prod_num=${dto.prod_num}">수정</a> | 
			<a href="BB_room_delete?prod_num=${dto.prod_num}">삭제</a></td>
		</tr>
		</c:forEach>	
	</table>
</div>
<%@ include file="../bottom.jsp"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  
<%@ include file="../top.jsp"%>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<h2 align="center">여행 상품 목록</h2>
<div align ="right">
	<table border="0" width="300">
		<tr>
			<th align="right"><a href="travel_prod_insert">추가</a></th>
		</tr>
	</table>
</div>
<div align="center">
	<table border="1" width="700">
		<tr bgcolor="yellow">
			<th width="10%">번호</th>
			<th width="15%">지역 카테고리</th> 
			<th width="20%">상품명</th>
			<th width="20%">연락처</th>
			<th width="15%">가격</th>
			<th width="10%">분류</th>
			<th width="20%">수정 | 삭제 </th>
		</tr>
		<tr>
		<c:if test="${empty ProductList}">
			<td colspan="7">등록된 카테고리목록이 없습니다.</td>
		</c:if>
		</tr>	
		<c:forEach var="dto" items="${ProductList}">
		<tr>
			<td align="right">${dto.prod_num}</td>
			<td align="center">${dto.prod_cate}</td>
			<td align="center">${dto.prod_name}</td>
			<td align="center">${dto.prod_hp}</td>
			<td align="center">${dto.prod_price}</td>
			<td align="center">${dto.prod_pick}</td>
			<td><a href="travel_prod_edit?prod_num=${dto.prod_num}">수정</a> | 
			<a href="travel_prod_delete?prod_num=${dto.prod_num}">삭제</a></td>
		</tr>
		</c:forEach>	
	</table>
</div>
<%@ include file="../bottom.jsp"%>
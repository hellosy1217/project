<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>   
<%@ include file="top.jsp"%>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<div align="center">
	<table border="1" width="400">
		<caption>여행 지역 카테고리목록</caption> 
		<tr bgcolor="yellow">
			<th width="10%">번호</th>
			<th width="30%">지역 카테고리 도</th>
			<th width="30%">지역 카테고리 시</th>
			<th width="20%">수정 | 삭제</th>
			<th width="10%"><a href="travel_category_insert">추가</a></th>
		</tr>
		<tr>
		<c:if test="${empty travelCategory}">
			<td colspan="5">등록된 카테고리목록이 없습니다.</td>
		</c:if>
		</tr>	
		<c:forEach var="dto" items="${travelCategory}">
		<tr>
			<td align="right">${dto.cate_num}</td>
			<td align="center">${dto.cate_state}</td>
			<td align="center">${dto.cate_city}</td>
			<td><a href="travel_category_edit?cate_num=${dto.cate_num}">수정</a> | 
			<a href="travel_category_delete?cate_num=${dto.cate_num}">삭제</a></td>
		</tr>
		</c:forEach>	
	</table>
</div>
<%@ include file="bottom.jsp"%>
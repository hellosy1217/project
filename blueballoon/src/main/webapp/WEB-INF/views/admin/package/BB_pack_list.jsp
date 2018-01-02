<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../top.jsp"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<h2 align="center">패키지 목록</h2>
<div align ="right">
<table border="0">
		<tr>
			<th align="right"><a href="BB_pack_insert">패키지 상품 추가</a></th>
		</tr>
	</table>
</div>
<div align="center">
	<table border="1" width="700">
		<tr>
			<th>번호</th>
			<th>패키지 타이틀</th>
			<th>담당 연락처</th>
			<th>가격</th>
			<th>기간</th>
			<th>일</th>
			<th>수정 | 삭제 </th>
		</tr>
		<tr>
		<c:if test="${empty packageList}">
			<td colspan="8" align="center">등록된 패키지 목록이 없습니다.</td>
		</c:if>
		</tr>	
		<c:forEach var="dto" items="${packageList}">
		<tr>
			<td align="right">${dto.pack_num}</td>
			<td align="center">${dto.pack_title}</td>
			<td align="center">${dto.pack_phone}</td>
			<td align="center">${dto.pack_price}</td>
			<td align="center">${dto.pack_period}</td>
			<td align="center">${dto.pack_days}</td>
			<td><a href="BB_pack_edit?pack_num=${dto.pack_num}">수정</a> | 
			<a href="BB_pack_delete?pack_num=${dto.pack_num}">삭제</a></td>
		</tr>
		</c:forEach>	
	</table>
</div>
<%@ include file="../bottom.jsp"%>
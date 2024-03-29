<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  
<%@ include file="../top.jsp"%>
<h2 align="center">여행 상품 목록</h2>
<script type="text/javascript">
	function checkDel(prod_num){
		var isDel = confirm("정말로 삭제하시겠습니까?")
		if (isDel){
			location.href="BB_prod_delete?prod_num="+prod_num;
		}
	}
</script>
<div align="center">
	<table border="1" width="700">
		<tr>
			<th colspan="7" align="right"><a href="BB_prod_insert">여행 상품 추가</a></th>
		</tr>
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
		<c:if test="${empty ProductList}">
			<td colspan="7">등록된 카테고리목록이 없습니다.</td>
		</c:if>
		</tr>	
		<c:forEach var="dto" items="${ProductList}">
		<tr>
			<td align="right">${dto.prod_num}</td>
			<td align="center">${dto.prod_cate}</td>
			<td align="center"><a href="BB_prod_content?prod_num=${dto.prod_num}">${dto.prod_name}</a></td>
			<td align="center">${dto.prod_phone}</td>
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
			<td><a href="BB_prod_edit?prod_num=${dto.prod_num}">수정</a> | 
			<a href="javascript:checkDel('${dto.prod_num}')">삭제</a></td>
		</tr>
		</c:forEach>	
	</table>
</div>
<%@ include file="../bottom.jsp"%>